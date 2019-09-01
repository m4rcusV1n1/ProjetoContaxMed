using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace RhAtestadook.Administrador
{
    public partial class administrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string login = (string)(Session["login"]);
            SqlConnection conn = new SqlConnection(@"Data Source=APPCTX06SALLM\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=todo@2015");
            SqlCommand comm = new SqlCommand("SELECT * FROM tb_usuario WHERE login_rede='" + login + "'", conn);
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@nome", "nome"));

            conn.Open();
            DbDataReader dr = comm.ExecuteReader();

            while (dr.Read())
            {
              
                Label1.Text = dr["Nome"].ToString();
            
            }
            conn.Close();
            //fim do parametro para pouplar dados pessoais 
        }
    }
}