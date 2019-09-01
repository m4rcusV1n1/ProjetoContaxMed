using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Services;
using System.Data.Common;

namespace CadastroTeste2.Operador
{
    public partial class cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.EnableViewState = false;
            //parametro para popular o dropdown
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT id_cli, clinica FROM tb_clinica"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        txtClinica1.DataSource = cmd.ExecuteReader();
                        txtClinica1.DataTextField = "clinica";
                        txtClinica1.DataValueField = "id_cli";
                        txtClinica1.DataBind();
                        con.Close();
                    }
                }
                txtClinica1.Items.Insert(0, new ListItem("Selecione uma Clinica", "0"));
            }

        }
        //parametro para inserir no banco de dados 
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=todo@2015;"))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_lancamento (clinica) VALUES (@clinica)", con))
                {
                    //string login = (string)(Session["login"]);
                    //string login = "380268";
                    //string status = "Pendente Validação";
                    //string ip = Request.UserHostAddress;
                    //string data_atual = System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                    //cmd.Parameters.AddWithValue("login", login);
                    //cmd.Parameters.AddWithValue("data_atual", data_atual);
                    //cmd.Parameters.AddWithValue("ip", ip);
                    //cmd.Parameters.AddWithValue("nome", txtNome.Text);
                    //cmd.Parameters.AddWithValue("operacao", txtoperacao.Text);
                    //cmd.Parameters.AddWithValue("dt_nascimento", txt_Dtnascimento.Text);
                    //cmd.Parameters.AddWithValue("re", txtRe.Text);
                    //cmd.Parameters.AddWithValue("gestor_imediato", txt_gestor.Text);
                    //cmd.Parameters.AddWithValue("horario_trabalho", txtHorariotrabalho.Text);
                    //cmd.Parameters.AddWithValue("dataini", txtDataini.Text);
                    //cmd.Parameters.AddWithValue("datafin", txtDatafim.Text);
                    //cmd.Parameters.AddWithValue("dias", txtDias.Text);
                    //cmd.Parameters.AddWithValue("motivo", txtMotivo.Text);
                    //cmd.Parameters.AddWithValue("cid", txtCid.Text);
                    //cmd.Parameters.AddWithValue("medico", txtMedico.Text);
                    //cmd.Parameters.AddWithValue("crm", txtCrm.Text);
                    cmd.Parameters.AddWithValue("clinica", txtClinica1.Text);
                    //cmd.Parameters.AddWithValue("descricao", txtDescricao.Text);
                    //cmd.Parameters.AddWithValue("hr_inicial", txtHrinicial.Text);
                    //cmd.Parameters.AddWithValue("hr_final", txtHrfinal.Text);
                    //cmd.Parameters.AddWithValue("status", status);

                    try
                    {
                        con.Open();
                        if (cmd.ExecuteNonQuery() > -1)
                        {
                            Response.Write("<script type='text/javascript'>alert('Atestado cadastrado com sucesso');</script>"+ txtClinica1);
                            //lblMensagem.InnerText = "Atestado cadastrado com sucesso.";
                            
                           
                        }
                    }
                    catch (Exception ex)
                    {
                        //lblMensagem.InnerText = "Erro ao cadastrar post.\n" + ex.Message;
                        Response.Write("<script type='text/javascript'>alert('Erro ao cadastrar post.\n');</script>" + ex.Message);
                    }
                    finally
                    {
                        con.Close();
                    }

                }
            }
        }

        

    }
    }
