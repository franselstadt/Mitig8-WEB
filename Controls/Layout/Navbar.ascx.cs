using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Controls.Layout
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        public Cloud Cloud = new Cloud();
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
                int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());

                if (UserTypeID == 2)
                {
                    New.Visible = true;
                    NewAssessment.Visible = true;

                    Search.Visible = false;


                    NewValuationMovableAssets.Visible = true;

              //      NewValuationBuildings.Visible = true;
                }

                if (UserTypeID == 3)
                {
                    New.Visible = false;
                    NewAssessment.Visible = false;

                    Search.Visible = false;
                    Support.Visible = false;


                    NewValuationMovableAssets.Visible = false;

                  //  NewValuationBuildings.Visible = false;
                }

                if (UserTypeID == 5)
                {
                    New.Visible = false;
                    NewAssessment.Visible = false;

                    Search.Visible = false;
                    Support.Visible = false;

                    NewValuationMovableAssets.Visible = false;

                //    NewValuationBuildings.Visible = false;
                }

                if (UserTypeID == 4)
                {
                    New.Visible = false;
                    NewAssessment.Visible = false;

                    Search.Visible = false;
                    Support.Visible = true;

                    NewValuationMovableAssets.Visible = false;

                 //   NewValuationBuildings.Visible = false;
                }

                if (UserTypeID == 6)
                {
                    NewValuationMovableAssets.Visible = true;

                   // NewValuationBuildings.Visible = true;
                    New.Visible = true;
                    NewAssessment.Visible = true;

                    Search.Visible = false;
                    Support.Visible = true;
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

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}