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
            <asp:Parameter Name="WorkoutName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="WorkoutID" Type="Int32" />
            <asp:Parameter Name="WorkoutName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="WorkoutSearchConnection" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionStringWorkoutSearch %>" 
        SelectCommand="SearchWorkouts" SelectCommandType="StoredProcedure" 
        UpdateCommand="UpdateWorkout" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="WorkoutSearch" Name="WorkoutName" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WorkoutID" Type="Int32" />
            <asp:Parameter Name="WorkoutName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h2>Search for Workout</h2>
    <asp:Label ID="Label1" Text="Workout Name" runat="server"></asp:Label>
    <asp:TextBox ID="WorkoutSearch" runat="server" />
    <asp:Button ID="SubmitSearchWorkout" Text="search" runat="server" />
    <br />
    <asp:Button ID="btnWorkoutVis" runat="server" Text="View all workouts" />
    <br />
    <br />
    <asp:GridView ID="SearchResultsAccounts" runat="server" 
            DataSourceID="WorkoutSearchConnection" AutoGenerateColumns="False" 
            DataKeyNames="WorkoutID" AllowSorting="True">
        <Columns>
            <asp:BoundField Visible="false" DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" />
            <asp:BoundField DataField="WorkoutName" HeaderText="WorkoutName" 
                SortExpression="WorkoutName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
    
    <div id="CurrentWorkouts">
    <asp:GridView ID="WorkoutTable" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="WorkoutID" 
        DataSourceID="sdsWorkout" Visible="False" >
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" 
                ButtonType="Button" EditText="Rename" SelectText="Edit Exercises" 
                UpdateText="Save" ControlStyle-CssClass="button"/>
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="WorkoutName" HeaderText="Workout Name" 
                SortExpression="WorkoutName" />
            <asp:BoundField DataField="Description" HeaderText="Workout Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnNewWorkout" runat="server" Text="Add Workout" Class="button" Visible="false" />
    
        <br />
        <asp:SqlDataSource ID="sqlAddNewWorkout" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString8AddNewWorkout %>" 
            InsertCommand="CreateWorkout" InsertCommandType="StoredProcedure" 
            SelectCommand="ReadWorkout" SelectCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="WorkoutName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    <br />
    <asp:DetailsView ID="dvNewWorkout" runat="server" AutoGenerateRows="False" 
        DataKeyNames="WorkoutID" DataSourceID="sqlAddNewWorkout" DefaultMode="Insert" 
        Height="50px" Width="125px" Visible="False">
        <Fields>
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="WorkoutName" HeaderText="WorkoutName" SortExpression="WorkoutName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            </Fields>
    </asp:DetailsView>
    <br />
    <asp:Button ID="btnAddWorkout" runat="server" Text="Save New Workout" Visible="false" Height="31px" class="button" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="False" 
            Height="31px" Class="button" />
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

    <div>
        -----<asp:Button ID="btnNewExercise" runat="server" Text="Create a New Exercise" Class="button" />
        <asp:GridView ID="gvWorkoutExercise" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sdsWorkoutExercise" Visible="False">
        <Columns>
            <asp:BoundField DataField="Workout" HeaderText="Workout" 
                SortExpression="Workout" ReadOnly="True" />
            <asp:BoundField DataField="Exercise" HeaderText="Exercise" 
                SortExpression="Exercise" ReadOnly="True" />
            <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" 
                InsertVisible="False" ReadOnly="True" SortExpression="WorkoutID" 
                Visible="False" />
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ExerciseID" 
                Visible="False" />
            <asp:TemplateField HeaderText="Set Count" >
                <ItemTemplate>
                    <asp:Label ID="lblSets" Text='<%#  ShowSetCount(Eval("WorkoutID"), Eval("ExerciseID"))  %>' runat="server"></asp:Label>
                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:TextBox ID="txtSets" runat="server" Text='<%# ShowSetCount(Eval("WorkoutID"), Eval("ExerciseID"))  %>' ></asp:TextBox>
                    <asp:RegularExpressionValidator ValidationGroup="reg" ID="regexSetCount" ControlToValidate="txtSets"
                        runat="server" ErrorMessage="Can only enter numbers"
                        ValidationExpression="^[0-9]+$" >*</asp:RegularExpressionValidator>
                </EditItemTemplate>--%>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsExercise" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BetaSYS39414Exercise %>" 
        DeleteCommand="DeleteExercise" DeleteCommandType="StoredProcedure" 
        InsertCommand="CreateExercise" InsertCommandType="StoredProcedure" 
        SelectCommand="ReadUnaddedExercise" SelectCommandType="StoredProcedure" 
        UpdateCommand="UpdateExerciseTable" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ExerciseName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="WorkoutTable" Name="WorkoutID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
            <asp:Parameter Name="ExerciseName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="ddlExercise" runat="server" DataSourceID="sdsExercise" 
        DataTextField="ExerciseName" DataValueField="ExerciseID" Visible="False">
    </asp:DropDownList>
    <br />
    <asp:Button ID="btnAddExercise" runat="server" Text="Add Exercise to Workout" 
        Visible="False" Class="button" />
    <br />
    <br />
    <br />
    <br />

    -----<asp:DropDownList ID="ddlRemoveExercise" runat="server" AutoPostBack="True" 
            DataSourceID="sqlRemoveExercise" DataTextField="ExerciseName" 
            DataValueField="ExerciseID">
        </asp:DropDownList>
        <br />
    <asp:Button ID="btnRemoveExercise" runat="server" Text="Remove an Exercise" 
        Visible="false" class="button" />
    -----
        
    
        -----<asp:SqlDataSource ID="sqlRemoveExercise" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString8RemoveExerciseFromWorkout %>" 
            DeleteCommand="DeleteWorkoutExercise" DeleteCommandType="StoredProcedure" 
            SelectCommand="ReadAddedExercise" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ExerciseID" Type="Int32" />
                <asp:Parameter Name="WorkoutID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="WorkoutTable" Name="WorkoutID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    -----<br />

    
        
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="sqlExerciseList" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionString3 %>" 
            SelectCommand="ReadWorkoutExercise" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="WorkoutTable" Name="WorkoutID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:Label Visible="false" ID="lblChangeSetCount" runat="server" Text="Change Set Count for " />
    <asp:DropDownList Visible="false" ID="ddlExerInWO" runat="server" DataSourceID="sqlExerciseList" 
            DataTextField="Exercise" DataValueField="ExerciseID" AutoPostBack="True" AppendDataBoundItems="true" >
            <asp:ListItem Text="--Choose--" Value="" />
    </asp:DropDownList>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlExerInWO" />
    <br />
    <asp:Label ID="lblIntro" Text="Previous Set Count: " Visible="false" runat="server" />
    <asp:Label ID="lblPrevSetCount" Visible="false" runat="server" />
    <asp:TextBox Visible="false" ID="txtNewSetCount" Text="" runat="server" />
    <br />
    <asp:Button Visible="false" ID="btnChangeSet" runat="server" Text="Confirm Changes" />
    <br />
    <br />
    <asp:Button ID="btnAssignWorkout" runat="server" Text="Assign Workouts to Athletes" />
    </div>    
    </div>

    </asp:Content>

