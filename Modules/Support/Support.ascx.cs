using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Support
{
    public partial class Support : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {

            }
        }

        public void Initialize()
        {
            try
            {

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void Declare()
        {
            try
            {

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnCloseSupport_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlSupport").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}