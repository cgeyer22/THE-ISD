Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient


Partial Class Role_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

    Protected Sub CoachNavMenu_MenuItemClick(sender As Object, e As System.Web.UI.WebControls.MenuEventArgs) Handles CoachNavMenu.MenuItemClick

    End Sub
End Class
