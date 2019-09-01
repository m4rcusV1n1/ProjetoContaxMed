<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/administrador.Master" AutoEventWireup="true" CodeBehind="lancamentoAdm.aspx.cs" Inherits="RhAtestadook.Administrador.lancamentoAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #horario {
            visibility:hidden; 
            margin-top:-305px;
	        margin-left:250px;
            width: 127px;
        }
        #conteudo1 {
            width: 519px;
        }
    </style>
    <link href="../Scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
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
            var cid = document.getElementById("FeaturedContent_txtCid").value;
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
            var crm = document.getElementById("FeaturedContent_txtCrm").value;
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
        //função para aparecer a hora
        function optionCheck() {
            var option = document.getElementById("FeaturedContent_txtMotivo").value;
            if (option == "Declaração de horas") {
                document.getElementById("horario").style.visibility = "visible";
            }
            if (option == "Acompanhamento de filho menor") {
                document.getElementById("horario").style.visibility = "hidden";
            }
            if (option == "Doação de Sangue") {
                document.getElementById("horario").style.visibility = "hidden";
            }
            if (option == "Doença") {
                document.getElementById("horario").style.visibility = "hidden";
            }

        }

        //funcão para calcular data
        function calculaDataFin() {
            var datainicial = document.getElementById("FeaturedContent_txtDataini").value;
            var dias = parseInt(document.getElementById("FeaturedContent_txtDias").value);
            var partes = datainicial.split("-");
            var ano = partes[0];
            var mes = partes[1] - 1;
            var dia = partes[2];

            datainicial = new Date(ano, mes, dia);
            datafinal = new Date(datainicial);
            datafinal.setDate(datafinal.getDate() + dias - 1);

            var dd = ("0" + datafinal.getDate()).slice(-2);
            var mm = ("0" + (datafinal.getMonth() + 1)).slice(-2);
            var y = datafinal.getFullYear();

            var dataformatada = y + '-' + mm + '-' + dd;
            document.getElementById('FeaturedContent_txtDatafim').value = dataformatada;

        }
        //função clinica
        $(document).ready(function () {
            $("#FeaturedContent_txtClinicaD").autocomplete("AutocompleteData.ashx");
        });

    </script>
<img src="../imagens/lancar_atestado.fw.png" alt="" style="margin-left:30px; margin-top:10px; position:relative;"/>&nbsp;
 <hr style="margin-top:10px; height: 3px; color:#24487C; background-color: #24487C;"/>
    &nbsp;&nbsp;Dados Pessoais:<br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Digite RE:" ></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtRe" runat="server" onblur="completar_campos_re()"></asp:TextBox>
     <img src="../Imagens/Loading_icon.gif" width="88" id="loading" alt="carregando" 
        style="display:none"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRe" ErrorMessage="Favor Digitar RE" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
    <br />
    <br />
    <div id="dados_essencias">
    &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Ecadop" ></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Nome:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtNome" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label3"  runat="server" Text="Operação:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtoperacao" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label4"  runat="server" Text="Site:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtLocalizacao" runat="server" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="Gestor:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txt_gestor" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label18"  runat="server" Text="Horario de Trabalho:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtHorariotrabalho" runat="server" Width="500px" ReadOnly="True" />
     <br />
     <br />
    </div>
    <hr style="margin-top:10px; height: 3px; color:#24487C; background-color: #24487C;"/>
     &nbsp;&nbsp;Dados de Lançamento do Atestado:<br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label7"  runat="server" Text="Data Inicial:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtDataini" runat="server" TextMode="Date" />
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtDataini" ControlToValidate="txtDatafim" ErrorMessage="CompareValidator" Operator="DataTypeCheck"></asp:CompareValidator>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="Dia(s):" ></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtDias" runat="server" Width="50px" onchange="calculaDataFin();" required="required" TextMode="Number" min="1"/>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label9"  runat="server" Text="Data Final:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtDatafim" runat="server" TextMode="Date" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label10"   runat="server" Text="Hospital / Clinica:"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtClinicaD" runat="server" Width="500px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClinicaD" ErrorMessage="Campo Obrigatório" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label11"  runat="server" Text="Motivo do Afastamento:"></asp:Label>

    <br />
     &nbsp;&nbsp;<asp:DropDownList ID="txtMotivo" runat="server" onChange="optionCheck()">
        <asp:ListItem Selected="True"></asp:ListItem>
        <asp:ListItem>Acompanhamento de filho menor</asp:ListItem>
        <asp:ListItem>Declaração de horas</asp:ListItem>
        <asp:ListItem>Doação de Sangue</asp:ListItem>
        <asp:ListItem>Doença</asp:ListItem>
    </asp:DropDownList>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMotivo" ErrorMessage="Campo Obrigatório" ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
    
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label12"  runat="server" Text="CRM (Médico) ou CRO (Dentista):"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtCrm" runat="server" required="required" onblur="completar_campos_crm()" />
    <img src="../Imagens/Loading_icon.gif" width="88" id="loading1" alt="carregando" 
        style="display:none"/>
    Ex: 10004BA<br />
    <br />
    <div id="dados_essencias1">
     &nbsp;&nbsp;<asp:Label ID="Label13"  runat="server" Text="Médico:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtMedico" runat="server" Width="500px" required="required" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMedico" ErrorMessage="CRM não Cadastrado Favor procurar SMO para Cadastro." ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
     </div>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label14"  runat="server" Text="CID / Cod. Doença:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtCid" runat="server" onblur="completar_campos();"   />
    <img src="../Imagens/Loading_icon.gif" width="88" id="loading2" alt="carregando" 
        style="display:none"/>
    <br />
    <br />
    <div id="dados_essencias2">
     &nbsp;&nbsp;<asp:Label ID="Label15"  runat="server" Text="Descrição:"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtDescricao" runat="server" Width="500px" ReadOnly="true"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDescricao" ErrorMessage="Favor Digitar um CID Valido." ForeColor="Red" style="font-weight: 700"></asp:RequiredFieldValidator>
    </div>
    <br />
    
    <br />
    <br />
    <br />

    &nbsp;&nbsp;<asp:Button ID="btnCadastrar" runat="server" 
        Text="Cadastrar Atestado" OnClick="btnCadastrar_Click"   />
     &nbsp;<br />
    &nbsp;<span id="lblSessionID" runat="server"></span>

    <div id="horario">
        <asp:Label ID="Label16" runat="server" Text="Hora Inicial:"></asp:Label>
        <br />
        <asp:TextBox ID="txtHrinicial" runat="server" TextMode="Time"></asp:TextBox>
        <br />
        <asp:Label ID="Label17" runat="server" Text="Hora Final:"></asp:Label>
        <br />
        <asp:TextBox ID="txtHrfinal" runat="server" TextMode="Time"></asp:TextBox>
    </div>
</asp:Content>
