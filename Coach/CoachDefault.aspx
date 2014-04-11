<%@ Page Title="Coach Home" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="CoachDefault.aspx.vb" Inherits="Coach_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>
        Welcome to the Coach home page.
    </h1>
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


</asp:Content>
