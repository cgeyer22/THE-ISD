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
    <asp:SqlDataSource ID="sdsEnteredData" runat="server"></asp:SqlDataSource>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
        ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <DayStyle ForeColor="#330066" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
            VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="2px" 
            Font-Bold="True" Font-Size="12pt" ForeColor="#330066" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="XX-Large" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="imgbtnCal" runat="server" Height="37px" 
        ImageUrl="http://www.stc-chicago.com/wp-content/uploads/2014/03/Calendar_Icon.png" 
        style="margin-top: 0px; margin-bottom: 0px" Visible="False" Width="38px" />
    <asp:GridView ID="gvAssignedWO" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataSourceID="sdsAssignedWorkouts" 
        Visible="False" BorderStyle="Solid" BorderColor="Black">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Enter Results" 
                ShowSelectButton="True" >
            <ControlStyle ForeColor="#330066" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:BoundField DataField="WorkoutName" HeaderText="WorkoutName" 
                SortExpression="WorkoutName" >
            <HeaderStyle ForeColor="#330066" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" >
            <HeaderStyle ForeColor="#330066" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:GridView ID="GridView1" runat="server">
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

