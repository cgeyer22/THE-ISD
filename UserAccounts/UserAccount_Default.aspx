<%@ Page Title="User Account" Language="VB" AutoEventWireup="false" CodeFile="UserAccount_Default.aspx.vb" Inherits="UserAccounts_UserAccount_Default" MasterPageFile="~/Site.master" %>




<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div id="NavBar">
        <asp:Menu ID="UserAccount_Menu" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Vertical">
            <Items>
                <asp:MenuItem NavigateUrl="~/UserAccounts/UserAccount.aspx" Text="Create and Edit Accounts" />
                <asp:MenuItem NavigateUrl="~/UserAccounts/UserRoles.aspx" Text="Edit User Roles" />
            </Items>
        </asp:Menu>
        
    </div>



</asp:Content>