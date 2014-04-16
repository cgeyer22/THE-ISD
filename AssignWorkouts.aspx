<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AssignWorkouts.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
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
                <asp:MenuItem NavigateUrl="~/UserAccounts/UserAccount.aspx" Text="Manage User Accounts" />
                <asp:MenuItem NavigateUrl="~/Teams.aspx" Text="Manage Teams" />
                <asp:MenuItem NavigateUrl="~/WorkoutPage.aspx" Text="Manage Workouts" />
                <asp:MenuItem NavigateUrl="~/ExercisePage.aspx" Text="Manage Exercises" />
                <asp:MenuItem NavigateUrl="~/ReportPage.aspx" Text="Manage Workout Reports" />
            </Items>
        </asp:Menu>
    </div>

    <asp:SqlDataSource ID="sdsWorkout" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionWorkout %>" 
        InsertCommand="CreateWorkout" InsertCommandType="StoredProcedure" 
        SelectCommand="ReadWorkout" SelectCommandType="StoredProcedure" 
        UpdateCommand="UpdateWorkout" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="WorkoutName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="WorkoutID" Type="Int32" />
            <asp:Parameter Name="WorkoutName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="WorkoutTable" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="WorkoutID" 
        DataSourceID="sdsWorkout">
        <Columns>
            <asp:CommandField ShowSelectButton="True" 
                ButtonType="Button" EditText="" SelectText="Assign to Athletes" 
                UpdateText="Save" />
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="WorkoutName" HeaderText="Workout Name" 
                SortExpression="WorkoutName" />
            <asp:BoundField DataField="Description" HeaderText="Workout Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsAthletes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionWorkout %>" 
        SelectCommand="ReadAthletes" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:CheckBoxList ID="checklistAthletes" runat="server" 
        DataSourceID="sdsAthletes" DataTextField="FullName" DataValueField="UserID" 
        Visible="False">
        <asp:ListItem Text="Name" Value="FullName"  />
    </asp:CheckBoxList>
    
    
    <asp:Button ID="btnAssign" runat="server" Text="Assign" Visible="False" />
    <br />
    <asp:Label ID="lblAssignmentResult" runat="server" Text="Assigned to: " Visible="false" />
    <br />
    <asp:Label ID="lblDublicate" runat="server" Text="Previously Assigned to: " Visible="false" />
</asp:Content>

