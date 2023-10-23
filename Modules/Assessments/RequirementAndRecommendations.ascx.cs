using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Assessments
{
    public partial class RequirementAndRecommendations : System.Web.UI.UserControl
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
                Cloud.JS("RequirementsAndRecommendations.Declare();");
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
                Cloud.Modal("mdlRequirementsAndRecommendations").Close();
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
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                    {
                        txtAreaOfObservation, txtDetail
                    };
                foreach (TextBox Field in Fields)
                {
                    if (Field.Text.Length == 0)
                    {
                        Valid = false;
                        Cloud.Draw(Field).Highlight();
                    }
                    else
                    {
                        Cloud.Draw(Field).Normal();
                    }
                }
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.", "Missing values", MessageBoxType.error); return; }


                int RequirementsAndRecommendationsID = int.Parse(vRequirementsAndRecommendationsID.Value.ToString());
                if (RequirementsAndRecommendationsID == 0)
                {
                    DataModal.addAssessmentRequirement(txtAreaOfObservation.Text, txtDetail.Text, int.Parse(cmbRiskRating.SelectedValue), int.Parse(cmbDeadline.SelectedValue), UserID, int.Parse(vAssessmentID.Value.ToString()), int.Parse(cmbRiskType.SelectedValue.ToString()));
                    Cloud.Modal("mdlRequirementsAndRecommendations").Close();
                    txtDetail.Text = "";
                    txtAreaOfObservation.Text = "";
                    Cloud.MessageBox.Show("Requiremennt added successfully!", "Success", MessageBoxType.success);
                    Cloud.JS("AssessmentControls.Functions.InitializeRiskManagement();");
                }
                else
                {
                    DataModal.updAssessmentRequirement(RequirementsAndRecommendationsID, txtAreaOfObservation.Text, txtDetail.Text, int.Parse(cmbRiskRating.SelectedValue), int.Parse(cmbDeadline.SelectedValue), UserID, int.Parse(vAssessmentID.Value.ToString()),int.Parse(cmbRiskType.SelectedValue.ToString()));
                    Cloud.Modal("mdlRequirementsAndRecommendations").Close();
                    txtDetail.Text = "";
                    txtAreaOfObservation.Text = "";
                    Cloud.MessageBox.Show("Requiremennt updated successfully!", "Success", MessageBoxType.success);
                    Cloud.JS("AssessmentControls.Functions.InitializeRiskManagement();");
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnRequirementsAndRecommendations_Initialize(object sender, EventArgs e)
        {
            try
            {
                cmbRiskType_Populate();
                int RequirementsAndRecommendationsID = int.Parse(vRequirementsAndRecommendationsID.Value.ToString());
                if (RequirementsAndRecommendationsID != 0)
                {
                    lblRbtnRequirementsAndRecommendations.Text = "Update Requirements or Recommendations";
                    btnDelete.Visible = true;
                    try
                    {
                        var Result = DataModal.getRequirementAndRecommendatio(RequirementsAndRecommendationsID).ToList()[0];
                        txtAreaOfObservation.Text = Result.AreaOfObservation;
                        cmbDeadline.SelectedValue = Result.Deadline.ToString();
                        cmbRiskRating.SelectedValue = Result.RiskRatingID.ToString();
                        txtDetail.Text = Result.DetailOfRequirement.ToString();
                        try
                        {
                            cmbRiskType.SelectedValue = Result.RiskTypeID.ToString();
                        }
                        catch { cmbRiskType.SelectedIndex = 0; }
                     }
                    catch { }
                }
                else
                {
                    lblRbtnRequirementsAndRecommendations.Text = "Add Requirements or Recommendations";
                    txtAreaOfObservation.Text = "";
                    cmbDeadline.SelectedIndex = 0;
                    cmbRiskRating.SelectedIndex = 0;
                    cmbRiskType.SelectedIndex = 0;
                    txtDetail.Text = "";
                    btnDelete.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbRiskType_Populate()
        {
            try
            {
              
                var Results = DataModal.getRiskTypes().ToList();

                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");

                foreach (var Result in Results)
                {
                    dt.Rows.Add(Result.ID, Result.Description);
                }

                cmbRiskType.DataSource = dt;
                cmbRiskType.DataValueField = "ID";
                cmbRiskType.DataTextField = "Description";
                cmbRiskType.DataBind();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int RequirementsAndRecommendationsID = int.Parse(vRequirementsAndRecommendationsID.Value.ToString());

                DataModal.deleteAssessmentRequirement(RequirementsAndRecommendationsID);

                Cloud.MessageBox.Show(cmbRiskType.SelectedItem.Text.ToString() + " deleted successfully", "Success", MessageBoxType.info);
                Cloud.Modal("mdlRequirementsAndRecommendations").Close();
                txtDetail.Text = "";
                txtAreaOfObservation.Text = "";
                Cloud.JS("AssessmentControls.Functions.InitializeRiskManagement();");

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }

        }
    }
}