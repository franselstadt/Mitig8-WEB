using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Mitig8.Modules.Profile
{
    public partial class user : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

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
                int UserID = int.Parse(vUserID.Value.ToString());
                setUserProfileDetails(UserID);
                mdlAssessmentHistoryDates_Initialize();
                mdlLocationHistoryDate_Initialize();
                setAssessmentHistory(UserID);
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
                Cloud.JS("UserProfileControls.Declare();");
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
                Initialize();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void mdlLocationHistoryDate_Initialize()
        {
            try
            {
                txtLocationHistoryDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void mdlAssessmentHistoryDates_Initialize()
        {
            try
            {
                txtAssessmentHistoryDateFrom.Text = DateTime.Now.AddDays(-7).ToString("yyyy/MM/dd");
                txtAssessmentHistoryDateTo.Text = DateTime.Now.ToString("yyyy/MM/dd");
                Cloud.JS("UserProfileControls.Declare();");

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void setAssessmentHistory(int UserID)
        {
            try
            {
                DateTime DateFrom = DateTime.Parse(txtAssessmentHistoryDateFrom.Text.ToString());
                DateTime DateTo = DateTime.Parse(txtAssessmentHistoryDateTo.Text.ToString());

                StringBuilder sb = new StringBuilder();

                var Response = DataModal.getUserProfileAssessmentHistory(DateFrom,DateTo,UserID).ToList();



                btnAssessmentHistoryDates.Text = "From "+ DateFrom.ToString("yyyy-MM-dd") + " To " + DateTo.ToString("yyyy-MM-dd");


                sb.AppendLine("<table class='table table-striped'>");
                sb.AppendLine("<thead>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<th style='width:20px'>ID</th>");
                sb.AppendLine("<th>Policy Number</th>");
                sb.AppendLine("<th>Insured</th>");
                sb.AppendLine("<th>Insurer</th>");
                sb.AppendLine("<th>Status</th>");
                sb.AppendLine("<th>Date</th>");
                sb.AppendLine("<th>Options</th>");
                sb.AppendLine("</tr>");
                sb.AppendLine("</thead>");
                sb.AppendLine("<tbody>");


                if (Response.Count() > 0)
                {
                    foreach (var Row in Response)
                    {
                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>"+Row.AssessmentID.ToString()+"</td>");
                        sb.AppendLine("<td>" + Row.PolicyNumber.ToString() +"</td>");
                        sb.AppendLine("<td>"+Row.Insured.ToString()+"</td>");
                        sb.AppendLine("<td>"+Row.Insurer.ToString()+"</td>");
                        sb.AppendLine("<td>"+Row.Status.ToString()+"</td>");
                        sb.AppendLine("<td>"+Row.Date.ToString()+"</td>");
                        sb.AppendLine("<th>");
                        sb.AppendLine("<button onclick='AssessmentControls.Initialze(\""+ Row.AssessmentID.ToString() + "\");' class='btn btn-warning' title='View'><i class='fas fa-eye'></i>&nbsp;Open</button>");
                        sb.AppendLine("</th>");
                        sb.AppendLine("</tr>");
                    }
                }
                else
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine(" <td colspan='7' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No assessments associated in period.</td>");
                    sb.AppendLine("</tr>");
                }

                sb.AppendLine("  </tbody>");
                sb.AppendLine("</ table>");
                litUserProfileAssessmentHistory.Text = sb.ToString();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnLocationHistoryDate_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlLocationHistoryDate").Open();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnAssessmentHistoryDates_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlAssessmentHistoryDates").Open();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setUserProfileDetails(int UserID)
        {
            try
            {
                var User = DataModal.getUserProfileDetails(UserID).ToList()[0];
                txtFirstName.Text = User.FirstName.ToString();
                txtLastName.Text = User.LastName.ToString();
                txtCellphone.Text = User.Cellphone.ToString();
                txtEmail.Text = User.Email.ToString();
                txtCompany.Text = User.Company.ToString();
                lblUserProfileFullName.Text = User.FirstName.ToString() + "'s Profile"; 
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
                int UserID = int.Parse(vUserID.Value.ToString());
                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
                    txtFirstName, txtLastName, txtEmail, txtCellphone
                };
                foreach (TextBox Field in Fields)
                {
                    if (Field.Text.Length == 0)
                    {
                        Cloud.Draw(Field).Highlight();
                        Valid = false;
                    }
                    else
                    {
                        Cloud.Draw(Field).Normal();
                    }
                }

                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values", "Missing values?", MessageBoxType.question); }

                DataModal.updUserProfileDetails(UserID, "NA", txtFirstName.Text.ToString(), txtLastName.Text.ToString(), txtCellphone.Text.ToString(), txtEmail.Text.ToString());

                Cloud.MessageBox.Show("Your profile was updated successfully.","Success",MessageBoxType.success);
            }
            catch(Exception ex)
            {
                Cloud.Exception(ex);    
            }
        }

        public void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            try
            {
                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
                    txtConfirmNewPassword, txtCurrentPassword, txtNewPassword
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
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.","Missing values?",MessageBoxType.question); return; }
  
                if (txtNewPassword.Text == txtConfirmNewPassword.Text)
                {
                    if (txtNewPassword.Text.Length < 8)
                    {
                        Cloud.MessageBox.Show("Please ensure new password contains a minimum of 8 chars!", "Too short...", MessageBoxType.error);
                    }
                    else
                    {
                        int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                        var Response = DataModal.updUserProfilePassword(txtCurrentPassword.Text,txtNewPassword.Text, UserID).ToList()[0];
                        if (Response.Status == 200)
                        {
                            Cloud.MessageBox.Show(Response.Message, Response.Title, MessageBoxType.success);

                        }
                        else
                        {
                            Cloud.MessageBox.Show(Response.Message, Response.Title, MessageBoxType.warning);
                        }
                    }
                }
                else
                {
                    Cloud.MessageBox.Show("Please ensure new password match!","Not matching...",MessageBoxType.error);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnUpdatePin_Click(object sender, EventArgs e)
        {
            try
            {
                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
                    txtConfirmNewPin, txtCurrentPin, txtNewPin
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
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.", "Missing values?", MessageBoxType.question);return; }

                if (txtNewPin.Text == txtConfirmNewPin.Text)
                {
                    if (txtNewPin.Text.Length < 4)
                    {
                        Cloud.MessageBox.Show("Please ensure new pin contains a minimum of 4 chars!", "Too short...", MessageBoxType.error);
                    }
                    else
                    {
                        int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                        var Response = DataModal.updUserProfilePin(int.Parse(txtCurrentPin.Text), int.Parse(txtNewPin.Text), UserID).ToList()[0];
                        if (Response.Status == 200)
                        {
                            Cloud.MessageBox.Show(Response.Message, Response.Title, MessageBoxType.success);

                        }
                        else
                        {
                            Cloud.MessageBox.Show(Response.Message, Response.Title, MessageBoxType.warning);
                        }
                    }
                }
                else
                {
                    Cloud.MessageBox.Show("Please ensure new pin match!", "Not matching...", MessageBoxType.error);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnCloseAssessmentHistoryDateRange_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlAssessmentHistoryDates").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnSetAssessmentHistoryDateRange_Click(object sender, EventArgs e)
        {
            try
            {
                int UserID = int.Parse(vUserID.Value.ToString());
           
                setAssessmentHistory(UserID);

                Cloud.Modal("mdlAssessmentHistoryDates").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

    }
}