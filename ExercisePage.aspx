<%@ Page Language="VB" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="false" CodeFile="ExercisePage.aspx.vb" Inherits="ExercisePage_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

       <h1>Create Exercise</h1>
      <div class="NavBar">
        <asp:Menu ID="CoachNavMenu" Visible="false" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Vertical">
            <Items>
                <asp:MenuItem NavigateUrl="~/WorkoutPage.aspx" Text="Workouts" />
                <asp:MenuItem NavigateUrl="~/ExercisePage.aspx" Text="Exercises" />
                <asp:MenuItem NavigateUrl="~/ReportPage.aspx" Text="Workout Reports" />
                <asp:MenuItem NavigateUrl="~/AttendancePage.aspx" Text="Attendance Reports" />
                <asp:MenuItem NavigateUrl="~/Teams.aspx" Text="Teams" />
                <asp:MenuItem NavigateUrl="~/Positions.aspx" Text="Positions" />
            </Items>
        </asp:Menu>
        <asp:Menu ID="AdminNavMenu" Visible="false" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Vertical">
            <Items>
                <asp:MenuItem NavigateUrl="~/UserAccount.aspx" Text="Manage User Accounts" />
                <asp:MenuItem NavigateUrl="~/Teams.aspx" Text="Manage Teams" />
                <asp:MenuItem NavigateUrl="~/WorkoutPage.aspx" Text="Manage Workouts" />
                <asp:MenuItem NavigateUrl="~/ExercisePage.aspx" Text="Manage Exercises" />
                <asp:MenuItem NavigateUrl="~/ReportPage.aspx" Text="Manage Workout Reports" />
            </Items>
        </asp:Menu>
        <asp:Menu ID="AthleteNavMenu" Visible="false" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Vertical">
            <Items>
                <asp:MenuItem NavigateUrl="~/WorkoutPage.aspx" Text="Manage Workouts" />
                <asp:MenuItem NavigateUrl="~/CalendarPage.aspx" Text="Manage Calendar" />
                <asp:MenuItem NavigateUrl="~/ReportPage.aspx" Text="Manage Reports" />
            </Items>
        </asp:Menu>

    </div>
    <div class="PostionOfLeftColumn">
    <asp:SqlDataSource ID="sqlExerciseTable" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString %>" 
        SelectCommand="ReadExercise" 
        DeleteCommand="DeleteExercise" 
        InsertCommand="CreateExercise" 
        UpdateCommand="UpdateExerciseTable" DeleteCommandType="StoredProcedure" 
        InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" 
        UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        DefaultMode="Insert" AutoGenerateRows="False" BorderWidth="1px" CellPadding="2" DataKeyNames="ExerciseID" 
        DataSourceID="sqlExerciseTable" GridLines="None">
        <Fields>
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ExerciseID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
        </Fields>
    </asp:DetailsView>
    <br />
    <h2>List of Exercises</h2>
    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
        CellSpacing="1" DataKeyNames="ExerciseID" DataSourceID="sqlExerciseTable" 
        GridLines="Horizontal" Width="600px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
          
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    </div>

</asp:Content>
