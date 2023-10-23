using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Assessments
{
    public partial class Quote : System.Web.UI.UserControl
    {

        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();
        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {
                Initialize(); 
            }
            Declare();
        }

        public string Modal
        {
            get { return "mdlAssessmentQuote"; }
        }

        public void Initialize()
        {
            try
            {
                mdlQuote_Reset();
                Cloud.JS("AssessmentQuoteControls.Declare();");
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
                Cloud.JS("AssessmentQuoteControls.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnQuote_Initialize(object sender, EventArgs e)
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
                Cloud.Modal(this.Modal).Close();
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
                bool Valid = true;
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());

                List<TextBox> Fields = new List<TextBox>
                {
                    txtQuoteServiceDate, txtQuoteValue
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
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.", "Missing values?", MessageBoxType.error);return; }
                decimal Amount = decimal.Parse("0.00");
                try
                {
                     Amount = decimal.Parse(txtQuoteValue.Text.ToString());
                    Cloud.Draw(txtQuoteValue).Normal();
                }
                catch
                {
                    Cloud.Draw(txtQuoteValue).Highlight();
                    Cloud.MessageBox.Show("Invalid quote value.", "Invalid value?", MessageBoxType.error); return;
                }
                DateTime Date = DateTime.Now;
                try
                {
                    Date = DateTime.Parse(txtQuoteServiceDate.Text.ToString());
                    Cloud.Draw(txtQuoteServiceDate).Normal();
                }
                catch
                {
                    Cloud.Draw(txtQuoteServiceDate).Highlight();
                    Cloud.MessageBox.Show("Invalid date value.", "Invalid value?", MessageBoxType.error); return;
                }

                DataModal.addAssessmentQuote(AssessmentID, UserID, Amount, Date, txtNote.Text.ToString(),CompanyID);

                Cloud.Modal(this.Modal).Close();
                Cloud.MessageBox.Show("Quote added successfully", "Success", MessageBoxType.success);
                Cloud.JS("setTimeout(()=>{" +
                    "$('#Assessment_btnAssessmentQuotesRefresh').click();" +
                    "},250);");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void mdlQuote_Reset()
        {
            try
            {
                Cloud.Draw(txtQuoteServiceDate).Normal();
                Cloud.Draw(txtQuoteValue).Normal();
                Cloud.Draw(txtNote).Normal();
                txtNote.Text = "";
                txtQuoteServiceDate.Text = "";
                txtQuoteValue.Text = "";
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}