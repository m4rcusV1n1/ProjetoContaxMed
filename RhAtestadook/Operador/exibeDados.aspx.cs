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
using System.IO;
using System.Text.RegularExpressions;
using System.ComponentModel.DataAnnotations;


namespace AutoCompletar
{
    public partial class exibeDados : System.Web.UI.Page
    {
     
        protected override void Render(HtmlTextWriter output)
        {
            StringWriter stringWriter = new StringWriter();

            HtmlTextWriter textWriter = new HtmlTextWriter(stringWriter);
            base.Render(textWriter);

            textWriter.Close();

            string strOutput = stringWriter.GetStringBuilder().ToString();

            strOutput = Regex.Replace(strOutput, "<input[^>]*id=\"__VIEWSTATE\"[^>]*>", "", RegexOptions.Singleline);

            output.Write(strOutput);
        }
        protected void Page_Load(object sender, EventArgs e)
        
      {

            //string cid = "z519";
            string cid = Request.QueryString["cid"];
            SqlConnection conn = new SqlConnection(@"Data Source=CARITA-PC\SQLEXPRESS;Initial Catalog=bd_rh_atestadoctx;User ID=sa;Password=marcus123");

            SqlCommand comm = new SqlCommand("SELECT * FROM tb_cid WHERE cid='" + cid + "'", conn);

            /* Aqui no CommandType tem que definir se vai utilizar uma Stored Procedure ou uma query */
            //comm.CommandType = CommandType.StoredProcedure; /* Quando usa SP's */
            /* ou */
            comm.CommandType = CommandType.Text; /* Quando usa Query */

            /* paramentros do banco*/
            comm.Parameters.Add(new SqlParameter("@id", "id"));
            comm.Parameters.Add(new SqlParameter("@cid", "cid"));
            comm.Parameters.Add(new SqlParameter("@descricao", "descricao"));
            conn.Open();
            DbDataReader dr = comm.ExecuteReader();
            while (dr.Read())
            {
                /* dados do banco x text box */
                txtDescricao.Text = dr["descricao"].ToString();
                

            }
            conn.Close();
        }
      
    }

}