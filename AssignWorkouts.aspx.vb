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
        btnAssign.Visible = True
        lblAssignmentResult.Visible = False
        lblAssignmentResult.Text = origText
        lblDublicate.Visible = False
        lblDublicate.Text = dubOrig

        For Each item As ListItem In checklistAthletes.Items
            item.Selected = False
        Next
    End Sub

    Protected Sub checklistAthletes_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles checklistAthletes.SelectedIndexChanged

    End Sub

    Protected Sub btnAssign_Click(sender As Object, e As System.EventArgs) Handles btnAssign.Click
        Debug.Print("assign")
        Debug.Print(WorkoutTable.SelectedDataKey.Value)
        'Debug.Print(checklistAthletes.Items
        lblAssignmentResult.Visible = True
        lblAssignmentResult.Text = origText
        lblDublicate.Text = dubOrig

        'checklistAthletes_SelectedIndexChanged()

        For Each item As ListItem In checklistAthletes.Items
            If item.Selected Then
                'Debug.Print("value: " + item.Value)

                
                Debug.Print("value: " + item.Value)
                Debug.Print("WorkoutTable: " + WorkoutTable.SelectedDataKey.Value.ToString)

                Using con1 As New SqlConnection(conStr)
                    Dim sqlCommand As New SqlCommand("EXEC CreateAssignedWO @UserID, @WorkoutID", con1)
                    sqlCommand.Parameters.AddWithValue("@UserID", item.Value)
                    sqlCommand.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedDataKey.Value)
                    con1.Open()
                    Dim rowsAffected As Integer = sqlCommand.ExecuteNonQuery()
                    If rowsAffected > 0 Then
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

        Select Case Session("ActiveUser")
            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteDefault.aspx")
        End Select

    End Sub
End Class
