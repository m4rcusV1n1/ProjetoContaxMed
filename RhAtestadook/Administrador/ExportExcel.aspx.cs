using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class ExportExcel : System.Web.UI.Page
    {
        public DataTable CarregaDados()
        {
            string conString = @"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123";
            DataTable dt = new DataTable();

            using (SqlConnection connection = new SqlConnection(conString))
            {
                using (SqlCommand command = new SqlCommand())
                {
					
                    string data = DateTime.Now.ToString();
                    command.Connection = connection;
                    //command.CommandText = "SELECT * FROM tb_lancamento WHERE Cast(data_atual as Date) BETWEEN '" + txtdataini.Text + "'AND  data_atual='" + txtdatafim + "'";
                    command.CommandText = "SELECT * FROM tb_lancamento WHERE Cast(data_atual as Date) BETWEEN '" + txtdataini.Text + "' and '" + txtdatafim.Text + "'";
                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = command;
                        adapter.Fill(dt);

                        
                    }
                }
            }

            return dt;
        }
        protected void relatorio_excel(object sender, EventArgs e)
        {
            Response.Redirect("exporta_exceladm.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = CarregaDados();
            Session.Add("Contatos2Excel", dt);
        }
    }
}