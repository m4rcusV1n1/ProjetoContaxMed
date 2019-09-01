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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //parametro para popular o dropdown
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from tb_clinica"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        txtClinica.DataSource = cmd.ExecuteReader();
                        txtClinica.DataTextField = "clinica";
                        txtClinica.DataValueField = "id_cli";
                        txtClinica.DataBind();
                        con.Close();
                    }
                }
                txtClinica.Items.Insert(0, new ListItem("Selecione uma Clinica", "0"));
            }

            //parametro de segurança logado
            //if (Session["logado"] == null || (bool)Session["logado"] != true)

            //{
            //Response.Redirect("~/Login.aspx");

            // }

            //{
            //string login = (string)(Session["login"]);
            string login = "380268";
            //lblSessionID.InnerText = String.Format("Session ID: {0}", Session.SessionID);
            //ClientScript.RegisterClientScriptBlock(Page.GetType(), "", "");
            txtNome.Text = login;
            //parametro para popular dados do operador vindo do banco
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123");

            SqlCommand comm = new SqlCommand("SELECT * FROM tb_usuario_new WHERE tipoRegistro='1' AND id_colaborador=" + login, conn);

            /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
            //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
            /* ou */
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@nome", "nome"));
            comm.Parameters.Add(new SqlParameter("@nomeOperacao", "nomeOperacao"));
            comm.Parameters.Add(new SqlParameter("@Re", "Re"));
            comm.Parameters.Add(new SqlParameter("@turno", "turno"));
            comm.Parameters.Add(new SqlParameter("@idEcadopSupervisor", "idEcadopSupervisor"));

            conn.Open();
            DbDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                /* dados do banco x text box */
                txtNome.Text = dr["Nome"].ToString();
                txtoperacao.Text = dr["nomeOperacao"].ToString();
                txtRe.Text = dr["Re"].ToString();
                txtHorariotrabalho.Text = dr["turno"].ToString();
                txt_gestor.Text = dr["idEcadopSupervisor"].ToString();



            }
            conn.Close();

            //}



        }
        //parametro para inserir no banco de dados 
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=todo@2015;"))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_lancamento (login,data_atual, ip, nome, operacao, dt_nascimento, re, gestor_imediato, horario_trabalho, dataini, datafin, dias, motivo, cid, medico, crm, clinica, descricao, hr_inicial, hr_final, status) VALUES (@login, @data_atual, @ip, @nome, @operacao, @dt_nascimento, @re, @gestor_imediato, @horario_trabalho, @dataini, @datafin, @dias, @motivo, @cid, @medico, @crm, @clinica, @descricao, @hr_inicial, @hr_final, @status)", con))
                {


                    //string login = (string)(Session["login"]);
                    string login = "380268";
                    string status = "Pendente Validação";
                    string ip = Request.UserHostAddress;
                    string data_atual = System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                    cmd.Parameters.AddWithValue("login", login);
                    cmd.Parameters.AddWithValue("data_atual", data_atual);
                    cmd.Parameters.AddWithValue("ip", ip);
                    cmd.Parameters.AddWithValue("nome", txtNome.Text);
                    cmd.Parameters.AddWithValue("operacao", txtoperacao.Text);
                    cmd.Parameters.AddWithValue("dt_nascimento", txt_Dtnascimento.Text);
                    cmd.Parameters.AddWithValue("re", txtRe.Text);
                    cmd.Parameters.AddWithValue("gestor_imediato", txt_gestor.Text);
                    cmd.Parameters.AddWithValue("horario_trabalho", txtHorariotrabalho.Text);
                    cmd.Parameters.AddWithValue("dataini", txtDataini.Text);
                    cmd.Parameters.AddWithValue("datafin", txtDatafim.Text);
                    cmd.Parameters.AddWithValue("dias", txtDias.Text);
                    cmd.Parameters.AddWithValue("motivo", txtMotivo.Text);
                    cmd.Parameters.AddWithValue("cid", txtCid.Text);
                    cmd.Parameters.AddWithValue("medico", txtMedico.Text);
                    cmd.Parameters.AddWithValue("crm", txtCrm.Text);
                    cmd.Parameters.AddWithValue("clinica", txtClinica.Text);
                    cmd.Parameters.AddWithValue("descricao", txtDescricao.Text);
                    cmd.Parameters.AddWithValue("hr_inicial", txtHrinicial.Text);
                    cmd.Parameters.AddWithValue("hr_final", txtHrfinal.Text);
                    cmd.Parameters.AddWithValue("status", status);

                    con.Close();
                    try
                    {
                        con.Open();
                        if (cmd.ExecuteNonQuery() > -1)
                        {
                            Response.Write("<script type='text/javascript'>alert('Atestado cadastrado com sucesso');</script>");
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