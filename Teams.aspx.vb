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


    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        AddAthletes.Visible = True
        CreateTeam.Visible = False
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Cancel.Click
        AddAthletes.Visible = False
        CreateTeam.Visible = True
    End Sub

 
    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Add.Click
        For Each item As ListItem In CheckBoxList1.Items
            If item.Selected Then
                Using con1 As New SqlConnection(connectionString)
                    Dim sqlCommand1 As New SqlCommand("EXEC AssignToTeam @UserID, @Sport", con1)
                    sqlCommand1.Parameters.AddWithValue("@UserID", item.Value)
                    sqlCommand1.Parameters.AddWithValue("@Sport", DropDownList1.SelectedValue)
                    con1.Open()
                    Dim rowsAfftected As Integer = sqlCommand1.ExecuteNonQuery
                End Using
            End If
        Next
        GridView2.DataBind()
        CheckBoxList1.DataBind()
    End Sub

End Class
