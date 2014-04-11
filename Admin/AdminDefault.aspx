<%@ Page Title="Admin Home" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="AdminDefault.aspx.vb" Inherits="Admin_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>
    <div>
        Here is a link to <a href="../UserAccounts/UserAccount_Default.aspx" >User Accounts</a>.
        Here is another to 
        <asp:Button ID="btnWorkout" runat="server" Text="Workout Page" />
    </div>
</asp:Content>