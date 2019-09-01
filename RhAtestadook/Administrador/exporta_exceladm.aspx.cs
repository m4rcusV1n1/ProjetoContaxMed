using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RhAtestadook.Administrador
{
    public partial class exporta_exceladm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = (Session["Contatos2Excel"] as DataTable);
            gridContatos.DataSource = dt;
            gridContatos.DataBind();
            string data = DateTime.Now.ToString();
            string attachment = "attachment; filename=relatorioadm_" + data + ".xls";
            Response.ClearContent();

            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";

            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            gridContatos.RenderControl(htw);
            Response.Write(sw.ToString());
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

    }
}