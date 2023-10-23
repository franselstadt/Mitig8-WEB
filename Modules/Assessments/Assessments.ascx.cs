using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Mitig8;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Reflection;

namespace Mitig8.Modules.Assessments
{
    public partial class Assessments : System.Web.UI.UserControl
    {

        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();


        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {

            }
            Declare();
        }

        public void Initialze()
        {
            //try
            //{
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var Result = DataModal.getAssessmentsAllActive(UserID).ToList();
                tblAssessments_Populate(Result); statAssessments_Populate();


            tblAssessmentsArchive_Populate(DataModal.getAssessmentsAllArchive(UserID).ToList());
            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }

        public void Declare()
        {
            //try
            //{
                Cloud.JS("AssessmentsControls.Declare();");
            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }

        public void statAssessments_Populate()
        {
            //try
            //{
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var AssessmentStats = DataModal.getAssessmentsAllStats(UserID).ToList()[0];
                lblCancelled.Text = AssessmentStats.Cancelled.ToString();
                lblComplete.Text = AssessmentStats.Complete.ToString();
                lblCreated.Text = AssessmentStats.Created.ToString();
                //lblFailed.Text = AssessmentStats.Failed.ToString();
                lblQuoting.Text = AssessmentStats.Quoting.ToString();
                lblInProgress.Text = AssessmentStats.In_Progress.ToString();
            lblQA.Text = AssessmentStats.QA.ToString();
            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }

        public void tblAssessments_Populate(List<getAssessmentsAllActive_Result3> Result)
        {
            try
            {
                int PolicyCaptureInProgress = 0;
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

                foreach (var Row in Result)
                {

                if (Row.Status.ToString() == "<i class=\"fas fa-spinner fa-spin\"></i> Policy Capture In Progress")
                {
                    PolicyCaptureInProgress++;
                }
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Row.Assessment.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Insurer_Name.ToString() + "</td>");

                sb.AppendLine("<td>" + Row.Policy_Number.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Assessment_Date.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Booking_Date.ToString() + "</td>");

                sb.AppendLine("<td>" + Row.Insured_Contact_Number.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Insured_Address.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Insured_Industry_Sector.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Status.ToString() + "</td>");
                    sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\"openAssessment('" + Row.Assessment.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><i class='fas fa-external-link-alt'></i></a></div></td>");
                    sb.AppendLine("</tr>");
                }


                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                litAssessments.Text = sb.ToString();
                lblFailed.Text = PolicyCaptureInProgress.ToString();
                updTEST.Update();
                Cloud.JS("AssessmentsControls.Declare();");

        }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
}




        public void tblAssessmentsArchive_Populate(List<getAssessmentsAllArchive_Result2> Result)
        {
            //try
            //{ 
            int PolicyCaptureInProgress = 0;
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

            foreach (var Row in Result)
            {

                if (Row.Status.ToString() == "<i class=\"fas fa-spinner fa-spin\"></i> Policy Capture In Progress")
                {
                    PolicyCaptureInProgress++;
                }
                sb.AppendLine("<tr>");
                sb.AppendLine("<td>" + Row.Assessment.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Insurer_Name.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Policy_Number.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Assessment_Date.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Booking_Date.ToString() + "</td>");

                sb.AppendLine("<td>" + Row.Insured_Contact_Number.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Insured_Address.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Insured_Industry_Sector.ToString() + "</td>");
                sb.AppendLine("<td>" + Row.Status.ToString() + "</td>");
                sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\"openAssessment('" + Row.Assessment.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><i class='fas fa-external-link-alt'></i></a></div></td>");
                sb.AppendLine("</tr>");
            }


            sb.AppendLine("</tbody>");
            sb.Append("</table>");
            litArchivedAssessments.Text = sb.ToString();
            lblFailed.Text = PolicyCaptureInProgress.ToString();
            updTEST.Update();
            Cloud.JS("AssessmentsControls.Declare();");

            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }


        public void btnInitialize_Click(object sender, EventArgs e)
        {
            //try
            //{

                Initialze();
            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }
    }
}