Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class Site
    Inherits System.Web.UI.MasterPage

    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Check to see if there are multiple roles, if yes - show the dropdown
        If Not (Page.IsPostBack) Then
            RoleDropDown.DataBind()
        End If
        If RoleDropDown.Items.Count = 1 Then
            RoleDropDown.Visible = "false"
        End If
        'End of Drop Down

        If Session("activeUser") Is Nothing Then
            LogoutLink.Visible = False
            Response.Redirect("~/ErrorLogin.aspx")
        Else
            Dim activeUserID = Session("activeUser")
            Debug.Print("activeUser is " + activeUserID)
            Debug.Print("Username is " + Session("Username"))

            LogoutLink.Visible = True
            HeadLoginView.Visible = False

        End If
        Select Case Session("UserRole")
            Case "Admin"
                Debug.Print("UserRole is admin")
                AdminNavMenu_Master.Visible = True


                'Case "Athlete"
                '    Debug.Print("UserRole is athlete")
                '    AthleteNavMenu.Visible = True

            Case "Coach"
                Debug.Print("UserRole is coach")
                CoachNavMenu_Master.Visible = True


        End Select

    End Sub

    Protected Sub LogoutLink_Click(sender As Object, e As System.EventArgs) Handles LogoutLink.Click

        If Session("activeUser") Then
            Session.Remove("activeUser")
        End If

        'Also change database so last Session entry is false

        LogoutLink.Visible = False
        HeadLoginView.Visible = True

        Debug.Print("Log me out please")
        Response.Redirect("~/Account/Login.aspx")

    End Sub
End Class

