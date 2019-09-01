<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="CadastroTeste2.Operador.cadastro"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        #horario {
            visibility:hidden; 
            margin-top:-380px;
	        margin-left:250px;
            width: 127px;
        }
        #conteudo1 {
            width: 519px;
        }
    </style>

    <script type="text/javascript" src="scripts.js"></script>

    <script type="text/javascript"> 

        function checkForm() {
            if (!FeaturedContent_veracidade.checked) {
                alert("Favor aceitar os termos de veracidade");
                FeaturedContent_veracidade.focus();
                return false;
            }
            return true;
        }
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
    </script>
    
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <img src="/imagens/lancar_atestado.fw.png" alt="" style="margin-left:30px; margin-top:10px; position:relative;"/>&nbsp;
    <hr style="margin-top:10px; height: 3px; color:#24487C; background-color: #24487C;"/>
     &nbsp;&nbsp;Dados Pessoais:<br />
    <br />
    
     &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Nome:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtNome" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label2"  runat="server" Text="Operação:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtoperacao" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label3"  runat="server" Text="Data de Nascimento:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txt_Dtnascimento" runat="server" TextMode="Date" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Re:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtRe" runat="server" ReadOnly="True" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text="Gestor:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txt_gestor" runat="server" Width="500px" ReadOnly="True" />
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label6"  runat="server" Text="Horario de Trabalho:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtHorariotrabalho" runat="server" Width="500px" ReadOnly="True" />
     <br />
     <br />
    <hr style="margin-top:10px; height: 3px; color:#24487C; background-color: #24487C;"/>
     &nbsp;&nbsp;Dados de Lançamento:<br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label7"  runat="server" Text="Data Inicial:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtDataini" runat="server" TextMode="Date" required="required"/>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="Afastado por:" ></asp:Label>
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
   
     &nbsp;&nbsp;<asp:DropDownList ID="txtClinica1" runat="server" Width="200px" AppendDataBoundItems="true" 
            >
    </asp:DropDownList>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label11"  runat="server" Text="Motivo:"></asp:Label>

    <br />
     &nbsp;&nbsp;<asp:DropDownList ID="txtMotivo" runat="server" onChange="optionCheck()">
        <asp:ListItem Selected="True">Selecione um motivo</asp:ListItem>
        <asp:ListItem>Acompanhamento de filho menor</asp:ListItem>
        <asp:ListItem>Declaração de horas</asp:ListItem>
        <asp:ListItem>Doação de Sangue</asp:ListItem>
        <asp:ListItem>Doença</asp:ListItem>
    </asp:DropDownList>
    
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label12"  runat="server" Text="CRM:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtCrm" runat="server" required="required" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label13"  runat="server" Text="Médico:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtMedico" runat="server" Width="500px" required="required" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label14"  runat="server" Text="CID / Cod. Doença:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtCid" runat="server" onChange="mostrarUsuario(this.value);"  />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label15"  runat="server" Text="Descrição:"></asp:Label>
    <br />
    <div id="conteudo1">&nbsp;&nbsp;<asp:TextBox ID="txtDescricao" runat="server" Width="500px" ReadOnly="true"/></div>
    <br />
    
    <br />
    <br />
    <br />
    &nbsp;&nbsp;<asp:CheckBox ID="veracidade" runat="server"/>
        <p style="margin-left:40px; margin-top:-40px; width: 476px;">Assumo total responsabilidade pela veracidade das  informa&ccedil;&otilde;es aqui prestadas <br/>
        e declaro estar ciente  de que emiss&atilde;o de atestado medico falso &eacute; crime, assim <br/>
        como adulterar qualquer  tipo de informa&ccedil;&atilde;o contida no documento e implicar&aacute;<br/> 
        nas penalidades cab&iacute;veis,  previstas no C&oacute;digo Penal.
        &nbsp;</p><br />
    
    &nbsp;&nbsp;<asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar Atestado" OnClick="btnCadastrar_Click"  />
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
    </div>
    </form>
</body>
</html>
