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
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="sqlDSUserRole" DataTextField="Username" 
            DataValueField="Username" AutoPostBack="True">
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
            <asp:ControlParameter ControlID="DropDownList1" Name="UserName" 
                PropertyName="SelectedValue" Type="String" />
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

        <asp:DropDownList ID="DropDownList2" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="Title" DataValueField="Title">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString2 %>" 
            SelectCommand="SelectRoles" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>

    </div>

</asp:Content>
