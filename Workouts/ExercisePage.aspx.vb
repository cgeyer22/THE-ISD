Imports System.Diagnostics
Partial Class ExercisePage_Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"




    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/RoleHome/RoleDefault.aspx")
                debug.print("Athlete cannot be on page")

        End Select
        
    End Sub


End Class
