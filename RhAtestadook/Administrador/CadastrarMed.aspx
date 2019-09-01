<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/administrador.Master" AutoEventWireup="true" CodeBehind="CadastrarMed.aspx.cs" Inherits="RhAtestadook.Administrador.CadastrarMed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
     <img src="../imagens/cadastrar_medico.fw.png" width="177" height="30" style="margin-top:15px; margin-left:15px;" alt="cadastrarclinica"  />    
<hr style="margin-top:5px; height: 3px; color:#24487C; background-color: #24487C;"/>
<p style="margin-left:15px;">Cadastrar Médico:</p>
     &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Médico:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtMedico" runat="server" Width="500px"></asp:TextBox>
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Crm:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtCrm" runat="server" Width="150px"></asp:TextBox>
     <br />
     <br />
    &nbsp;&nbsp;<asp:Button ID="cadastrarmedico" runat="server" Text="Cadastrar Médico" OnClick="cadastrarmedicook" />
</asp:Content>

