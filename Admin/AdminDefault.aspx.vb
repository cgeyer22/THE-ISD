
Partial Class Admin_Default
    Inherits System.Web.UI.Page

    Protected Sub btnExercises_Click(sender As Object, e As System.EventArgs) Handles btnWorkout.Click
        Response.Redirect("http://localhost:53380/THE-ISD/WorkoutPage.aspx")
    End Sub
End Class
