<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarsDashboard.aspx.cs" Inherits="Practica1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Coches Disponibles.</h2>
    <asp:Button ID="AddNewCar" runat="server" CssClass="btn-primary" Height="21px" Text="Add New Car" Width="100px" OnClick="AddNewCar_Click" />
    <asp:GridView ID="carsDashboard" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource1" Width="496px" AllowSorting="True" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="carsDashboard_SelectedIndexChanged" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="carId" HeaderText="Plate" SortExpression="carId" />
            <asp:BoundField DataField="make" HeaderText="Make" SortExpression="make" />
            <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PracticasConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [make], [model], [carId] FROM [CarsTable] WHERE ([available] = @available) ORDER BY [make], [model], [carId]">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="available" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
