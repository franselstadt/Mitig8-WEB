using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.RiskManagement
{
    public partial class PolicyRiskManagement : System.Web.UI.UserControl
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
                Cloud.JS("PolicyRiskManagementControls.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnInitialize_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                var Result = DataModal.getAssessmentGeneralInformation(AssessmentID).ToList()[0];
                lblPolicyNumber.Text = Result.InsurerPolicyNumber.ToString();
                lblAssessmentID.Text = AssessmentID.ToString();
                lblAssessorsGeneralComments.Text = Result.RiskComments.ToString();
                vEML.Value = Result.EML.ToString();
                vMPL.Value = Result.MPL.ToString();
                tblAssessmentRequirements_Populate();
                tblRiskClassificationSummaries_Populate();
                tblFinancialRisk_Populate();
                Cloud.JS("PolicyRiskManagementControls.Declare();");
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
                Cloud.Modal("mdlPolicyRiskManagement").Close();
                Cloud.JS("$('#'"+btnInitialize.ClientID+ "').click();$('#'" + btnInitialize.ClientID + "').click();$('#'" + btnInitialize.ClientID + "').click();");
                Cloud.Modal("mdlPolicyRiskManagement").Close();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void tblAssessmentRequirements_Populate()
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                StringBuilder sb = new StringBuilder();
                var Results = DataModal.getAssessmentRequirements(AssessmentID).ToList();
                if (Results.Count() > 0)
                {
                    sb.AppendLine("<table class='table table-striped'>");
                    sb.AppendLine("<thead>");
                    sb.AppendLine("<tr>");
                    //sb.AppendLine("<th style='width: 20px'>ID</th>");
                    sb.AppendLine("<th width='180px'>Type</th>");
                    sb.AppendLine("<th width='180px'>Risk</th>");

                    sb.AppendLine("<th width='180px'>Area Of Observation</th>");
                    sb.AppendLine("<th >Detail</th>");
                    sb.AppendLine("<th width='95px'>Priority</th>");
                    sb.AppendLine("<th width='95px'>Deadline</th>");
                    sb.AppendLine("<th>Target Date</th>");
                    sb.AppendLine("<th width='95px'>Status</th>");
                    sb.AppendLine("<th width='175px'>Options</th>");
                    sb.AppendLine("</tr>");
                    sb.AppendLine("</thead>");
                    sb.AppendLine("<tbody>");
                    foreach (var Result in Results)
                    {


                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Result.Type.ToString() + "</td>");
                        sb.AppendLine("<td>" + Result.RiskRating.ToString() + "</td>");

                        sb.AppendLine("<td>" + Result.AreaOfObservation.ToString() + "</td>");
                        sb.AppendLine("<td><textarea  id='RiskManagement_PolicyRiskManagement_txtdetail" + Result.ID.ToString() + "' class='form-control' style='height:260px;width:260px;'>" + Result.Details.ToString() + "</textarea>");
                        sb.AppendLine("<td><select  onchange=\"priorityChange('"+Result.ID.ToString() +"')\" id='RiskManagement_PolicyRiskManagement_cmbPriority" + Result.ID.ToString() + "' ><option  value='1'  "+((Result.DeadlineID == 1) ? "selected" : "")+ ">Severe</option><option value='2' " + ((Result.DeadlineID == 2) ? "selected" : "") + ">High</option><option value='3' " + ((Result.DeadlineID == 3) ? "selected" : "") + ">Moderate </option><option value='4' " + ((Result.DeadlineID == 4) ? "selected" : "") + ">Low</option><option value='5' " + ((Result.DeadlineID == 5) ? "selected" : "") + ">None</option></select></td>");
                        sb.AppendLine("<td><span id='RiskManagement_PolicyRiskManagement_DeadLine"+Result.ID.ToString()+"'>" + Result.Deadline.ToString());
                        sb.AppendLine("</span></td>");
                        sb.AppendLine("<td><input type='text'  value='" + Result.DeadlineDate.ToString() + "' id='RiskManagement_PolicyRiskManagement_txtdate"+Result.ID.ToString()+"' class='form-control datepicker' style='height:26px;width:200px;'>");
                        
                        sb.AppendLine("</td>");



                        sb.AppendLine("<td>" + Result.Status.ToString());
                        sb.AppendLine("</td>");
                        sb.AppendLine("<td>");

                        if (Result.Status.ToString() == "Open")
                        {
                            sb.AppendLine("<button onclick='updateRequirementStatusDate(\"" + Result.ID.ToString() + "\",\"" + 1 + "\");return false;' class='btn btn-default' title='Open'><i class='fas fa-pencil-alt'></i>&nbsp;Update</button>&nbsp;<button onclick='updateRequirementStatusDate(\"" + Result.ID.ToString() + "\",\"" + 10 + "\");return false;' class='btn btn-danger' title='Open'><i class='fas fa-trash-alt'></i>&nbsp;Remove</button>&nbsp;<button style='margin:5px' onclick='uploadRiskDocument(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' class='btn btn-success' title='Open'><i class='fas fa-cloud-upload-alt'></i>&nbsp;Upload</button>&nbsp;<button style='margin:5px' onclick='commentRiskRequirement(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' class='btn btn-warning' title='Open'><i class='far fa-comment'></i>&nbsp;Comment</button>"); 
                        }
                        else if (Result.Status.ToString() == "Planned")
                        {
                            sb.AppendLine("<button onclick='updateRequirementStatusDate(\"" + Result.ID.ToString() + "\",\"" + 2 + "\");return false;' class='btn btn-default' title='Open'><i class='fas fa-pencil-alt'></i>&nbsp;Set Complete</button>&nbsp;<button onclick='updateRequirementStatusDate(\"" + Result.ID.ToString() + "\",\"" + 10 + "\");return false;' class='btn btn-danger' title='Open'><i class='fas fa-trash-alt'></i>&nbsp;Remove</button>&nbsp;<button style='margin:5px' onclick='uploadRiskDocument(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' class='btn btn-success' title='Open'><i class='fas fa-cloud-upload-alt'></i>&nbsp;Upload</button>&nbsp;<button style='margin:5px' onclick='commentRiskRequirement(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' class='btn btn-warning' title='Open'><i class='far fa-comment'></i>&nbsp;Comment</button>");
                        }
                        else if (Result.Status.ToString() == "Removed")
                        {
                            sb.AppendLine("<button onclick='updateRequirementStatusDate(\"" + Result.ID.ToString() + "\",\"" + 0 + "\");return false;' class='btn btn-default' title='Open'><i class='fas fa-plus'></i>&nbsp;Re-Apply</button>&nbsp;<button onclick='uploadRiskDocument(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' style='margin:5px' class='btn btn-success' title='Open'><i class='fas fa-cloud-upload-alt'></i>&nbsp;Upload</button>&nbsp;<button style='margin:5px' onclick='commentRiskRequirement(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' class='btn btn-warning' title='Open'><i class='far fa-comment'></i>&nbsp;Comment</button>");
                        }
                        else
                        {
                            sb.AppendLine("<button onclick='updateRequirementStatusDate(\"" + Result.ID.ToString() + "\",\"" +1 + "\");return false;' class='btn btn-default' title='Open'><i class='fas fa-pencil-alt'></i>&nbsp;Re-Open</button>&nbsp;<button onclick='uploadRiskDocument(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' style='margin:5px' class='btn btn-success' title='Open'><i class='fas fa-cloud-upload-alt'></i>&nbsp;Upload</button>&nbsp;<button style='margin:5px' onclick='commentRiskRequirement(\"" + Result.ID.ToString() + "\",\"" + Result.AreaOfObservation.ToString() + "\");return false;' class='btn btn-warning' title='Open'><i class='far fa-comment'></i>&nbsp;Comment</button>");
                        }

                           
           
                        sb.AppendLine("</td>");
                        sb.AppendLine("</tr>");
                    }


                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("</tbody>");
                    sb.AppendLine("</table>");
                    litRequirementsAndRecommendations.Text = sb.ToString();
                }
                else
                {
                    litRequirementsAndRecommendations.Text = " <table class='table table-striped' id='tblRequirementsAndRecommendations' style='zoom: 100% !important'> <thead> <tr> <th style='width: 350px'>Area of Observation</th> <th style='width: 350px'>Details of Requirements</th> <th style='width: 350px'>Priority</th> </tr> </thead> <tbody> <tr> <td colspan='3' style='text-align: center !important'><i class='fas fa-map-pin'></i>&nbsp;None associated...</td> </tr> </tbody> </table>";

                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnUpdateRequirementDeadlineDate_Click(object sender, EventArgs e)
        {
            //http://localhost:1375/dashboard?MODULE=RISKMANAGEMENT
            try
            {

                if (vStatusIDRequiremewnt.Value == "10")
                {
                    vRequirementDeadlineDate.Value = DateTime.Now.ToString();
                }

                DataModal.updAssessmentRiskTargetDateStatus(int.Parse(vRequirementID.Value), DateTime.Parse(vRequirementDeadlineDate.Value), int.Parse(vStatusIDRequiremewnt.Value), int.Parse(vPriorityID.Value),vRequirementDetail.Value.ToString());
                tblAssessmentRequirements_Populate();
            }
            catch {

                Cloud.MessageBox.Show("Please supply target date", "Invalid values", MessageBoxType.error);
            }

        }

        public class RiskClassificationSummaryItem
        {
            public int FactorID { get; set; }
            public DropDownList Risk { get; set; }
            public TextBox Comment { get; set; }
        }



        public void tblRiskClassificationSummaries_Populate()
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());

                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var Results = DataModal.getRiskClassificationSummaryRaw(AssessmentID).ToList();

                List<RiskClassificationSummaryItem> Items = new List<RiskClassificationSummaryItem>()
                {
                    new RiskClassificationSummaryItem { FactorID = 1, Risk = cmbRCS_Fire, Comment = txtRCS_Fire},
                    new RiskClassificationSummaryItem { FactorID = 2, Risk = cmbRCS_Smoke, Comment = txtRCS_Smoke},
                    new RiskClassificationSummaryItem { FactorID = 3, Risk = cmbRCS_Explosion, Comment = txtRCS_Explosion},
                    new RiskClassificationSummaryItem {FactorID = 4, Risk=cmbRCS_Lightning, Comment=txtRCS_Lightning},
                    new RiskClassificationSummaryItem {FactorID = 5, Risk=cmbRCS_Flood, Comment=txtRCS_Flood},
                    new RiskClassificationSummaryItem {FactorID = 6, Risk=cmbRCS_Storm, Comment=txtRCS_Storm},
                    new RiskClassificationSummaryItem {FactorID = 7, Risk=cmbRCS_Electric, Comment=txtRCS_Electric},
                    new RiskClassificationSummaryItem {FactorID = 8, Risk=cmbRCS_Goods, Comment=txtRCS_Goods},
                    new RiskClassificationSummaryItem {FactorID = 9, Risk=cmbRCS_FallingTrees, Comment=txtRCS_FallingTrees},
                    new RiskClassificationSummaryItem {FactorID = 10, Risk=cmbRCS_MaliciousDamage, Comment=txtRCS_MaliciousDamage},
                    new RiskClassificationSummaryItem {FactorID = 11, Risk=cmbRCS_Theft, Comment=txtRCS_Theft},
                    new RiskClassificationSummaryItem {FactorID = 12, Risk=cmbRCS_Dams, Comment=txtRCS_Dams},
                    new RiskClassificationSummaryItem {FactorID = 13, Risk=cmbRCS_Hazard, Comment=txtRCS_Hazard},
                    new RiskClassificationSummaryItem {FactorID = 14, Risk=cmbRCS_Fireload, Comment=txtRCS_FireLoad},
                    new RiskClassificationSummaryItem {FactorID = 15, Risk=cmbRCS_Structure, Comment=txtRCS_Structure}
                };



                foreach (var Item in Items)
                {
                    foreach (var Result in Results)
                    {
                        if (Result.AssessmentRiskFactorID == Item.FactorID)
                        {
                            Item.Risk.SelectedValue = Result.AssessmentRiskRatingID.ToString();
                            Item.Comment.Text = Result.Reason.ToString().Replace(",", "");
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void tblFinancialRisk_Populate()
        {
            int AssessmentID = int.Parse(vAssessmentID.Value.ToString());

            litFinancialRisk.Text = DataModal.getAssessmentFinancialRiskHTML(AssessmentID).ToList()[0].ToString();
        }


        public void btnUploadAttachmentsHidden_Click(object sender, EventArgs e)
        {
            try
            {
                lblAreaOfObservation.Text = vAreaOfObservation.Value + " (" + vAssessmnetRequiremntID.Value + ")";
                int AssessmentID = int.Parse(vAssessmnetRequiremntID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID"));
                litAttachmentsUploadFrame.Text = "<iframe src=\"upload/document/uploadassessmentrequirementdocuments?AssessmentRequirementID=" + AssessmentID.ToString() + "&UserID=" + UserID.ToString() + "\" width=\"100%\" height=\"450px\" style=\"border:none;overflow-x:hidden\"></iframe> ";
                Cloud.Modal("mdlPolicyRiskManagement").Close();
                Cloud.Modal("mdlAttachmentsUploadRiskManagement").Open();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        protected void btnFinishUpload_Click(object sender, EventArgs e)
        {
            try
            {
                btnInitialize_Click(sender, e);
                Cloud.Modal("mdlRiskManagementComment").Close();
                Cloud.Modal("mdlAttachmentsUploadRiskManagement").Close();
                Cloud.Modal("mdlPolicyRiskManagement").Open();
                Cloud.Modal("mdlPolicyRiskManagement").Open();
                Cloud.Modal("mdlPolicyRiskManagement").Open();
                Cloud.Modal("mdlPolicyRiskManagement").Open();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnRiskManagementCommentHidden_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Draw(txtComment).Normal();

                lblCommentTitle.Text = vAreaOfObservation.Value + " (" + vAssessmnetRequiremntID.Value + ")";
                int AssessmentID = int.Parse(vAssessmnetRequiremntID.Value);

                txtComment.Text = DataModal.getAssessmentRequirementComment(AssessmentID).ToList()[0];

                Cloud.Modal("mdlPolicyRiskManagement").Close();
                Cloud.Modal("mdlRiskManagementComment").Open();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnSaveComment_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtComment.Text.Length > 0)
                {
                    int AssessmentID = int.Parse(vAssessmnetRequiremntID.Value);

                    Cloud.Draw(txtComment).Normal();
                    DataModal.updAssessmentRequirementComment(AssessmentID, txtComment.Text);
                    Cloud.MessageBox.Show("Comment saved successfully", "Success", MessageBoxType.success);


                }
                else
                {
                    Cloud.MessageBox.Show("Please ensure you provided a valid comment", "Invalid details", MessageBoxType.error);
                    Cloud.Draw(txtComment).Highlight();
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}