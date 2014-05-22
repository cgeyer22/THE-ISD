Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient
Partial Class Default2
    Inherits System.Web.UI.Page

    Dim connectionString As String = "Data Source=simon;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=skrygshe;Password=vccviwhq"

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
        btnDescriptions.Visible = True
        btnHide.Visible = False
    End Sub

    Protected Sub btnWorkouts_Click(sender As Object, e As System.EventArgs) Handles btnWorkouts.Click
        lblWorkout.Visible = False
        btnWorkouts.Visible = False
        gvExercises.Visible = False
        btnDescriptions.Visible = False
        btnHide.Visible = False
        lblDate.Visible = True
        imgbtnCal.Visible = True
        gvAssignedWO.Visible = True
    End Sub

    Protected Sub gvExercises_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles gvExercises.SelectedIndexChanged
        lblWorkout.Visible = False
        btnWorkouts.Visible = False
        gvExercises.Visible = False
        btnDescriptions.Visible = False
        btnHide.Visible = False
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
        btnDescriptions.Visible = True
        btnHide.Visible = False
    End Sub

    Protected Sub btnDescriptions_Click(sender As Object, e As System.EventArgs) Handles btnDescriptions.Click
        btnDescriptions.Visible = False
        btnHide.Visible = True
        gvExercises.Columns(3).Visible = True
    End Sub

    Protected Sub btnHide_Click(sender As Object, e As System.EventArgs) Handles btnHide.Click
        btnHide.Visible = False
        btnDescriptions.Visible = True
        gvExercises.Columns(3).Visible = False
    End Sub

    Protected Function ShowSetCount(ByVal wID As Integer, ByVal eID As Integer) As Integer
        Dim setCount As Integer = 0

        Using connection1 As New SqlConnection(connectionString)
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

End Class
