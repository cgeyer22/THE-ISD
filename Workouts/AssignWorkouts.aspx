<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AssignWorkouts.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
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
    <asp:Button ID="Button1" runat="server" Text="← Back to Workout Info" />
    <br />
    <br />
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
    </asp:CheckBoxList>

    <asp:Button ID="btnWeightsReps" runat="server" Text="Assign Weight and Rep Counts" Visible="false" />
    <asp:SqlDataSource ID="sqlListExercises" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString4ListExercises %>" 
        SelectCommand="ListExercisesForAthletes" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="WorkoutTable" Name="WorkoutID" 
                PropertyName="SelectedValue" Type="Int32" />
            <%--<asp:Parameter Name="UserID" Type="Int32" />--%>
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="divWeightRep" runat="server" visible="false" >
        <asp:Label ID="lblInput" Text= "Input Rep counts and Weight assignments below." runat="server" Visible="true" />
    </div>

    <br /><br />
    <asp:Button ID="btnAssign" runat="server" Text="Assign" Visible="False" />
    <br />
    <br />
    <asp:Label ID="lblAssignmentResult" runat="server" Text="Assigned to: " Visible="false" />
    <br />
    <asp:Label ID="lblDublicate" runat="server" Text="Previously Assigned to: " Visible="false" />
    <br />
    <asp:Button ID="EnterAssignedRepsAndWeight" Text="Submit" runat="server" />
</asp:Content>

