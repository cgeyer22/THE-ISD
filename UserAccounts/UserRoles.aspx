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
            DataValueField="UserID" AutoPostBack="True" AppendDataBoundItems="true" >
        <asp:ListItem Selected="True" Value="-1">--Select One--</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="sqlDSUserRole" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString2UserRole %>" 
        SelectCommand="SelectUsers" SelectCommandType="StoredProcedure" 
            UpdateCommand="UpdateRoleOfUser" UpdateCommandType="StoredProcedure" >
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="ChangeRoleID" Type="Int32" />
            <asp:Parameter Name="NewRoleID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <br />
        <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString2UpdateUserRole %>" 
        SelectCommand="SelectRoleOfUser" SelectCommandType="StoredProcedure" 
            UpdateCommand="UpdateRoleOfUser" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlUsername" Name="UserID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="ChangeRoleID" Type="Int32" />
            <asp:Parameter Name="NewRoleID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource1" DataKeyNames="RoleID" BackColor="White" 
            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
            ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"  />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
        
        <br />
        
        <asp:Button ID="btnChange" runat="server" Text="Change User Role" 
            Visible="False" />
        
        <asp:Label ID="lblChange" runat="server" Text="Change" Visible="False"></asp:Label>
        <asp:DropDownList ID="ddlChangeRole" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="RoleID" 
            Visible="False">
        </asp:DropDownList>
        
        <asp:Label Text="Role of User to: " ID="lblRole" runat="server" 
            Visible="False" />
        <asp:DropDownList ID="ddlRoles" runat="server" Visible="False"
            DataSourceID="SqlDataSource2" DataTextField="Title" 
            DataValueField="RoleID">
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

        <br />

        <br />

        <asp:Button ID="btnAdd" runat="server" Text="Add User Role" Visible="False" />
        <asp:Label ID="lblAdd1" runat="server" Text="Add" Visible="False"></asp:Label>
        <asp:DropDownList ID="ddlAddRole" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="Title" DataValueField="RoleID" Visible="False">
        </asp:DropDownList>
        <asp:Label ID="lblAdd2" runat="server" Text="Role to User" Visible="False"></asp:Label>
        <asp:Button ID="btnAddRole" runat="server" Text="Confirm" Visible="False" />
        <br />
        <br />
        <asp:Button ID="btnDelete" runat="server" Text="Delete User Role" 
            Visible="False" />
        <asp:Label ID="lblRemove1" runat="server" Text="Remove" Visible="False"></asp:Label>
        <asp:DropDownList ID="ddlDeleteRole" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="RoleID" 
            Visible="False">
        </asp:DropDownList>
        <asp:Label ID="lblRemove2" runat="server" Text="Role from User" Visible="False"></asp:Label>
        <asp:Button ID="btnDeleteRole" runat="server" Text="Confirm" Visible="False" />
        <br />

    </div>

</asp:Content>
