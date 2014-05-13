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
    <asp:SqlDataSource ID="sdsAssignedExercises" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414AssignedExercises %>" 
        SelectCommand="ReadAssignedExercises" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvAssignedWO" Name="WorkoutID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsEnteredData" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414EnteredData %>" 
        SelectCommand="ReadExerciseSets" SelectCommandType="StoredProcedure" 
        UpdateCommand="UpdateEnteredData" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="ActiveUser" Type="Int32" />
            <asp:ControlParameter ControlID="gvAssignedWO" Name="WorkoutID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="gvExercises" Name="ExerciseID" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="DateID" 
                PropertyName="SelectedDate" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="EnteredDataID" Type="Int32" />
            <asp:Parameter Name="Entered_weight" Type="Int32" />
            <asp:Parameter Name="Entered_reps" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" 
        ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="100%">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#CCCCCC" 
            VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="Black" BorderColor="Black" BorderWidth="4px" 
            Font-Bold="True" Font-Size="12pt" ForeColor="#EEEEEE" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="XX-Large" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:ImageButton ID="imgbtnCal" runat="server" Height="37px" 
        ImageUrl="http://www.stc-chicago.com/wp-content/uploads/2014/03/Calendar_Icon.png" 
        style="margin-top: 0px; margin-bottom: 0px" Visible="False" Width="38px" />
    <asp:GridView ID="gvAssignedWO" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="WorkoutID" 
        DataSourceID="sdsAssignedWorkouts" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
        GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="View Exercises" 
                ShowSelectButton="True">
            <ControlStyle ForeColor="#330066" />
            </asp:CommandField>
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="WorkoutName" HeaderText="Workout" 
                SortExpression="WorkoutName">
            <HeaderStyle ForeColor="#330066" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
            <HeaderStyle ForeColor="#330066" />
            </asp:BoundField>
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
    <asp:Label ID="lblWorkout" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="XX-Large" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnWorkouts" runat="server" BorderColor="Black" 
        ForeColor="#330066" Text="Back to Workouts" Visible="False" 
        Font-Bold="True" />
    <asp:GridView ID="gvExercises" runat="server" Visible="False" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ExerciseID" 
        DataSourceID="sdsAssignedExercises" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Enter Results" 
                ShowSelectButton="True">
            <ControlStyle ForeColor="#330066" />
            </asp:CommandField>
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ExerciseID" 
                Visible="False" />
            <asp:BoundField DataField="ExerciseName" HeaderText="Exercise" 
                SortExpression="ExerciseName">
            <HeaderStyle ForeColor="#330066" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description">
            <HeaderStyle ForeColor="#330066" />
            </asp:BoundField>
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
    <asp:Label ID="lblExercise" runat="server" Font-Bold="True" Font-Italic="True" 
        Font-Size="XX-Large" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnExercises" runat="server" BorderColor="Black" 
        Font-Bold="True" ForeColor="#330066" Text="Back to Exercises" Visible="False" />
    <asp:GridView ID="gvEnterData" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="EnteredDataID" DataSourceID="sdsEnteredData" 
        Visible="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
        GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowEditButton="True">
            <ControlStyle ForeColor="#330066" />
            </asp:CommandField>
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                SortExpression="WorkoutID" Visible="False" />
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                SortExpression="ExerciseID" Visible="False" />
            <asp:BoundField DataField="EnteredDataID" HeaderText="EnteredDataID" 
                ReadOnly="True" SortExpression="EnteredDataID" Visible="False" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" 
                Visible="False" />
            <asp:BoundField DataField="DateID" HeaderText="DateID" SortExpression="DateID" 
                Visible="False" />
            <asp:BoundField DataField="Assigned_weight" HeaderText="Target Weight" 
                SortExpression="Assigned_weight" ReadOnly="True" />
            <asp:BoundField DataField="Entered_weight" HeaderText="Actual Weight" 
                SortExpression="Entered_weight" />
            <asp:BoundField DataField="Assigned_reps" HeaderText="Target Reps" 
                SortExpression="Assigned_reps" ReadOnly="True" />
            <asp:BoundField DataField="Entered_reps" HeaderText="Actual Reps" 
                SortExpression="Entered_reps" />
            <asp:BoundField DataField="Rest_time_minutes" HeaderText="Rest Time (mins)" 
                SortExpression="Rest_time_minutes" ReadOnly="True" />
            <asp:BoundField DataField="Rest_time_seconds" HeaderText="Rest Time (sec)" 
                SortExpression="Rest_time_seconds" ReadOnly="True" />
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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

