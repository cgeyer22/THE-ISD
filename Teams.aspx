<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Teams.aspx.vb" Inherits="Default3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Teams</h1>

    <br />
    <asp:SqlDataSource ID="sdsTeam" runat="server" 
    ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString %>" 
    InsertCommand="CreateTeam" InsertCommandType="StoredProcedure" 
    SelectCommand="ReadTeam" SelectCommandType="StoredProcedure" 
    UpdateCommand="UpdateTeam" UpdateCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="Sport" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="Gender" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="TeamID" Type="Int32" />
        <asp:Parameter Name="Sport" Type="String" />
        <asp:Parameter Name="Gender" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>
    <asp:DetailsView ID="dvTeamInsert" runat="server" AutoGenerateRows="False" 
        DataKeyNames="TeamID" DataSourceID="sdsTeam" DefaultMode="Insert" 
        Height="136px" Width="125px">
        <Fields>
            <asp:BoundField DataField="TeamID" HeaderText="TeamID" InsertVisible="False" 
                ReadOnly="True" SortExpression="TeamID" />
            <asp:BoundField DataField="Sport" HeaderText="Sport" SortExpression="Sport" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
        </Fields>
    </asp:DetailsView>
    <br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="TeamID" DataSourceID="sdsTeam">
    <Columns>
        <asp:BoundField DataField="TeamID" HeaderText="TeamID" InsertVisible="False" 
            ReadOnly="True" SortExpression="TeamID" />
        <asp:BoundField DataField="Sport" HeaderText="Sport" SortExpression="Sport" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" 
            SortExpression="Gender" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
        <asp:CheckBoxField DataField="Active" HeaderText="Active" 
            SortExpression="Active" />
    </Columns>
</asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    Add Athletes to Team:<br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
    DataSourceID="SqlDataSource1" DataTextField="Sport" DataValueField="Sport">
        <asp:ListItem Text="--Select A Team--" Value="" />
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString7 %>" 
    SelectCommand="GetTeamName" SelectCommandType="StoredProcedure">
</asp:SqlDataSource>
    <br />
    <br />
    </asp:Content>

