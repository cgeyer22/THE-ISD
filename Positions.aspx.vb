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

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        DropDownList2.Visible = True
        PosButton.Visible = True
        GridView1.Visible = False
        Label2.Visible = True
        Label3.Visible = False
        assign.Visible = False
        GridView1.DataBind()
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        Label3.Visible = True
        assign.Visible = True
        GridView1.Visible = True
        GridView1.DataBind()
    End Sub

   

    Protected Sub PosButton_Click(sender As Object, e As System.EventArgs) Handles PosButton.Click
        newPos.Visible = True
        Label3.Visible = False
        GridView1.Visible = False
        assign.Visible = False
        PosButton.Visible = False
        DropDownList2.Visible = False
        Label2.Visible = False
        Label3.Visible = False
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Label3.Visible = True
        assign.Visible = True
        GridView1.Visible = True
        PosButton.Visible = True
        newPos.Visible = False
        Label2.Visible = True
        DropDownList2.Visible = True
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Using con1 As New SqlConnection(conStr)
            Dim cmdUpdatePos As New SqlCommand("EXEC CreatePosition @Name, @Description, @Sport", con1)
            cmdUpdatePos.Parameters.AddWithValue("@Name", Position.Text)
            cmdUpdatePos.Parameters.AddWithValue("@Description", Description.Text)
            cmdUpdatePos.Parameters.AddWithValue("@Sport", DropDownList1.SelectedValue)
            con1.Open()
            Dim rowsAffected As Integer = cmdUpdatePos.ExecuteNonQuery
        End Using
        GridView1.DataBind()
        DropDownList1.DataBind()
        DropDownList2.DataBind()

        Label3.Visible = True
        assign.Visible = True
        GridView1.Visible = True
        PosButton.Visible = True
        newPos.Visible = False
        Label2.Visible = True
        DropDownList2.Visible = True

    End Sub
End Class
