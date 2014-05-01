Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class UserAccount
    Inherits System.Web.UI.Page
    Dim conStr As String = "Data Source=simon;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=skrygshe;Password=vccviwhq"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Coach"
                Response.Redirect("~/RoleHome/RoleDefault.aspx")
            Case "Athlete"
                Response.Redirect("~/RoleHome/RoleDefault.aspx")

        End Select
    End Sub

    Protected Sub SubmitSearchAccount_Click(sender As Object, e As System.EventArgs) Handles SubmitSearchAccount.Click
        Using connection As New SqlConnection(conStr)
            Dim searchAccounts As New SqlCommand("EXEC SearchAccounts @FirstName,@LastName", connection)
            searchAccounts.Parameters.AddWithValue("@FirstName", GivenFirstName.Text)
            searchAccounts.Parameters.AddWithValue("@LastName", GivenLastName.Text)



        End Using

    End Sub
End Class
