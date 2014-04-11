Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class UserAccounts_UserRoles
    Inherits System.Web.UI.Page

    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"

    Protected Sub ddlUsername_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlUsername.SelectedIndexChanged

        GridView1.Visible = True
        ddlRoles.Visible = False
        btnNewRole.Visible = False
        lblChange.Visible = False


        btnChange.Visible = True


    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub btnChange_Click(sender As Object, e As System.EventArgs) Handles btnChange.Click
        ddlRoles.Visible = True
        btnNewRole.Visible = True
        lblChange.Visible = True
        btnChange.Visible = False


    End Sub

    Protected Sub btnNewRole_Click(sender As Object, e As System.EventArgs) Handles btnNewRole.Click

        Using con1 As New SqlConnection(connectionString)
            'Dim con1 As New SqlConnection(connectionString)
            Dim cmdUpdateRoles As New SqlCommand("EXEC UpdateRoleOfUser @Username, @Title", con1)
            cmdUpdateRoles.Parameters.AddWithValue("@Username", ddlUsername.SelectedIndex)
            cmdUpdateRoles.Parameters.AddWithValue("@Title", ddlRoles.SelectedIndex)
            con1.Open()
            Dim rowsAffected As Integer = cmdUpdateRoles.ExecuteNonQuery
        End Using

        'ddlUsername.DataBind()
        'ddlRoles.DataBind()


    End Sub
End Class
