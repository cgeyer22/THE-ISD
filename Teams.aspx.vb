﻿Imports System.Diagnostics

Partial Class Default3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Select Case Session("UserRole")
            Case "Admin"
                Debug.Print("UserRole is admin")
                AdminNavMenu.Visible = True

            Case "Coach"
                Debug.Print("UserRole is coach")
                CoachNavMenu.Visible = True

            Case "Athlete"
                Response.Redirect("~/Athlete/AthleteDefault.aspx")
        End Select

    End Sub

End Class
