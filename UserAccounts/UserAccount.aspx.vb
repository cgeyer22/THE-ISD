Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class UserAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Coach"
                Response.Redirect("~/Coach/CoachDefault.aspx")
            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteDefault.aspx")

        End Select
    End Sub
End Class
