using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class CadastrarMed : System.Web.UI.Page
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

        protected void cadastrarmedicook(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=marcus123;"))
            {
                con.Open();
                string consulta = "select * from tb_medico where crm='" + txtCrm.Text + "'";
                SqlCommand cmd1 = new SqlCommand(consulta, con);
                SqlDataReader read = cmd1.ExecuteReader();
                if (read.Read())
                {

                    MsgBox("Já existe médico cadastrado com esse CRM", this.Page, this);
                }

                else
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_medico (medico, crm ) VALUES (@medico, @crm)", con))
                    {


                        cmd.Parameters.AddWithValue("medico", txtMedico.Text);
                        cmd.Parameters.AddWithValue("crm", txtCrm.Text);



                        con.Close();
                        try
                        {
                            con.Open();
                            if (cmd.ExecuteNonQuery() > -1)
                            {
                                Response.Write("<script type='text/javascript'>alert('Médico Cadastrado com Sucesso');</script>");

                                txtMedico.Text = "";
                                txtCrm.Text = "";

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