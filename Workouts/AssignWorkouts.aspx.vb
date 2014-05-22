Imports System.Diagnostics
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

                Dim dateTest As Date = New Date(2014, 5, 5)

                Using con1 As New SqlConnection(conStr)
                    Dim sqlCommand1 As New SqlCommand("EXEC CreateAssignedWO @UserID, @WorkoutID, @DateID", con1)
                    sqlCommand1.Parameters.AddWithValue("@UserID", item.Value)
                    sqlCommand1.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                    sqlCommand1.Parameters.AddWithValue("@DateID", dateTest)
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

                                    Dim exerciseIDList As New ArrayList

                                    Dim setCount As Integer = 0

                                    Dim ExerciseID As Integer = rowsAffected2("ExerciseID")
                                    exerciseIDList.Add(ExerciseID)

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

                                    Dim userIDList As New ArrayList
                                    Dim repList As New ArrayList
                                    Dim weightList As New ArrayList

                                    For Each k As String In Request.Form.AllKeys
                                        Dim v As String = Request.Form(k)

                                        Debug.Print("Key " + k + ", Value " + v)
                                        If k.Contains("checklistAthletes") Then
                                            userIDList.Add(v)
                                            Debug.Print("user id is: " + v)
                                        ElseIf k.Contains("txtRep") Then
                                            repList.Add(v)
                                            Debug.Print("rep count is: " + v)
                                        ElseIf k.Contains("txtWeight") Then
                                            weightList.Add(v)
                                            Debug.Print("weight count is: " + v)
                                        Else
                                            'userIDList.Add(v)
                                            Debug.Print("GGG")
                                        End If
                                    Next

                                    Dim userIDIndex As Integer = 0
                                    Dim exerciseCount As Integer = 0

                                    For i As Integer = 0 To weightList.Count - 1

                                        Using conEnter As New SqlConnection(conStr)
                                            Dim sqlCommandEnter As New SqlCommand("EXEC EnterWeightAndRepsAssignment @Assigned_weight, @Assigned_reps, @UserID, @WorkoutID, @ExerciseID", conEnter)

                                            sqlCommandEnter.Parameters.AddWithValue("@Assigned_weight", weightList.Item(i))
                                            sqlCommandEnter.Parameters.AddWithValue("@Assigned_reps", repList.Item(i))
                                            sqlCommandEnter.Parameters.AddWithValue("@UserID", userIDList.Item(userIDIndex))
                                            sqlCommandEnter.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                                            sqlCommandEnter.Parameters.AddWithValue("@ExerciseID", exerciseIDList.Item(i))

                                            conEnter.Open()

                                            sqlCommandEnter.ExecuteNonQuery()

                                        End Using

                                        If exerciseCount = exerciseIDList.Count - 1 Then
                                            userIDIndex += 1
                                            exerciseCount = 0
                                        Else
                                            exerciseCount += 1
                                        End If


                                    Next


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
        checklistAthletes.Visible = False
        divWeightRep.Visible = True
        btnAssign.Visible = True
        'gvExercises.DataBind()
        
        Dim j As Integer = 0
        For Each item As ListItem In checklistAthletes.Items

            If item.Selected = True Then
                Dim dgv As New DataGrid
                Dim br As New HtmlGenericControl("br")
                dgv.DataSource() = sqlListExercises

                dgv.DataBind()

                Dim itemS As String = item.ToString
                Dim length As Integer = itemS.IndexOf(", ")

                Dim lastName As String = itemS.Substring(0, length)
                Dim firstName As String = itemS.Substring(length + 2)


                Using con2 As New SqlConnection(conStr)
                    Dim sqlCommand2 As New SqlCommand("EXEC FindExercise @WorkoutID", con2)
                    sqlCommand2.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                    con2.Open()

                    Dim rowsAffected2 As SqlDataReader = sqlCommand2.ExecuteReader()

                    If rowsAffected2.HasRows() Then
                        Dim i As Integer = 0
                        While rowsAffected2.Read()
                            'Dim setCount As Integer = 0

                            Dim ExerciseID As Integer = rowsAffected2("ExerciseID")

                            Dim textboxR As New TextBox
                            textboxR.ID = "txtRep5" + i.ToString
                            textboxR.Width() = 25

                            Dim textboxW As New TextBox
                            textboxW.ID = "txtWeight6" + i.ToString
                            textboxW.Width() = 30

                            'dgv.Items(i).Cells(0).Text = firstName
                            dgv.Items(i).Cells(1).Text = lastName
                            dgv.Items(i).Cells(4).Text = ShowSetCount(WorkoutTable.SelectedValue, ExerciseID)
                            dgv.Items(i).Cells(5).Controls.Add(textboxR)
                            dgv.Items(i).Cells(6).Controls.Add(textboxW)

                            dgv.ID = "dgvWR" + j.ToString

                            i += 1
                        End While
                    End If

                End Using

                Me.divWeightRep.Controls.Add(dgv)
                Me.divWeightRep.Controls.Add(br)

            End If
            j += 1
        Next



        'Debug.Print("DUMPING CONTROLS")
        'For Each c In Me.divWeightRep.Controls
        '    Dim type_name As String = c.GetType().Name
        '    Debug.Print("CONTROL " + type_name)
        'Next
        'Dim x As String = "txtRep50"
        ''Debug.Print(x)
        ''If Not Me.FindControl(x) Is DBNull.Value Then
        'Dim dgv1 As HtmlInputText = Me.FindControl(x)
        '' Debug.Print("ID " + dgv1.ID)


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

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Response.Redirect("~/Workouts/WorkoutPage.aspx")
    End Sub

    Protected Sub EnterAssignedRepsAndWeight_Click(sender As Object, e As System.EventArgs) Handles EnterAssignedRepsAndWeight.Click
        checklistAthletes.Visible = True

        'Using con2 As New SqlConnection(conStr)
        '    Dim ConnectSQLToReps As New SqlCommand("EXEC EnterWeightAndRepsAssignment @Assigned_weight, @Assigned_reps,@UserID,@WorkoutID,@ExerciseID", con2)
        '    ConnectSQLToReps.Parameters.AddWithValue("@Assigned_weight", textboxW.text)
        'End Using

        'Dim foo As System.Web.HttpRequest = Request
        'Debug.Print("Got request")

        Dim userIDList As New ArrayList
        Dim repList As New ArrayList
        Dim weightList As New ArrayList

        For Each k As String In Request.Form.AllKeys
            Dim v As String = Request.Form(k)

            Debug.Print("Key " + k + ", Value " + v)
            If k.Contains("checklistAthletes") Then
                userIDList.Add(v)
                Debug.Print("user id is: " + v)
            ElseIf k.Contains("txtRep") Then
                repList.Add(v)
                Debug.Print("rep count is: " + v)
            ElseIf k.Contains("txtWeight") Then
                weightList.Add(v)
                Debug.Print("weight count is: " + v)
            Else
                'userIDList.Add(v)
                Debug.Print("GGG")
            End If
        Next

        Dim exerciseIDList As New ArrayList

        Using con2 As New SqlConnection(conStr)
            Dim sqlCommand2 As New SqlCommand("EXEC FindExercise @WorkoutID", con2)
            sqlCommand2.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
            con2.Open()

            Dim rowsAffected2 As SqlDataReader = sqlCommand2.ExecuteReader()

            If rowsAffected2.HasRows() Then
                While rowsAffected2.Read()
                    Dim ExerciseID As Integer = rowsAffected2("ExerciseID")
                    exerciseIDList.Add(ExerciseID)
                End While
            End If
        End Using

        Dim userIDIndex As Integer = 0
        Dim exerciseCount As Integer = 0

        For i As Integer = 0 To weightList.Count - 1

            Using conEnter As New SqlConnection(conStr)
                Dim sqlCommandEnter As New SqlCommand("EXEC EnterWeightAndRepsAssignment @Assigned_weight, @Assigned_reps, @UserID, @WorkoutID, @ExerciseID", conEnter)

                sqlCommandEnter.Parameters.AddWithValue("@Assigned_weight", weightList.Item(i))
                sqlCommandEnter.Parameters.AddWithValue("@Assigned_reps", repList.Item(i))
                sqlCommandEnter.Parameters.AddWithValue("@UserID", userIDList.Item(userIDIndex))
                sqlCommandEnter.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                sqlCommandEnter.Parameters.AddWithValue("@ExerciseID", exerciseIDList.Item(i))

                conEnter.Open()

                sqlCommandEnter.ExecuteNonQuery()

            End Using

            If exerciseCount = exerciseIDList.Count - 1 Then
                userIDIndex += 1
                exerciseCount = 0
            Else
                exerciseCount += 1
            End If


        Next



        Dim test As String = userIDList.Item(0)

        'Debug.Print("GOT SOMETHING " + Request.Form("ctl00$MainContent$dgvWR2$ctl02$txtRep50"))

        'Me.FindControl("dgvWR0").Controls.Item(0).Controls
        'Debug.Print("DUMPING CONTROLS")
        'For Each c In Me.divWeightRep.Controls
        '    Dim type_name As String = c.GetType().Name
        '    Debug.Print("CONTROL " + type_name)
        'Next
        'Dim x As String = "dgvWR1$txtRep50$0"
        ''Debug.Print(x)
        ''If Not Me.FindControl(x) Is DBNull.Value Then
        'Dim dgv As HtmlInputText = Me.FindControl(x)
        ''Debug.Print("ID " + dgv.ID)

        'Debug.Print(dgv.Controls(0))
        'Debug.Print(dgv.Text)
        'Me.FindControl(x).Controls.Item(0)
        'Debug.Print(dgv.Items(0).Cells(0))
        'Debug.Print(dgv.Items(0).Cells(0).Text)
        'Debug.Print(dgv.Items(0).Cells(1).Text)
        'Debug.Print(dgv.Items(0).Cells(3).Text)

        ' End If


        '.items(0).cells(5)


        'Debug.Print(

    End Sub
End Class
