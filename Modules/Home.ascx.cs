using System;
using System.Web.UI;
using Mitig8.Application.Home;
using Mitig8.Architecture;
using Mitig8.Domain.Items.View;

namespace Mitig8.Modules
{
    public partial class Home : System.Web.UI.UserControl
    {
        public Cloud Cloud = new Cloud();
        private HomeApplication homeApplication = new HomeApplication();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Cloud.Page(this.Page);
            if (!this.IsPostBack)
            {
                this.Initialize();
            }

            this.Declare();
        }

        public void Initialize()
        {
            try
            {
                this.Cloud.GetCookie("UserID");
                SessionContext session = SessionContext.FromCookies(this.Request);
                HomeSummaryViewItem summary = this.homeApplication.ReadSummary(session.UserID, session.CompanyID);
                this.lblInvoices.Text = summary.Invoices.ToString();
                this.lblAssessments.Text = summary.Assessments.ToString();
                this.lblNotifications.Text = summary.Notifications.ToString();
                this.lblUsers.Text = summary.Users.ToString();
                this.lblTotaAssessments.Text = summary.TotalAssessments.ToString();
                this.lblInsurers.Text = summary.Insurers.ToString();
                this.lblAssessors.Text = summary.Assessors.ToString();
                this.lblSpecialists.Text = summary.Specialists.ToString();
            }
            catch (Exception ex)
            {
                this.Cloud.Exception(ex);
            }
        }

        public void Declare()
        {
        }

        public void btnShowMessage_Click(object sender, EventArgs e)
        {
        }
    }
}
