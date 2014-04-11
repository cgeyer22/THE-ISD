
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub WorkoutTable_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles WorkoutTable.SelectedIndexChanged
        checklistAthletes.Visible = True
    End Sub

    Protected Sub checklistAthletes_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles checklistAthletes.SelectedIndexChanged

    End Sub
End Class
