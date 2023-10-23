using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mitig8.Infrasructure;

namespace Mitig8
{
    public partial class persuitims_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Request.QueryString["token"].ToString() == "8c866f435c8b0de06ee402a3e83e8b907a6688d9")
                {
                    pursuitims pursuitims = new pursuitims();

                    Response.Write(DateTime.Now.ToString() + "---->"+ pursuitims.Policy_GetPolicyDetails(Request.QueryString["policynumber"].ToString(), Request.QueryString["UMCode"].ToString()));
                }
                else
                {
                    Response.Write("unauthorized access " + DateTime.Now.ToString()); ;

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
        }
    }
}