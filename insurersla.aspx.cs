using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class insurersla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string CompanyName = Request.QueryString["CompanyName"].ToString();
            string CompanyRegNo = Request.QueryString["CompanyRegNo"].ToString();
            string CompanyAddress = Request.QueryString["CompanyAddress"].ToString();
            string CompanyUser = Request.QueryString["CompanyUser"].ToString();

            lblCompanyName.Text = CompanyName;
            lblRegistrationNumber.Text = CompanyRegNo;
            lblAddress.Text = CompanyAddress;
            lblUserName.Text = CompanyUser;
        }
    }
