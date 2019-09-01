using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook
{
    public partial class CadastrarUser : System.Web.UI.Page
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

        }

        protected void CadastrarUserbd(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=todo@2015;"))
            {
                con.Open();
                string consulta = "select * from tb_usuario where re='" + txtRe.Text + "'";
                SqlCommand cmd1 = new SqlCommand(consulta, con);
                SqlDataReader read = cmd1.ExecuteReader();
                if (read.Read())
                {

                    MsgBox("Já existe usuário cadastrado com esse RE", this.Page, this);
                }

                else
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_usuario (login_rede, senha, nome, re, operacao, gestor_imediato, ramal_gestor, site, nivel_usuario ) VALUES (@login_rede, @senha, @nome, @re, @operacao, @gestor_imediato, @ramal_gestor, @site, @nivel_usuario)", con))
                    {


                        cmd.Parameters.AddWithValue("login_rede", txtLoginRede.Text);
                        cmd.Parameters.AddWithValue("senha", txtSenha.Text);
                        cmd.Parameters.AddWithValue("nome", txtNome.Text);
                        cmd.Parameters.AddWithValue("re", txtRe.Text);
                        cmd.Parameters.AddWithValue("operacao", txtCargo.Text);
                        cmd.Parameters.AddWithValue("gestor_imediato", txtGestor.Text);
                        cmd.Parameters.AddWithValue("ramal_gestor", txtRamal.Text);
                        cmd.Parameters.AddWithValue("site", txtSite.Text);
                        cmd.Parameters.AddWithValue("nivel_usuario", txtnivel.Text);
                        



                        con.Close();
                        try
                        {
                            con.Open();
                            if (cmd.ExecuteNonQuery() > -1)
                            {
                                Response.Write("<script type='text/javascript'>alert('Médico Cadastrado com Sucesso');</script>");

                                txtLoginRede.Text = "";
                                txtSenha.Text = "";
                                txtNome.Text = "";
                                txtRe.Text = "";
                                txtCargo.Text = "";
                                txtRamal.Text = "";
                                txtSite.Text = "";
                                txtnivel.Text = "";
                                txtGestor.Text = "";
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script type='text/javascript'>alert('Erro ao cadastrar Médico.\n');</script>" + ex.Message);
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