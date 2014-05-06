<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AthleteWorkouts.aspx.vb" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="sdsAssignedWorkouts" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414AssignedWO %>" 
        SelectCommand="ReadAssignedWO4At" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="ActiveUser" Type="Int32" />
            <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="WorkoutDate" 
                PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
        ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
            VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <asp:GridView ID="gvAssignedWO" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="sdsAssignedWorkouts" 
        Visible="False" BorderStyle="Groove">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Enter Results" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="WorkoutName" HeaderText="WorkoutName" 
                SortExpression="WorkoutName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

