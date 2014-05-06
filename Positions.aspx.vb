Imports System.Diagnostics
Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Dim conStr As String = "Data Source=simon;Initial Catalog=BetaSYS39414;Persist Security Info=True;User ID=skrygshe;Password=vccviwhq"


    Protected Sub AddButton_Click(sender As Object, e As System.EventArgs) Handles AddButton.Click
        For Each item As ListItem In CheckBoxList1.Items
            If item.Selected Then
                Using con1 As New SqlConnection(conStr)
                    Dim sqlCommand1 As New SqlCommand("EXEC AssignToPosition @LastName, @FirstName, @Position", con1)
                    Dim s As String = item.Value
                    Dim split As String() = s.Split(New Char() {" "c})
                    Dim FirstName As String = split(0)
                    Dim LastName As String = split(1)
                    Debug.Print("last name " + LastName)
                    Debug.Print("first name " + FirstName)
                    sqlCommand1.Parameters.AddWithValue("@LastName", LastName)
                    sqlCommand1.Parameters.AddWithValue("@FirstName", FirstName)
                    sqlCommand1.Parameters.AddWithValue("@Position", DropDownList2.SelectedValue)
                    Debug.Print(DropDownList2.SelectedValue)
                    con1.Open()

                    'THINGS I NEED TO GET WORKING: THIS  SQLCOMMAND AND THE STORED PROCEDURE FOR ATHLETENOTINPOSITION
                End Using
            End If
        Next
    End Sub
End Class
