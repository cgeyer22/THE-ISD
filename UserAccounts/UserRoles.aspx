<%@ Page Title="Edit User Roles" Language="VB" AutoEventWireup="false" CodeFile="UserRoles.aspx.vb" Inherits="UserAccounts_UserRoles" MasterPageFile="~/Site.master" %>



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


    <div>
    <asp:DropDownList ID="ddlUsername" runat="server" 
        DataSourceID="sqlDSUserRole" DataTextField="Username" 
            DataValueField="UserID" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="sqlDSUserRole" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString2UserRole %>" 
        SelectCommand="SelectUsers" SelectCommandType="StoredProcedure" 
            UpdateCommand="UpdateRoleOfUser" UpdateCommandType="StoredProcedure" >
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString2UpdateUserRole %>" 
        SelectCommand="SelectRoleOfUser" SelectCommandType="StoredProcedure" 
            UpdateCommand="UpdateRoleOfUser" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlUsername" Name="UserID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"  />
        </Columns>
    </asp:GridView>
        
        <asp:Button ID="btnChange" runat="server" Text="Change User Role" />
        
        <asp:Label Text="Change Role of User to: " ID="lblChange" runat="server" Visible="false" />
        <asp:DropDownList ID="ddlRoles" runat="server" Visible="false"
            DataSourceID="SqlDataSource2" DataTextField="Title" DataValueField="Title">
        </asp:DropDownList>
        <asp:Button ID="btnNewRole" runat="server" Text="Confirm" Visible="false" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString2 %>" 
            SelectCommand="SelectRoles" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlUsername" Name="UserID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>
