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
        SelectCommand="ListExercises" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="WorkoutTable" Name="WorkoutID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="divWeightRep" runat="server" visible="false" >
        <asp:Label ID="lblInput" Text= "Input Rep counts and Weight assignments below." runat="server" Visible="true" />
        <asp:GridView ID="gvExercises" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ExerciseID,WorkoutID,ExerciseID1" DataSourceID="sqlListExercises" >
            <Columns>
                
                <asp:TemplateField HeaderText="Athlete Name">
                    <ItemTemplate>
                        <asp:Label ID="lblName1" Text='<%#  ShowAthleteName(1)  %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" ReadOnly="True" 
                    SortExpression="ExerciseID" Visible="False" />
                <asp:BoundField DataField="WorkoutID" HeaderText="WorkoutID" ReadOnly="True" 
                    SortExpression="WorkoutID" Visible="False" />
                <asp:BoundField DataField="ExerciseID1" HeaderText="ExerciseID1" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ExerciseID1" 
                    Visible="False" />
                <asp:BoundField DataField="ExerciseName" HeaderText="ExerciseName" 
                    SortExpression="ExerciseName" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" Visible="False" />
                <asp:TemplateField HeaderText="Set Count" >
                <ItemTemplate>
                    <asp:Label ID="lblSetCount" Text='<%#  ShowSetCount(Eval("WorkoutID"), Eval("ExerciseID"))  %>' runat="server"></asp:Label>
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
    </div>

    <br /><br />
    <asp:Button ID="btnAssign" runat="server" Text="Assign" Visible="False" />
    <br />
    <asp:Label ID="lblAssignmentResult" runat="server" Text="Assigned to: " Visible="false" />
    <br />
    <asp:Label ID="lblDublicate" runat="server" Text="Previously Assigned to: " Visible="false" />
</asp:Content>

