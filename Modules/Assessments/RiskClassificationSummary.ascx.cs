using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Mitig8.Modules.Assessments
{
    public partial class RiskClassificationSummary : System.Web.UI.UserControl
    {
        DataModal DataModal = new DataModal();
        Cloud Cloud = new Cloud();

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
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Result = DataModal.getAssessmentRiskClassificationFactor().ToList();
                foreach (var Item in Result)
                {
                    dt.Rows.Add(Item.ID, Item.Description);
                }
                cmbRiskFactor.DataSource = dt;
                cmbRiskFactor.DataValueField = "ID";
                cmbRiskFactor.DataTextField = "Description";
                cmbRiskFactor.DataBind();
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
                Cloud.JS("RiskClassificationSummaryControls.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnRiskClassificationSummary_Initialize(object sender, EventArgs e)
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

        public void btnClose_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlRiskClassificationSummary").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtReason.Text.Length > 0)
                {
                    int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                    int AssessmentID = int.Parse(vAssessmentID.Value);
                    DataModal.addAssessmentRiskClassificationSummary(int.Parse(cmbRiskFactor.SelectedValue), int.Parse(cmbRiskRating.SelectedValue), AssessmentID, txtReason.Text, UserID);
                    txtReason.Text = "";
                    Cloud.Modal("mdlRiskClassificationSummary").Close();
                    Cloud.MessageBox.Show("Risk classification summary added successfully!", "Success", MessageBoxType.success);
                    Cloud.JS("AssessmentControls.Functions.InitializeRiskManagement();");
                }
                else
                {
                    Cloud.MessageBox.Show("Please ensure you captured a reason...","No reason?",MessageBoxType.error);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}