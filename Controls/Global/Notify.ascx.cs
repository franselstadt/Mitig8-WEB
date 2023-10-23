using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Controls.Global
{
    public partial class Notify : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        public string Modal
        {
            get { return "mdlNotify"; }
        }

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
                List<TextBox> Fields = new List<TextBox>()
                {
                    txtTitle, txtMessage
                };
                foreach (TextBox Field in Fields)
                { 
                    Cloud.Draw(Field).Normal();
                    Field.Text = "";
                }
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

        public void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                int FromUserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int ToUserID = int.Parse(vUserID.Value.ToString());
                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
                    txtTitle, txtMessage
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
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.","Missing values",MessageBoxType.warning);return; }
                DataModal.Notify(FromUserID,ToUserID, txtTitle.Text.ToString(),txtMessage.Text.ToString());
                Cloud.Modal(this.Modal.ToString()).Close();
                Cloud.MessageBox.Show("Notification delivered to user successfully.","Sent!",MessageBoxType.success);
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

    }
}