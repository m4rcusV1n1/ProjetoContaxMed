<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/administrador.Master" AutoEventWireup="true" CodeBehind="CadastrarCli.aspx.cs" Inherits="RhAtestadook.Administrador.CadastrarCli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <img src="../imagens/cadastrar_clinica.fw.png" width="177" height="30" style="margin-top:15px; margin-left:15px;" alt="cadastrarclinica"  />    
<hr style="margin-top:5px; height: 3px; color:#24487C; background-color: #24487C;"/>
<p style="margin-left:15px;">Cadastrar Clínica:</p>
    &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Clinica"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtClinica" runat="server" Width="500px"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Endereço:"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtEndereco" runat="server" Width="500px"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Cep:"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtCep" runat="server" Width="100px"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Estado:"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:DropDownList ID="txtEstado" runat="server">
    <asp:ListItem></asp:ListItem>
    <asp:ListItem>AC</asp:ListItem>
	<asp:ListItem>AL</asp:ListItem>
	<asp:ListItem>AM</asp:ListItem>
	<asp:ListItem>AP</asp:ListItem>
	<asp:ListItem>BA</asp:ListItem>
	<asp:ListItem>CE</asp:ListItem>
	<asp:ListItem>DF</asp:ListItem>
	<asp:ListItem>ES</asp:ListItem>
	<asp:ListItem>GO</asp:ListItem>
	<asp:ListItem>MA</asp:ListItem>
	<asp:ListItem>MG</asp:ListItem>
	<asp:ListItem>MS</asp:ListItem>
	<asp:ListItem>MT</asp:ListItem>
	<asp:ListItem>PA</asp:ListItem>
	<asp:ListItem>PB</asp:ListItem>
	<asp:ListItem>PE</asp:ListItem>
	<asp:ListItem>PI</asp:ListItem>
	<asp:ListItem>PR</asp:ListItem>
	<asp:ListItem>RJ</asp:ListItem>
	<asp:ListItem>RN</asp:ListItem>
	<asp:ListItem>RS</asp:ListItem>
	<asp:ListItem>RO</asp:ListItem>
	<asp:ListItem>RR</asp:ListItem>
	<asp:ListItem>SC</asp:ListItem>
	<asp:ListItem>SE</asp:ListItem>
	<asp:ListItem>SP</asp:ListItem>
	<asp:ListItem>TO</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Telefone:"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtTelefone" runat="server" Width="100px"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="Email:"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtEmail" runat="server" Width="500px"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Button ID="clinica" runat="server" Text="Cadastrar Clinica" OnClick="btn_cadastrar_cli" />
</asp:Content>
