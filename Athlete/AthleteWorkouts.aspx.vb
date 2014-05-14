Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Session("UserRole")
            Case ""
                Response.Redirect("~/Account/Login.aspx")
        End Select
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As System.EventArgs) Handles Calendar1.SelectionChanged
        lblDate.Text = Calendar1.SelectedDate
        lblDate.Visible = True
        imgbtnCal.Visible = True
        gvAssignedWO.Visible = True
        Calendar1.Visible = False
    End Sub

    Protected Sub imgbtnCal_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgbtnCal.Click
        lblDate.Visible = False
        imgbtnCal.Visible = False
        gvAssignedWO.Visible = False
        Calendar1.Visible = True
        Calendar1.SelectedDate = Date.FromOADate(13 / 13 / 2013)
    End Sub

    Protected Sub gvAssignedWO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles gvAssignedWO.SelectedIndexChanged
        Debug.Print(gvAssignedWO.SelectedIndex)
        lblDate.Visible = False
        imgbtnCal.Visible = False
        gvAssignedWO.Visible = False
        lblWorkout.Text = gvAssignedWO.SelectedRow.Cells(2).Text
        lblWorkout.Visible = True
        btnWorkouts.Visible = True
        gvExercises.Visible = True
    End Sub

    Protected Sub btnWorkouts_Click(sender As Object, e As System.EventArgs) Handles btnWorkouts.Click
        lblWorkout.Visible = False
        btnWorkouts.Visible = False
        gvExercises.Visible = False
        lblDate.Visible = True
        imgbtnCal.Visible = True
        gvAssignedWO.Visible = True
    End Sub

    Protected Sub gvExercises_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles gvExercises.SelectedIndexChanged
        lblWorkout.Visible = False
        btnWorkouts.Visible = False
        gvExercises.Visible = False
        lblExercise.Text = gvExercises.SelectedRow.Cells(2).Text
        lblExercise.Visible = True
        btnExercises.Visible = True
        gvEnterData.Visible = True
    End Sub

    Protected Sub btnExercises_Click(sender As Object, e As System.EventArgs) Handles btnExercises.Click
        lblExercise.Visible = False
        btnExercises.Visible = False
        gvEnterData.Visible = False
        lblWorkout.Visible = True
        btnWorkouts.Visible = True
        gvExercises.Visible = True
    End Sub
End Class
