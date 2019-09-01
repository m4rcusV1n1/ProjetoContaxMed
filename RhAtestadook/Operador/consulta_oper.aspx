<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/operador.Master" AutoEventWireup="true" CodeBehind="consulta_oper.aspx.cs" Inherits="CadastroTeste2.Operador.consulta_oper" EnableViewState="false" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
  <script type="text/javascript">
        function abrir(URL) {

            var width = 865;
            var height = 715;
            var left = 99;
            var top = 40;
            window.open(URL, 'janela', 'width=' + width + ', height=' + height + ', top=' + top + ', left=' + left + ', scrollbars=yes, status=no, toolbar=no, location=no, directories=no, menubar=no, resizable=no, fullscreen=no');
        }
</script>
    <img src="../imagens/consultar_atestado.fw.png" width="177" height="30" style="margin-top:15px; margin-left:15px;" alt="Consulta" />
<hr style="margin-top:5px; height: 3px; color:#24487C; background-color: #24487C;"/>
<strong ><p style="margin-left:15px;">Atestados Lançados:</p></strong>
    <div style="margin-left:15px;">
    <asp:GridView ID="Consulta_status" runat="server" Width="800px" AutoGenerateColumns="false">
        <Columns>

        <asp:TemplateField HeaderText="Código">
        <ItemTemplate>

       <center> <%# Eval("id") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Data do Atestado Inicio">
        <ItemTemplate>
        <center><%# DataBinder.Eval(Container.DataItem, "dataini", "{0:dd/MM/yyyy}") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Data do Atestado Fim" >
        <ItemTemplate>
           

        <center><%# DataBinder.Eval(Container.DataItem, "datafin", "{0:dd/MM/yyyy}") %></center>
        </ItemTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Dias">
        <ItemTemplate>
        <center><%# Eval("dias") %></center>
        </ItemTemplate>
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Data da Entrega" >
        <ItemTemplate>
         <center><%# Eval("data_atual") %></center>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status" >
        <ItemTemplate>
        <center><%# Eval("status")%></center>
        </ItemTemplate>
        </asp:TemplateField>
             <asp:TemplateField HeaderText="">
        <ItemTemplate>
        <center><a href="javascript:abrir('relatorio.aspx?id=<%#Eval("id")%>'); "><img src="../imagens/pdf.png" width="20" height="20" alt="excluir"></a></center>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
</asp:Content>
