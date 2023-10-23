using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Companies
{
    public partial class Company : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        public int CompanyID
        {
            get { return (vCompanyID.Value.Length < 1) ? 0 : int.Parse(vCompanyID.Value); }
            set { vCompanyID.Value = value.ToString(); }
        }

        public string Name
        {
            get { return txtName.Text; }
            set { txtName.Text = value;lblCompanyName.Text = value;  }
        }

        public string ContactPerson
        {
            get { return txtContactPerson.Text; }
            set { txtContactPerson.Text = value; }
        }

        public string ContactNumber
        {
            get { return txtContactNumber.Text; }
            set { txtContactNumber.Text = value; }
        }

        public string Email
        {
            get { return txtEmail.Text; }
            set { txtEmail.Text = value; }
        }

        public string Town
        {
            get { return txtTown.Text; }
            set { txtTown.Text = value; }
        }

        public string PostalCode
        {
            get { return txtPostalCode.Text; }
            set { txtPostalCode.Text = value; }
        }

        public string Address1
        {
            get { return txtAddress1.Text; }
            set { txtAddress1.Text = value; }
        }

        public string Address2
        {
            get { return txtAddress2.Text; }
            set { txtAddress2.Text = value; }
        }

        public int CompanyType
        {
            get { return int.Parse(cmbCompanyType.SelectedValue.ToString()); }
            set { cmbCompanyType.SelectedValue = value.ToString(); }
        }

        public string RegistrationNumber
        {
            get { return txtRegistrationNumber.Text.ToString(); }
            set { txtRegistrationNumber.Text = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {
                Declare();
            }
            Initialize();
        }

        public void Initialize()
        {
            try
            {
                cmbCompanyType_Populate();
                List<getCompanyEmployees_Result> Employees = DataModal.getCompanyEmployees(this.CompanyID).ToList();
                tblEmployees_Populate(Employees);

                if (this.CompanyID == 0)//New
                {
                    lblCompanyName.Text = "New Company";
                }
                else//Existing
                {

                }
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
                Cloud.JS("CompanyControls.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnCompany_Initialize(object sender, EventArgs e)
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

        public void cmbCompanyType_Populate()
        {
            try
            {
                cmbCompanyType.DataSource = DataModal.GetCompanyType();
                cmbCompanyType.DataValueField = "ID";
                cmbCompanyType.DataTextField = "Description";
                cmbCompanyType.DataBind();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void tblEmployees_Populate(List<getCompanyEmployees_Result> Result)
        {
            try
            {
                if (Result.Count == 0) {litEmployees.Text =""; return; }
                StringBuilder sb = new StringBuilder();
                sb.Append("<table id='tblEmployees' class='hover table table-striped table-bordered dataTable' style='font-size:13px;'>");
                sb.AppendLine("<thead><tr>");
                sb.AppendLine("<th>UserID</th>");
                sb.AppendLine("<th>Name</th>");
                sb.AppendLine("<th>Cellphone</th>");
                sb.AppendLine("<th>Type</th>");
                sb.AppendLine("<th>Custodian?</th>");
                sb.AppendLine("<th>Options</th>");
                sb.AppendLine("</tr></thead><tbody>");
                foreach (getCompanyEmployees_Result Row in Result)
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Row.UserID.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Name.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Cellphone.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Description.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Custodian_.ToString() + "</td>");
                    sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\"openEmployee('" + Row.UserID.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><span class='glyphicon glyphicon-new-window'></span></a></div></td>");
                    sb.AppendLine("</tr>");
                }
                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                
                litEmployees.Text = sb.ToString();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlCompany").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}