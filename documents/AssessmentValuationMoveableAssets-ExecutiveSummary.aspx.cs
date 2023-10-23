using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.documents
{
    public partial class AssessmentValuationMoveableAssets_ExecutiveSummary : System.Web.UI.Page
    {

        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string AssessmentID = Request.QueryString["AssessmentID"].ToString();

                var Pages = DataModal.PDF_getAssessmentMoveableAssetsValuation(int.Parse(AssessmentID)).ToList();

                foreach (var Page in Pages)
                {
                    litReport.Text += Page.HTML;
                }


            }
        }
    }
}