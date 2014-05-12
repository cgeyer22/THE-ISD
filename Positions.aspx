<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Positions.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>&nbsp;Positions</h1>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Team:"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
    DataSourceID="SqlDataSource1" DataTextField="Sport" DataValueField="Sport" AutoPostBack="true" AppendDataBoundItems="true">
        <asp:ListItem Text="--Select A Team--" Value="" /> 
</asp:DropDownList>
    <br />
    <br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:BetaSYS39414GetTeams %>" 
    SelectCommand="SELECT [Sport] FROM [Team]"></asp:SqlDataSource>
    <br />
    <div id="newPos" runat="server" Visible="false">
    New Position Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        New Position Description:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:Button ID="Button1" runat="server" Text="Submit" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Cancel" /> 
    </div>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Position:"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name" AutoPostBack="true" Visible="false" >
        <asp:ListItem Text="--Select A Position--" Value="" />
    </asp:DropDownList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414GetPositions %>" 
        SelectCommand="GetPositionsBasedOnTeam" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Sport" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="PosButton" runat="server" Visible="false" Text="Creat New Position"  />
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Athletes:" Visible="false"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource3"  DataKeyNames="LastName,FirstName" 
        Visible="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
        BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
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


<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:BetaSYS39414GetAthletesFromPosition %>" 
    SelectCommand="GetAthletesBasedOnPosition" SelectCommandType="StoredProcedure" 
        DeleteCommand="DeletePositionFromAthlete" DeleteCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:ControlParameter ControlID="DropDownList2" Name="PosName" 
            PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="GridView1" Name="LastName" 
            Type="String" PropertyName="SelectedDataKey[0]"  />
        <asp:ControlParameter ControlID="GridView1" Name="FirstName" 
            Type="String" PropertyName="SelectedDataKey[1]"  />
    </DeleteParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList2" Name="Name" 
            PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
  
    <br />
  
    <br />
    <br />
  
    <br />
    <div ID="assign" runat="server" visible="false">
    Add
    athletes to this position:
    <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
        DataSourceID="SqlDataSource4" DataTextField="Column1" DataValueField="UserID">
    </asp:CheckBoxList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString5 %>" 
        SelectCommand="AthleteNotInPosition" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="PosName" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="TeamName" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="AddButton" runat="server" Text="Add" AutoPostBack="true" />
    </div>
  
    <br />
  
    </asp:Content>
