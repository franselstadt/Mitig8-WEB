using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.RunSurvey
{
    public partial class Survey : System.Web.UI.Page
    {
        DataModal DataModal = new DataModal();
        Cloud Cloud = new Cloud();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {

     int UserID = int.Parse(Request.QueryString["n"].ToString());




  int MODE = 0;
                try
                {
if(UserID != 0)
{
                    vModeID.Value = Request.QueryString["xmode"].ToString();
}
                }
                catch
                {

                }

try
{
if(UserID != 0)
{
                if (int.Parse(Cloud.GetCookie("UserTypeID").ToString()) == 4)
                {
                    fabSpecialist.Visible = true;
                }
                else
                {
                    fabSpecialist.Visible = false;
                }


                if (int.Parse(Cloud.GetCookie("UserTypeID").ToString()) == 5)
                {
                    fabAssessor.Visible = true;
                }
                else
                {
                    fabAssessor.Visible = false;
                }
}
}
catch{fabAssessor.Visible = false; fabSpecialist.Visible = false;vModeID.Value = "1";}

if(UserID == 0)
{
	fabAssessor.Visible = false; fabSpecialist.Visible = false;vModeID.Value = "1";
}

                int SurveyID = int.Parse(Request.QueryString["y"].ToString());
             
                int AssessmentID = int.Parse(Request.QueryString["a"].ToString());

                vSurveyID.Value = SurveyID.ToString().Trim();
                vUserID.Value = UserID.ToString().Trim();
                vAssessmentID.Value = AssessmentID.ToString().Trim();

                var SurveyJSON = DataModal.getAssessmentSurvey(SurveyID).ToList()[0];
                vJSON.Value = SurveyJSON.SurveyQuestionsJSON.ToString().Replace(";", "");
                vState.Value = SurveyJSON.SurveyAnswersJSON.ToString().Replace(";", "");
                vJSONDOWNLOAD.Value = SurveyJSON.SurveyQuestionsJSON.ToString().Replace(";", "").Replace("\"visible\": false", "\"visible\": true").Replace("visibleIf", "*visibleIf");

              
            }
        }


        public void btnInitializeAddReviewMessage_Click(object sender, EventArgs e)
        {
            try
            {
                txtReviewText.Text = "";
                cmbReviewSurveyCategory_Populate();

                lblAddReviewMessageTitle.Text = "Add Review";

                Cloud.Modal("mdlAddReviewMessage").Open();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbReviewSurveyCategory_Populate()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Result = DataModal.getSurveyCategories(1).ToList();
                foreach (var Item in Result)
                {
                    dt.Rows.Add(Item.ID, Item.Description);
                }
                cmbReviewSurveyCategory.DataSource = dt;
                cmbReviewSurveyCategory.DataValueField = "ID";
                cmbReviewSurveyCategory.DataTextField = "Description";
                cmbReviewSurveyCategory.DataBind();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnAddReview_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtReviewText.Text.Length > 0)
                {
                    int AssessmentID = int.Parse(Request.QueryString["a"].ToString());
                    int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                    DataModal.addAssessmentReview(UserID, AssessmentID, int.Parse(cmbReviewSurveyCategory.SelectedValue), txtReviewText.Text);
                    Cloud.Modal("mdlAddReviewMessage").Close();
                    Cloud.MessageBox.Show("Review for " + cmbReviewSurveyCategory.SelectedItem.Text + " added successfully.", "Success", MessageBoxType.success);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}