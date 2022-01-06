<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewCar.aspx.cs" Inherits="Practica1.About" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add New Car</h2>
    <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" AlignItemCaptionsInAllGroups="True" DataSourceID="SqlDataSource">
        <Items>
            <dx:BootstrapLayoutItem Caption="Car Id">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="carId" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem Caption="Make">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="make" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem Caption="Model">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:BootstrapTextBox ID="model" runat="server">
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
        </Items>
    </dx:BootstrapFormLayout>

    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PracticasConnectionString %>" SelectCommand="SELECT [carId], [make], [model] FROM [CarsTable]"></asp:SqlDataSource>
     <label style="width:700px"></label>
    <asp:Label ID="LabelIncorrectInsert" runat="server" Font-Size="Large" Visible="false" ForeColor="Red" Text="Incorrect Insert"></asp:Label>
    <asp:Label ID="LabelCorrect" runat="server" Font-Size="Large" Visible="false" ForeColor="Green" Text="Insert Correct"></asp:Label>
    <p>
        <label style="width:731px">
        <asp:Button ID="Button1" runat="server" CssClass="btn-primary focus" OnClick="Button1_Click" Text="Back/Cancel" />
        </label>
        <asp:Button ID="Submit" runat="server" Text="Submit" Width="127px" CssClass="btn-primary" OnClick="Submit_Click" />
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
