<%@ Page Title="Home" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="RoleDefault.aspx.vb" Inherits="Role_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>
        Welcome to the <%= Session("UserRole") %> home page.
    </h1>
    


</asp:Content>
