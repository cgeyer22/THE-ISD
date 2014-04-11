<%@ Page Language="VB" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="false" CodeFile="ExercisePage.aspx.vb" Inherits="ExercisePage_Default" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <h2>Create Exercise</h2>
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
        DefaultMode="Insert" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="ExerciseID" 
        DataSourceID="sqlExerciseTable" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:BoundField DataField="ExerciseID" HeaderText="ExerciseID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ExerciseID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
    </asp:DetailsView>
    <br />
    <h2>List of Exercises</h2>
    <asp:GridView ID="GridView1" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
        CellSpacing="1" DataKeyNames="ExerciseID" DataSourceID="sqlExerciseTable" 
        GridLines="None">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
          
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>

</asp:Content>
