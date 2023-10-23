using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.RiskManagement
{
    public partial class RiskManagement : System.Web.UI.UserControl
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
                Cloud.JS("$.fn.dataTable.ext.errMode = 'none';$('#tblRiskManagement').DataTable();");
            }
            catch (Exception ex)
            {
                //Cloud.Exception(ex);
            }
        }

        public void btnInitialize_Click(object sender, EventArgs e)
        {
            try
            {
                tblRiskManagement_Populate();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void tblRiskManagement_Populate()
        {
            try
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var Results = DataModal.getRiskManagementRequirementsAll(UserID).ToList();

                StringBuilder sb = new StringBuilder();
                sb.Append("<table id='tblRiskManagement' class='hover table table-striped table-bordered dataTable' style='font-size:13px;'>");
                sb.AppendLine("<thead><tr>");
                sb.AppendLine("<th>Assessment</th>");
                sb.AppendLine("<th>Insurer</th>");
                sb.AppendLine("<th>Policy</th>");
                sb.AppendLine("<th>Date</th>");
                sb.AppendLine("<th>Name</th>");
                sb.AppendLine("<th>High Risk</th>");
                sb.AppendLine("<th>Medium Risk</th>");
                sb.AppendLine("<th>Low Risk</th>");
                sb.AppendLine("<th>Options</th>");
                sb.AppendLine("</tr></thead><tbody>");
                foreach (var Result in Results)
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Result.Assessment.ToString() + "</td>");
                    sb.AppendLine("<td>" + Result.Insurer_Name.ToString() + "</td>");
                    sb.AppendLine("<td>" + Result.Policy.ToString() + "</td>");
                    sb.AppendLine("<td>" + Result.Date.ToString() + "</td>");
                    sb.AppendLine("<td>" + Result.Insured.ToString() + "</td>");
                    sb.AppendLine("<td>" + Result.C_HRR.ToString()+ "</td>");
                    sb.AppendLine("<td>" + Result.C_MRR.ToString() + "</td>");
                    sb.AppendLine("<td>" + Result.C_LRR.ToString() + "</td>");
                    sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\"PolicyRiskManagementControls.Initialize('" + Result.Assessment.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><i class='fas fa-external-link-alt'></i></a></div></td>");
                    sb.AppendLine("</tr>");
                }
                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                litRiskManagement.Text = sb.ToString();
                totalsRiskManagement_Populate();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void totalsRiskManagement_Populate()
        {
            try
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var Results = DataModal.getRiskManagementTotals(UserID).ToList()[0];
                lblHighRisk.Text = Results.High_Risk.ToString();
                lblLowRisk.Text = Results.Low_Risk.ToString();
                lblMediumRisk.Text = Results.Medium_Risk.ToString();
                lblPendingRequirements.Text = Results.Pending_Requirements.ToString();
                lblCompletedRequirements.Text = Results.Completed_Requirements.ToString();
                lblRiskManagementKPI.Text = Results.Risk_Management_KPI.ToString();
            }
            catch { }
        }
    }
}