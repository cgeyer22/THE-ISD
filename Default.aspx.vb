Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("activeUser") Then
            Response.Redirect("~/RoleHome/RoleDefault.aspx")
        End If

    End Sub
End Class
