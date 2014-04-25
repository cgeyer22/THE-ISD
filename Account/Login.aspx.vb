Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient


Partial Class Account_Login
    Inherits System.Web.UI.Page

    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=sking;Password=pxdrlgyu"

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    'End Sub

    Protected Sub LoginButton_Click(sender As Object, e As System.EventArgs)


        Dim accountName As String = LoginUser.UserName
        Dim password As String = LoginUser.Password

        Dim con1 As New SqlConnection(connectionString)
        Dim cmdLogin As New SqlCommand("SELECT * FROM UserTable WHERE Username = '" + accountName + "' and Password = '" + password + "' ", con1)

        con1.Open()

        Dim rd As SqlDataReader = cmdLogin.ExecuteReader()



        If rd.HasRows() Then
            While rd.Read()
                Session("Username") = String.Format(rd("Username"))

                Dim UserID As String = String.Format(rd("UserID"))
                'Dim DataAdapter As SqlDataAdapter

                Dim con2 As SqlConnection

                con2 = New SqlConnection(connectionString)


                Debug.Print("UserID =" + UserID)

                Try
                    'This try block sets all previous login sessions to false according for the current UserID
                    con2.Open()
                    Dim cmdInactivate As New SqlCommand("UPDATE Session SET Active = @Active WHERE UserID = @UserID", con2)
                    cmdInactivate.Parameters.AddWithValue("@Active", False)
                    cmdInactivate.Parameters.AddWithValue("@UserID", UserID)

                    cmdInactivate.ExecuteNonQuery()
                Catch ex As Exception
                    Debug.Print("ERROR while inserting record on table..." & ex.Message, "Insert Records")
                Finally
                    con2.Close()
                End Try

                Try
                    'Inserts a new session entry for the now current login session
                    con2.Open()
                    Dim cmdSession As New SqlCommand("INSERT INTO Session (UserID, Active, Created)" _
                                                 + "VALUES (@UserID, @Active, @Created) ", con2)
                    cmdSession.Parameters.AddWithValue("@UserID", UserID)
                    cmdSession.Parameters.AddWithValue("@Active", 1)
                    cmdSession.Parameters.AddWithValue("@Created", DateTime.Now)
                    'cmdSession.Parameters.AddWithValue("@TimeActive" , ??)

                    cmdSession.ExecuteNonQuery()
                Catch ex As Exception
                    Debug.Print("ERROR while inserting record on table..." + ex.Message, "Insert Records")
                Finally
                    con2.Close()
                End Try

                Try
                    'Create Session("UserRole") variable according to role
                    'of current logged in user
                    con2.Open()
                    Dim cmdRole As New SqlCommand("EXEC CheckUserRoles @Username", con2)
                    cmdRole.Parameters.AddWithValue("@Username", Session("Username"))

                    Dim rdRole As SqlDataReader = cmdRole.ExecuteReader()

                    If rdRole.HasRows() Then
                        While rdRole.Read()
                            Session("UserRole") = String.Format(rdRole("Title"))
                        End While
                    End If
                Catch ex As Exception
                    Debug.Print("ERROR while inserting record on table..." & ex.Message, "Insert Records")
                Finally
                    con2.Close()
                End Try



                'Dim loginCookie As New HttpCookie("lastSession")
                'loginCookie.Value = DateTime.Now.ToString()
                'loginCookie.Expires = DateTime.Now.AddDays(5)
                'Response.Cookies.Add(loginCookie)

                'Response.Cookies("userInfo").Expires = DateTime.Now.AddDays(1)
                'Response.Cookies("userInfo").Value = UserID
                'Request.Cookies("userInfo").Value = UserID

                Session("activeUser") = UserID
                'Session("activeRole") = Querysomekind


                Debug.Print("valid login")

                Response.Redirect("~/RoleHome/RoleDefault.aspx")

                'Select Case Session("UserRole")
                '   Case "Coach"
                'Response.Redirect("~/Coach/CoachDefault.aspx")
                '    Case "Athlete"
                'Response.Redirect("~/Athlete/AthleteDefault.aspx")
                '    Case "Admin"
                'Response.Redirect("~/Admin/AdminDefault.aspx")

                'End Select

                con2.Close()
            End While

        Else
            Debug.Print("INVALID login. Try again please")
            LoginUser.FailureText = String.Format("Invalid Login Information")
            Response.Redirect("~/Account/ErrorLogin.aspx")
        End If






        Debug.Print("accountName {0} and password {1}", accountName, password)

        con1.Close()




    End Sub
End Class