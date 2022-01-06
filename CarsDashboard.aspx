<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarsDashboard.aspx.cs" Inherits="Practica1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Coches Disponibles.</h2>
    <asp:Button ID="AddNewCar" runat="server" CssClass="btn-primary" Height="21px" Text="Add New Car" Width="100px" OnClick="AddNewCar_Click" />
    <asp:GridView runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="496px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="carId" HeaderText="carId" SortExpression="carId" />
            <asp:BoundField DataField="make" HeaderText="make" SortExpression="make" />
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PracticasConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [make], [model], [carId] FROM [CarsTable] WHERE ([available] = @available) ORDER BY [make], [model], [carId]">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="available" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
