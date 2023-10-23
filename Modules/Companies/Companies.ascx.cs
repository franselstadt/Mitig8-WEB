using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Companies
{
    public partial class Companies : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {
                Initialze();
            }
            Declare();
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

        public void Initialze()
        {
            try
            {
                DataModal.getCompanies();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnInitialize_Click(object sender, EventArgs e)
        {
            try
            {
                var Result = DataModal.getCompanies().ToList();
                tblCompanies_Populate(Result);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void tblCompanies_Populate(List<getCompanies_Result> Result)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<table id='tblCompanies' class='hover table table-striped table-bordered dataTable' style='font-size:13px;'>");
                sb.AppendLine("<thead><tr>");
                sb.AppendLine("<th>ID</th>");
                sb.AppendLine("<th>Name</th>");
                sb.AppendLine("<th>Type</th>");
                sb.AppendLine("<th>Tell</th>");
                sb.AppendLine("<th>Email</th>");
                sb.AppendLine("<th>Registration</th>");
                sb.AppendLine("<th>Quote</th>");
                sb.AppendLine("<th>Options</th>");
                sb.AppendLine("</tr></thead><tbody>");
                foreach (getCompanies_Result Row in Result)
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Row.ID.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Name.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Type.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Tell.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Email.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Registration.ToString() + "</td>");
                    sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\"PolicyRiskManagementControls('" + Row.ID.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><span class='glyphicon glyphicon-new-window'></span></a></div></td>");
                    sb.AppendLine("</tr>");
                }
                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                litCompanies.Text = sb.ToString();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlCompany").Open();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}