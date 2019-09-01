<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastrarUser.aspx.cs" Inherits="RhAtestadook.CadastrarUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/MyWay_FF.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Login de Rede:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtLoginRede" runat="server"></asp:TextBox>
    
        <br />
    
        <asp:Label ID="Label2" runat="server" Text="Senha:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
    
        <asp:Label ID="Label3" runat="server" Text="Nome:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtNome" runat="server" Width="400px"></asp:TextBox>
    
        <br />
    
        <asp:Label ID="Label4" runat="server" Text="Re:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtRe" runat="server"></asp:TextBox>
    
        <br />
    
        <asp:Label ID="Label5" runat="server" Text="Cargo:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtCargo" runat="server"></asp:TextBox>
    
        <br />
    
        <asp:Label ID="Label6" runat="server" Text="Gestor Imediato:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtGestor" runat="server" Width="400px"></asp:TextBox>
    
        <br />
    
        <asp:Label ID="Label7" runat="server" Text="Ramal Gestor" style="font-weight: 700"></asp:Label>
        <br />
        <asp:TextBox ID="txtRamal" runat="server"></asp:TextBox>
    
        <br />
    
        <asp:Label ID="Label8" runat="server" Text="Site:" style="font-weight: 700"></asp:Label>
        <br />
        <asp:DropDownList ID="txtSite" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Site Matriz</asp:ListItem>
<asp:ListItem>Site Joao Pessoa</asp:ListItem>
<asp:ListItem>Site Prado Ii</asp:ListItem>
<asp:ListItem>Todo Tecnologia da Informacao</asp:ListItem>
<asp:ListItem>Site Rio de Janeiro Eng Dent</asp:ListItem>
<asp:ListItem>Site Acre</asp:ListItem>
<asp:ListItem>Site Sao Paulo SP02</asp:ListItem>
<asp:ListItem>Site Mauá</asp:ListItem>
<asp:ListItem>Site Trade Contax Sao Paulo</asp:ListItem>
<asp:ListItem>Matriz</asp:ListItem>
<asp:ListItem>Filial Trade Rio de Janeiro</asp:ListItem>
<asp:ListItem>Site Lapa Sp</asp:ListItem>
<asp:ListItem>Site Fortaleza</asp:ListItem>
<asp:ListItem>Site Sao Paulo</asp:ListItem>
<asp:ListItem>Sites de Porto Alegre - Todo!</asp:ListItem>
<asp:ListItem>Site Boa Viagem - Ba</asp:ListItem>
<asp:ListItem>Site Niteroi</asp:ListItem>
<asp:ListItem>Site Salvador BA02</asp:ListItem>
<asp:ListItem>Site Belo Horizonte</asp:ListItem>
<asp:ListItem>Site Dedic Campinas</asp:ListItem>
<asp:ListItem>Site Passeio</asp:ListItem>
<asp:ListItem>Site Dedic Alegria</asp:ListItem>
<asp:ListItem>Site Antartica</asp:ListItem>
<asp:ListItem>Site Paulista 407 - Todo!</asp:ListItem>
<asp:ListItem>Site Dedic Campinas 02</asp:ListItem>
<asp:ListItem>Site Rio de Janeiro RJ03</asp:ListItem>
<asp:ListItem>Sites de Fortaleza - Todo!</asp:ListItem>
<asp:ListItem>Trade São Paulo</asp:ListItem>
<asp:ListItem>Site Cabula - Ba</asp:ListItem>
<asp:ListItem>Site Recife</asp:ListItem>
<asp:ListItem>Site Santo Amaro Pe</asp:ListItem>
<asp:ListItem>Site Mackenzie</asp:ListItem>
<asp:ListItem>Site Aurora</asp:ListItem>
<asp:ListItem>Site Salvador</asp:ListItem>
<asp:ListItem>Site Principe Pe</asp:ListItem>
<asp:ListItem>Sites Pernambuco - Todo!</asp:ListItem>
<asp:ListItem>Site Dedic Sao Paulo SP02</asp:ListItem>
<asp:ListItem>Site Dedic Matriz</asp:ListItem>
<asp:ListItem>Site Alegria</asp:ListItem>
<asp:ListItem>Sites de Salvador - Todo!</asp:ListItem>
<asp:ListItem>Site Porto Alegre</asp:ListItem>
<asp:ListItem>Site Brasilia</asp:ListItem>
<asp:ListItem>Site Diretoria Contax</asp:ListItem>
<asp:ListItem>Site Paulista 407</asp:ListItem>
<asp:ListItem>Site Dedic Luigi Amorese</asp:ListItem>
<asp:ListItem>Site Rio Comprido</asp:ListItem>
<asp:ListItem>Sites de Sao Paulo - Todo!</asp:ListItem>
<asp:ListItem>Site Prado Ii - Todo!</asp:ListItem>
        </asp:DropDownList>
    
        <br />
    
        <asp:Label ID="Label9" runat="server" Text="Permissão" style="font-weight: 700"></asp:Label>
        <br />
        <asp:DropDownList ID="txtnivel" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="2">Aci</asp:ListItem>
            <asp:ListItem Value="1">Administrador</asp:ListItem>
            <asp:ListItem Value="3">Médico</asp:ListItem>
            <asp:ListItem Value="4">Técnico de Enfermagem </asp:ListItem>
            <asp:ListItem Value="5">Enfermeiro</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Cadastrar" OnClick="CadastrarUserbd" />
    
        <br />
    
        <br />
    
    </div>
    </form>
</body>
</html>
