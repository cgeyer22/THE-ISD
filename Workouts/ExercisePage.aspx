<%@ Page Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="ExercisePage.aspx.vb" Inherits="ExercisePage_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h1>Create Exercise</h1>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        DefaultMode="Insert" AutoGenerateRows="False" BorderWidth="1px" CellPadding="2" DataKeyNames="ExerciseID" 
        DataSourceID="sqlExerciseTable" GridLines="None">
        <Fields>
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ExerciseID" />
            <asp:BoundField DataField="ExerciseName" HeaderText="ExerciseName" SortExpression="ExerciseName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
        </Fields>
    </asp:DetailsView>
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
            <asp:Parameter Name="ExerciseName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
            <asp:Parameter Name="ExerciseName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <h2>List of Exercises</h2>

    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
        CellSpacing="1" DataKeyNames="ExerciseID" DataSourceID="sqlExerciseTable" 
        GridLines="Horizontal" Width="600px">
        <Columns>
          
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
          
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                SortExpression="ExerciseID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="ExerciseName" HeaderText="ExerciseName" 
                SortExpression="ExerciseName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>
    
</asp:Content>
