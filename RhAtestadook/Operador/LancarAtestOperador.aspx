<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/operador.Master" AutoEventWireup="true" CodeBehind="LancarAtestOperador.aspx.cs" Inherits="AutoCompletar.Operador.LancarAtestOperador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #horario {
            visibility:hidden; 
            margin-top:-440px;
	        margin-left:250px;
            width: 127px;
        }
        #conteudo1 {
            width: 519px;
        }
        </style>
    <style type="text/css">
    /* cria a div pop-up*/
    #popup{
    position: absolute; /*Define a posição absoluta da pop-up*/
    top: 50%; /*Distancia da margem superior da página */
    left: 30%; /*Distancia da margem esquerda da página */
    width: 300px; /*Largura da pop-up*/
    height: 100px; /*Altura da pop-up*/
    padding: 20px 20px 20px 20px; /*Margem interna da pop-up*/
    border-width: 1px; /*Largura da borda da pop-up*/
    border-style: solid; /*Estilo da borda da pop-up*/
    background: #FFC; /*Cor de fundo da pop-up*/
    color: #000066; /*Cor do texto da pop-up*/
    display: none; /* Estilo da pop-up*/
    /*fim pop-up*/
    }
     #popupcid{
    position: absolute; /*Define a posição absoluta da pop-up*/
    top: 60%; /*Distancia da margem superior da página */
    left: 30%; /*Distancia da margem esquerda da página */
    width: 300px; /*Largura da pop-up*/
    height: 100px; /*Altura da pop-up*/
    padding: 20px 20px 20px 20px; /*Margem interna da pop-up*/
    border-width: 1px; /*Largura da borda da pop-up*/
    border-style: solid; /*Estilo da borda da pop-up*/
    background: #FFC; /*Cor de fundo da pop-up*/
    color: #000066; /*Cor do texto da pop-up*/
    display: none; /* Estilo da pop-up*/
    /*fim pop-up*/
    }
    </style>

      <script type="text/javascript">
          // Função que fecha o pop-up ao clicar no botao fechar
          function fechar() {
              document.getElementById('popup').style.display = 'none';
          }
          // Aqui definimos o tempo para fechar o pop-up automaticamente
          function abrir() {
              document.getElementById('popup').style.display = 'block';
              //setTimeout ("fechar()", 5000);
          }
          //comentario cid 

          // Função que fecha o pop-up ao clicar no botao fechar
          function fecharcid() {
              document.getElementById('popupcid').style.display = 'none';
          }
          // Aqui definimos o tempo para fechar o pop-up automaticamente
          function abrircid() {
              document.getElementById('popupcid').style.display = 'block';
              //setTimeout ("fechar()", 5000);
          }
</script>
    <link href="../Scripts/jquery.autocomplete.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <script src="../Scripts/jquery-latest.js" type="text/javascript"></script>
    
    <script src="../Scripts/jquery.autocomplete.js" type="text/javascript"></script>
    <script type="text/javascript">
        function completar_campos() {
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
            var cid = document.getElementById("FeaturedContent_txtCid").value;
            con_consulta.open("GET", "exibeDados.aspx?cid=" + cid, true);

            con_consulta.send(null);

        }

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
            con_consulta_crm.open("GET", "exibir_dados_crm.aspx?crm=" + crm, true);

            con_consulta_crm.send(null);

        }
        //função para aparecer a hora
        //function optionCheck() {
           // var option = document.getElementById("FeaturedContent_txtMotivo").value;
           // if (option == "Declaração de horas") {
               // document.getElementById("horario").style.visibility = "visible";
            //}
            //if (option == "Acompanhamento de filho menor") {
               // document.getElementById("horario").style.visibility = "hidden";
           // }
            //if (option == "Doação de Sangue") {
               // document.getElementById("horario").style.visibility = "hidden";
           // }
            //if (option == "Doença") {
                //document.getElementById("horario").style.visibility = "hidden";
           // }

       // }
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

        $(document).ready(function () {
            $("#FeaturedContent_txtClinicaD").autocomplete("AutocompleteData.ashx");
        });
        function valida_form() {
            if (document.getElementById("txtMedico").value == "") {
                alert('CRM inválido, Verifique se o CRM possui o BA ao final ex: 14000BA');
                document.getElementById("txtMedico").focus();
               
                return false
               
            }
            if (document.getElementById("txtDescricao").value == "") {
                alert('CID inválido, favor clicar no icone Ajuda.');
                document.getElementById("txtDescricao").focus();

                return false

            }
        }
    </script>
<img src="../imagens/lancar_atestado.fw.png" alt="" style="margin-left:30px; margin-top:10px; position:relative;"/>&nbsp;
    <hr style="margin-top:10px; height: 3px; color:#24487C; background-color: #24487C;"/>
     &nbsp;&nbsp;Dados Pessoais:<br />
    <br />
    <div id="popup" class="popup">
<b>Ajuda?</b>
<p>
Ao final do número do CRM acrescentar a sigla do estado.
Ex: CRM + Estado ---> 10004BA
</p>
<a href="javascript: fechar();">FECHAR</a>
</div>
    <div id="popupcid" class="popupcid">
<b>Ajuda?</b>
<p>
CID é obrigatório 4 caracteres, uma letra e 3 números.
Caso não Possua acrescentar o numero zero no final.
Ex: J51 -----> J510
</p>
<a href="javascript: fecharcid();">FECHAR</a>
</div>
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
     &nbsp;&nbsp;<asp:Label ID="Label3"  runat="server" Text="Site:"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtSite" runat="server" ReadOnly="True" />
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
     &nbsp;&nbsp;Dados de Lançamento do Atestado:<br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label7"  runat="server" Text="Data Inicial:" style="font-weight: 700"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtDataini" runat="server" TextMode="Date" required="required"/>
    <asp:CustomValidator runat="server"
    ID="valDateRange" 
    ControlToValidate="txtDataini"
    onservervalidate="txtDataini_validate" 
    ErrorMessage="" />
    <asp:Label ID="msgalerta" runat="server" Text="" ForeColor="Red" style="font-weight: 700"></asp:Label>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="Dia(s):" style="font-weight: 700" ></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtDias" runat="server" Width="50px" onchange="calculaDataFin();" required="required" TextMode="Number" min="1" Max="3" MaxLength="1"/>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtDias" ErrorMessage="Atestado superior a 3 dias, Favor procurar SMO para lançamento." ForeColor="Red" MaximumValue="3" MinimumValue="0"></asp:RangeValidator>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label9"  runat="server" Text="Data Final:" style="font-weight: 700"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtDatafim" runat="server" TextMode="Date" />
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label10"   runat="server" Text="Hospital / Clinica:" style="font-weight: 700"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtClinicaD" runat="server" Width="500px" AutoCompleteMode="Append"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClinicaD" ErrorMessage="Campo Obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label11"  runat="server" Text="Motivo do Afastamento:" style="font-weight: 700"></asp:Label>

    <br />
     &nbsp;&nbsp;<asp:DropDownList ID="txtMotivo" runat="server">
        <asp:ListItem Selected="True"></asp:ListItem>
        <asp:ListItem>Acompanhamento de filho menor</asp:ListItem>
        <asp:ListItem>Doação de Sangue</asp:ListItem>
        <asp:ListItem>Doença</asp:ListItem>
    </asp:DropDownList>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMotivo" ErrorMessage="Campo Obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
    
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label12"  runat="server" Text=" CRM (Médico) ou CRO (Dentista):" style="font-weight: 700"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtCrm" runat="server" required="required" onblur="completar_campos_crm()" />
    <img src="../imagens/Loading_icon.gif" width="88" id="loading1" alt="carregando" 
        style="display:none"/>
    <a href="javascript:abrir();"><img alt="Ajuda?" src="../Imagens/help.png" style="height: 15px; width: 15px" /></a><br />
    <br />
    <div id="dados_essencias1">
     &nbsp;&nbsp;<asp:Label ID="Label13"  runat="server" Text="Médico:" style="font-weight: 700"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtMedico" runat="server" Width="500px" required="required" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMedico" ErrorMessage="Campo Obrigatório" ForeColor="Red"></asp:RequiredFieldValidator>
     </div>
    <br />
    <br />
     &nbsp;&nbsp;<asp:Label ID="Label14"  runat="server" Text="CID / Cod. Doença:" style="font-weight: 700"></asp:Label>
    <br />
     &nbsp;&nbsp;<asp:TextBox ID="txtCid" runat="server" onblur="completar_campos();"   />
    <img src="../imagens/Loading_icon.gif" width="88" id="loading" alt="carregando" 
        style="display:none"/>
    <a href="javascript:abrircid();"><img alt="Ajuda?" src="../Imagens/help.png" style="height: 15px; width: 15px" /></a><br />
    <br />
    <div id="dados_essencias">
     &nbsp;&nbsp;<asp:Label ID="Label15"  runat="server" Text="Descrição:" style="font-weight: 700"></asp:Label>
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="txtDescricao" runat="server" Width="500px" ReadOnly="true"/>
    </div>
    <br />
    <br />
    &nbsp;&nbsp;<asp:TextBox ID="termos" runat="server" Height="75px" TextMode="MultiLine" Width="500px" ReadOnly="True">Assumo total responsabilidade pela veracidade das informações aqui prestadas e declaro estar ciente de que emissão de atestado medico falso é crime, assim como adulterar qualquer tipo de informação contida no documento e implicará nas penalidades cabíveis, previstas no Código Penal.</asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;<asp:CheckBox ID="veracidade" runat="server"  /><strong>EU LI E CONCORDO COM OS TERMOS DE VERACIDADE.
    </strong>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Label ID="Label18" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="10pt"></asp:Label>
    <br />
    <br />
    &nbsp;&nbsp;<asp:Button ID="btnCadastrar" runat="server" 
        Text="Cadastrar Atestado" OnClick="btnCadastrar_Click" onfocus="return valida_form()"/>
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