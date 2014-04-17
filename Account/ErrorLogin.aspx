<%@ Page Title="Log In" Language="VB" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="false"
    CodeFile="ErrorLogin.aspx.vb" Inherits="ErrorLogin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        This is the page users are sent when they log in incorrectly or they try to go to a page without permission.
        <asp:hyperlink ID="LogoutLink" runat="server" Text=" Log in " NavigateUrl="~/Account/Login.aspx"  />
    </div>
</asp:Content>