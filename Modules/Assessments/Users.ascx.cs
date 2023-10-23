using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Assessments
{
    public partial class Users : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {
                //Initialize();
            }
            Declare();
        }

        public void Initialize()
        {
            try
            {
                mdlAssessmentUsers_Reset();
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
                Cloud.JS("AssessmentUserControl.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void mdlAssessmentUsers_Reset()
        {
            try
            {
                List<TextBox> Fields = new List<TextBox>()
                {
                    txtCellphone, txtEmail, txtFirstName, txtLastName, txtUserType
                };

                foreach (TextBox Field in Fields)
                {
                    Field.Text = "";
                }

                cmbUsers_Populate();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbUsers_Populate()
        {
            try
            {
                cmbUsers.Items.Clear();
                int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                var Results = DataModal.getAssesmentUsersForAssociation(CompanyID).ToList();
                foreach (getAssesmentUsersForAssociation_Result Result in Results)
                {
                    cmbUsers.Items.Add(new ListItem
                    {
                        Value = Result.ID.ToString(),
                        Text = Result.Name.ToString()
                    });
                }


                cmbUsers.DataBind();

                int UserID = int.Parse(cmbUsers.SelectedValue.ToString());
                setSelectedUser(UserID);
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
                mdlAssessmentUsers_Reset();
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
                Cloud.Modal("mdlAssessmentUsers").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnAssign_Click(object sender, EventArgs e)
        {
            try
            {
                int ActionUserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int UserID = int.Parse(vUserID.Value.ToString());
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                var Response = DataModal.updAssignUserAssessment(AssessmentID, UserID, ActionUserID).ToList()[0];
                if (Response.Code == 200)
                {
                    Cloud.MessageBox.Show(txtFirstName.Text.ToString() + " " + txtLastName.Text.ToString() + "  assigned to assessment.", "Assigned successfully", MessageBoxType.success);
                    Cloud.Modal("mdlAssessmentUsers").Close();
                    Cloud.JS("AssessmentControls.Functions.RefreshAssessmentUsers();");
                }
                else
                {
                    Cloud.MessageBox.Show(txtFirstName.Text.ToString() + " " + txtLastName.Text.ToString() + " already assigned to assessment.", "Unable to assign", MessageBoxType.info);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbUsers_Changed(object sender, EventArgs e)
        {
            try
            {
                int UserID = 0;
                try
                {
                     UserID = int.Parse(cmbUsers.SelectedValue.ToString());
                }
                catch { }

                if (UserID != 0)
                {
                    setSelectedUser(UserID);
                }
                else
                {
                    Cloud.Modal("mdlAssessmentUsers").Close();
                    Cloud.MessageBox.Show("No valid users found...", "Nobody to associate!", MessageBoxType.info);
                    return;
                }
                
            }
            catch(Exception ex )
            {
                Cloud.Exception(ex);    
            }
        }

        public void setSelectedUser(int UserID)
        {
            try
            {

                if (UserID != 0)
                {
                    var User = DataModal.getAssignUserSelectedDetails(UserID).ToList()[0];
                    vUserID.Value = cmbUsers.SelectedValue.ToString();
                    txtFirstName.Text = User.FirstName.ToString();
                    txtLastName.Text = User.LastName.ToString();
                    txtCellphone.Text = User.Cellphone.ToString();
                    txtEmail.Text = User.Email.ToString();
                    txtUserType.Text = User.UserType.ToString();
                }
                else
                {
                    Cloud.Modal("mdlAssessmentUsers").Close();
                    Cloud.MessageBox.Show("No valid users found...", "Nobody to associate!", MessageBoxType.info);
                    Cloud.JS("AssessmentControls.Functions.RefreshAssessmentUsers();");
                    return;
                }
              
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}