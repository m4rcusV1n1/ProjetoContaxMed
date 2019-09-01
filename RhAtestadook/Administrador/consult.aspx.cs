using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class consult : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            string id = Request.QueryString["id"];
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123");

            SqlCommand comm = new SqlCommand("select * from tb_lancamento WHERE id='" + id + "'", conn);


            /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
            //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
            /* ou */
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@id", "id"));
            comm.Parameters.Add(new SqlParameter("@nome", "nome"));
            comm.Parameters.Add(new SqlParameter("@GrupoHierarquico", "GrupoHierarquico"));
            comm.Parameters.Add(new SqlParameter("@site", "localizacao"));
            comm.Parameters.Add(new SqlParameter("@Re", "Re"));
            comm.Parameters.Add(new SqlParameter("@gestor_imediato", "gestor_imediato"));
            comm.Parameters.Add(new SqlParameter("@horario_trabalho", "horario_trabalho"));
            comm.Parameters.Add(new SqlParameter("@dataini", "dataini"));
            comm.Parameters.Add(new SqlParameter("@dias", "dias"));
            comm.Parameters.Add(new SqlParameter("@datafin", "datafin"));
            comm.Parameters.Add(new SqlParameter("@clinica", "clinica"));
            comm.Parameters.Add(new SqlParameter("@motivo", "motivo"));
            comm.Parameters.Add(new SqlParameter("@crm", "crm"));
            comm.Parameters.Add(new SqlParameter("@medico", "medico"));
            comm.Parameters.Add(new SqlParameter("@cid", "cid"));
            comm.Parameters.Add(new SqlParameter("@sucategoria", "sucategoria"));
            comm.Parameters.Add(new SqlParameter("@hr_inicial", "hr_inicial"));
            comm.Parameters.Add(new SqlParameter("@hr_final", "hr_final"));
            conn.Open();
            DbDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                /* dados do banco x text box */
                txtId.Text = dr["id"].ToString();
                txtNome.Text = dr["Nome"].ToString();
                txtOperacao.Text = dr["GrupoHierarquico"].ToString();
                txtSite.Text = dr["site"].ToString();
                txtRe.Text = dr["Re"].ToString();
                txtGestor.Text = dr["gestor_imediato"].ToString();
                txtHorarioTrabalho.Text = dr["horario_trabalho"].ToString();
                txtDataini.Text = dr["dataini"].ToString();
                txtDatafim.Text = dr["datafin"].ToString();
                txtDias.Text = dr["dias"].ToString();
                txtClinica.Text = dr["clinica"].ToString();
                txtMotivo.Text = dr["motivo"].ToString();
                txtCrm.Text = dr["crm"].ToString();
                txtMedico.Text = dr["medico"].ToString();
                txtCid.Text = dr["cid"].ToString();
                txtDescricao.Text = dr["subcategoria"].ToString();
                txthr_inicial.Text = dr["hr_inicial"].ToString();
                txthr_final.Text = dr["hr_final"].ToString();
            }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           string id = Request.QueryString["id"];
            using (SqlConnection con = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS; Initial Catalog=bd_rh_atestadoctx; User Id=sa; Password=todo@2015;"))
            {
                using (SqlCommand cmd = new SqlCommand("update tb_lancamento set dataini = @dataini, dias = @dias, datafin = @datafin, clinica = @clinica, motivo = @motivo, crm = @crm, medico = @medico, cid = @cid, subcategoria = @subcategoria, status = @status, dt_atualizacao = @dt_atualizacao where id='" + id + "'", con))
                {
                    
                    var txtDataini = Request.Form["txtDataini"];
                    cmd.Parameters.AddWithValue("dataini", Convert.ToDateTime(txtDataini).ToString("yyyy-MM-dd"));
                    var txtDias = Request.Form["txtDias"];
                    cmd.Parameters.AddWithValue("dias", txtDias);
                    var txtDatafim = Request.Form["txtDatafim"];
                    cmd.Parameters.AddWithValue("datafin", Convert.ToDateTime(txtDatafim).ToString("yyyy-MM-dd"));
                    var txtClinica = Request.Form["txtClinica"];
                    cmd.Parameters.AddWithValue("clinica", txtClinica);
                    var txtMotivo = Request.Form["txtMotivo"];
                    cmd.Parameters.AddWithValue("motivo", txtMotivo);
                    var txtCrm = Request.Form["txtCrm"];
                    cmd.Parameters.AddWithValue("crm", txtCrm);
                    var txtMedico = Request.Form["txtMedico"];
                    cmd.Parameters.AddWithValue("medico", txtMedico);
                    var txtCid = Request.Form["txtCid"];
                    cmd.Parameters.AddWithValue("cid", txtCid);
                    var txtDescricao = Request.Form["txtDescricao"];
                    cmd.Parameters.AddWithValue("subcategoria", txtDescricao);
                    cmd.Parameters.AddWithValue("status", txtStatus.Text);
                    string dt_atualizacao = System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                    cmd.Parameters.AddWithValue("dt_atualizacao", dt_atualizacao);


                    con.Close();
                    try
                    {
                        con.Open();
                        if (cmd.ExecuteNonQuery() > -1)
                        {
                            Response.Write("<script type='text/javascript'>alert('Atestado validado com sucesso'); window.close();  opener.location.reload(); </script>");
                            //Response.Write("<script type='text/javascript'>  </script>");
                            //lblMensagem.InnerText = "Atestado cadastrado com sucesso.";
                           
                           
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