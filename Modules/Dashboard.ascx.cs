using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mitig8;


namespace Mitig8.Modules
{
    public partial class Dashboard : System.Web.UI.UserControl
    {
       public Cloud Cloud = new Cloud();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack) {
                Initialize();
            }
            Declare();
        }

        public void Initialize()
        {

        }

        public void Declare()
        {

        }

        public void btnShowMessage_Click(object sender, EventArgs e)
        {
            //  Cloud.MessageBox.Show("Test", "text", MessageBoxType.info);
  
        }
    }
}