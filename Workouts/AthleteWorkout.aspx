<%@ Page Title="Workouts" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AthleteWorkout.aspx.vb" Inherits="Workouts_AthleteWorkout" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <asp:SqlDataSource ID="sqlAthleteWO" runat="server"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>



</asp:Content>