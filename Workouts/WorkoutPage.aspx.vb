﻿Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class Default3
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=simon;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=skrygshe;Password=vccviwhq"

    Protected Sub btnNewWorkout_Click(sender As Object, e As System.EventArgs) Handles btnNewWorkout.Click
        dvNewWorkout.Visible = True
        btnCancel.Visible = True
        btnNewWorkout.Visible = False
        btnAddWorkout.Visible = True

    End Sub

    Protected Sub WorkoutTable_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles WorkoutTable.SelectedIndexChanged
        gvWorkoutExercise.Visible = True
        lblChangeSetCount.Visible = True
        ddlExerInWO.Visible = True
        lblWorkoutName.Text = "Workout Name: " + WorkoutTable.SelectedRow.Cells(2).Text
        lblWorkoutName.Font.Size = 20
        lblWorkoutName.Visible = True
        lblIntro.Visible = False
        lblPrevSetCount.Visible = False
        txtNewSetCount.Visible = False
        btnChangeSet.Visible = False

        ddlExerInWO.ClearSelection()

        ddlExercise.DataBind()
        ddlRemoveExercise.DataBind()

        If ddlRemoveExercise.Items.Count = 0 Then
            ddlRemoveExercise.Visible = False
            btnRemoveExercise.Visible = False
        Else
            btnRemoveExercise.Visible = True
            ddlRemoveExercise.Visible = True
        End If

        If ddlExercise.Items.Count = 0 Then
            ddlExercise.Visible = False
            btnAddExercise.Visible = False
            btnNewExercise.Visible = True
        Else
            btnAddExercise.Visible = True
            btnNewExercise.Visible = True
            ddlExercise.Visible = True
        End If

        'ddlExerInWO.AppendDataBoundItems() = False
        'Dim li As New ListItem
        'li.Value = ""
        'li.Text = "--NOPE--"
        'ddlExerInWO.Items.Clear()
        'ddlExerInWO.AppendDataBoundItems() = True
        'ddlExerInWO.Items.Insert(0, "--Select One--")


    End Sub

    Protected Sub ddlExerInWO_DataBinding(sender As Object, e As System.EventArgs) Handles ddlExerInWO.DataBinding
        ddlExerInWO.Items.Clear()
        ddlExerInWO.Items.Insert(0, "--Select One--")
    End Sub

    Protected Sub ddlExerInWO_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlExerInWO.SelectedIndexChanged
        If Not ddlExerInWO.SelectedValue = "--Select One--" Then
            lblIntro.Visible = True
            lblPrevSetCount.Visible = True
            lblPrevSetCount.Text = ShowSetCount(WorkoutTable.SelectedValue, ddlExerInWO.SelectedValue)
            txtNewSetCount.Visible = True
            btnChangeSet.Visible = True
            txtNewSetCount.Text = ""
        Else
            lblIntro.Visible = False
            lblPrevSetCount.Visible = False
            txtNewSetCount.Visible = False
            btnChangeSet.Visible = False
        End If



    End Sub

    Protected Sub btnAddExercise_Click(sender As Object, e As System.EventArgs) Handles btnAddExercise.Click
        If Not ddlExercise.Items.Count = 0 Then
            Using connection As New SqlConnection(connectionString)
                Dim JoelandSam4ever As New SqlCommand("EXEC CreateWorkoutExercise @ExerciseID, @WorkoutID", connection)
                JoelandSam4ever.Parameters.AddWithValue("@ExerciseID", ddlExercise.SelectedValue)
                JoelandSam4ever.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedValue)
                connection.Open()
                Dim rowsAffected As Integer = JoelandSam4ever.ExecuteNonQuery
            End Using
            gvWorkoutExercise.DataBind()
            ddlExercise.DataBind()
            ddlRemoveExercise.DataBind()
        End If

        If ddlExercise.Items.Count = 0 Then
            ddlExercise.Visible = False
            btnAddExercise.Visible = False
            btnNewExercise.Visible = True
        End If

        If Not ddlRemoveExercise.Items.Count = 0 Then
            ddlRemoveExercise.Visible = True
            btnRemoveExercise.Visible = True
        End If

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As System.EventArgs) Handles btnCancel.Click
        btnNewWorkout.Visible = True
        dvNewWorkout.Visible = False
        btnCancel.Visible = False
        btnAddWorkout.Visible = False

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/RoleHome/RoleDefault.aspx")
        End Select

    End Sub

    Protected Sub btnNewExercise_Click(sender As Object, e As System.EventArgs) Handles btnNewExercise.Click
        Response.Redirect("~/Workouts/ExercisePage.aspx")
    End Sub

    Protected Sub btnAssignWorkout_Click(sender As Object, e As System.EventArgs) Handles btnAssignWorkout.Click
        Response.Redirect("~/Workouts/AssignWorkouts.aspx")
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

    Protected Sub btnChangeSet_Click(sender As Object, e As System.EventArgs) Handles btnChangeSet.Click

        If Regex.IsMatch(txtNewSetCount.Text, "^[0-9]+$") Then
            Using updateConnection As New SqlConnection(connectionString)
                Dim UpdateSets As New SqlCommand("EXEC UpdateSets @WorkoutID, @ExerciseID, @NewSetCount", updateConnection)
                UpdateSets.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedValue)
                UpdateSets.Parameters.AddWithValue("@ExerciseID", ddlExerInWO.SelectedValue)
                UpdateSets.Parameters.AddWithValue("@NewSetCount", Convert.ToInt32(txtNewSetCount.Text))
                updateConnection.Open()

                Dim rowsAffected As Integer = UpdateSets.ExecuteNonQuery


            End Using

            lblIntro.Visible = False
            lblPrevSetCount.Visible = False
            txtNewSetCount.Visible = False
            btnChangeSet.Visible = False

            ddlExerInWO.ClearSelection()
            gvWorkoutExercise.DataBind()
        End If


    End Sub

    Protected Sub txtNewSetCount_TextChanged(sender As Object, e As System.EventArgs) Handles txtNewSetCount.TextChanged

    End Sub

    Protected Sub sdsWorkoutExercise_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles sdsWorkoutExercise.Selecting
        ddlExerInWO.AppendDataBoundItems() = True
    End Sub

    Protected Sub gvWorkoutExercise_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles gvWorkoutExercise.SelectedIndexChanged

    End Sub

    Protected Sub SubmitSearchWorkout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitSearchWorkout.Click
        btnNewWorkout.Visible = True
        Using connection As New SqlConnection(connectionString)
            Dim searchWorkouts As New SqlCommand("EXEC SearchWorkouts @WorkoutName", connection)
            searchWorkouts.Parameters.AddWithValue("@WorkoutName", WorkoutSearch.Text)
        End Using
    End Sub

    Protected Sub btnWorkoutVis_Click(sender As Object, e As System.EventArgs) Handles btnWorkoutVis.Click
        WorkoutTable.Visible = True
        btnNewWorkout.Visible = True
        btnWorkoutVis.Visible = False
        hideWorkoutsBtn.Visible = True
    End Sub

    Protected Sub btnAddWorkout_Click(sender As Object, e As System.EventArgs) Handles btnAddWorkout.Click
        Debug.Print(dvNewWorkout.Fields(0).ToString)
        Debug.Print(dvNewWorkout.Fields(1).ToString)

        dvNewWorkout.InsertItem(False)

        WorkoutTable.DataBind()

        'Using addWorkout As New SqlConnection(connectionString)
        '    Dim NewWorkout As New SqlCommand("EXEC CreateWorkout @WorkoutName, @Description", addWorkout)
        '    NewWorkout.Parameters.AddWithValue("@WorkoutName", dvNewWorkout.Fields(1).ToString)
        '    NewWorkout.Parameters.AddWithValue("@Description", dvNewWorkout.Fields(2).ToString)
        '    addWorkout.Open()

        '    Dim rowsAffected As Integer = NewWorkout.ExecuteNonQuery


        'End Using

    End Sub

    Protected Sub btnRemoveExercise_Click(sender As Object, e As System.EventArgs) Handles btnRemoveExercise.Click
        If Not ddlRemoveExercise.Items.Count = 0 Then
            Using updateConnection As New SqlConnection(connectionString)
                Dim RemoveExerciseFromWorkout As New SqlCommand("EXEC DeleteExerciseFromWorkout @WorkoutID, @ExerciseID", updateConnection)
                RemoveExerciseFromWorkout.Parameters.AddWithValue("@WorkoutID", WorkoutTable.SelectedValue)
                RemoveExerciseFromWorkout.Parameters.AddWithValue("@ExerciseID", ddlRemoveExercise.SelectedValue)
                'RemoveExerciseFromWorkout.Parameters.AddWithValue("@NewSetCount", Convert.ToInt32(txtNewSetCount.Text))
                updateConnection.Open()

                Dim rowsAffected As Integer = RemoveExerciseFromWorkout.ExecuteNonQuery


            End Using

            gvWorkoutExercise.DataBind()
            ddlRemoveExercise.DataBind()
            ddlExercise.DataBind()
        End If

        If ddlRemoveExercise.Items.Count = 0 Then
            ddlRemoveExercise.Visible = False
            btnRemoveExercise.Visible = False
        End If

        If Not ddlExercise.Items.Count = 0 Then
            ddlExercise.Visible = True
            btnAddExercise.Visible = True
            btnNewExercise.Visible = True
        End If

    End Sub

    Protected Sub hideWorkoutsBtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles hideWorkoutsBtn.Click
        WorkoutTable.Visible = False
        btnNewWorkout.Visible = False
        btnWorkoutVis.Visible = True
        hideWorkoutsBtn.Visible = False
        dvNewWorkout.Visible = False
        btnAddWorkout.Visible = False
        btnCancel.Visible = False
    End Sub
End Class
