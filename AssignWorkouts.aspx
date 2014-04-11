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
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="WorkoutID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
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
            <asp:BoundField DataField="Name" HeaderText="Workout Name" 
                SortExpression="Name" />
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
</asp:Content>

