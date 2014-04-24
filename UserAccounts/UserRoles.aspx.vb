Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class UserAccounts_UserRoles
    Inherits System.Web.UI.Page

    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"

    Protected Sub ddlUsername_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlUsername.SelectedIndexChanged

        GridView1.Visible = True
        lblChange.Visible = False
        ddlChangeRole.Visible = False
        ddlRoles.Visible = False
        btnNewRole.Visible = False
        lblRole.Visible = False
        btnChange.Visible = True

        btnAdd.Visible = True
        lblAdd1.Visible = False
        ddlAddRole.Visible = False
        lblAdd2.Visible = False
        btnAddRole.Visible = False

        GridView1.DataBind()
        ddlChangeRole.DataBind()
        ddlRoles.DataBind()
        ddlAddRole.DataBind()

    End Sub

    Protected Sub btnChange_Click(sender As Object, e As System.EventArgs) Handles btnChange.Click
        lblChange.Visible = True
        ddlChangeRole.Visible = True
        lblRole.Visible = True
        ddlRoles.Visible = True
        btnNewRole.Visible = True
        btnChange.Visible = False


    End Sub

    Protected Sub btnNewRole_Click(sender As Object, e As System.EventArgs) Handles btnNewRole.Click
        Using con1 As New SqlConnection(connectionString)
            Dim cmdUpdateRoles As New SqlCommand("EXEC UpdateRoleOfUser @UserID, @ChangeRoleID, @NewRoleID", con1)
            cmdUpdateRoles.Parameters.AddWithValue("@UserID", ddlUsername.SelectedValue)
            cmdUpdateRoles.Parameters.AddWithValue("@ChangeRoleID", ddlChangeRole.SelectedValue)
            cmdUpdateRoles.Parameters.AddWithValue("@NewRoleID", ddlRoles.SelectedValue)
            con1.Open()
            Dim rowsAffected As Integer = cmdUpdateRoles.ExecuteNonQuery
        End Using
        GridView1.DataBind()
        ddlChangeRole.DataBind()
        ddlRoles.DataBind()
        ddlAddRole.DataBind()
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        btnAdd.Visible = False
        lblAdd1.Visible = True
        ddlAddRole.Visible = True
        lblAdd2.Visible = True
        btnAddRole.Visible = True
    End Sub

    Protected Sub btnAddRole_Click(sender As Object, e As System.EventArgs) Handles btnAddRole.Click
        Using con2 As New SqlConnection(connectionString)
            Dim cmdAddRole As New SqlCommand("EXEC AddRoleToUser @UserID, @RoleID", con2)
            cmdAddRole.Parameters.AddWithValue("@UserID", ddlUsername.SelectedValue)
            cmdAddRole.Parameters.AddWithValue("@RoleID", ddlAddRole.SelectedValue)
            con2.Open()
            Dim rowsAffected As Integer = cmdAddRole.ExecuteNonQuery
        End Using
        GridView1.DataBind()
        ddlChangeRole.DataBind()
        ddlRoles.DataBind()
        ddlAddRole.DataBind()
    End Sub
End Class
