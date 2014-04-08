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

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        gvWorkoutExercise.Visible = True
        btnAddExercise.Visible = True
        ddlExercise.Visible = True
    End Sub

    Protected Sub btnAddExercise_Click(sender As Object, e As System.EventArgs) Handles btnAddExercise.Click
        Using connection As New SqlConnection(connectionString)
            Dim JoelandSam4ever As New SqlCommand("EXEC CreateWorkoutExercise @ExerciseID, @WorkoutID", connection)
            JoelandSam4ever.Parameters.AddWithValue("@ExerciseID", ddlExercise.SelectedValue)
            JoelandSam4ever.Parameters.AddWithValue("@WorkoutID", GridView1.SelectedValue)
            connection.Open()
            Dim rowsAffected As Integer = JoelandSam4ever.ExecuteNonQuery
        End Using
        gvWorkoutExercise.DataBind()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        btnNewWorkout.Visible = True
        dvNewWorkout.Visible = False
        btnCancel.Visible = False
    End Sub
End Class
