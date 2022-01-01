<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Practica1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Table runat="server" Height="50px"></asp:Table>

    <asp:Table ID="table" runat="server" Height="173px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" ID="userLabel" Text="User" Width="80px"></asp:Label>
                <asp:TextBox ID="textBoxUser" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Height="80px">
                <asp:Label runat="server" ID="passwordLabel" Text="Password" Width="80px"></asp:Label>
                <asp:TextBox ID="textBoxPassword" runat="server" TextMode="Password"> </asp:TextBox>
                <asp:Label runat="server" Width="30px"></asp:Label>
                <asp:TextBox ID="auxPassword" runat="server" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button runat="server" ID="createNewUser" Text="Create New User" OnClick="createUser" />
                <asp:Label runat="server" Width="130px"></asp:Label>
                <asp:Button runat="server" ID="SubmitButton" Text="Enter User" OnClick="ClickSubmit" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label runat="server" Height="25px" Width="135px" Visible="true"></asp:Label>
                <asp:Label runat="server" ID="labelError" Text="Error, can't enter name or a password empty" Visible="false" ForeColor="#ff3300"></asp:Label>
                <asp:Label runat="server" ID="labelUserExists" Text="The user already exists" Visible="false" ForeColor="#ff3300"></asp:Label>
                <asp:Label runat="server" ID="labelCorrectLogin" Text="Correct login" Visible="false" ForeColor="#33cc33"></asp:Label>
                <asp:Label runat="server" ID="labelNotCorrectLogin" Text="Fail login" Visible="false" ForeColor="#ff3300"></asp:Label>
                <asp:Label runat="server" ID="labelCorrectInsertUser" Text="Correct Create" Visible="false" ForeColor="#33cc33"></asp:Label>
                <asp:Label runat="server" ID="labelNotCorrectInsertUser" Text="User already exists" Visible="false" ForeColor="#ff3300"></asp:Label>
                <asp:TextBox ID="comprobarUser" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="comprobarPassword" runat="server" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>

