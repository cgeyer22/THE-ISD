Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient


Partial Class Role_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteWorkouts.aspx")

        End Select
    End Sub
End Class
