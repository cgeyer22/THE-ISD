Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient
Partial Class Coach_Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        'Connection to database and Permissoin Call
        Dim Conn As New SqlConnection(connectionString)
        Dim PermissionCheck As New SqlCommand("EXEC PermissionCheckWithRoles", Conn)
        PermissionCheck.Parameters.AddWithValue("@Title", Session("UserRole"))

        Conn.Open()

        Dim rd As SqlDataReader = PermissionCheck.ExecuteReader()
        If PermissionCheck =


        End If







    End Sub
End Class
