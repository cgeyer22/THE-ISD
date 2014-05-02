Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics
Partial Class ExercisePage_Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"
    Dim previous As String

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/RoleHome/RoleDefault.aspx")
                debug.print("Athlete cannot be on page")

        End Select
        Try
            previous = Request.ServerVariables("HTTP_REFERER")
            If previous.EndsWith("/WorkoutPage.aspx") Then
                backButton.Visible = True
            End If
        Catch ex As Exception
            ' Print("No previous page")
        End Try
    End Sub

    Protected Sub backButton_Click(sender As Object, e As System.EventArgs) Handles backButton.Click
        Response.Redirect("~/Workouts/WorkoutPage.aspx")
    End Sub

    Protected Sub Unnamed2_Click(sender As Object, e As System.EventArgs) Handles SearchExerciesButton.Click
        Using connection As New SqlConnection(connectionString)
            Dim searchExercises As New SqlCommand("EXEC SearchExercies @ExerciseName", connection)
            searchExercises.Parameters.AddWithValue("@ExerciseName", ExerciseSearchBar.Text)


        End Using



    End Sub
End Class
