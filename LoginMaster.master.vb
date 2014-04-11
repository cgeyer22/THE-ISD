Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class LoginMaster
    Inherits System.Web.UI.MasterPage

    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load



        If Session("activeUser") Is Nothing Then
            LogoutLink.Visible = False
            'Response.Redirect("~/ErrorLogin.aspx")
        Else
            Dim activeUserID = Session("activeUser")
            Debug.Print("activeUser is " + activeUserID)
            Debug.Print("Username is " + Session("Username"))

            LogoutLink.Visible = True
            HeadLoginView.Visible = False

        End If

    End Sub

    Protected Sub LogoutLink_Click(sender As Object, e As System.EventArgs) Handles LogoutLink.Click

        If Session("activeUser") Then
            Session.Remove("activeUser")
        End If

        'Also change database so last Session entry is false

        LogoutLink.Visible = False

        Debug.Print("Log me out please")
        Response.Redirect("~/Account/Login.aspx")

    End Sub
End Class



