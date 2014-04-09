<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="WorkoutPage.aspx.vb" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Workouts</h1>
    <br />
    <asp:SqlDataSource ID="sdsWorkout" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionWorkout %>" 
        InsertCommand="CreateWorkout" InsertCommandType="StoredProcedure" 
        SelectCommand="ReadWorkout" SelectCommandType="StoredProcedure" 
        UpdateCommand="UpdateWorkout" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="WorkoutID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <div id="NavBar">
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

    </div>
        <div id="CurrentWorkouts">
    <asp:GridView ID="WorkoutTable" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="WorkoutID" 
        DataSourceID="sdsWorkout">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" 
                ButtonType="Button" EditText="Rename" SelectText="Edit Exercises" 
                UpdateText="Save" />
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Workout Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Workout Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnNewWorkout" runat="server" Text="Add Workout" />
    
    <br />
    <asp:DetailsView ID="dvNewWorkout" runat="server" AutoGenerateRows="False" 
        DataKeyNames="WorkoutID" DataSourceID="sdsWorkout" DefaultMode="Insert" 
        Height="50px" Width="125px" Visible="False">
        <Fields>
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                InsertText="Save New Workout" ShowCancelButton="False" />
        </Fields>
    </asp:DetailsView>
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="False" />
    <br />
    <asp:SqlDataSource ID="sdsWorkoutExercise" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414WorkoutExercise %>" 
        DeleteCommand="DeleteWorkoutExercise" DeleteCommandType="StoredProcedure" 
        InsertCommand="CreateWorkoutExercise" InsertCommandType="StoredProcedure" 
        SelectCommand="ReadWorkoutExercise" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
            <asp:Parameter Name="WorkoutID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
            <asp:Parameter Name="WorkoutID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="WorkoutTable" DefaultValue="" Name="WorkoutID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="gvWorkoutExercise" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sdsWorkoutExercise" Visible="False">
        <Columns>
            <asp:BoundField DataField="Workout" HeaderText="Workout" 
                SortExpression="Workout" />
            <asp:BoundField DataField="Exercise" HeaderText="Exercise" 
                SortExpression="Exercise" />
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ExerciseID" 
                Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsExercise" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414Exercise %>" 
        DeleteCommand="DeleteExercise" DeleteCommandType="StoredProcedure" 
        InsertCommand="CreateExercise" InsertCommandType="StoredProcedure" 
        SelectCommand="ReadExercise" SelectCommandType="StoredProcedure" 
        UpdateCommand="UpdateExerciseTable" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="ddlExercise" runat="server" DataSourceID="sdsExercise" 
        DataTextField="Name" DataValueField="ExerciseID" Visible="False">
    </asp:DropDownList>
    <br />
    <asp:Button ID="btnAddExercise" runat="server" Text="Add Exercise to Workout" 
        Visible="False" />
    </div>
    </asp:Content>
    

