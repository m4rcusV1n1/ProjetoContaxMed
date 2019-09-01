using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class CadastrarCli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_cadastrar_cli(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=marcus123;"))
        
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_clinica (clinica, endereco, cep, estado, telefone, email ) VALUES (@clinica, @endereco, @cep, @estado, @telefone, @email)", con))
                {

                        
                        cmd.Parameters.AddWithValue("clinica", txtClinica.Text);
                        cmd.Parameters.AddWithValue("endereco", txtEndereco.Text);
                        cmd.Parameters.AddWithValue("cep", txtCep.Text);
                        cmd.Parameters.AddWithValue("estado", txtEstado.Text);
                        cmd.Parameters.AddWithValue("telefone", txtTelefone.Text);
                        cmd.Parameters.AddWithValue("email", txtEmail.Text);
                       

                        con.Close();
                        try
                        {
                            con.Open();
                            if (cmd.ExecuteNonQuery() > -1)
                            {
                                Response.Write("<script type='text/javascript'>alert('Clinica Cadastrada com Sucesso');</script>");
                                //lblMensagem.InnerText = "Atestado cadastrado com sucesso.";
                                txtClinica.Text = "";
                                txtEndereco.Text = "";
                                txtCep.Text = "";
                                txtEstado.Text = "";
                                txtTelefone.Text = "";
                                txtEmail.Text = "";
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMensagem.InnerText = "Erro ao cadastrar post.\n" + ex.Message;
                            Response.Write("<script type='text/javascript'>alert('Erro ao cadastrar Clinica.\n');</script>" + ex.Message);
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
