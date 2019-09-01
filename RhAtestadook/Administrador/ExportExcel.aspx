<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/administrador.Master" AutoEventWireup="true" CodeBehind="ExportExcel.aspx.cs" Inherits="RhAtestadook.Administrador.ExportExcel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 155px;
            height: 30px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <p>
        <img alt="relatorio" class="auto-style1" src="../Imagens/relatorio.fw.png" /></p>
        <hr style="margin-top:10px; height: 3px; color:#24487C; background-color: #24487C;"/>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Data Inicial:" style="font-weight: 700"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtdataini" runat="server" TextMode="Date" ></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Data Final:" style="font-weight: 700"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtdatafim" runat="server" TextMode="Date"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="Site:" style="font-weight: 700"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:DropDownList ID="txtSite" runat="server" Enabled="False">
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
    <br />
    &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Gerar Relatório" OnClick="relatorio_excel" />
    
</asp:Content>
