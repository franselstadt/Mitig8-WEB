using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8
{
    public partial class dashboard : System.Web.UI.Page
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this);
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
                Cloud.GetCookie("UserID").ToString();

                Assessment.Visible = false;
                Assessment_Building_Valuation.Visible = false;
                Assessment_Assets_Valuation.Visible = false;

                try
                {
                    if (Request.QueryString["Module"] == "ASSESSMENT_BUILDING_VALUATION")
                    {

                        Assessment.Visible = false;
                        Assessment_Building_Valuation.Visible = true;
                        Assessment_Assets_Valuation.Visible = false;


                    }
                    else if (Request.QueryString["Module"] == "ASSESSMENT_ASSETS_VALUATION")
                    {

                        Assessment.Visible = false;
                        Assessment_Building_Valuation.Visible = false;
                        Assessment_Assets_Valuation.Visible = true;

                    }
                    else if (Request.QueryString["Module"] == "ASSESSMENT")
                    {

                        Assessment.Visible = true;
                        Assessment_Building_Valuation.Visible = false;
                        Assessment_Assets_Valuation.Visible = false;

                    }
                    else
                    {
                        Assessment.Visible = false;
                        Assessment_Building_Valuation.Visible = false;
                        Assessment_Assets_Valuation.Visible = false;

                    }

                }
                catch { }
            }
            catch { }

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
                //if (Request.QueryString["Module"] == "ASSESSMENT_BUILDING_VALUATION")
                //{

                //    Assessment.Visible = false;
                //    Assessment_Building_Valuation.Visible = true;
                //    Assessment_Assets_Valuation.Visible = false;


                //}
                //else if (Request.QueryString["Module"] == "ASSESSMENT_ASSETS_VALUATION")
                //{

                //    Assessment.Visible = false;
                //    Assessment_Building_Valuation.Visible = false;
                //    Assessment_Assets_Valuation.Visible = true;

                //}
                //else if (Request.QueryString["Module"] == "ASSESSMENT")
                //{

                //    Assessment.Visible = true;
                //    Assessment_Building_Valuation.Visible = false;
                //    Assessment_Assets_Valuation.Visible = false;

                //}
                //else
                //{
                //    Assessment.Visible = false;
                //    Assessment_Building_Valuation.Visible = false;
                //    Assessment_Assets_Valuation.Visible = false;

                //}
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


    }
}