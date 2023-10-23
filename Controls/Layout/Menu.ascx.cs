using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Controls.Layout
{
    public partial class Menu : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {


                vUserID.Value = Cloud.GetCookie("UserID").ToString();

                try
                {
                    int? isCustodian = DataModal.isCustodian(int.Parse(Cloud.GetCookie("UserID").ToString())).ToList()[0].Value;
                    if (isCustodian > 0)
                    {
                        btnBilling.Visible = true;
                    }
                    else
                    {
                        btnBilling.Visible = false;

                    }
                }
                catch {
                    btnBilling.Visible = false;
                }

                try
                {
                    if (int.Parse(Cloud.GetCookie("UserTypeID").ToString()) == 2)
                    {
                        btnRiskManagement.Visible = true;
                      
                    }
                    else
                    {
                        btnRiskManagement.Visible = false;
                    }
                }
                catch
                {
                    btnRiskManagement.Visible = false;
                }

                btnReport.Visible = btnRiskManagement.Visible;
            }
        }
            
        }
    
}