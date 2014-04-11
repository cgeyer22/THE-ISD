
Partial Class Default3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case Session("UserRole")
            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteDefault.aspx")
            End Select
    End Sub

End Class
