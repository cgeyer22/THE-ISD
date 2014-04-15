Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class Default3
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=simon;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=skrygshe;Password=vccviwhq"
    Protected Sub btnNewWorkout_Click(sender As Object, e As System.EventArgs) Handles btnNewWorkout.Click
        dvNewWorkout.Visible = True
        btnCancel.Visible = True
        btnNewWorkout.Visible = False
    End Sub

    Protected Sub WorkoutTable_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles WorkoutTable.SelectedIndexChanged
        gvWorkoutExercise.Visible = True
        btnAddExercise.Visible = True
        ddlExercise.Visible = True
    End Sub

    Protected Sub btnAddExercise_Click(sender As Object, e As System.EventArgs) Handles btnAddExercise.Click
        Using connection As New SqlConnection(connectionString)
            Dim JoelandSam4ever As New SqlCommand("EXEC CreateWorkoutExercise @ExerciseID, @WorkoutID", connection)
            JoelandSam4ever.Parameters.AddWithValue("@ExerciseID", ddlExercise.SelectedValue)
            JoelandSam4ever.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedValue)
            connection.Open()
            Dim rowsAffected As Integer = JoelandSam4ever.ExecuteNonQuery
        End Using
        gvWorkoutExercise.DataBind()
        ddlExercise.DataBind()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        btnNewWorkout.Visible = True
        dvNewWorkout.Visible = False
        btnCancel.Visible = False
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Session("UserRole")
            Case "Admin"
                Debug.Print("UserRole is admin")
                AdminNavMenu.Visible = True

            Case "Coach"
                Debug.Print("UserRole is coach")
                CoachNavMenu.Visible = True
        End Select

        Select Case Session("ActiveUser")
            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteDefault.aspx")
        End Select
    End Sub

    Protected Sub btnNewExercise_Click(sender As Object, e As System.EventArgs) Handles btnNewExercise.Click
        Response.Redirect("ExercisePage.aspx")
    End Sub

    Protected Sub btnAssignWorkout_Click(sender As Object, e As System.EventArgs) Handles btnAssignWorkout.Click
        Response.Redirect("AssignWorkouts.aspx")
    End Sub
End Class
