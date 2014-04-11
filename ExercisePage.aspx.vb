Imports System.Diagnostics
Partial Class ExercisePage_Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"

    


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteDefault.aspx")
                debug.print("Athlete cannot be on page")

        End Select
        Select Case Session("UserRole")
            Case "Admin"
                Debug.Print("UserRole is admin")
                AdminNavMenu.Visible = True

            Case "Athlete"
                Debug.Print("UserRole is athlete")
                AthleteNavMenu.Visible = True

            Case "Coach"
                Debug.Print("UserRole is coach")
                CoachNavMenu.Visible = True


        End Select
    End Sub


End Class
