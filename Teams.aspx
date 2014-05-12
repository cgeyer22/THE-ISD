<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Teams.aspx.vb" Inherits="Default3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Teams</h1>
    <div ID="CreateTeam" runat="server">
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
        <asp:Button ID="AddTeam" runat="server" Text="Add Team" />
        <br />
    <br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="TeamID" DataSourceID="sdsTeam" 
            DataValueField="UserID" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
            GridLines="Vertical" >
    <AlternatingRowStyle BackColor="#CCCCCC" />
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
    <asp:Button ID="Button1" runat="server" Text="Add Athletes To A Team" />
    <br />
    <br />
    <br />
    <br />
    </div>
    <br />
    <div id="AddAthletes" runat="server" Visible="false">
    Team:
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
        Athletes:<br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="UserID" DataSourceID="SqlDataSource2" DataValueField="UserID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
        </Columns>
    </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414GetAthletesFromTeam %>" 
            SelectCommand="GetAthletesFromTeam" SelectCommandType="StoredProcedure"
            DeleteCommand="DeleteTeamFromAthlete" DeleteCommandType="StoredProcedure">
                <DeleteParameters>
                <asp:ControlParameter ControlID="GridView2" Name="LastName" 
                    Type="String" PropertyName="SelectedDataKey[1]"  />
                <asp:ControlParameter ControlID="GridView2" Name="FirstName" 
                    Type="String" PropertyName="SelectedDataKey[0]"  />
                <asp:ControlParameter ControlID="DropDownList1" Name="Sport" 
                    PropertyName="SelectedValue" Type="String" />
                 </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Sport" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Add Athletes:<asp:CheckBoxList ID="CheckBoxList1" runat="server" 
            DataValueField="UserID" DataSourceID="SqlDataSource3" DataTextField="Column1" >
    </asp:CheckBoxList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414GetAthletesNotInTeam %>" 
            SelectCommand="GetAthletesNotInTeam" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Sport" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    <asp:Button ID="Button2" runat="server" Text="Add" />
    <asp:Button ID="Button3" runat="server" Text="Cancel" />
        <br />
    </div>
    <br />
    <br />
    </asp:Content>

