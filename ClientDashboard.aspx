<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientDashboard.aspx.cs" Inherits="Practica1.ClientDashboard" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Reserve a car</h2>
    <p>Add New Diver:</p>
    <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" AlignItemCaptionsInAllGroups="True" DataSourceID="SqlDataSource2">
        <Items>
            <dx:BootstrapLayoutItem Caption="Name">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="BootstrapFormLayout1_E1" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem Caption="Address">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="BootstrapFormLayout1_E2" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem Caption="Mobile">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapSpinEdit ID="BootstrapFormLayout1_E3" runat="server">
                        </dx:BootstrapSpinEdit>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
        </Items>
    </dx:BootstrapFormLayout>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PracticasEmpresaConnectionString %>" SelectCommand="SELECT [name], [address], [mobile] FROM [customer]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="Error" runat="server" ForeColor="#FF3300" Text="Error, User already exists" Visible="false"></asp:Label>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add New Driver"/>
    </p>
    <p>
        Select Driver:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" Width="372px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Width="100px" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PracticasEmpresaConnectionString %>" SelectCommand="SELECT [name], [address], [mobile] FROM [customer] ORDER BY [name], [address], [mobile]"></asp:SqlDataSource>
    </p>
    <asp:Label ID="Confirmation" runat="server" ></asp:Label>
    <label></label>
    <asp:Button ID="ConfirmationButton" Text="Yes" runat="server" Width="50px" Visible="false" OnClick="ConfirmationButton_Click" />
    <label></label>
    <asp:Button ID="NotConfirmationButton" Text="No" runat="server" Width="50px" Visible="false" OnClick="NotConfirmationButton_Click"/>
    <p>
        &nbsp;</p>
</asp:Content>
