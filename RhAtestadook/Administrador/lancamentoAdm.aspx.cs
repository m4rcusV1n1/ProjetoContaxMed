using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class lancamentoAdm : System.Web.UI.Page
    {

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());



        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logado"] == null || (bool)Session["logado"] != true)
            {
                Response.Redirect("Loginadm.aspx");

            }
            else
            {
            }
        }
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=marcus123;"))
                {
                    con.Open();
                    var login1 = Request.Form["txtLogin"];
                    string consulta = "select * from tb_lancamento where dataini='" + txtDataini.Text + "'AND  login='" + login1 + "'";
                    SqlCommand cmd1 = new SqlCommand(consulta, con);
                    SqlDataReader read = cmd1.ExecuteReader();
                    if (read.Read())
                    {

                        MsgBox("Atestado já lançado para esta data", this.Page, this);
                    }

                    else
                    {

                        using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_lancamento (login,data_atual, ip, nome, GrupoHierarquico, cpf, site, re, gestor_imediato, horario_trabalho, dataini, datafin, dias, titulo, subtitulo, categoria, subcategoria, motivo, cid, medico, crm, clinica, hr_inicial, hr_final, status) VALUES (@login, @data_atual, @ip, @nome, @GrupoHierarquico, @cpf, @site, @re, @gestor_imediato, @horario_trabalho, @dataini, @datafin, @dias, @titulo, @subtitulo, @categoria, @subcategoria, @motivo, @cid, @medico, @crm, @clinica, @hr_inicial, @hr_final, @status)", con))
                        {
                            string titulo = ".";
                            string subtitulo = ".";
                            string categoria = ".";
                            string cpf = (string)(Session["cpf"]);
                            string status = "Validado";
                            string ip = Request.UserHostAddress;
                            string data_atual = System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                            var login = Request.Form["txtLogin"];
                            var nome = Request.Form["txtNome"];
                            var operacao = Request.Form["txtoperacao"];
                            var site = Request.Form["txtLocalizacao"];
                            var gestor_imediato = Request.Form["txt_gestor"];
                            var horario_trabalho = Request.Form["txtHorariotrabalho"];
                            cmd.Parameters.AddWithValue("login", login);
                            cmd.Parameters.AddWithValue("data_atual", data_atual);
                            cmd.Parameters.AddWithValue("ip", ip);
                            cmd.Parameters.AddWithValue("nome", nome);
                            cmd.Parameters.AddWithValue("GrupoHierarquico", operacao);
                            cmd.Parameters.AddWithValue("cpf", cpf);
                            cmd.Parameters.AddWithValue("site", site);
                            cmd.Parameters.AddWithValue("re", txtRe.Text);
                            cmd.Parameters.AddWithValue("gestor_imediato", gestor_imediato);
                            cmd.Parameters.AddWithValue("horario_trabalho", horario_trabalho);
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
                                    Response.Write("<script type='text/javascript'>alert('Atestado cadastrado com sucesso');</script>");
                                    //lblMensagem.InnerText = "Atestado cadastrado com sucesso.";
                                    txtRe.Text = "";
                                    txtDataini.Text = "";
                                    txtDatafim.Text = "";
                                    txtDias.Text = "";
                                    txtCrm.Text = "";
                                    txtCid.Text = "";
                                    txtHrinicial.Text = "";
                                    txtHrfinal.Text = "";
                                    txtClinicaD.Text = "";
                                    txtMotivo.Text = "";
                                }
                            }
                            catch (Exception ex)
                            {
                                //lblMensagem.InnerText = "Erro ao cadastrar post.\n" + ex.Message;
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
}