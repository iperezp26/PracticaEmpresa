<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarsDashboard.aspx.cs" Inherits="Practica1.Contact" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;Coches Disponibles</h2>

    <table>
        <tr>
            <td>
                <asp:Button ID="AddNewCar" runat="server" CssClass="btn-primary" Height="21px" Text="Add New Car" Width="100px" OnClick="AddNewCar_Click" />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="carsDashboard" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource1" Width="496px" AllowSorting="True"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="carsDashboard_SelectedIndexChanged" Height="0px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="carId" HeaderText="Plate" SortExpression="carId" />
                        <asp:BoundField DataField="make" HeaderText="Make" SortExpression="make" />
                        <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                        <asp:BoundField DataField="reservedBy" HeaderText="Reserved By" SortExpression="reservedBy" />
                        <asp:CheckBoxField DataField="available" HeaderText="Available" SortExpression="available" Visible="True" />
                    </Columns>
                    <EditRowStyle HorizontalAlign="Center" />
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" Font-Strikeout="False" Height="30px" HorizontalAlign="Left" Wrap="False" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
            <td style="width: 6%"></td>
            <td>
                <asp:Table ID="TableReadOnly" runat="server" Width="495px" HorizontalAlign="Justify" Height="130px">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="LabelPlate" runat="server" Text="Plate"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="TextBoxPlate" runat="server" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="LabelMake" runat="server" Text="Make"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="TextBoxMake" runat="server" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="LabelModel" runat="server" Text="Model"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="TextBoxModel" runat="server" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="LabelReservedBy" runat="server" Text="Reserved By"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox ID="TextBoxReservedBy" runat="server" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <asp:Label ID="LabelAvailable" runat="server" Text="Available"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Image ID="ImageAvailable" runat="server" Visible="false" ImageUrl="~/Images/Green_tick.svg.png" Height="10px" />
                            <asp:Image ID="ImageNotAvailable" runat="server" Visible="false" ImageUrl="~/Images/cross png.png" Height="10px" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="Reserve" runat="server" Text="Reserve" OnClick="Reservar_Click" Visible="false" />
                            <asp:Button ID="Liberate" runat="server" Text="Liberate" OnClick="Liberate_Click" Visible="false" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PracticasEmpresaConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [carId], [make], [model], [available], [reservedBy] FROM [CarsTable] ORDER BY [carId], [make], [model]"></asp:SqlDataSource>
    <br />
</asp:Content>
