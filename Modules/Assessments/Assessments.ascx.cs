using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using Mitig8.Application.Assessments;
using Mitig8.Architecture;
using Mitig8.Domain.Items.View;
using Mitig8.Extensions;

namespace Mitig8.Modules.Assessments
{
    public partial class Assessments : System.Web.UI.UserControl
    {
        private Cloud Cloud = new Cloud();
        private AssessmentApplication assessmentApplication = new AssessmentApplication();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Cloud.Page(this.Page);
            if (!this.IsPostBack)
            {
            }

            this.Declare();
        }

        public void Initialze()
        {
            this.Cloud.GetCookie("UserID");
            int userID = SessionContext.FromCookies(this.Request).UserID;
            this.tblAssessments_Populate(this.assessmentApplication.ReadActive(userID));
            this.statAssessments_Populate();
            this.tblAssessmentsArchive_Populate(this.assessmentApplication.ReadArchive(userID));
        }

        public void Declare()
        {
            this.Cloud.JS("AssessmentsControls.Declare();");
        }

        public void statAssessments_Populate()
        {
            int userID = SessionContext.FromCookies(this.Request).UserID;
            AssessmentStatsViewItem stats = this.assessmentApplication.ReadStats(userID);
            this.lblCancelled.Text = stats.Cancelled.ToString();
            this.lblComplete.Text = stats.Complete.ToString();
            this.lblCreated.Text = stats.Created.ToString();
            this.lblQuoting.Text = stats.Quoting.ToString();
            this.lblInProgress.Text = stats.InProgress.ToString();
            this.lblQA.Text = stats.QA.ToString();
        }

        public void tblAssessments_Populate(List<AssessmentWorklistViewItem> result)
        {
            try
            {
                int policyCaptureInProgress = 0;
                StringBuilder sb = new StringBuilder();
                sb.Append("<table id='tblAssessmentsActive' class='hover table table-striped table-bordered' style='font-size:13px;'>");
                sb.AppendLine("<thead><tr>");
                sb.AppendLine("<th>Assessment</th>");
                sb.AppendLine("<th>Insurer</th>");
                sb.AppendLine("<th>Policy</th>");
                sb.AppendLine("<th>Date</th>");
                sb.AppendLine("<th>Booking</th>");
                sb.AppendLine("<th>Insured Name</th>");
                sb.AppendLine("<th>Insured Address</th>");
                sb.AppendLine("<th>Insured Industry</th>");
                sb.AppendLine("<th>Status</th>");
                sb.AppendLine("<th>Open</th>");
                sb.AppendLine("</tr></thead><tbody>");

                foreach (AssessmentWorklistViewItem row in result)
                {
                    if (row.IsPolicyCaptureInProgress)
                    {
                        policyCaptureInProgress++;
                    }

                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + row.AssessmentID.ToString() + "</td>");
                    sb.AppendLine("<td>" + row.InsurerName.OrEmpty() + "</td>");
                    sb.AppendLine("<td>" + row.PolicyNumber.OrEmpty() + "</td>");
                    sb.AppendLine("<td>" + row.AssessmentDate.OrEmpty() + "</td>");
                    sb.AppendLine("<td>" + row.BookingDate.OrEmpty() + "</td>");
                    sb.AppendLine("<td>" + row.InsuredContactNumber.OrEmpty() + "</td>");
                    sb.AppendLine("<td>" + row.InsuredAddress.OrEmpty() + "</td>");
                    sb.AppendLine("<td>" + row.InsuredIndustrySector.OrEmpty() + "</td>");
                    sb.AppendLine("<td>" + row.Status.OrEmpty() + "</td>");
                    sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;cursor:pointer\" onclick=\"openAssessment('" + row.AssessmentID.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><i class='fas fa-external-link-alt'></i></a></div></td>");
                    sb.AppendLine("</tr>");
                }

                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                this.litAssessments.Text = sb.ToString();
                this.lblFailed.Text = policyCaptureInProgress.ToString();
                this.updTEST.Update();
                this.Cloud.JS("AssessmentsControls.Declare();");
            }
            catch (Exception ex)
            {
                this.Cloud.Exception(ex);
            }
        }

        public void tblAssessmentsArchive_Populate(List<AssessmentWorklistViewItem> result)
        {
            int policyCaptureInProgress = 0;
            StringBuilder sb = new StringBuilder();
            sb.Append("<table id='tblAssessmentsArchive' class='hover table table-striped table-bordered' style='font-size:13px;'>");
            sb.AppendLine("<thead><tr>");
            sb.AppendLine("<th>Assessment</th>");
            sb.AppendLine("<th>Insurer</th>");
            sb.AppendLine("<th>Policy</th>");
            sb.AppendLine("<th>Date</th>");
            sb.AppendLine("<th>Booking</th>");
            sb.AppendLine("<th>Insured Name</th>");
            sb.AppendLine("<th>Insured Address</th>");
            sb.AppendLine("<th>Insured Industry</th>");
            sb.AppendLine("<th>Status</th>");
            sb.AppendLine("<th>Open</th>");
            sb.AppendLine("</tr></thead><tbody>");

            foreach (AssessmentWorklistViewItem row in result)
            {
                if (row.IsPolicyCaptureInProgress)
                {
                    policyCaptureInProgress++;
                }

                sb.AppendLine("<tr>");
                sb.AppendLine("<td>" + row.AssessmentID.ToString() + "</td>");
                sb.AppendLine("<td>" + row.InsurerName.OrEmpty() + "</td>");
                sb.AppendLine("<td>" + row.PolicyNumber.OrEmpty() + "</td>");
                sb.AppendLine("<td>" + row.AssessmentDate.OrEmpty() + "</td>");
                sb.AppendLine("<td>" + row.BookingDate.OrEmpty() + "</td>");
                sb.AppendLine("<td>" + row.InsuredContactNumber.OrEmpty() + "</td>");
                sb.AppendLine("<td>" + row.InsuredAddress.OrEmpty() + "</td>");
                sb.AppendLine("<td>" + row.InsuredIndustrySector.OrEmpty() + "</td>");
                sb.AppendLine("<td>" + row.Status.OrEmpty() + "</td>");
                sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;cursor:pointer\" onclick=\"openAssessment('" + row.AssessmentID.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><i class='fas fa-external-link-alt'></i></a></div></td>");
                sb.AppendLine("</tr>");
            }

            sb.AppendLine("</tbody>");
            sb.Append("</table>");
            this.litArchivedAssessments.Text = sb.ToString();
            this.lblFailed.Text = policyCaptureInProgress.ToString();
            this.updTEST.Update();
            this.Cloud.JS("AssessmentsControls.Declare();");
        }

        public void btnInitialize_Click(object sender, EventArgs e)
        {
            this.Initialze();
        }
    }
}
