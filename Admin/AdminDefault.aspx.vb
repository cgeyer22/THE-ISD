
Partial Class Admin_Default
    Inherits System.Web.UI.Page

    Protected Sub btnExercises_Click(sender As Object, e As System.EventArgs) Handles btnWorkout.Click
        Response.Redirect("~/WorkoutPage.aspx")

    End Sub
End Class
