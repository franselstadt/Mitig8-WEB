using System;
using System.Web.UI;
using Mitig8.Architecture;

namespace Mitig8
{
    public partial class dashboard : System.Web.UI.Page
    {
        private Cloud Cloud = new Cloud();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Cloud.Page(this);
            if (!this.IsPostBack)
            {
                this.Initialize();
            }

            this.Declare();
        }

        public void Initialize()
        {
            try
            {
                SessionContext session = SessionContext.FromCookies(this.Request);
                if (!session.IsAuthenticated)
                {
                    this.Cloud.GetCookie("UserID");
                    return;
                }

                this.Assessment.Visible = false;
                this.Assessment_Building_Valuation.Visible = false;
                this.Assessment_Assets_Valuation.Visible = false;

                string module = this.Request.QueryString["Module"];
                if (module == ModuleCatalog.BuildingValuation)
                {
                    this.Assessment_Building_Valuation.Visible = true;
                }
                else if (module == ModuleCatalog.AssetsValuation)
                {
                    this.Assessment_Assets_Valuation.Visible = true;
                }
                else if (module == ModuleCatalog.Assessment)
                {
                    this.Assessment.Visible = true;
                }
            }
            catch (Exception ex)
            {
                this.Cloud.Exception(ex);
            }
        }

        public void Declare()
        {
        }
    }
}
