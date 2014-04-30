﻿Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Dim conStr As String = "Data Source=simon;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=skrygshe;Password=vccviwhq"
    Dim origText As String = "Assigned to: "
    Dim dubOrig As String = "Previously Assigned to: "

    Protected Sub WorkoutTable_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles WorkoutTable.SelectedIndexChanged
        checklistAthletes.Visible = True
        btnWeightsReps.Visible = True
        lblInput.Visible = True
        'divWeightRep.Visible = True

        'btnAssign.Visible = True
        lblAssignmentResult.Visible = False
        lblAssignmentResult.Text = origText
        lblDublicate.Visible = False
        lblDublicate.Text = dubOrig

        For Each item As ListItem In checklistAthletes.Items
            item.Selected = False
        Next
    End Sub

    Protected Sub btnAssign_Click(sender As Object, e As System.EventArgs) Handles btnAssign.Click
        Debug.Print("assign workoutID is next")
        Debug.Print(WorkoutTable.SelectedDataKey.Value)
        'Debug.Print(checklistAthletes.Items
        lblAssignmentResult.Visible = True
        lblAssignmentResult.Text = origText
        lblDublicate.Text = dubOrig

        For Each item As ListItem In checklistAthletes.Items
            If item.Selected Then

                Debug.Print("value: " + item.Value)
                Debug.Print("WorkoutTable: " + WorkoutTable.SelectedDataKey.Value.ToString)

                Using con1 As New SqlConnection(conStr)
                    Dim sqlCommand1 As New SqlCommand("EXEC CreateAssignedWO @UserID, @WorkoutID", con1)
                    sqlCommand1.Parameters.AddWithValue("@UserID", item.Value)
                    sqlCommand1.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                    con1.Open()
                    Dim rowsAffected1 As Integer = sqlCommand1.ExecuteNonQuery()
                    If rowsAffected1 > 0 Then

                        Using con2 As New SqlConnection(conStr)
                            Dim sqlCommand2 As New SqlCommand("EXEC FindExercise @WorkoutID", con2)
                            sqlCommand2.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                            con2.Open()

                            Dim rowsAffected2 As SqlDataReader = sqlCommand2.ExecuteReader()

                            If rowsAffected2.HasRows() Then
                                While rowsAffected2.Read()

                                    Dim setCount As Integer = 0

                                    Dim ExerciseID As Integer = rowsAffected2("ExerciseID")

                                    Debug.Print("START ExerciseID is below")
                                    'Debug.Print(rowsAffected2("WorkoutID"))
                                    Debug.Print(rowsAffected2("ExerciseID"))


                                    'Counts the set counts for each exercise
                                    Using con3 As New SqlConnection(conStr)
                                        Dim sqlCommand3 As New SqlCommand("EXEC CountSets @WorkoutID, @ExerciseID", con3)
                                        sqlCommand3.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                                        sqlCommand3.Parameters.AddWithValue("@ExerciseID", ExerciseID)
                                        con3.Open()

                                        Dim rowsAffected3 As SqlDataReader = sqlCommand3.ExecuteReader()

                                        If rowsAffected3.HasRows() Then
                                            While rowsAffected3.Read()
                                                setCount += 1
                                            End While
                                        End If
                                    End Using

                                    Debug.Print("STOP Set Count below")
                                    Debug.Print(setCount)

                                    Using con4 As New SqlConnection(conStr)
                                        Dim sqlCommand4 As New SqlCommand("EXEC AssignWorkoutExerciseSetsToAthletes @WorkoutID, @ExerciseID, @UserID, @SetCount", con4)
                                        sqlCommand4.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                                        sqlCommand4.Parameters.AddWithValue("@ExerciseID", ExerciseID)
                                        sqlCommand4.Parameters.AddWithValue("@UserID", item.Value)
                                        sqlCommand4.Parameters.AddWithValue("@SetCount", setCount)
                                        con4.Open()

                                        Dim rowsAffected4 As Integer = sqlCommand4.ExecuteNonQuery()
                                        If rowsAffected4 > 0 Then
                                            Debug.Print("IT worked")
                                        Else
                                            Debug.Print("nope")
                                        End If


                                    End Using

                                End While


                            Else

                            End If

                        End Using

                        Dim itemS As String = item.ToString
                        Dim length As Integer = itemS.IndexOf(", ")
                        'Debug.Print(item.ToString)
                        'Debug.Print(item.ToString.IndexOf(", "))

                        Dim lastName As String = itemS.Substring(0, length)
                        Dim firstName As String = itemS.Substring(length + 2)
                        Dim newText As String = lblAssignmentResult.Text + firstName + " " + lastName + " "
                        'Debug.Print("first: \{0}\ last: \{1}\", firstName, lastName)
                        Debug.Print(lblAssignmentResult.Text + firstName + " " + lastName + " ")
                        lblAssignmentResult.Text = newText

                    Else
                        Dim itemS As String = item.ToString
                        Dim length As Integer = itemS.IndexOf(", ")
                        'Debug.Print(item.ToString)
                        'Debug.Print(item.ToString.IndexOf(", "))

                        Dim lastName As String = itemS.Substring(0, length)
                        Dim firstName As String = itemS.Substring(length + 2)
                        lblDublicate.Visible = True
                        Dim dubText As String = lblDublicate.Text + firstName + " " + lastName + " "
                        lblDublicate.Text = dubText
                    End If
                End Using

            End If
        Next

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/RoleHome/RoleDefault.aspx")
        End Select

    End Sub

    Protected Sub btnWeightsReps_Click(sender As Object, e As System.EventArgs) Handles btnWeightsReps.Click
        divWeightRep.Visible = True
        gvExercises.DataBind()

        For Each item As ListItem In checklistAthletes.Items
            If item.Selected = True Then
                Dim dgv As New DataGrid
                Dim c As Integer = 5
                Dim r As Integer = 10
                dgv.DataSource() = sqlListExercises

                dgv.DataBind()

                'dgv.Columns.Remove("ExerciseID")
                'Debug.Print(dgv.Columns.Count)
                'Me.Controls.Add(dgv)
                'Me.Controls.AddAt(Me.Controls.IndexOf(divWeightRep), dgv)
                'Me.lblInput.Parent.Controls.Add(dgv)
                Me.divWeightRep.Controls.Add(dgv)
                'dgv.Columns.RemoveAt(0)
                'Debug.Print(dgv.Columns.Item(0).ToString())
                If Not dgv.Items(0) Is Nothing Then
                    Debug.Print(dgv.Items(0).Cells(3).Text)
                    dgv.Items(0).Cells(3).Text = "HELLO"

                Else
                    Debug.Print("BB")
                End If

            Else

            End If
        Next

    End Sub

    Protected Function ShowSetCount(ByVal wID As Integer, ByVal eID As Integer) As Integer
        Dim setCount As Integer = 0

        Using connection1 As New SqlConnection(conStr)
            Dim countSets As New SqlCommand("EXEC CountSets @WorkoutID, @ExerciseID", connection1)
            countSets.Parameters.AddWithValue("@WorkoutID", wID)
            countSets.Parameters.AddWithValue("@ExerciseID", eID)
            connection1.Open()

            Dim rowsAffected As SqlDataReader = countSets.ExecuteReader()

            If rowsAffected.HasRows() Then
                While rowsAffected.Read()
                    setCount += 1
                End While
            End If
        End Using

        Return setCount
    End Function

    Protected Function ShowAthleteName(ByVal index As Integer) As String
        Dim name As String = "TESTTING"


        For Each item As ListItem In checklistAthletes.Items
            If item.Selected = True Then
                name = item.ToString
            Else

            End If
        Next


        Return name
    End Function

    Protected Sub checklistAthletes_DataBinding(sender As Object, e As System.EventArgs) Handles checklistAthletes.DataBinding
        'checklistAthletes.Items.Clear()
        'checklistAthletes.Items.Insert(0, "--Select One--")

        'For Each item As ListItem In checklistAthletes.Items
        '    If item.Selected = True Then
        '        Dim dgv As New DataGrid
        '        Dim c As Integer = 5
        '        Dim r As Integer = 10
        '        dgv.DataSource() = sqlListExercises
        '        dgv.DataBind()
        '        Me.Controls.Add(dgv)

        '        'name = item.ToString
        '    Else

        '    End If
        'Next

    End Sub

End Class
