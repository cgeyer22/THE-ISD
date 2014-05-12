<%@ Page Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="ExercisePage.aspx.vb" Inherits="ExercisePage_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h1>Create Exercise</h1>
    <asp:Button ID="backButton" runat="server" Text="← Back to Workouts" 
            Visible="False" />
    <br />
    <br />
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
    <h2>Search Exercies</h2>
    <asp:Label runat="server">Enter Exercise Name</asp:Label>
    <asp:TextBox ID="ExerciseSearchBar" runat="server"></asp:TextBox>
    <asp:Button ID="SearchExerciesButton" Text="Search" runat="server" onclick="Unnamed2_Click" />
    <br />
    <asp:SqlDataSource runat="server" ID="SqlExerciseSearchConnection" 
    ConnectionString="<%$ ConnectionStrings:BetaSYS39414ConnectionStringExerciseSearch %>" 
    SelectCommand="SearchExercies" SelectCommandType="StoredProcedure" 
    UpdateCommand="UpdateExerciseTable" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ExerciseSearchBar" Name="ExerciseName" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ExerciseID" Type="Int32" />
            <asp:Parameter Name="ExerciseName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:GridView runat="server" ID="ExerciseSearchResults" AllowSorting="True" 
        DataSourceID="SqlExerciseSearchConnection" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
        ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
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
    <h2>List of Exercises</h2>

    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="ExerciseID" DataSourceID="sqlExerciseTable" 
        GridLines="Vertical" Width="600px" ForeColor="Black">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
          
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
          
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                SortExpression="ExerciseID" InsertVisible="False" ReadOnly="True" 
                Visible="False" />
            <asp:BoundField DataField="ExerciseName" HeaderText="ExerciseName" 
                SortExpression="ExerciseName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
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
</asp:Content>
