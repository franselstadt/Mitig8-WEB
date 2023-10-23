using SelectPdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.documents
{
    public partial class ExecutiveReport : System.Web.UI.Page
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this);
            if (!IsPostBack)
            {
                if (int.Parse(Cloud.GetCookie("UserTypeID").ToString()) == 4)
                {
                    fabSpecialist.Visible = true;
                }
                else {
                    fabSpecialist.Visible = false;
                }

                var Pages = DataModal.PDF_ExecutiveReport(int.Parse(Request.QueryString["AID"].ToString())).ToList();

                string n = "";

                for (int x = 0; x < Pages.Count; x++)
                {
                    n = n + Pages[x].Page.ToString();
                }
                litExecutiveReport.Text = n;
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
                    int AssessmentID = int.Parse(Request.QueryString["AID"].ToString());
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