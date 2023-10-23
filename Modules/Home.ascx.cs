using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules
{
    public partial class Home : System.Web.UI.UserControl
    {

            public Cloud Cloud = new Cloud();
            DataModal DataModal = new DataModal();

            protected void Page_Load(object sender, EventArgs e)
            {
                Cloud.Page(this.Page);
                if (!IsPostBack)
                {
                    Initialize();
                }
                Declare();
            }

            public void Initialize()
            {
                try
                {
                    int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                    int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                    var Response = DataModal.getUserDetailsHome(UserID, CompanyID).ToList()[0];
                    lblInvoices.Text = Response.Invoices.ToString();
                    lblAssessments.Text = Response.Assessments.ToString();
                    lblNotifications.Text = Response.Notifications.ToString();
                    lblUsers.Text = Response.Users.ToString();

                   var GlobalResponse = DataModal.getDetailsHomeGlobal().ToList()[0];
                   lblTotaAssessments.Text = GlobalResponse.Assessments.ToString();
                   lblInsurers.Text = GlobalResponse.Insurers.ToString();
                   lblAssessors.Text = GlobalResponse.Assessors.ToString();
                   lblSpecialists.Text = GlobalResponse.Specialist.ToString();

            }
            catch (Exception ex)
                {
                    Cloud.Exception(ex);
                }
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
    