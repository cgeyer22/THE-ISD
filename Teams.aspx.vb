Imports System.Diagnostics
Imports System.Data.SqlClient

Partial Class Default3
    Inherits System.Web.UI.Page

    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteDefault.aspx")
        End Select

    End Sub


End Class
