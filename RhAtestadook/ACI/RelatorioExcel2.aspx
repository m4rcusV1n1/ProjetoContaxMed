<%@ Page Title="" Language="C#" MasterPageFile="~/ACI/aci.Master" AutoEventWireup="true" CodeBehind="RelatorioExcel2.aspx.cs" Inherits="RhAtestadook.ACI.RelatorioExcel2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
       #gridview{
           margin-left:15px;

       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <img src="../imagens/relatorio.fw.png" width="177" height="30" style="margin-top:15px; margin-left:15px;" alt=""  />
    <hr style="margin-top:10px; height: 3px; color:#24487C; background-color: #24487C;"/>
    <div id="gridview">
        <asp:Button ID="btnCarregarDados" runat="server" Text="Carregar" OnClick="btnCarregarDados_Click" />
        <asp:Button ID="btnExportarExcel" runat="server" Text="Exporta Excel" OnClick="btnExportarExcel_Click" />
        &nbsp;<asp:DropDownList ID="txtSite" runat="server" >
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
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSite" ErrorMessage="Favor Selecionar um Site" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
        <br />
        <br />
    
       <asp:GridView ID="gridContatos" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" ShowFooter="True"  onpageindexchanging="GridView1_PageIndexChanging" Width="771px" >
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="Nome" />
                <asp:BoundField DataField="re" HeaderText="Re" />
                <asp:BoundField DataField="dataini" HeaderText="Data Inicial do Atestado" />
                <asp:BoundField DataField="datafin" HeaderText="Data Final do Atestado" />
                <asp:BoundField DataField="data_atual" HeaderText="Data da Entrega"/>
            </Columns>
        </asp:GridView>
   </div>

</asp:Content>
