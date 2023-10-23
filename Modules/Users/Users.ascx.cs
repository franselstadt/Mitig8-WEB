using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Users
{
    public partial class Users : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
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
                int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                setCompanyUsers(CompanyID);
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

        public void setCompanyUsers(int CompanyID)
        {
            try
            {
                var Users = DataModal.getCompanyUsers(CompanyID).ToList();

                lblTotalUsers.Text = Users.Count().ToString();
                int? Active = 0, Suspended = 0, Pending = 0;


                StringBuilder sb = new StringBuilder();
                sb.Append("<table id='tblUsers' class='hover table table-striped table-bordered dataTable' style='font-size:13px;'>");
                sb.AppendLine("<thead><tr>");
                sb.AppendLine("<th>Name</th>");
                sb.AppendLine("<th>Identity Number</th>");
                sb.AppendLine("<th>Email</th>");
                sb.AppendLine("<th>Cellphone</th>");
                sb.AppendLine("<th>Type</th>");
                sb.AppendLine("<th>Active</th>");
                sb.AppendLine("<th>Options</th>");
                sb.AppendLine("</tr></thead><tbody>");
                foreach (getCompanyUsers_Result Row in Users)
                {
                 

                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Row.Firstname + " " + Row.LastName + "</td>");
                    sb.AppendLine("<td>" + Row.IdentityNumber.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Email.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Cellphone.ToString() + "</td>");
                    sb.AppendLine("<td>Assessor</td>");
                    sb.AppendLine("<td>" + ((Row.Active==0) ? "No" : "Yes") + "</td>");
                    sb.AppendLine("<td><button class='btn btn-warning' title='View'><i class='fas fa-eye'></i>&nbsp;View</button></td>");
                    sb.AppendLine("</tr>");

                    Suspended += (Row.Active == 0) ? 1 : 0;
                }

                Active = Users.Count() - Suspended;
                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                litUsers.Text = sb.ToString();
                lblActiveUsers.Text = Active.ToString();
                lblPendingUsers.Text = Pending.ToString();
                lblSuspendedUsers.Text = Suspended.ToString();
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
                Initialize();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}