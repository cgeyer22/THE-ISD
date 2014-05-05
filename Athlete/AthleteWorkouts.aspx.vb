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
        gvAssignedWO.Visible = True
    End Sub
End Class
