<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="UserAccount.aspx.vb" Inherits="UserAccount" %>


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

    <div id="CreateUser">
    <asp:SqlDataSource ID="SqlAccess" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString %>" 
        DeleteCommand="InactivateUserAccount" DeleteCommandType="StoredProcedure" 
        InsertCommand="CreateAccount" InsertCommandType="StoredProcedure" 
        SelectCommand="ReadAccounts" SelectCommandType="StoredProcedure" 
        UpdateCommand="UpdateAccount" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="TaylorID" Type="Int32" />
            <asp:Parameter Name="Height" Type="String" />
            <asp:Parameter Name="BodyWeight" Type="String" />
            <asp:Parameter Name="SchoolYear" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="TaylorID" Type="Int32" />
            <asp:Parameter Name="Height" Type="String" />
            <asp:Parameter Name="BodyWeight" Type="String" />
            <asp:Parameter Name="SchoolYear" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="NewAccountInformation" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="SqlAccess" 
            DefaultMode="Insert">
        <Fields>
            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
            <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:TemplateField HeaderText="Gender" SortExpression="Gender" 
                ConvertEmptyStringToNull="False">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlGender" DataField="Gender" DataValueField="Gender" DataTextField="Gender" runat="server">
                        <asp:ListItem Text="Male" Value="1">
                        </asp:ListItem>
                        <asp:ListItem Text="Female" Value="0">
                        </asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TaylorID" HeaderText="TaylorID" 
                SortExpression="TaylorID" />
            <asp:BoundField DataField="Height" HeaderText="Height" 
                SortExpression="Height" />
            <asp:BoundField DataField="BodyWeight" HeaderText="BodyWeight" 
                SortExpression="BodyWeight" />
            <asp:BoundField DataField="SchoolYear" HeaderText="SchoolYear" 
                SortExpression="SchoolYear" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
        </Fields>
    </asp:DetailsView>
    <br />
    <br />
    <asp:SqlDataSource ID="SearchSQLConnection" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionStringSearchAccounts %>" 
            SelectCommand="SearchAccounts" SelectCommandType="StoredProcedure" 
            UpdateCommand="UpdateAccount" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GivenFirstName" Name="FirstName" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="GivenLastName" Name="LastName" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="TaylorID" Type="Int32" />
            <asp:Parameter Name="Height" Type="String" />
            <asp:Parameter Name="BodyWeight" Type="String" />
            <asp:Parameter Name="SchoolYear" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <h2>Search for Account</h2>
    <asp:Label Text="First Name" runat="server"></asp:Label>
    <asp:TextBox ID="GivenFirstName" runat="server" />
    <asp:Label Text="Last Name" runat="server"></asp:Label>
    <asp:TextBox ID="GivenLastName" runat="server" />
    <asp:Button ID="SubmitSearchAccount" Text="search" runat="server" />
    <br />
    <br />
    <asp:GridView ID="SearchResultsAccounts" runat="server" 
            DataSourceID="SearchSQLConnection" AutoGenerateColumns="False" 
            DataKeyNames="UserID" AllowSorting="True" AllowPaging="True" 
            CssClass="gridView">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                ReadOnly="True" SortExpression="UserID" Visible="False" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
            <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" Visible="False" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:CheckBoxField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" Visible="False" />
            <asp:BoundField DataField="TaylorID" HeaderText="TaylorID" 
                SortExpression="TaylorID" />
            <asp:BoundField DataField="Height" HeaderText="Height" 
                SortExpression="Height" />
            <asp:BoundField DataField="BodyWeight" HeaderText="BodyWeight" 
                SortExpression="BodyWeight" />
            <asp:BoundField DataField="SchoolYear" HeaderText="SchoolYear" 
                SortExpression="SchoolYear" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
        </Columns>
    </asp:GridView>

    <br />
    <br />
    <div id="gridDiv">
    <asp:GridView ID="UserAccounts" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="UserID" CssClass="gridView" DataSourceID="SqlAccess" 
            AllowPaging="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ButtonType="Button" />
            <asp:BoundField Visible="false" DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
            <asp:BoundField DataField="Password" HeaderText="Password" 
                SortExpression="Password" Visible="False" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" Visible="False" />
            <asp:BoundField DataField="TaylorID" HeaderText="TaylorID" 
                SortExpression="TaylorID" />
            <asp:BoundField DataField="Height" HeaderText="Height" 
                SortExpression="Height" />
            <asp:BoundField DataField="BodyWeight" HeaderText="BodyWeight" 
                SortExpression="BodyWeight" />
            <asp:BoundField DataField="SchoolYear" HeaderText="SchoolYear" 
                SortExpression="SchoolYear" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
        </Columns>
    </asp:GridView>
    </div>
    </div>
    </asp:Content>
    

