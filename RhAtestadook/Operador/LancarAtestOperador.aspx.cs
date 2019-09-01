using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;

namespace AutoCompletar.Operador
{
    public partial class LancarAtestOperador : System.Web.UI.Page
    {

        public void MsgBox(String ex, Page pg,Object obj) 
{
    string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
    Type cstype = obj.GetType();
    ClientScriptManager cs = pg.ClientScript;
    cs.RegisterClientScriptBlock(cstype, s, s.ToString());

    

}
        protected void Page_Load(object sender, EventArgs e)
        {

            //parametro de segurança logado
            if (Session["logado"] == null || (bool)Session["logado"] != true)
            {
                Response.Redirect("~/Login.aspx");

            }
            else
            {
                string login = (string)(Session["login"]);
                
                ClientScript.RegisterClientScriptBlock(Page.GetType(), "", "");
                txtNome.Text = login;
                //parametro para popular dados pessoais vindo do banco
                
                SqlConnection conn = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=todo@2015");

                SqlCommand comm = new SqlCommand("SELECT * FROM tb_usuario_new WHERE tipoRegistro='1' AND id_colaborador=" + login, conn);

                /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
                //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
                /* ou */
                comm.CommandType = CommandType.Text; /* Quando usa Query */

                /* paramentros do banco*/
                comm.Parameters.Add(new SqlParameter("@nome", "nome"));
                comm.Parameters.Add(new SqlParameter("@nomeGrupoHierarquico", "nomeGrupoHierarquico"));
                comm.Parameters.Add(new SqlParameter("@site1", "localizacao"));
                comm.Parameters.Add(new SqlParameter("@Re", "Re"));
                comm.Parameters.Add(new SqlParameter("@site", "site"));
                comm.Parameters.Add(new SqlParameter("@idEcadopSupervisor", "idEcadopSupervisor"));
                comm.Parameters.Add(new SqlParameter("@CPF", "CPF"));

                conn.Open();
                DbDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    /* dados do banco x text box */

                    txtNome.Text = dr["Nome"].ToString();
                    txtoperacao.Text = dr["nomeGrupoHierarquico"].ToString();
                    txtRe.Text = dr["Re"].ToString();
                    txtHorariotrabalho.Text = dr["turno"].ToString();
                    txt_gestor.Text = dr["idEcadopSupervisor"].ToString();
                    txtSite.Text = dr["site"].ToString();
                    string cpf = dr["cpf"].ToString();
                    Session["cpf"] = cpf;
                }
                conn.Close();
                //fim do parametro para pouplar dados pessoais
            }
        }
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            
            DateTime dataSelecionada = DateTime.Parse(txtDataini.Text);
            DateTime dataHoje = DateTime.Now;

            double diferenca = ( dataHoje - dataSelecionada).TotalDays;

            if (diferenca >= 6)
            {
                MsgBox("Atestado fora do Prazo para lançamento, Favor procurar o SMO.", this.Page, this);
                msgalerta.Text = "Atestado fora do Prazo para lançamento, Favor procurar o SMO.";
            }
            else
            {

                if (veracidade.Checked)
                {
                    //code to process

                    using (SqlConnection con = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=todo@2015;"))
                    {
                        con.Open();

                        string consulta = "select * from tb_lancamento where dataini='" + txtDataini.Text + "'AND  login='" + Session["login"] + "'";
                        SqlCommand cmd1 = new SqlCommand(consulta, con);
                        SqlDataReader read = cmd1.ExecuteReader();
                        if (read.Read())
                        {

                            MsgBox("Atestado já lançado para esta data", this.Page, this);
                        }

                        else
                        {
                            using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_lancamento (login,data_atual, ip, nome, GrupoHierarquico, cpf ,site, re, gestor_imediato, horario_trabalho, dataini, datafin, dias, titulo, subtitulo, categoria, subcategoria, motivo, cid, medico, crm, clinica, hr_inicial, hr_final, status) VALUES (@login, @data_atual, @ip, @nome, @GrupoHierarquico, @CPF, @site, @re, @gestor_imediato, @horario_trabalho, @dataini, @datafin, @dias, @titulo, @subtitulo, @categoria, @subcategoria, @motivo, @cid, @medico, @crm, @clinica, @hr_inicial, @hr_final, @status)", con))

                            {
                                if (txtMotivo.Text == "Doação de Sangue" & txtDias.Text != "1")
                                {
                                    MsgBox("Doação de Sanque só é permitido por apenas 1 dia, Em caso de dúvidas procurar SMO !", this.Page, this);
                                }
                                else
                                {
                                    string titulo = ".";
                                    string subtitulo = ".";
                                    string categoria = ".";
                                    string cpf = (string)(Session["cpf"]);
                                    string login = (string)(Session["login"]);
                                    string status = "Pendente Validação";
                                    string ip = Request.UserHostAddress;
                                    string data_atual = System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                                    cmd.Parameters.AddWithValue("login", login);
                                    cmd.Parameters.AddWithValue("data_atual", data_atual);
                                    cmd.Parameters.AddWithValue("ip", ip);
                                    cmd.Parameters.AddWithValue("nome", txtNome.Text);
                                    cmd.Parameters.AddWithValue("GrupoHierarquico", txtoperacao.Text);
                                    cmd.Parameters.AddWithValue("cpf", cpf);
                                    cmd.Parameters.AddWithValue("site", txtSite.Text);
                                    cmd.Parameters.AddWithValue("re", txtRe.Text);
                                    cmd.Parameters.AddWithValue("gestor_imediato", txt_gestor.Text);
                                    cmd.Parameters.AddWithValue("horario_trabalho", txtHorariotrabalho.Text);
                                    cmd.Parameters.AddWithValue("dataini", txtDataini.Text);
                                    cmd.Parameters.AddWithValue("datafin", txtDatafim.Text);
                                    cmd.Parameters.AddWithValue("dias", txtDias.Text);
                                    cmd.Parameters.AddWithValue("titulo", titulo);
                                    cmd.Parameters.AddWithValue("subtitulo", subtitulo);
                                    cmd.Parameters.AddWithValue("categoria", categoria);
                                    var txtDescricao = Request.Form["txtDescricao"];
                                    cmd.Parameters.AddWithValue("subcategoria", txtDescricao);
                                    cmd.Parameters.AddWithValue("motivo", txtMotivo.Text);
                                    cmd.Parameters.AddWithValue("cid", txtCid.Text);
                                    var txtMedico = Request.Form["txtMedico"];
                                    cmd.Parameters.AddWithValue("medico", txtMedico);
                                    cmd.Parameters.AddWithValue("crm", txtCrm.Text);
                                    cmd.Parameters.AddWithValue("clinica", txtClinicaD.Text);                                  
                                    cmd.Parameters.AddWithValue("hr_inicial", txtHrinicial.Text);
                                    cmd.Parameters.AddWithValue("hr_final", txtHrfinal.Text);
                                    cmd.Parameters.AddWithValue("status", status);

                                    con.Close();
                                    try
                                    {
                                        con.Open();
                                        if (cmd.ExecuteNonQuery() > -1)
                                        {
                                            Response.Write("<script type='text/javascript'>alert('Atestado enviado. O mesmo apenas será válido após a avaliação das informações pela equipe do RH');</script>");

                                            txtDataini.Text = "";
                                            txtDatafim.Text = "";
                                            txtDias.Text = "";
                                            txtCrm.Text = "";
                                            txtCid.Text = "";
                                            txtClinicaD.Text = "";
                                            txtMotivo.Text = "";
                                            Session.Abandon();
                                            //Response.Redirect("../login.aspx");
                                            Response.Write("<script type='text/javascript'>location.reload();</script>");
                                        }
                                    }
                                    catch (Exception ex)
                                    {

                                        Response.Write("<script type='text/javascript'>alert('Erro ao cadastrar Atestado.\n');</script>" + ex.Message);
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
                else
                {
                    Label18.Text = "Favor aceitar os termos de veracidade";
                }
            }
        }
        protected void txtDataini_validate(object source, ServerValidateEventArgs args)
        {
            DateTime dataSelecionada = DateTime.Parse(txtDataini.Text);
            DateTime dataHoje = DateTime.Now;

            double diferenca = (dataHoje - dataSelecionada).TotalDays;

            if (diferenca >= 6)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}