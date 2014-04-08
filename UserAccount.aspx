<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="CreateUser" runat="server">
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
    <asp:DetailsView ID="NewAccountInformation" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="SqlAccess" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" DefaultMode="Insert">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
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
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
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
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
    </asp:DetailsView>
    <br />
    <br />
    <asp:GridView ID="UserAccounts" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlAccess" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ButtonType="Button" />
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
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
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
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    </form>
</body>
</html>
