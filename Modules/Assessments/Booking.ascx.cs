using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Assessments
{
    public partial class Booking : System.Web.UI.UserControl
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
            get { return "mdlAssessmentBooking"; }
        }

        public int BookingID
        {
            get { return vBookingID.Value.Length < 1 ? 0 : int.Parse(vBookingID.Value);  }
            set { vBookingID.Value = value.ToString(); }
        }
        public int AssessmentID
        {
            get { return vAssessmentID.Value.Length < 1 ? 0 : int.Parse(vAssessmentID.Value); }
            set { vAssessmentID.Value = vAssessmentID.ToString(); }
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
                Cloud.JS("AssessmentBookingControls.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnBooking_Initialize(object sender, EventArgs e)
        {
            try
            {
               // if (this.AssessmentID == 0) {Cloud.Modal(this.Modal).Close(); Cloud.MessageBox.Show("Assessment not yet saved, please save assessment before adding bookings.","Assessment",MessageBoxType.info); return;}


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
    }
}