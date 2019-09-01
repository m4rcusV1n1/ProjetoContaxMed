<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consult.aspx.cs" Inherits="RhAtestadook.Administrador.consult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administração</title>
    <link href="../Styles/MyWay_FF.css" rel="stylesheet" /> 
    <link href="../Scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-latest.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.autocomplete.js" type="text/javascript"></script>
   <script type="text/javascript">
       
       //função para pegar o cid
       function completar_campos() {
           document.getElementById("loading2").style.display = "block";
           var con_consulta;
           if (window.XMLHttpRequest) {
               con_consulta = new XMLHttpRequest();
           } else {
               con_consulta = new ActiveXObject("Microsoft.XMLHTTP");
           }

           con_consulta.onreadystatechange = function () {
               if (con_consulta.readyState == 4 && con_consulta.status == 200) {
                   document.getElementById("dados_essencias2").innerHTML = con_consulta.responseText;
                   document.getElementById("loading2").style.display = "none";
               }
           }
           var cid = document.getElementById("txtCid").value;
           con_consulta.open("GET", "../operador/exibeDados.aspx?cid=" + cid, true);

           con_consulta.send(null);

       }
       //função para  pegar o crm
       function completar_campos_crm() {
           document.getElementById("loading1").style.display = "block";
           var con_consulta_crm;
           if (window.XMLHttpRequest) {
               con_consulta_crm = new XMLHttpRequest();
           } else {
               con_consulta_crm = new ActiveXObject("Microsoft.XMLHTTP");
           }
           con_consulta_crm.onreadystatechange = function () {
               if (con_consulta_crm.readyState == 4 && con_consulta_crm.status == 200) {
                   document.getElementById("dados_essencias1").innerHTML = con_consulta_crm.responseText;
                   document.getElementById("loading1").style.display = "none";
               }
           }
           var crm = document.getElementById("txtCrm").value;
           con_consulta_crm.open("GET", "../Operador/exibir_dados_crm.aspx?crm=" + crm, true);

           con_consulta_crm.send(null);

       }
       function completar_campos_re() {
           document.getElementById("loading").style.display = "block";
           var con_consulta;
           if (window.XMLHttpRequest) {
               con_consulta = new XMLHttpRequest();
           } else {
               con_consulta = new ActiveXObject("Microsoft.XMLHTTP");
           }

           con_consulta.onreadystatechange = function () {
               if (con_consulta.readyState == 4 && con_consulta.status == 200) {
                   document.getElementById("dados_essencias").innerHTML = con_consulta.responseText;
                   document.getElementById("loading").style.display = "none";
               }
           }
           var re = document.getElementById("FeaturedContent_txtRe").value;
           con_consulta.open("GET", "MostrarRe.aspx?re=" + re, true);

           con_consulta.send(null);

       }
       </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left:15px;">
        <br />
        &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Código:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtId" runat="server" Width="50px" ReadOnly="True"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label17" runat="server" Text="Nome:"></asp:Label>
        <br />
       &nbsp;&nbsp;<asp:TextBox ID="txtNome" runat="server" Width="500px" ReadOnly="True"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Operação:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtOperacao" runat="server" Width="500px" ReadOnly="True"></asp:TextBox>
        <br />
           &nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Text="Site:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtSite" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
        <br />
           &nbsp;&nbsp; <asp:Label ID="Label4" runat="server" Text="Re:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtRe" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
        <br />
           &nbsp;&nbsp; <asp:Label ID="Label5" runat="server" Text="Gestor:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtGestor" runat="server" Width="500px" ReadOnly="True"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="Horario de Trabalho:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtHorarioTrabalho" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Text="Data Inicial:"></asp:Label>
        <br />
       &nbsp;&nbsp;<asp:TextBox ID="txtDataini" runat="server"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text=" Afastado por:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtDias" runat="server" Width="50px"></asp:TextBox>
        <br />
           &nbsp;&nbsp; <asp:Label ID="Label15" runat="server" Text="Data Final:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtDatafim" runat="server"></asp:TextBox>
        <br />
        &nbsp; <asp:Label ID="Label18" runat="server" Text="Hora Inicial:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txthr_inicial" runat="server"></asp:TextBox>
        &nbsp;
        <br />
        &nbsp;&nbsp;<asp:Label ID="Label19" runat="server" Text="Hora Final:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txthr_final" runat="server"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label16" runat="server" Text="Hospital / Clinica"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtClinica" runat="server" Width="500px"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label9" runat="server" Text="Motivo:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtMotivo" runat="server" Width="200px"></asp:TextBox>
        <br />
            &nbsp;&nbsp;<asp:Label ID="Label10" runat="server" Text="Crm:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtCrm" runat="server" onblur="completar_campos_crm()"></asp:TextBox>
          <img src="../Imagens/Loading_icon.gif" width="88" id="loading1" alt="carregando" 
        style="display:none"/>
        <br />
        <div id="dados_essencias1">
            &nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Text="Médico:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtMedico" runat="server" Width="500px"></asp:TextBox>
          
        <br />
        </div>
       &nbsp;&nbsp; <asp:Label ID="Label12" runat="server" Text="Cid:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:TextBox ID="txtCid" runat="server" onblur="completar_campos();"></asp:TextBox>
        &nbsp;&nbsp;<img src="../Imagens/Loading_icon.gif" width="88" id="loading2" alt="carregando" 
        style="display:none"/>
        <br />
        <div id="dados_essencias2">
            &nbsp;&nbsp;<asp:Label ID="Label13" runat="server" Text="Descrição:"></asp:Label>
        <br />

        &nbsp;&nbsp;<asp:TextBox ID="txtDescricao" runat="server" Width="500px"></asp:TextBox>
        <br />
            </div>
            &nbsp;&nbsp;<asp:Label ID="Label14" runat="server" Text="Status:"></asp:Label>
        <br />
        &nbsp;&nbsp;<asp:DropDownList ID="txtStatus" runat="server" Height="20px" Width="300px">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Favor dirigir ao RH</asp:ListItem>
            <asp:ListItem>Validado</asp:ListItem>
            <asp:ListItem>Cancelado</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStatus" ErrorMessage="Campo Obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Inserir" Width="122px" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
