<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Teams.aspx.vb" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Positions</h1>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" 
    DataSourceID="SqlDataSource1" DataTextField="Sport" DataValueField="Sport" AutoPostBack="true" AppendDataBoundItems="true">
        <asp:ListItem Text="--Select A Team--" Value="" /> 
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:BetaSYS39414GetTeams %>" 
    SelectCommand="SELECT [Sport] FROM [Team]"></asp:SqlDataSource>
    <br />
    <br />
  
    </asp:Content>
