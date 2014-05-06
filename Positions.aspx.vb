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
                    Dim sqlCommand1 As New SqlCommand("EXEC AssignToPosition @UserID, @Position", con1)
                    sqlCommand1.Parameters.AddWithValue("@UserID", item.Value)
                    sqlCommand1.Parameters.AddWithValue("@Position", DropDownList2.SelectedValue)
                    con1.Open()
                    Dim rowsAfftected As Integer = sqlCommand1.ExecuteNonQuery

                    'THINGS I NEED TO GET WORKING: THE STORED PROCEDURE FOR ATHLETENOTINPOSITION
                End Using
            End If
        Next
        GridView1.DataBind()
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        Label3.Visible = True
        assign.Visible = True
        GridView1.Visible = True
        GridView1.DataBind()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        DropDownList2.Visible = True
        GridView1.Visible = False
        Label3.Visible = False
        assign.Visible = False
        GridView1.DataBind()
    End Sub
End Class
