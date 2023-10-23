using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

namespace Mitig8.Modules.Assessments
{
    public partial class Assessment : System.Web.UI.UserControl
    {
        DataModal DataModal = new DataModal();
        Cloud Cloud = new Cloud();
        public void TabState(AssessmentTabControl TabControl)
        {
            try
            {
                string command = "console.log('execute tabstate');";
                foreach (AssessmentTab Tab in TabControl.AssessmentTabs)
                {
                    command += "$('#" + Tab.TabButton + "')" + ((Tab.State == 0) ? ".show();" : ".hide();") +
                         ((Tab.Active) ? "$('#" + Tab.TabButton + "').tab('show');" : ""); 
                }
                Cloud.JS(command);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public class AssessmentTab
        {
            public string TabButton { get; set; }
            public string TabPanel { get; set; }
            public AssessmentTabState State { get; set; }
            public bool Active { get; set; }
        }

        public class AssessmentTabControl
        {
            public string ID { get; set; }
            public IList<AssessmentTab> AssessmentTabs { get; set; }
        }


        public enum AssessmentTabState
        {
            Visible,
            Hidden
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {

            }
            Declare();
        }

        public void Initialize(object sender, EventArgs e)
        {
            try
            {
                vUserID.Value = Cloud.GetCookie("UserID").ToString();
            }
            catch { }

            if (vAssessmentID.Value.Length < 1)
            {
                return;
            }

            try
            {
                cmbIndustrySector_Populate();
                cmbIndustrySubSector_Populate();
                cmbIndustryType_Populate();
                int? AssessmentStatusID = 0;
                cmbCategory_Populate();
                Cloud.JS("AssessmentControls.Declare();");
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                if (AssessmentID != 0)
                {
                    lblAssessment.Text = "Assessment: " + AssessmentID.ToString();
                    setAssessmentGeneralInformation(AssessmentID, sender, e);
                    setAssessmentUsers(AssessmentID);
                    btnAssesssmentAttachments_Populate();
                    getAssessmentReferences();

                    try
                    {
                        AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];
                    }
                    catch
                    {
                        AssessmentStatusID = 0;
                    }
                    btnAssessmentReviewInitialize_Click(sender, e);

                    setAssessmentBooking();
                }
                else
                {
                    try
                    {
                        //var AutoCompleteResponse = DataModal.getAssessmentAutocompleteInfo(int.Parse(vUserID.Value)).ToList()[0];
                        //txtInsurerName.Text = AutoCompleteResponse.InsurerName.ToString();
                        //txtInsurerContactNumber.Text = AutoCompleteResponse.InsurerContactNumber.ToString();
                        //txtInsurerContactPerson.Text = AutoCompleteResponse.InsurerContactPerson.ToString();
                        //txtBrokerName.Text = AutoCompleteResponse.BrokerName.ToString();
                        //txtBrokerContactNumber.Text = AutoCompleteResponse.BrokerContactNumber.ToString();
                        //txtInsurerEmailAddress.Text = AutoCompleteResponse.InsurerEmailAddress.ToString();
                        //txtBrokerEmailAddress.Text = AutoCompleteResponse.BrokerEmailAddress.ToString();
                    }
                    catch 
                    { 
                    
                    }
                    lblAssessment.Text = "New Assessment";
                }

                setAssessmentQuotes(AssessmentID);
                setAssessmentRiskAddresses(AssessmentID);
                setAssessmentPolicyDetails(AssessmentID);
                setAssessmentTracks(AssessmentID);
                setAssessmentSurveys(AssessmentID);
                int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                setPictureGallary();
                setSpecialRequests(AssessmentID);
                switch (UserTypeID)
                {

                    case 4: //Specialist
                        btnSaveSpecialRequests.Visible = false;
                        btnFinalizeQA.Visible = true;
                        setAssessmentPolicyReadOnly(AssessmentID);
                        btnSendForSpecialistReview.Visible = false;
                        btnCancelAssessment.Visible = false;
                        btnCloseAutoCapture.Visible = false;

                        btnUploadPolicyDocument.Visible = false;
                        btnRequestQuote.Visible = false;
                        {
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabReview", TabPanel="tabReview"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnOtherReferences", TabPanel="tabOtherReferences"}



                            }
                            };
                            TabState(AssessmentTabControl);
                        }

                        break;


                    case 3://Clerk
                        btnSaveSpecialRequests.Visible = true;
                        btnUpdateOtherReferences.Visible = true;
                        btnFinalizeQA.Visible = false;
                        btnSendForSpecialistReview.Visible = false;
                        btnCancelAssessment.Visible = false;
                        btnCloseAutoCapture.Visible = false;
                        {
                            btnUploadPolicyDocument.Visible = false;
                            btnRequestQuote.Visible = true;
                            {
                                AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                                {
                                    ID = "AssessmentTabControl",
                                    AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnOtherReferences", TabPanel="tabOtherReferences"}


                            }
                                };
                                TabState(AssessmentTabControl);
                            }
                        }


                        break;

                    case 2: //Insurer or Broker
                    case 6:
                        btnSaveSpecialRequests.Visible = true;
                        btnUpdateOtherReferences.Visible = true;
                        btnFinalizeQA.Visible = false;
                        btnSendForSpecialistReview.Visible = false;
                        if (AssessmentID == 0 || AssessmentStatusID == 0 || AssessmentStatusID == 1)
                        {

                            if (AssessmentID == 0 || AssessmentStatusID == 0)
                            {
                                btnUploadPolicyDocument.Visible = true;
                                btnRequestQuote.Visible = false;

                            }
                            else
                            {
                                btnUploadPolicyDocument.Visible = false;
                                btnRequestQuote.Visible = true;



                            }


                            if ((AssessmentID != 0 && AssessmentStatusID == 0) || (AssessmentID != 0 && AssessmentStatusID == 1) || (AssessmentID != 0 && AssessmentStatusID == 7))
                            {
                                btnCancelAssessment.Visible = true;

                                if (AssessmentStatusID == 0 || AssessmentStatusID == 1)
                                {
                                    btnCancelAssessment.Text = "Delete Assessment";
                                    lblCancelAssessment.Text = "Delete Assessment";
                                }
                                else
                                {
                                    btnCancelAssessment.Text = "Cancel Assessment";
                                    lblCancelAssessment.Text = "Cancel Assessment";
                                }
                            }
                            else
                            {
                                btnCancelAssessment.Visible = false;
                                btnUpdateOtherReferences.Visible = false;

                            }

                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnOtherReferences", TabPanel="tabOtherReferences"}


                            }
                            };
                            TabState(AssessmentTabControl);

                        }
                        else if (AssessmentStatusID == 5) //Cancelled
                        {
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnOtherReferences", TabPanel="tabOtherReferences"}

                            }
                            };
                            TabState(AssessmentTabControl);
                        }
                        else if (AssessmentStatusID == 4)
                        {
                            setAssessmentPolicyReadOnly(AssessmentID);

                            btnCancelAssessment.Visible = false;
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnOtherReferences", TabPanel="tabOtherReferences"}

                            }
                            };
                            TabState(AssessmentTabControl);
                            Cloud.JS("$('#btnAddQuote').hide();");
                        }

                        else
                        {
                            btnCancelAssessment.Visible = false;
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                 new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                                                                                                                            new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                                                                                                                                                            new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnOtherReferences", TabPanel="tabOtherReferences"}



                            }
                            };
                            TabState(AssessmentTabControl);
                            Cloud.JS("$('#btnAddQuote').hide();");
                        }
                        break;
                    case 5: //Assessor
                        btnSaveSpecialRequests.Visible = false;

                        btnFinalizeQA.Visible = false;
                        btnSendForSpecialistReview.Visible = false;
                        if (AssessmentID == 0)
                        {
                            Cloud.JS(" $(document).ready(function(){ let timerIntervalUnauthorized; Swal.fire({ title: 'Unauthorized',icon:'error', html: 'You will be redirected in <b></b> milliseconds.', timer: 5000,allowOutsideClick:false, timerProgressBar: true, onBeforeOpen: () => { Swal.showLoading(); timerIntervalUnauthorized = setInterval(() => { Swal.getContent().querySelector('b').textContent = Swal.getTimerLeft(); }, 100); }, onClose: () => { clearInterval(timerIntervalUnauthorized); window.location = '/dashboard'; } }).then((result) => { if (result.dismiss === Swal.DismissReason.timer) { console.log('I was closed by the timer'); } }); });");
                        }
                        else if (AssessmentStatusID == 7)
                        {

                            setAssessmentPolicyReadOnly(AssessmentID);
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},

                                                                                                        new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"}




                            }
                            };
                            TabState(AssessmentTabControl);

                            Cloud.JS("$('#btnAddQuote').show();");
                        }
                        else if (AssessmentStatusID == 5)
                        {
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                               new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                     new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                                                                                             new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"}


                            }
                            };
                            TabState(AssessmentTabControl);
                        }
                        else if (AssessmentStatusID == 3)
                        {
                            btnSendForSpecialistReview.Visible = true;
                            setAssessmentPolicyReadOnly(AssessmentID);
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                      new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                                                                                              new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"}





                            }
                            };
                            TabState(AssessmentTabControl);

                            Cloud.JS("$('#btnAddQuote').hide();");
                        }
                        else if (AssessmentStatusID == 8)
                        {
                            setAssessmentPolicyReadOnly(AssessmentID);
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                         new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabReview", TabPanel="tabReview"},

                                                                                                                                                       new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"}



                            }
                            };
                            TabState(AssessmentTabControl);

                            Cloud.JS("$('#btnAddQuote').hide();");

                        }
                        else if (AssessmentStatusID == 4)
                        {
                            setAssessmentPolicyReadOnly(AssessmentID);
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                         new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabReview", TabPanel="tabReview"},
                                                                                                                                                       new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"}




                            }
                            };
                            TabState(AssessmentTabControl);

                            Cloud.JS("$('#btnAddQuote').hide();");

                        }

                        else
                        {
                            setAssessmentPolicyReadOnly(AssessmentID);
                            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                            {
                                ID = "AssessmentTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabReview", TabPanel="tabReview"},
                                                                                                                                              new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"}





                            }
                            };
                            TabState(AssessmentTabControl);

                            Cloud.JS("$('#btnAddQuote').hide();");
                        }
                        break;
                }

                if (btnCancelAssessment.Visible == true)
                {
                    btnUploadPolicyDocument.Style.Add("right", "195px !important");
                }
                else
                {
                    btnUploadPolicyDocument.Style.Add("right", "20px !important");
                }

                Declare();
            }
            catch (Exception ex)
            {
                //Cloud.Exception(ex);
            }
        }

        public void Declare()
        {
            try
            {
                if (vAssessmentID.Value.Length > 0)
                {
                    int? AutoCapture = 0;
                    int AssessmentID = int.Parse(vAssessmentID.Value);
                    try
                    {
                        AutoCapture = DataModal.chkAutoCapture(AssessmentID).ToList()[0];
                    }
                    catch
                    {
                        AutoCapture = 0;
                    }

                    int? AssessmentStatusID = 0;
                    try
                    {
                        AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];
                    }
                    catch
                    {
                        AssessmentStatusID = 0;
                    }

                    string Script = "AssessmentControls.Declare();";

                    int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                    if (UserTypeID == 3)
                    {
                        Script += "$('#btnManageAutoCapture').show();";
                        Script += "$('#btnAddRiskAddressJS').show();";
                        Script += "$('#btnSaveClientDetailsJS').show();";
                        Script += "$('#SavePolicyDetailsJS').show();";
                    }
                    else if (UserTypeID == 5)
                    {
                        Script += "$('#btnAddQuote').show();";
                    }
                    else if (UserTypeID == 2 || UserTypeID == 6)
                    {
                        try
                        {
                            if (AutoCapture == 0)
                            {

                                if (AssessmentStatusID < 2)
                                {
                                    btnCancelAssessment.Visible = true;

                                    if (AssessmentStatusID == 0 || AssessmentStatusID == 1)
                                    {
                                        btnCancelAssessment.Text = "Delete Assessment";
                                        lblCancelAssessment.Text = "Delete Assessment";
                                    }
                                    else
                                    {
                                        btnCancelAssessment.Text = "Cancel Assessment";
                                        lblCancelAssessment.Text = "Cancel Assessment";
                                    }
                                }

                                Script += "$('#btnManageAutoCapture').hide();";
                                Script += "$('#btnAddRiskAddressJS').show();";
                                Script += "$('#btnSaveClientDetailsJS').show();";
                                Script += "$('#SavePolicyDetailsJS').show();";

                            }
                            else
                            {
                                btnCloseAutoCapture.Visible = true;
                                Script += "$('#btnManageAutoCapture').show();";
                                Script += "$('#btnAddRiskAddressJS').show();";
                                Script += "$('#btnSaveClientDetailsJS').show();";
                                Script += "$('#SavePolicyDetailsJS').show();";
                            }
                        }
                        catch
                        {
                            Script += "$('#btnManageAutoCapture').hide();";
                        }

                        try
                        {
                            if (AssessmentStatusID > 1 || AssessmentStatusID == 7)
                            {
                                btnCancelAssessment.Visible = true;

                                Script += "$('#btnAddRiskAddressJS').show();";
                                Script += "$('#btnSaveClientDetailsJS').show();";
                                Script += "$('#SavePolicyDetailsJS').show();";
                            }
                            else if (AssessmentStatusID < 2 && AutoCapture == 0 || AssessmentStatusID == 7 && AutoCapture == 0)
                            {
                                btnCancelAssessment.Visible = true;
                                Script += "$('#btnAddRiskAddressJS').show();";
                                Script += "$('#btnSaveClientDetailsJS').show();";
                                Script += "$('#SavePolicyDetailsJS').show();";

                                if (AssessmentStatusID == 0 || AssessmentStatusID == 1)
                                {
                                    btnCancelAssessment.Text = "Delete Assessment";
                                    lblCancelAssessment.Text = "Delete Assessment";
                                }
                                else
                                {
                                    btnCancelAssessment.Text = "Cancel Assessment";
                                    lblCancelAssessment.Text = "Cancel Assessment";
                                }
                            }
                            else if (AssessmentStatusID > 1)
                            {
                                btnCancelAssessment.Visible = false;

                            }
                        }
                        catch
                        {
                            Script += "$('#btnAddRiskAddressJS').show();";
                            Script += "$('#btnSaveClientDetailsJS').show();";
                            Script += "$('#SavePolicyDetailsJS').show();";
                        }


                        Script += "$('#btnAddQuote').hide();";
                    }
                    Cloud.JS("setTimeout(()=>{" + Script + "},5);");
                }
                try
                {
                    int AssessmentID = string.IsNullOrEmpty(vAssessmentID.Value.ToString()) ? 0 : int.Parse(vAssessmentID.Value.ToString());

                    int? AssessmentStatusID = 0;
                    try
                    {
                        if (AssessmentID != 0)
                        {
                            AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];
                        }
                    }
                    catch
                    {
                        AssessmentStatusID = 0;
                    }

                    if (AssessmentID == 0 || AssessmentStatusID == 3)
                    {
                        string Script = "";
                        Script += "$('#btnAddRiskAddressJS').show();";
                        Script += "$('#btnSaveClientDetailsJS').show();";
                        Script += "$('#SavePolicyDetailsJS').show();";
                        btnCancelAssessment.Visible = false;
                        Cloud.JS("setTimeout(()=>{" + Script + "},5);");

                    }


                    if (AssessmentStatusID != 1 && AssessmentStatusID != 7)
                    { 
                    btnCancelAssessment.Visible = false;
                    }

                }
                catch { }
                if (btnCancelAssessment.Visible == true)
                {
                    btnUploadPolicyDocument.Style.Add("right", "195px !important");
                }
                else {
                    btnUploadPolicyDocument.Style.Add("right", "20px !important");
                }



            }
            catch (Exception ex)
            {
                //  Cloud.Exception(ex);
            }
        }

        public void btnInitialize_Click(object sender, EventArgs e)
        {

            Assessment_Clear();
            Initialize(sender, e);
            btnRiskManagemensInitialize_Click(sender, e);

        }

        public void cmbCategory_Populate()
        {
            cmbCategory.DataSource = DataModal.getAssessmentCategories();
            cmbCategory.DataValueField = "ID";
            cmbCategory.DataTextField = "Description";
            cmbCategory.DataBind();
            int CategoryID = int.Parse(cmbCategory.SelectedValue.ToString());
            cmbSubCategory_Populate(CategoryID);
        }

        public void cmbSubCategory_Populate(int CategoryID)
        {
            cmbSubcategory.DataSource = DataModal.getAssessmentSubCategories(CategoryID);
            cmbSubcategory.DataValueField = "ID";
            cmbSubcategory.DataTextField = "Description";
            cmbSubcategory.DataBind();
            int SubCategoryID = int.Parse(cmbSubcategory.SelectedValue.ToString());
            cmbType_Populate(SubCategoryID);
        }

        public void cmbCategory_Change(object sender, EventArgs e)
        {
            int CategoryID = int.Parse(cmbCategory.SelectedValue.ToString());
            cmbSubCategory_Populate(CategoryID);
        }

        public void cmbSubCategory_Change(object sender, EventArgs e)
        {
            int SubCategoryID = int.Parse(cmbSubcategory.SelectedValue.ToString());
            cmbType_Populate(SubCategoryID);
        }

        public void cmbType_Populate(int SubCategoryID)
        {
            cmbType.DataSource = DataModal.getAssessmentAssessmentTypes(SubCategoryID);
            cmbType.DataValueField = "ID";
            cmbType.DataTextField = "Description";
            cmbType.DataBind();
        }



        public void btnReferences_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlAssessmentReferences").Open();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnCloseAssessmentReferences_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlAssessmentReferences").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnSaveClientDetails_Click(object sender, EventArgs e)
        {
            try
            {


                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
                   txtInsurerName, txtInsurerContactPerson, txtInsurerContactNumber, txtInsurancePolicyNumber, txtBrokerName, txtBrokerContactNumber, txtInsuredName, txtInsuredContactNumber, txtInsuredIndustrySector, txtBrokerEmailAddress, txtInsuredEmailAddress, txtInsurerEmailAddress
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
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.", "Missing values?", MessageBoxType.question); return; }

                int? AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                if (AssessmentID != 0)
                {
                    DataModal.updAssessmentGeneralInformation(AssessmentID, txtInsurerName.Text, txtInsurerContactPerson.Text, txtInsurerContactNumber.Text, txtInsurancePolicyNumber.Text, txtBrokerName.Text, txtBrokerContactNumber.Text, txtInsuredName.Text, txtInsuredContactNumber.Text, txtInsuredIndustrySector.Text, int.Parse(Cloud.GetCookie("UserID").ToString()), DateTime.Now, txtInsuredEmailAddress.Text, txtInsurerEmailAddress.Text, txtBrokerEmailAddress.Text, int.Parse(cmbIndustrySector.SelectedValue), int.Parse(cmbIndustrySubSector.SelectedValue), int.Parse(cmbIndustryType.SelectedValue), int.Parse(cmbDelegate.SelectedValue));
                    Cloud.MessageBox.Show("Assessment with ID: " + AssessmentID.ToString() + " updated successfully.", "Assessment Saved", MessageBoxType.success);
                    btnUploadPolicyDocument.Visible = false;
                    btnRequestQuote.Visible = true;
                }
                else
                {

                    AssessmentID = DataModal.addAssessment(txtInsurerName.Text.ToString(), txtInsurerContactPerson.Text.ToString(), txtInsurerContactNumber.Text.ToString(), txtInsurancePolicyNumber.Text.ToString(), txtBrokerName.Text.ToString(), txtBrokerContactNumber.Text.ToString(), txtInsuredName.Text.ToString(), txtInsuredContactNumber.Text.ToString(), txtInsuredIndustrySector.Text.ToString(), int.Parse(Cloud.GetCookie("UserID").ToString()), DateTime.Now, 1, txtInsuredEmailAddress.Text, txtInsurerEmailAddress.Text, txtBrokerEmailAddress.Text, int.Parse(cmbExistingPolicy.SelectedValue), int.Parse(cmbIndustrySector.SelectedValue), int.Parse(cmbIndustrySubSector.SelectedValue), int.Parse(cmbIndustryType.SelectedValue), int.Parse(cmbDelegate.SelectedValue)).ToList()[0].AssessmentID;
                    lblAssessment.Text = "Assessment: " + AssessmentID.ToString();
                    Cloud.JS("AssessmentControls.Initialze('" + AssessmentID.ToString() + "');");
                    Cloud.MessageBox.Show("Assessment with ID: " + AssessmentID.ToString() + " created successfully.", "Assessment Saved", MessageBoxType.success);
                    btnRequestQuote.Visible = true;
                    btnUploadPolicyDocument.Visible = false;
                    btnRequestQuote.Visible = true;
                    btnUploadPolicyDocument.Visible = false;
                }

                try
                {
                 //   btnUpdateOtherReferences_Click(sender, e);
                }
                catch { }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void Assessment_Clear()
        {
            List<TextBox> Fields = new List<TextBox>()
            {
                txtInsurerName, txtInsurerContactPerson, txtInsurerContactNumber, txtInsurancePolicyNumber, txtBrokerName, txtBrokerContactNumber, txtInsuredName, txtInsuredContactNumber, txtInsuredIndustrySector,txtBrokerEmailAddress, txtInsuredEmailAddress, txtInsurerEmailAddress
            };
            foreach (TextBox Field in Fields)
            {
                Field.Text = "";
                Cloud.Draw(Field).Normal();
            }
        }

        public void setAssessmentGeneralInformation(int AssessmentID, object sender, EventArgs e)
        {
            try
            {
                var Result = DataModal.getAssessmentGeneralInformation(AssessmentID).ToList()[0];
                txtInsurerName.Text = Result.InsurerName;
                txtInsurerContactPerson.Text = Result.InsurerContactPerson;
                txtInsurerContactNumber.Text = Result.InsurerContactNumber;
                txtInsurancePolicyNumber.Text = Result.InsurerPolicyNumber;
                txtBrokerName.Text = Result.BrokerName;
                txtBrokerContactNumber.Text = Result.BrokerContactNumber;
                txtInsuredName.Text = Result.InsuredName;
                txtInsuredContactNumber.Text = Result.InsuredContactNumber;
                txtInsuredIndustrySector.Text = Result.InsuredIndustrySector;
                txtInsurerEmailAddress.Text = Result.InsurerEmailAddress;
                txtInsuredEmailAddress.Text = Result.InsuredEmailAddress;
                txtBrokerEmailAddress.Text = Result.BrokerEmailAddress;
                try
                {
                    cmbDelegate.SelectedValue = Result.IsInternal.ToString();
                }
                catch 
                { 
                
                }

                try
                {
                    txtEMLComments.Text = Result.EMLComment.ToString();
                }
                catch { }

                try
                {
                    txtMPLComment.Text = Result.MPLComment.ToString();
                }
                catch { }

                try
                {
                    cmbExistingPolicy.SelectedValue = Result.NewPolicy.ToString();
                }
                catch { }
                try
                {
                    cmbIndustrySector.SelectedValue = Result.IndustrySectorID.ToString();
                    cmbIndustrySector_Change(sender, e);

                    cmbIndustrySubSector.SelectedValue = Result.IndustrySubSectorID.ToString();
                    cmbIndustrySubSector_Change(sender, e);
                    cmbIndustryType.SelectedValue = Result.IndustryClassID.ToString();
                }
                catch { }
                try
                {
                    txtEML.Text = Result.EML.ToString();
                    txtMPL.Text = Result.MPL.ToString();

                    lblEML.InnerText = Result.EML.ToString() + "%";
                    lblMPL.InnerText = Result.MPL.ToString() + "%";
                    //chartMPL.Width = 650;
                    //chartMPL.Series["Series1"].AxisLabel = "MPL " + txtMPL.Text + "%";
                    //chartMPL.ChartAreas["ChartArea1"].AxisY.Interval = 5;
                    //chartMPL.ChartAreas["ChartArea1"].AxisY.Maximum = 100;
                    //chartMPL.ChartAreas["ChartArea1"].AxisY.Minimum = 0;


                    //chartMPL.Series["Series1"].Points[0].SetValueY(double.Parse(txtMPL.Text));

                    //chartEML.Width = 650;
                    //chartEML.Series["Series1"].AxisLabel = "EML " + txtEML.Text + "%";
                    //chartEML.Series["Series1"].Points[0].SetValueY(double.Parse(txtEML.Text));
                    //chartEML.ChartAreas["ChartArea1"].AxisY.Interval = 5;
                    //chartEML.ChartAreas["ChartArea1"].AxisY.Maximum = 100;
                    //chartEML.ChartAreas["ChartArea1"].AxisY.Minimum = 0;
                    //chartEML.DataBind();


                    txtRiskComment.Text = Result.RiskComments.ToString();
                }
                catch { }

                btnRequestQuote.Visible = (Result.AssessmentStatusID == 1 || Result.AssessmentStatusID == 0);

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setAssessmentRiskAddresses(int AssessmentID)
        {
            StringBuilder sb = new StringBuilder();


            litClientDetailsRiskAddresses.Text = "";
            List<getAssessmentAddresses_Result> Results = DataModal.getAssessmentAddresses(AssessmentID).ToList();
            sb.AppendLine("<table class='table table-striped' id='tblAssessmentAddresses' style='zoom: 88% !important'>");
            sb.AppendLine("                                           <thead>");
            sb.AppendLine("                                               <tr>");
            sb.AppendLine("                                                    <th>Province</th>");
            sb.AppendLine("                                                    <th>Town</th>");
            sb.AppendLine("                                                    <th>Suburb</th>");
            sb.AppendLine("                                                    <th>Street</th>");
            sb.AppendLine("                                                    <th>Building</th>");
            sb.AppendLine("                                                    <th style='width: 250px'>Options</th>");
            sb.AppendLine("                                                </tr>");
            sb.AppendLine("                                              </thead>");
            sb.AppendLine("                                              <tbody>");

            if (Results.Count != 0)
            {
                foreach (getAssessmentAddresses_Result Row in Results)
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Row.Province + "</td>");
                    sb.AppendLine("<td>" + Row.Town + "</td>");
                    sb.AppendLine("<td>" + Row.Suburb + "</td>");
                    sb.AppendLine("<td>" + Row.Street + "</td>");
                    sb.AppendLine("<td>" + Row.BuildingName + "</td>");
                    sb.AppendLine("<td><button onclick=\"AddressControls.Initialze('" + vAssessmentID.Value.ToString() + "','" + Row.AssessmentAddressID + "');\" class='btn btn-warning' title='Edit'><i class='far fa-edit'></i>&nbsp;Edit</button></td>");
                    sb.AppendLine("</tr>");
                }
            }
            else
            {
                sb.AppendLine("<tr><td colspan='6' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No risk addresses associated.</td></tr>");
            }
            sb.AppendLine("                                              </tbody>");
            sb.AppendLine("                                           </table>");


            litClientDetailsRiskAddresses.Text = sb.ToString();
        }

        public void btnClientDetailsRiskAddresses_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                setAssessmentRiskAddresses(AssessmentID);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        class PolicyDetailsElement
        {
            public int ElementID { get; set; }
            public DropDownList Covered { get; set; }
            public TextBox Sum { get; set; }
        }

        public void btnSavePolicyDetails_Click(object sender, EventArgs e)
        {
            //try
            //{
            int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
            int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
            if (AssessmentID == 0)
            {
                Cloud.MessageBox.Show("Please ensure you save client details first before adding policy details...", "Policy Details", MessageBoxType.error); return;
            }

            decimal Sum = decimal.Parse("0");
            int Covered = 0;
            List<PolicyDetailsElement> policyDetailsElements = new List<PolicyDetailsElement>
                {
                    new PolicyDetailsElement { ElementID = 1, Covered = Policy_cmbPlantAndMachinery_Covered,Sum = Policy_txtPlantAndMachinery},
                    new PolicyDetailsElement { ElementID = 2, Covered = Policy_cmbBuilding_Covered,Sum = Policy_txtBuilding},
                    new PolicyDetailsElement { ElementID = 3, Covered = Policy_cmbContents_Covered,Sum = Policy_txtContents},
                    new PolicyDetailsElement { ElementID = 4, Covered = Policy_cmbMiscellaneous_Covered,Sum = Policy_txtMiscellaneous},
                    new PolicyDetailsElement { ElementID = 5, Covered = Policy_cmbGrossProfit_Covered,Sum = Policy_txtGrossProfit},
                    new PolicyDetailsElement { ElementID = 6, Covered = Policy_cmbUtilities_Covered,Sum = Policy_txtUtilities},
                    new PolicyDetailsElement { ElementID = 7, Covered = Policy_cmbPOA_Covered,Sum = Policy_txtPOA},
                    new PolicyDetailsElement { ElementID = 8, Covered = Policy_cmbLossOfRent_Covered,Sum = Policy_txtLossOfRent},
                    new PolicyDetailsElement { ElementID = 9, Covered = Policy_cmbAICOW_Covered,Sum = Policy_txtAICOW},
                    new PolicyDetailsElement { ElementID = 10, Covered = Policy_cmbBuildings_Covered,Sum = Policy_txtBuildings},
                    new PolicyDetailsElement { ElementID = 11, Covered = Policy_cmbEscalation_Covered,Sum = Policy_txtEscalation},
                    new PolicyDetailsElement { ElementID = 12, Covered = Policy_cmbInflation_Covered,Sum = Policy_txtInflation},
                    new PolicyDetailsElement { ElementID = 13, Covered = Policy_cmbRental_Covered,Sum = Policy_txtRental_Covered},
                    new PolicyDetailsElement { ElementID = 14, Covered = Policy_cmbOfficeContents_Covered,Sum = Policy_txtOfficeContents},
                    new PolicyDetailsElement { ElementID = 15, Covered = Policy_cmbMoney_Covered,Sum = Policy_txtMoney_Covered},
                    new PolicyDetailsElement { ElementID = 16, Covered = Policy_cmbElectronicEquipment_Covered,Sum = Policy_txtElectronicEquipment},
                    new PolicyDetailsElement { ElementID = 17, Covered = Policy_cmbGlass_Covered,Sum = Policy_txtGlass},
                    new PolicyDetailsElement { ElementID = 18, Covered = Policy_cmbTheft_Covered,Sum = Policy_txtTheft},
                    new PolicyDetailsElement { ElementID = 19, Covered = Policy_cmbFidelity_Covered,Sum = Policy_txtFidelity_Covered},
                    new PolicyDetailsElement { ElementID = 20, Covered = Policy_cmbLiability_Covered,Sum = Policy_txtLiability_Covered},
                    new PolicyDetailsElement { ElementID = 21, Covered = Policy_cmbGIT_Covered,Sum = Policy_txtGIT},
                    new PolicyDetailsElement { ElementID = 22, Covered = Policy_cmbBAR_Covered,Sum = Policy_txtBAR},
                    new PolicyDetailsElement { ElementID = 23, Covered = Policy_cmbAccidentalDamage_Covered,Sum = Policy_txtAccidentalDamage},
                    new PolicyDetailsElement { ElementID = 24, Covered = Policy_cmbMachineryBreakdown_Covered,Sum = Policy_txtMacineryBreakdown},
                    new PolicyDetailsElement { ElementID = 25, Covered = Assest_Policy_cmbPlantsAndMachinery,Sum = Assest_Policy_txtPlantsAndMachinery},
                    new PolicyDetailsElement { ElementID = 26, Covered = Assest_Policy_cmbBuildings,Sum = Assest_Policy_txtBuildings},
                    new PolicyDetailsElement { ElementID = 27, Covered = Assest_Policy_cmbStock,Sum = Assest_Policy_txtStock},
                    new PolicyDetailsElement { ElementID = 28, Covered = Assest_Policy_cmbMiscellaneous,Sum = Assest_Policy_txtMiscellaneous}
                };

            foreach (PolicyDetailsElement policyDetailsElement in policyDetailsElements)
            {
                Cloud.Draw(policyDetailsElement.Covered).Normal();
                Cloud.Draw(policyDetailsElement.Sum).Normal();

            }

            foreach (PolicyDetailsElement policyDetailsElement in policyDetailsElements)
            {
                if (policyDetailsElement.Sum.Text.Length > 0)
                {
                    try
                    {
                        Sum = decimal.Parse(policyDetailsElement.Sum.Text.ToString());
                    }
                    catch
                    {
                        Cloud.Draw(policyDetailsElement.Sum).Highlight();
                        Cloud.JS("setTimeout(()=>{$('html, body').animate({scrollTop: $('#" + policyDetailsElement.Sum.ClientID.ToString() + "').offset().top}, 2000);},50);");
                        Cloud.MessageBox.Show("Please ensure valid data entered, example 0.00", "See highlighted field", MessageBoxType.warning);
                        return;
                    }
                    Cloud.Draw(policyDetailsElement.Sum).Normal();

                    if (policyDetailsElement.Covered.SelectedValue != "1")
                    {
                        Cloud.Draw(policyDetailsElement.Covered).Highlight();
                        Cloud.JS("setTimeout(()=>{$('html, body').animate({scrollTop: $('#" + policyDetailsElement.Covered.ClientID.ToString() + "').offset().top}, 2000);},50);");
                        Cloud.MessageBox.Show("You indicated sums insured, but stated element not covered?", "See highlighted field", MessageBoxType.warning);
                        return;
                    }
                    Cloud.Draw(policyDetailsElement.Covered).Normal();


                }

                if (policyDetailsElement.Covered.SelectedValue == "1")
                {

                    if (policyDetailsElement.Sum.Text.Length == 0)
                    {
                        try
                        {
                            Sum = decimal.Parse(policyDetailsElement.Sum.Text.ToString());
                        }
                        catch
                        {
                            Cloud.Draw(policyDetailsElement.Sum).Highlight();
                            Cloud.JS("setTimeout(()=>{$('html, body').animate({scrollTop: $('#" + policyDetailsElement.Sum.ClientID.ToString() + "').offset().top}, 2000);},50);");
                            Cloud.MessageBox.Show("You indicated element covered, bu" +
                                "t did not provide a sum insured.", "See highlighted field", MessageBoxType.warning);
                            return;
                        }
                        Cloud.Draw(policyDetailsElement.Sum).Normal();

                        Cloud.Draw(policyDetailsElement.Sum).Highlight();
                        Cloud.JS("setTimeout(()=>{$('html, body').animate({scrollTop: $('#" + policyDetailsElement.Sum.ClientID.ToString() + "').offset().top}, 2000);},50);");
                        Cloud.MessageBox.Show("You indicated element covered, but did not provide a sum insured.", "See highlighted field", MessageBoxType.warning);
                        return;
                    }
                    Cloud.Draw(policyDetailsElement.Sum).Normal();



                    try
                    {
                        Sum = decimal.Parse(policyDetailsElement.Sum.Text.ToString());
                    }
                    catch
                    {
                        Cloud.Draw(policyDetailsElement.Sum).Highlight();
                        Cloud.JS("setTimeout(()=>{$('html, body').animate({scrollTop: $('#" + policyDetailsElement.Sum.ClientID.ToString() + "').offset().top}, 2000);},50);");
                        Cloud.MessageBox.Show("Please ensure valid data entered, example 0.00", "See highlighted field", MessageBoxType.warning);
                        return;
                    }
                    Cloud.Draw(policyDetailsElement.Sum).Normal();


                    if (Sum <= decimal.Parse("0"))
                    {
                        Cloud.Draw(policyDetailsElement.Sum).Highlight();
                        Cloud.JS("setTimeout(()=>{$('html, body').animate({scrollTop: $('#" + policyDetailsElement.Sum.ClientID.ToString() + "').offset().top}, 2000);},50);");
                        Cloud.MessageBox.Show("You indicated element covered, but did not provide a sum insured.", "See highlighted field", MessageBoxType.warning);
                        return;
                    }
                    Cloud.Draw(policyDetailsElement.Sum).Normal();

                }
            }



            foreach (PolicyDetailsElement policyDetailsElement in policyDetailsElements)
            {
                try
                {
                    int ElementID = policyDetailsElement.ElementID;
                    try
                    {
                        Covered = int.Parse(policyDetailsElement.Covered.SelectedValue.ToString());
                    }
                    catch
                    {
                        Covered = 0;
                    }
                    try
                    {
                        Sum = decimal.Parse(policyDetailsElement.Sum.Text.ToString());
                    }
                    catch
                    {
                        Sum = decimal.Parse("0.00");
                    }

                    DataModal.addAssessmentPolicyDetails(ElementID, Covered, Sum, AssessmentID, UserID);
                }
                catch
                {

                }
            }

            Cloud.MessageBox.Show("Policy details saved successfully", "Policy Details", MessageBoxType.success);

            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }

        public void setAssessmentPolicyDetails(int AssessmentID)
        {
            try
            {
                List<getAssessmentPolicyDetails_Result> Results = DataModal.getAssessmentPolicyDetails(AssessmentID).ToList();
                List<PolicyDetailsElement> policyDetailsElements = new List<PolicyDetailsElement>
                {
                    new PolicyDetailsElement { ElementID = 1, Covered = Policy_cmbPlantAndMachinery_Covered,Sum = Policy_txtPlantAndMachinery},
                    new PolicyDetailsElement { ElementID = 2, Covered = Policy_cmbBuilding_Covered,Sum = Policy_txtBuilding},
                    new PolicyDetailsElement { ElementID = 3, Covered = Policy_cmbContents_Covered,Sum = Policy_txtContents},
                    new PolicyDetailsElement { ElementID = 4, Covered = Policy_cmbMiscellaneous_Covered,Sum = Policy_txtMiscellaneous},
                    new PolicyDetailsElement { ElementID = 5, Covered = Policy_cmbGrossProfit_Covered,Sum = Policy_txtGrossProfit},
                    new PolicyDetailsElement { ElementID = 6, Covered = Policy_cmbUtilities_Covered,Sum = Policy_txtUtilities},
                    new PolicyDetailsElement { ElementID = 7, Covered = Policy_cmbPOA_Covered,Sum = Policy_txtPOA},
                    new PolicyDetailsElement { ElementID = 8, Covered = Policy_cmbLossOfRent_Covered,Sum = Policy_txtLossOfRent},
                    new PolicyDetailsElement { ElementID = 9, Covered = Policy_cmbAICOW_Covered,Sum = Policy_txtAICOW},
                    new PolicyDetailsElement { ElementID = 10, Covered = Policy_cmbBuildings_Covered,Sum = Policy_txtBuildings},
                    new PolicyDetailsElement { ElementID = 11, Covered = Policy_cmbEscalation_Covered,Sum = Policy_txtEscalation},
                    new PolicyDetailsElement { ElementID = 12, Covered = Policy_cmbInflation_Covered,Sum = Policy_txtInflation},
                    new PolicyDetailsElement { ElementID = 13, Covered = Policy_cmbRental_Covered,Sum = Policy_txtRental_Covered},
                    new PolicyDetailsElement { ElementID = 14, Covered = Policy_cmbOfficeContents_Covered,Sum = Policy_txtOfficeContents},
                    new PolicyDetailsElement { ElementID = 15, Covered = Policy_cmbMoney_Covered,Sum = Policy_txtMoney_Covered},
                    new PolicyDetailsElement { ElementID = 16, Covered = Policy_cmbElectronicEquipment_Covered,Sum = Policy_txtElectronicEquipment},
                    new PolicyDetailsElement { ElementID = 17, Covered = Policy_cmbGlass_Covered,Sum = Policy_txtGlass},
                    new PolicyDetailsElement { ElementID = 18, Covered = Policy_cmbTheft_Covered,Sum = Policy_txtTheft},
                    new PolicyDetailsElement { ElementID = 19, Covered = Policy_cmbFidelity_Covered,Sum = Policy_txtFidelity_Covered},
                    new PolicyDetailsElement { ElementID = 20, Covered = Policy_cmbLiability_Covered,Sum = Policy_txtLiability_Covered},
                    new PolicyDetailsElement { ElementID = 21, Covered = Policy_cmbGIT_Covered,Sum = Policy_txtGIT},
                    new PolicyDetailsElement { ElementID = 22, Covered = Policy_cmbBAR_Covered,Sum = Policy_txtBAR},
                    new PolicyDetailsElement { ElementID = 23, Covered = Policy_cmbAccidentalDamage_Covered,Sum = Policy_txtAccidentalDamage},
                    new PolicyDetailsElement { ElementID = 24, Covered = Policy_cmbMachineryBreakdown_Covered,Sum = Policy_txtMacineryBreakdown},
                    new PolicyDetailsElement { ElementID = 25, Covered = Assest_Policy_cmbPlantsAndMachinery,Sum = Assest_Policy_txtPlantsAndMachinery},
                    new PolicyDetailsElement { ElementID = 26, Covered = Assest_Policy_cmbBuildings,Sum = Assest_Policy_txtBuildings},
                    new PolicyDetailsElement { ElementID = 27, Covered = Assest_Policy_cmbStock,Sum = Assest_Policy_txtStock},
                    new PolicyDetailsElement { ElementID = 28, Covered = Assest_Policy_cmbMiscellaneous,Sum = Assest_Policy_txtMiscellaneous}
                };
                if (Results.Count > 0)
                {
                    foreach (PolicyDetailsElement policyDetailsElement in policyDetailsElements)
                    {
                        foreach (getAssessmentPolicyDetails_Result Result in Results)
                        {
                            if (policyDetailsElement.ElementID == Result.ElementID)
                            {

                                try
                                {
                                    policyDetailsElement.Covered.SelectedValue = Result.Covered.ToString();
                                }
                                catch
                                {
                                    policyDetailsElement.Covered.SelectedValue = "0";
                                }
                                try
                                {
                                    if (Result.Sum > 0)
                                    {
                                        policyDetailsElement.Sum.Text = decimal.Parse(Result.Sum.ToString()).ToString();
                                    }
                                    else
                                    {
                                        policyDetailsElement.Sum.Text = "";
                                    }
                                }
                                catch
                                {
                                    policyDetailsElement.Sum.Text = "";
                                }
                            }
                        }
                    }

                }
                else
                {
                    foreach (PolicyDetailsElement policyDetailsElement in policyDetailsElements)
                    {

                        policyDetailsElement.Covered.SelectedValue = "0";
                        policyDetailsElement.Sum.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setAssessmentQuotes(int AssessmentID)
        {
            try
            {
                int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                List<getAssessmentQuotes_Result1> Results = DataModal.getAssessmentQuotes(AssessmentID, UserID).ToList();
                StringBuilder sb = new StringBuilder();
                sb.AppendLine("             <table class='table table-striped'>");
                sb.AppendLine("                    <thead>");
                sb.AppendLine("                        <tr>");
                sb.AppendLine("                            <th style='width: 20px'>ID</th>");
                sb.AppendLine("                            <th>Company</th>");
                sb.AppendLine("                            <th>Rating</th>");
                sb.AppendLine("                            <th>Service Date</th>");
                sb.AppendLine("                            <th>Quote Date</th>");
                sb.AppendLine("                            <th>Price</th>");
                if (UserTypeID == 2 || UserTypeID == 6)
                {
                    sb.AppendLine("                            <th style='width: 250px'>Response</th>");
                }
                if (UserTypeID == 2 || UserTypeID == 1 || UserTypeID == 6)
                {
                    sb.AppendLine("                            <th style='width: 250px'>Options</th>");
                }
                sb.AppendLine("                        </tr>");
                sb.AppendLine("                    </thead>");

                bool QuoteAccepted = false;

                if (AssessmentID != 0)
                {
                    sb.AppendLine("                    <tbody>");
                    foreach (getAssessmentQuotes_Result1 Quote in Results)
                    {



                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Quote.AssessmentQuoteID.ToString() + "</td>");
                        sb.AppendLine("<td>" + Quote.Company.ToString() + "</td>");
                        sb.AppendLine("<td><div class='progress progress-xs' style='height: 30px;'><div class='progress-bar progress-bar-yellow' style='width: " + (decimal.Parse(Quote.Rating.ToString()) * 10).ToString() + "%'>" + Quote.Rating.ToString() + "/10</div></div></td>");
                        sb.AppendLine("<td>" + Quote.ServiceDate.ToString() + "</td>");
                        sb.AppendLine("<td>" + Quote.QuoteDate.ToString() + "</td>");
                        sb.AppendLine("<td>R" + Quote.Price.ToString() + "</td>");
                        if (Quote.QuoteStatusID == 2)
                        {
                            QuoteAccepted = true;
                            sb.AppendLine("<td><a><button class='btn btn-success' title='Accepted'><i class='far fa-handshake'></i>&nbsp;Accepted!</button></a></td>");
                        }
                        else if (Quote.QuoteStatusID == 3)
                        {
                            sb.AppendLine("<td><a><button class='btn btn-danger' title='Rejected'><i class='far fa-thumbs-down'></i>&nbsp;Rejected</button></a></td>");
                        }
                        else
                        {
                            if (UserTypeID == 2 || UserTypeID == 6 || UserTypeID == 1)
                            {
                                sb.AppendLine("<td><a onclick=\"AssessmentControls.Tabs.Quotes.Accept('" + Quote.AssessmentQuoteID.ToString() + "');\" ><button class='btn btn-success' title='Accept'><i class='far fa-handshake'></i>&nbsp;Accept</button></a>&nbsp;<a onclick=\"AssessmentControls.Tabs.Quotes.Reject('" + Quote.AssessmentQuoteID.ToString() + "');\"><button  class='btn btn-danger' title='Reject'><i class='far fa-thumbs-down'></i>&nbsp;Reject</button></a></td>");
                            }
                            else
                            {
                                sb.AppendLine("<td><a><button class='btn btn-primary' title='Pending'><i class='fas fa-hourglass-half fa-spin'></i>&nbsp;Pending</button></a></td>");

                            }

                        }

                        if (UserTypeID == 2 || UserTypeID == 6 || UserTypeID == 1)
                        {
                            sb.AppendLine("<td><a target='_blank' href='" + (Request.Url.Scheme + "://" + Request.Url.Authority +
    Request.ApplicationPath.TrimEnd('/') + "/documents/quote?download=no&quoteID=" + Quote.AssessmentQuoteID.ToString()).ToString() + "' class='btn btn-warning' title='View'><i class='fas fa-eye'></i>&nbsp;View</a>&nbsp;<a target='_blank' href='" + (Request.Url.Scheme + "://" + Request.Url.Authority +
    Request.ApplicationPath.TrimEnd('/') + "/documents/quote?download=yes&quoteID=" + Quote.AssessmentQuoteID.ToString()).ToString() + "' class='btn btn-warning' title='Download'><i class='fas fa-file-download'></i>&nbsp;Download</a></td>");

                        }




                        sb.AppendLine("</tr>");
                    }
                    sb.AppendLine("</tbody>");
                    sb.AppendLine("</table>");
                }
                else
                {
                    sb.AppendLine("<tbody>");
                    sb.AppendLine("<tr><td colspan='8' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No quotes associated.</td></tr>");
                    sb.AppendLine("</tbody>");
                    sb.AppendLine("</table>");
                }
                litAssessmentQuotes.Text = sb.ToString();
                if (QuoteAccepted == true)
                {
                    Cloud.JS("$('#btnAddQuote').hide();");
                }
                else
                {
                    Cloud.JS("$('#btnAddQuote').show();");
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnAssessmentQuotesRefresh_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                setAssessmentQuotes(AssessmentID);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnUpdateQuoteStatus_Click(object sender, EventArgs e)
        {
            try
            {
                int QuoteID = int.Parse(vQuoteID.Value.ToString());
                int QuoteStatusID = int.Parse(vQuoteStatusID.Value.ToString());
                DataModal.updAssessmentQuoteStatus(QuoteID, QuoteStatusID);
                btnAssessmentQuotesRefresh_Click(sender, e);
                if (QuoteStatusID == 2)
                {
                    Cloud.MessageBox.Show("Quote: " + QuoteID.ToString() + " accepted successfully.", "Thank you for your patronage!", MessageBoxType.success);
                }
                else
                {
                    Cloud.MessageBox.Show("Quote: " + QuoteID.ToString() + " rejected, please phone support if you change your mind.", "Rejected", MessageBoxType.info);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setAssessmentTracks(int AssessmentID)
        {
            //try
            //{
            litAssessmentTracks.Text = "";
            int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
            List<getAssessmentTracksHTML_Result1> Results = DataModal.getAssessmentTracksHTML(AssessmentID).ToList();
            foreach (getAssessmentTracksHTML_Result1 Result in Results)
            {
                litAssessmentTracks.Text += Result.HTML.ToString();
            }
            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }

        public void btnRefreshTracks_Click(object sender, EventArgs e)
        {
            //try
            //{
            int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
            setAssessmentTracks(AssessmentID);
            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }


        public void setAssessmentUsers(int AssessmentID)
        {
            try
            {
                int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                if (UserTypeID == 3)
                {

                    bool Exist = false;

                    int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                    StringBuilder sb = new StringBuilder();
                    sb.AppendLine(" <div class='row d-flex align-items-stretch' style='padding: 10px;'>");
                    var Resluts = DataModal.getAssessmentAssignedUsers(AssessmentID).ToList();
                    foreach (var Result in Resluts)
                    {
                        try
                        {
                            string UserFaIconClassName = "fas fa-diagnoses";
                            switch (Result.UserTypeID)
                            {
                                case 1:
                                    UserFaIconClassName = "fas fa-user-astronaut";
                                    break;
                                case 2:
                                    UserFaIconClassName = "fas fa-user-shield";
                                    break;
                                case 3:
                                    UserFaIconClassName = "fas fa-user-graduate";
                                    break;
                                case 4:
                                    UserFaIconClassName = "fas fa-user-tie";
                                    break;
                                case 5:
                                    UserFaIconClassName = "fas fa-diagnoses";
                                    break;
                                case 6:
                                    UserFaIconClassName = "fas fa-user-tie";
                                    break;
                                default:
                                    UserFaIconClassName = "far fa-user";
                                    break;
                            }


                            if (UserID == Result.UserID)
                            {
                                Exist = true;
                            }

                            sb.AppendLine("<div class='col-12 col-sm-6 col-md-4 d-flex align-items-stretch'> <div class='card bg-light'>");
                            sb.AppendLine("<div class='card-header  border-bottom-0'>");
                            sb.AppendLine("<i class='" + UserFaIconClassName + "'></i>&nbsp;" + Result.UserTypeDescription);
                            sb.AppendLine("</div>");
                            sb.AppendLine("<div class='card-body pt-0'>");
                            sb.AppendLine("<div class='row'>");
                            sb.AppendLine("<div class='col-7'>");
                            sb.AppendLine("<h2 class='lead'><b>" + Result.UserFirstName.ToString() + " " + Result.UsersLastName.ToString() + "</b></h2>");
                            sb.AppendLine("<p class='text-muted text-sm'><b>Assigned: </b>" + Result.AssessmentUserAsignedDate.ToString() + " </p>");
                            sb.AppendLine("");
                            sb.AppendLine("<ul class='ml-4 mb-0 fa-ul text-muted'>");
                            sb.AppendLine("<li class='small'><span class='fa-li'><i class='fas fa-lg fa-building'></i></span>" + Result.Adderess.ToString() + "</li>");
                            sb.AppendLine("<li class='small'><span class='fa-li'><i class='fas fa-lg fa-phone'></i></span>Phone #: " + Result.UserCellphone.ToString() + "</li>");
                            sb.AppendLine("</ul>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("<div class='col-5 text-center'>");
                            sb.AppendLine("<img src='/images/nopic.jpg' alt='' class='img-circle img-fluid'>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");

                            sb.AppendLine("<div style='margin-top:10px !important' class='row'>");
                            if (Result.CompanyID == CompanyID)
                            {
                                sb.AppendLine("<button onclick=\"AssessmentControls.Functions.UnassignAssessmentUser('" + Result.UserID.ToString() + "');\" type='button' class='btn btn-block btn-danger btn-sm'><i class='fas fa-user-minus'></i>&nbsp;Unassign</button>");
                            }
                            sb.AppendLine("<button onclick=\"NotifyControl.Initialize('" + Result.UserID.ToString() + "');\" type='button' class='btn btn-block btn-info btn-sm'><i class='far fa-paper-plane'></i>&nbsp;Notify</button>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");


                        }
                        catch (Exception ex)
                        {
                            Cloud.Exception(ex);
                        }
                    }
                    sb.AppendLine(" </div>");
                    litAssessmentUsers.Text = sb.ToString();
                    if (Exist == false)
                    {
                        DataModal.updAssignUserAssessment(AssessmentID, UserID, UserID);
                    }
                }
                else
                {
                    int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                    StringBuilder sb = new StringBuilder();
                    sb.AppendLine(" <div class='row d-flex align-items-stretch' style='padding: 10px;'>");
                    var Resluts = DataModal.getAssessmentAssignedUsers(AssessmentID).ToList();
                    foreach (var Result in Resluts)
                    {
                        try
                        {
                            string UserFaIconClassName = "fas fa-diagnoses";
                            switch (Result.UserTypeID)
                            {
                                case 1:
                                    UserFaIconClassName = "fas fa-user-astronaut";
                                    break;
                                case 2:
                                    UserFaIconClassName = "fas fa-user-shield";
                                    break;
                                case 3:
                                    UserFaIconClassName = "fas fa-user-graduate";
                                    break;
                                case 4:
                                    UserFaIconClassName = "fas fa-user-tie";
                                    break;
                                case 5:
                                    UserFaIconClassName = "fas fa-diagnoses";
                                    break;
                                case 6:
                                    UserFaIconClassName = "fas fa-user-tie";
                                    break;
                                default:
                                    UserFaIconClassName = "far fa-user";
                                    break;
                            }



                            sb.AppendLine("<div class='col-12 col-sm-6 col-md-4 d-flex align-items-stretch'> <div class='card bg-light'>");
                            sb.AppendLine("<div class='card-header  border-bottom-0'>");
                            sb.AppendLine("<i class='" + UserFaIconClassName + "'></i>&nbsp;" + Result.UserTypeDescription);
                            sb.AppendLine("</div>");
                            sb.AppendLine("<div class='card-body pt-0'>");
                            sb.AppendLine("<div class='row'>");
                            sb.AppendLine("<div class='col-7'>");
                            sb.AppendLine("<h2 class='lead'><b>" + Result.UserFirstName.ToString() + " " + Result.UsersLastName.ToString() + "</b></h2>");
                            sb.AppendLine("<p class='text-muted text-sm'><b>Assigned: </b>" + Result.AssessmentUserAsignedDate.ToString() + " </p>");
                            sb.AppendLine("");
                            sb.AppendLine("<ul class='ml-4 mb-0 fa-ul text-muted'>");
                            sb.AppendLine("<li class='small'><span class='fa-li'><i class='fas fa-lg fa-building'></i></span>" + Result.Adderess.ToString() + "</li>");
                            sb.AppendLine("<li class='small'><span class='fa-li'><i class='fas fa-lg fa-phone'></i></span>Phone #: " + Result.UserCellphone.ToString() + "</li>");
                            sb.AppendLine("</ul>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("<div class='col-5 text-center'>");
                            sb.AppendLine("<img src='/images/nopic.jpg' alt='' class='img-circle img-fluid'>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");

                            sb.AppendLine("<div style='margin-top:10px !important' class='row'>");
                            if (Result.CompanyID == CompanyID)
                            {
                                sb.AppendLine("<button onclick=\"AssessmentControls.Functions.UnassignAssessmentUser('" + Result.UserID.ToString() + "');\" type='button' class='btn btn-block btn-danger btn-sm'><i class='fas fa-user-minus'></i>&nbsp;Unassign</button>");
                            }
                            sb.AppendLine("<button onclick=\"NotifyControl.Initialize('" + Result.UserID.ToString() + "');\" type='button' class='btn btn-block btn-info btn-sm'><i class='far fa-paper-plane'></i>&nbsp;Notify</button>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");
                            sb.AppendLine("</div>");


                        }
                        catch (Exception ex)
                        {
                            Cloud.Exception(ex);
                        }
                    }
                    sb.AppendLine(" </div>");
                    litAssessmentUsers.Text = sb.ToString();
                }




            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnRefereshAssessmentUsers_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                setAssessmentUsers(AssessmentID);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnUnassignUserFromAssessment_Click(object sender, EventArgs e)
        {
            try
            {
                int UserID = int.Parse(vUnassignUserID.Value.ToString());
                int ActionUserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                var Result = DataModal.updAssessmentUserUnassign(ActionUserID, UserID, AssessmentID);
                setAssessmentUsers(AssessmentID);
                Cloud.MessageBox.Show("User unassigned successfully.", "Unassigned", MessageBoxType.info);

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void setReports(int SurveyID)
        {
            btnSurveyReport.Text = "<button onclick='runSurveyReadOnly(\"" + SurveyID.ToString() + "\",\"" + vAssessmentID.Value + "\",\"" + Cloud.GetCookie("UserID") + "\");return false;' class=\"btn btn-warning\" title=\"Download\"><i class=\"fas fa-eye\"></i>&nbsp;View</button>";

            btnExecutiveReport.Text = "<button   onclick='runEXEReport(\"" + vAssessmentID.Value + "\");return false;' class=\"btn btn-warning\" title=\"Download\"><i class=\"fas fa-eye\"></i>&nbsp;View</button>";


            btnExecutiveReportDownload.Text = "<button  onclick='rundownloadEXEReport(\"" + vAssessmentID.Value + "\");return false;' class='btn btn-warning' title='Download'><i class='fas fa-file-download'></i>&nbsp;Download</button>";


            btnSurveyReportDownload.Text = "<a href='/runsurvey/download?s="+ SurveyID.ToString() + "' class='btn btn-warning' title='Download'><i class='fas fa-file-download'></i>&nbsp;Download</a>";



        }

        public void setAssessmentSurveys(int AssessmentID)
        {
            try
            {

                StringBuilder sb = new StringBuilder();
                var Results = DataModal.getAssessmentSurveys(AssessmentID).ToList();
                if (Results.Count() > 0)
                {
                    sb.AppendLine("<table class='table table-striped'>");
                    sb.AppendLine("<thead>");
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<th style='width: 20px'>ID</th>");
                    sb.AppendLine("<th>Type</th>");

                    sb.AppendLine("<th style='width: 500px'>Options</th>");
                    sb.AppendLine("</tr>");
                    sb.AppendLine("</thead>");
                    sb.AppendLine("<tbody>");
                    foreach (var Result in Results)
                    {

                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Result.ID.ToString() + "</td>");
                        sb.AppendLine("<td>" + Result.Type.ToString() + "</td>");

                        sb.AppendLine("<td>");
                        setReports(Result.ID);
                        sb.AppendLine("<button onclick='runSurvey(\"" + Result.ID.ToString() + "\",\"" + vAssessmentID.Value + "\",\"" + Cloud.GetCookie("UserID") + "\")' class='btn btn-warning' title='Open'><i class='fas fa-pencil-alt'></i>&nbsp;Open</button>");
                        //sb.AppendLine("<button class='btn btn-warning' title='Asign'><i class='fas fa-diagnoses'></i>&nbsp;Asign</button>");
                        //sb.AppendLine("<button class='btn btn-warning' title='Drop'><i class='fas fa-trash-alt'></i>&nbsp;Drop</button>");
                        //sb.AppendLine("<button class='btn btn-warning' title='Reset'><i class='fas fa-recycle'></i>&nbsp;Reset</button>");
                        sb.AppendLine("");
                        sb.AppendLine("</td>");
                        sb.AppendLine("</tr>");
                    }
                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("</tbody>");
                    sb.AppendLine("</table>");
                    litAssessmentSurveys.Text = sb.ToString();
                }
                else
                {
                    sb.AppendLine("<table class='table table-striped'>");
                    sb.AppendLine("<thead>");
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<th style='width: 20px'>ID</th>");
                    sb.AppendLine("<th>Type</th>");
                    sb.AppendLine("<th>Status</th>");
                    sb.AppendLine("<th>Assessor</th>");
                    sb.AppendLine("<th>Last Updated</th>");
                    sb.AppendLine("<th style='width: 500px'>Options</th>");
                    sb.AppendLine("</tr>");
                    sb.AppendLine("</thead>");
                    sb.AppendLine("<tbody>");

                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td colspan='6' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No surveys associated.</td>");
                    sb.AppendLine("</tr>");

                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("</tbody>");
                    sb.AppendLine("</table>");
                    litAssessmentSurveys.Text = sb.ToString();
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnRequestQuote_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID"));

                if (DataModal.getAssessmentPolicyDetails(AssessmentID).ToList().Count == 0)
                {
                    Cloud.MessageBox.Show("Please provide policy details.", "No Policy Details?", MessageBoxType.warning); return;
                }

                if (DataModal.getAssessmentAddresses(AssessmentID).ToList().Count == 0)
                {
                    Cloud.MessageBox.Show("Please provide risk address.", "No Risk Address?", MessageBoxType.warning); return;
                }


                DataModal.AssessmentRequestQuote(AssessmentID, UserID);

                btnRequestQuote.Visible = false;

                AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                {
                    ID = "AssessmentTabControl",
                    AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"}

                            }
                };
                TabState(AssessmentTabControl);



                Cloud.MessageBox.Show("Assessment send for quoting successfully.", "Hang tight...", MessageBoxType.info);


            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setAssessmentPolicyReadOnly(int AssessmentID)
        {
            try
            {
                litAssessmentPolicyReadOnly.Text = "<iframe src=\"/documents/assessmentdetails?assessmentid=" + AssessmentID.ToString() + "&download=no\"  height=\"650px\" width=\"100%\" ></iframe>";
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnUploadPolicyDocument_Click(object sender, EventArgs e)
        {
            try
            {
                btnCancelAssessment.Visible = true;
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID"));

                AssessmentID = int.Parse(DataModal.addFileUploadAssessment(UserID, AssessmentID).ToList()[0].Column1.ToString());
                vAssessmentID.Value = AssessmentID.ToString();


                lblAssessment.Text = "Assessment: " + AssessmentID.ToString();
                //setAssessmentUsers(AssessmentID);

                UploadDocumentFrame.Text = "<iframe src=\"upload/document/upload?AssessmentID=" + AssessmentID.ToString() + "&UserID=" + UserID.ToString() + "\" width=\"100%\" height=\"450px\" style=\"border:none;overflow-x:hidden\"></iframe> ";
                btnUploadPolicyDocument.Visible = false;
                string Script = "AssessmentControls.Declare();";

                Script += "$('#btnManageAutoCapture').show();";
                Script += "$('#btnAddRiskAddressJS').show();";
                Script += "$('#btnSaveClientDetailsJS').show();";
                Script += "$('#SavePolicyDetailsJS').show();";
                Cloud.JS("setTimeout(()=>{" + Script + "},5);");
                Cloud.Modal("mdlPolicyDocumentUpload").Open(); Cloud.JS(" changeUrl('DATA', Router.Functions.Encode(" + AssessmentID + "));");


            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnCloseAutoCapture_Click(object sender, EventArgs e)
        {
            try
            {
                btnUploadPolicyDocument.Visible = true;

                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID"));
                DataModal.cancelAutoCapture(AssessmentID, UserID);


                Cloud.Modal("mdlPolicyDocumentUpload").Close();
                Cloud.MessageBox.Show("Auto-capture request cancelled.", "Cancelled", MessageBoxType.info);
                string Script = "AssessmentControls.Declare();";
                Script += "$('#btnAddRiskAddressJS').show();";
                Script += "$('#btnSaveClientDetailsJS').show();";
                Script += "$('#SavePolicyDetailsJS').show();";
                Script += "$('#btnManageAutoCapture').hide();";
                Cloud.JS("setTimeout(()=>{" + Script + "},5);");

                btnCancelAssessment.Visible = true;
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
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
                    sb.AppendLine("<th>Area Of Observations</th>");
                    sb.AppendLine("<th>Detail</th>");
                    sb.AppendLine("<th>Priority</th>");
                    sb.AppendLine("<th>Deadline</th>");
                    sb.AppendLine("<th>Date</th>");
                    sb.AppendLine("<th >Options</th>");
                    sb.AppendLine("</tr>");
                    sb.AppendLine("</thead>");
                    sb.AppendLine("<tbody>");
                    foreach (var Result in Results)
                    {

                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Result.AreaOfObservation.ToString() + "</td>");
                        sb.AppendLine("<td>" + Result.Details.ToString() + "</td>");
                        sb.AppendLine("<td>" + Result.RiskRating.ToString());
                        sb.AppendLine("</td>");
                        sb.AppendLine("<td>" + Result.Deadline.ToString());
                        sb.AppendLine("</td>");
                        sb.AppendLine("<td>" + Result.Date.ToString());
                        sb.AppendLine("</td>");

                        sb.AppendLine("<td>");
                        sb.AppendLine("<button onclick='RequirementsAndRecommendations.Open(\"" + vAssessmentID.Value + "\",\"" + Result.ID.ToString() + "\")' class='btn btn-warning' title='Open'><i class='fas fa-pencil-alt'></i>&nbsp;Open</button>");
                        //sb.AppendLine("<button class='btn btn-warning' title='Asign'><i class='fas fa-diagnoses'></i>&nbsp;Asign</button>");
                        //sb.AppendLine("<button class='btn btn-warning' title='Drop'><i class='fas fa-trash-alt'></i>&nbsp;Drop</button>");
                        //sb.AppendLine("<button class='btn btn-warning' title='Reset'><i class='fas fa-recycle'></i>&nbsp;Reset</button>");
                        // sb.AppendLine("");
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

        public void btnRiskManagemensInitialize_Click(object sender, EventArgs e)
        {
            try
            {
                tblRiskClassificationSummaries_Populate();
                tblAssessmentRequirements_Populate();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }



        public void setPictureGallary()
        {
            int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
            StringBuilder sb = new StringBuilder();
            bool LocOpen = false; bool CatOpen = false;
            var Results = DataModal.getAssessmentGallaryDetails(AssessmentID).ToList();
            string CurrentCategory = ""; string CurrentLocation = "";
            foreach (var Result in Results)
            {
                if (CurrentCategory != Result.SurveyCategory || CurrentLocation != Result.Location)
                {
                    if (LocOpen == true)
                    {
                        LocOpen = false;
                        sb.AppendLine("</div>");
                    }

                    if (CatOpen == true)
                    {
                        CatOpen = false;
                        sb.AppendLine("</div>");
                    }
                    CurrentCategory = Result.SurveyCategory;
                    CurrentLocation = Result.Location;
                    sb.AppendLine("<div style='box-shadow:grey 5px 5px 10px 2px;border-radius:15px;width:96%;margin-left:1.5%;margin-bottom:8px;margin-top:8px'>");




                    sb.AppendLine("<a   onclick=\"AssessmentControls.Functions.OpenAssessmentAlbum('" + Result.SurveyCategoryID.ToString() + "','" + Result.Location.ToString() + "');\" style='cursor:pointer !important'><h4 style='padding:5px;margin-left:7px' class='m-0 text-dark'>");
                    sb.AppendLine("<i class='far fa-images'></i>&nbsp;");
                    sb.AppendLine(CurrentCategory + "</h4>");
                    sb.AppendLine("<h6 style='padding:5px;margin-left:7px' class='m-0 text-dark'>");
                    sb.AppendLine("<i class='far fa-compass'></i>&nbsp;");
                    sb.AppendLine(CurrentLocation + "</h6>");
                    sb.AppendLine("<p style='padding:5px;margin-left:7px' class='m-0 text-dark'>");
                    sb.AppendLine("<i class='fas fa-bullhorn'></i>&nbsp;");
                    sb.AppendLine(Result.Comment + "</p></a>");
                    sb.AppendLine("<div class='row'>");
                    LocOpen = true;
                    CatOpen = true;
                }

                sb.AppendLine("<div  style='cursor:pointer !important;box-shadow: grey 5px 5px 10px 2px;padding: 4px;margin: 20px; width: 250px;' class='col-sm-2'>");
                sb.AppendLine("<a  onclick=\"AssessmentControls.Functions.OpenAssessmentImage('" + Result.ID.ToString() + "');\">");
                sb.AppendLine("<img src='http://web.mitig8.co.za/" + Result.PictureURL + "' class='img-fluid mb-2' alt='white sample'>");
                sb.AppendLine("<p>" + Result.Title.ToString() + "</p>");
                sb.AppendLine("</a>");
                sb.AppendLine("</div>");

            }

            litGallery.Text = sb.ToString();
        }


        public void btnInitializePictureGallary_Click(object sender, EventArgs e)
        {
            setPictureGallary();
        }

        public void btnUploadImagesHidden_Click(object sender, EventArgs e)
        {
            int AssessmentID = int.Parse(vAssessmentID.Value);
            int UserID = int.Parse(Cloud.GetCookie("UserID"));



            //setAssessmentUsers(AssessmentID);

            litUploadImages.Text = "<iframe src=\"upload/image/upload?AssessmentID=" + AssessmentID.ToString() + "&UserID=" + UserID.ToString() + "\" width=\"100%\" height=\"450px\" style=\"border:none;overflow-x:hidden\"></iframe> ";
            Cloud.Modal("mdlPolicyImageUpload").Open();
        }



        public void cmbIndustrySector_Populate()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Result = DataModal.getIndustrySector().ToList();
                foreach (var Item in Result)
                {
                    dt.Rows.Add(Item.ID, Item.Description);
                }
                cmbIndustrySector.DataSource = dt;
                cmbIndustrySector.DataValueField = "ID";
                cmbIndustrySector.DataTextField = "Description";
                cmbIndustrySector.DataBind();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbIndustrySubSector_Populate()
        {
            try
            {
                int IndustrySector = int.Parse(cmbIndustrySector.SelectedValue);
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Result = DataModal.getIndustrySubSector(IndustrySector).ToList();
                foreach (var Item in Result)
                {
                    dt.Rows.Add(Item.ID, Item.Description);
                }
                cmbIndustrySubSector.DataSource = dt;
                cmbIndustrySubSector.DataValueField = "ID";
                cmbIndustrySubSector.DataTextField = "Description";
                cmbIndustrySubSector.DataBind();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbIndustryType_Populate()
        {
            try
            {
                int IndustrySubSector = int.Parse(cmbIndustrySubSector.SelectedValue);
                int IndustrySector = int.Parse(cmbIndustrySector.SelectedValue);
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Result = DataModal.getIndustrySectorClass(IndustrySubSector).ToList();
                foreach (var Item in Result)
                {
                    dt.Rows.Add(Item.ID, Item.Description);
                }
                cmbIndustryType.DataSource = dt;
                cmbIndustryType.DataValueField = "ID";
                cmbIndustryType.DataTextField = "Description";
                cmbIndustryType.DataBind();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbIndustrySector_Change(object sender, EventArgs e)
        {
            try
            {
                cmbIndustrySubSector_Populate();
                cmbIndustryType_Populate();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbIndustrySubSector_Change(object sender, EventArgs e)
        {
            try
            {
                cmbIndustryType_Populate();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnUpdatePML_Click(object sender, EventArgs e)
        {
            try
            {


                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
                    txtEML,txtMPL
                };
                foreach (TextBox Field in Fields)
                {
                    double Out;
                    if (!double.TryParse(Field.Text, out Out))
                    {
                        Field.Text = "0";
                    }

                    if (Field.Text.Length < 1)
                    {

                        Field.Text = "0";
                    }

                }
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.", "Missing values...", MessageBoxType.error); return; }

                lblEML.InnerText = txtEML.Text + "%";
                lblMPL.InnerText = txtMPL.Text + "%";
                //chartMPL.Width = 650;
                //chartMPL.Series["Series1"].AxisLabel = "MPL " + txtMPL.Text + "%";
                //chartMPL.ChartAreas["ChartArea1"].AxisY.Interval = 5;
                //chartMPL.ChartAreas["ChartArea1"].AxisY.Maximum = 100;
                //chartMPL.ChartAreas["ChartArea1"].AxisY.Minimum = 0;


                //chartMPL.Series["Series1"].Points[0].SetValueY(double.Parse(txtMPL.Text));

                //chartEML.Width = 650;
                //chartEML.Series["Series1"].AxisLabel = "EML " + txtEML.Text + "%";
                //chartEML.Series["Series1"].Points[0].SetValueY(double.Parse(txtEML.Text));
                //chartEML.ChartAreas["ChartArea1"].AxisY.Interval = 5;
                //chartEML.ChartAreas["ChartArea1"].AxisY.Maximum = 100;
                //chartEML.ChartAreas["ChartArea1"].AxisY.Minimum = 0;
                //chartEML.DataBind();



                DataModal.upd_EML_MPL(int.Parse(vAssessmentID.Value), decimal.Parse(txtEML.Text), decimal.Parse(txtMPL.Text));
                lblEML.InnerText = txtEML.Text + "%";
                lblMPL.InnerText = txtMPL.Text.ToString() + "%";


                DataModal.updAssessmentRiskComments(int.Parse(vAssessmentID.Value), txtMPLComment.Text, txtEMLComments.Text);

                Cloud.MessageBox.Show("Update successfull", "Thank you, values captured successfully!", MessageBoxType.success);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnUpdateEML_Click(object sender, EventArgs e)
        {
            btnUpdatePML_Click(sender, e);

        }

        public void btnUpdateGeneralCommentsRisk_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtRiskComment.Text.Length < 1)
                {
                    Cloud.MessageBox.Show("Please ensure field have valid values.", "Missing value...", MessageBoxType.error); return;
                }
                else
                {
                    DataModal.updAssessmentRisk(int.Parse(vAssessmentID.Value), txtRiskComment.Text);
                    Cloud.MessageBox.Show("Update successfull", "Thank you, values captured successfully!", MessageBoxType.success);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnCancelAssessment_Click(object sender, EventArgs e)
        {
            try
            {

                Cloud.Modal("mdlCancelAssessmentReason").Open();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnConfrimCancelAssessment_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());

                int? AssessmentStatusID = 0;
                try
                {
                    AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];

                }
                catch { }
                Cloud.Modal("mdlCancelAssessmentReason").Close();



                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                if (AssessmentID != 0)
                {



                    DataModal.cancelAssessment(AssessmentID, UserID);
                    if (AssessmentStatusID < 2)
                    {


                        Response.Redirect("/dashboard?MODULE=ASSESSMENTS");
                        Cloud.MessageBox.Show("Assessment: " + AssessmentID.ToString() + " deleted successfully.", "Assessment deleted", MessageBoxType.info);

                    }
                    else
                    {
                        AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                        {
                            ID = "AssessmentTabControl",
                            AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                               new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"}

                            }
                        };
                        TabState(AssessmentTabControl);

                        Cloud.MessageBox.Show("Assessment: " + AssessmentID.ToString() + " cancelled successfully.", "Assessment Cancelled", MessageBoxType.info);
                    }
                }
                else
                {
                    btnCancelAssessment.Visible = false;
                }

                btnCancelAssessment.Visible = false;
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public class RiskClassificationSummaryItem
        {
            public int FactorID { get; set; }
            public DropDownList Risk { get; set; }
            public TextBox Comment { get; set; }
        }

        public void btnSaveRiskClassificationSummary_Click(object sender, EventArgs e)
        {
            try
            {

                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
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
                    DataModal.addAssessmentRiskClassificationSummary(Item.FactorID, int.Parse(Item.Risk.SelectedValue), AssessmentID, Item.Comment.Text, UserID);
                }

                Cloud.MessageBox.Show("Success", "Risk Classification Summary saved...", MessageBoxType.info);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnSendForSpecialistReview_Click(object sender, EventArgs e)
        {
            try
            {
                int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());

                var Result = DataModal.updAssessmentSpecialistReview(AssessmentID, UserID, CompanyID).ToList()[0];
                if (Result.Status == 200)
                {


                    setAssessmentPolicyReadOnly(AssessmentID);
                    AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
                    {
                        ID = "AssessmentTabControl",
                        AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"},
                                         new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabReview", TabPanel="tabReview"}




                            }
                    };
                    TabState(AssessmentTabControl);

                    Cloud.JS("$('#btnAddQuote').hide();");



                    Cloud.MessageBox.Show(Result.Message.ToString(), Result.Title.ToString(), MessageBoxType.success);
                    btnSendForSpecialistReview.Visible = false;


                }
                else
                {
                    Cloud.MessageBox.Show(Result.Message.ToString(), Result.Title.ToString(), MessageBoxType.warning);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnInitializeAddReviewMessage_Click(object sender, EventArgs e)
        {
            try
            {
                txtReviewText.Text = "";
                cmbReviewSurveyCategory_Populate();
                if (int.Parse(vAssessmentReviewID.Value.ToString()) == 0)
                {
                    lblAddReviewMessageTitle.Text = "Add Review";
                }
                else
                {
                    lblAddReviewMessageTitle.Text = "Edit Review: " + vAssessmentReviewID.Value;
                }
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

        class Message
        {
            int SurveyCategoryID { get; set; }
            string SurveyCategoryTitle { get; set; }

            string Container_HTML { get; set; }

            string Messages_HTML { get; set; }
        }

        public void btnAssessmentReviewInitialize_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            int AssessmentID = int.Parse(vAssessmentID.Value);
            var Results = DataModal.getAssessmentReview(AssessmentID).ToList();
            int? CurrentID = 0;
            foreach (var Result in Results)
            {
                if (CurrentID != Result.SurveyCategoryID)
                {

                    if (CurrentID != 0)
                    {

                        sb.AppendLine("</div>");
                        sb.AppendLine("<!--/.direct-chat-messages-->");
                        sb.AppendLine("");
                        sb.AppendLine("<!-- /.direct-chat-pane -->");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.box-body -->");
                        sb.AppendLine("<div class=\"box-footer\" style=\"\">");
                        sb.AppendLine("<div class=\"input-group\">");
                        sb.AppendLine("<input id=\"txtReview" + CurrentID.ToString() + "\" type=\"text\" name=\"message\" placeholder=\"Type Message ...\" class=\"form-control\">");
                        sb.AppendLine("<span class=\"input-group-btn\">");
                        sb.AppendLine("<button type=\"submit\" class=\"btn btn-warning btn-flat\" onclick=\"AssessmentControls.Functions.AddAssessmentReview(" + CurrentID.ToString() + ");\">Send</button>");
                        sb.AppendLine("</span>");
                        sb.AppendLine("</div>");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.box-footer-->");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!--/.direct-chat -->");
                        sb.AppendLine("</div>");
                        sb.AppendLine("");
                        sb.AppendLine("");
                        sb.AppendLine("</div>");
                        sb.AppendLine("</div>");

                    }


                    CurrentID = Result.SurveyCategoryID;







                    sb.AppendLine("<div class=\"col-12 col-sm-12 col-md-12 d-flex align-items-stretch\" style=\"margin-left: auto;margin-right: auto;width: 100%;padding: 7px;\"> ");
                    sb.AppendLine("<div class=\"card bg-light\" style=\"width: 100%;\">");
                    sb.AppendLine("");
                    sb.AppendLine("<div class=\"card-header  border-bottom-0\" >");
                    sb.AppendLine("<i class=\"fas fa-pencil-ruler\"></i>" + Result.SurveyCategory);
                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("<a class=\"btn btn-default\" data-toggle=\"collapse\" href=\"#ARW" + Result.SurveyCategoryID.ToString() + "\" role=\"button\" aria-expanded=\"false\" aria-controls=\"collapseExample\" style=\"float:right\">");
                    sb.AppendLine("<i class=\"fas fa-glasses\"></i>  Open");
                    sb.AppendLine("</a>");
                    sb.AppendLine("</div>");
                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("");
                    sb.AppendLine("<div id=\"ARW" + Result.SurveyCategoryID.ToString() + "\" class=\"card-body pt-0 collapse\" style=\"background:white !important\">");
                    sb.AppendLine("<!-- DIRECT CHAT WARNING -->");
                    sb.AppendLine("<div class=\"box box-warning direct-chat direct-chat-warning\">");
                    sb.AppendLine("");
                    sb.AppendLine("<div class=\"box-body\">");
                    sb.AppendLine("<!-- Conversations are loaded here -->");
                    sb.AppendLine("<div id=\"msgReview" + Result.SurveyCategoryID.ToString() + "\" class=\"direct-chat-messages\">");


                    if (Result.UserTypeID != 5)
                    {
                        sb.AppendLine("<!-- Message to the right -->");
                        sb.AppendLine("<div class=\"direct-chat-msg right\">");
                        sb.AppendLine("<div class=\"direct-chat-info clearfix\">");
                        sb.AppendLine("<span class=\"direct-chat-name pull-right\">" + Result.UserName.ToString() + "</span>");
                        sb.AppendLine("<span class=\"direct-chat-timestamp pull-left\">" + Result.Date.ToString() + "</span>");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-info -->");
                        sb.AppendLine("<img class=\"direct-chat-img\" src=\"/images/nopic.jpg\" alt=\"Message User Image\"><!-- /.direct-chat-img -->");
                        sb.AppendLine("<div class=\"direct-chat-text\">");
                        sb.AppendLine(Result.Message.ToString());
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-text -->");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-msg -->");
                    }
                    else
                    {
                        sb.AppendLine("<!-- Message. Default to the left -->");
                        sb.AppendLine("<div class=\"direct-chat-msg\">");
                        sb.AppendLine("<div class=\"direct-chat-info clearfix\">");
                        sb.AppendLine("<span class=\"direct-chat-name pull-left\">" + Result.UserName.ToString() + "</span>");
                        sb.AppendLine("<span class=\"direct-chat-timestamp pull-right\">" + Result.Date.ToString() + "</span>");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-info -->");
                        sb.AppendLine("<img class=\"direct-chat-img\" src=\"/images/nopic.jpg\" alt=\"Message User Image\"><!-- /.direct-chat-img -->");
                        sb.AppendLine("<div class=\"direct-chat-text\">");
                        sb.AppendLine(Result.Message.ToString());
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-text -->");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-msg -->");
                    }





                }
                else
                {
                    if (Result.UserTypeID != 5)
                    {
                        sb.AppendLine("<!-- Message to the right -->");
                        sb.AppendLine("<div class=\"direct-chat-msg right\">");
                        sb.AppendLine("<div class=\"direct-chat-info clearfix\">");
                        sb.AppendLine("<span class=\"direct-chat-name pull-right\">" + Result.UserName.ToString() + "</span>");
                        sb.AppendLine("<span class=\"direct-chat-timestamp pull-left\">" + Result.Date.ToString() + "</span>");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-info -->");
                        sb.AppendLine("<img class=\"direct-chat-img\" src=\"/images/nopic.jpg\" alt=\"Message User Image\"><!-- /.direct-chat-img -->");
                        sb.AppendLine("<div class=\"direct-chat-text\">");
                        sb.AppendLine(Result.Message.ToString());
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-text -->");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-msg -->");
                    }
                    else
                    {
                        sb.AppendLine("<!-- Message. Default to the left -->");
                        sb.AppendLine("<div class=\"direct-chat-msg\">");
                        sb.AppendLine("<div class=\"direct-chat-info clearfix\">");
                        sb.AppendLine("<span class=\"direct-chat-name pull-left\">" + Result.UserName.ToString() + "</span>");
                        sb.AppendLine("<span class=\"direct-chat-timestamp pull-right\">" + Result.Date.ToString() + "</span> ");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-info -->");
                        sb.AppendLine("<img class=\"direct-chat-img\" src=\"/images/nopic.jpg\" alt=\"Message User Image\"><!-- /.direct-chat-img -->");
                        sb.AppendLine("<div class=\"direct-chat-text\">");
                        sb.AppendLine(Result.Message.ToString());
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-text -->");
                        sb.AppendLine("</div>");
                        sb.AppendLine("<!-- /.direct-chat-msg -->");
                    }


                }
            }

            sb.AppendLine("</div>");
            sb.AppendLine("<!--/.direct-chat-messages-->");
            sb.AppendLine("");
            sb.AppendLine("<!-- /.direct-chat-pane -->");
            sb.AppendLine("</div>");
            sb.AppendLine("<!-- /.box-body -->");
            sb.AppendLine("<div class=\"box-footer\" style=\"\">");
            sb.AppendLine("<div class=\"input-group\">");
            sb.AppendLine("<input id=\"txtReview" + CurrentID.ToString() + "\" type=\"text\" name=\"message\" placeholder=\"Type Message ...\" class=\"form-control\">");
            sb.AppendLine("<span class=\"input-group-btn\">");
            sb.AppendLine("<button  class=\"btn btn-warning btn-flat\" onclick=\"AssessmentControls.Functions.AddAssessmentReview('" + CurrentID.ToString() + "');return false;\">Send</button>");
            sb.AppendLine("</span>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");
            sb.AppendLine("<!-- /.box-footer-->");
            sb.AppendLine("</div>");
            sb.AppendLine("<!--/.direct-chat -->");
            sb.AppendLine("</div>");
            sb.AppendLine("");
            sb.AppendLine("");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");

            litReview.Text = sb.ToString();
        }


        public void btnAddReview_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtReviewText.Text.Length > 0)
                {
                    int AssessmentID = int.Parse(vAssessmentID.Value);
                    int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                    DataModal.addAssessmentReview(UserID, AssessmentID, int.Parse(cmbReviewSurveyCategory.SelectedValue), txtReviewText.Text);
                    btnAssessmentReviewInitialize_Click(sender, e);
                    Cloud.Modal("mdlAddReviewMessage").Close();
                    Cloud.MessageBox.Show("Review for " + cmbReviewSurveyCategory.SelectedItem.Text + " added successfully.", "Success", MessageBoxType.success);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnFinalizeQA_Click(object sender, EventArgs e)
        {
            int AssessmentID = int.Parse(vAssessmentID.Value);
            int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
            DataModal.updAssessmentFinalizeQA(AssessmentID, UserID);
            Cloud.JS(" $(document).ready(function(){ let timerIntervalUnauthorized; Swal.fire({ title: 'Thank you for completing the QA process.',icon:'success', html: 'You will be redirected in <b></b> milliseconds.', timer: 5000,allowOutsideClick:false, timerProgressBar: true, onBeforeOpen: () => { Swal.showLoading(); timerIntervalUnauthorized = setInterval(() => { Swal.getContent().querySelector('b').textContent = Swal.getTimerLeft(); }, 100); }, onClose: () => { clearInterval(timerIntervalUnauthorized); window.location = '/dashboard?MODULE=ASSESSMENTS'; } }).then((result) => { if (result.dismiss === Swal.DismissReason.timer) { console.log('I was closed by the timer'); } }); });");
        }


        public void btnFinalizeQA_Confirm_Click(object sender, EventArgs e)
        {
            Cloud.Modal("mdlSureFinalizeQA").Open();
        }


        public void btnInitializeGallaryPicture_Click(object sender, EventArgs e)
        {
            try
            {
                cmbGallaryPictureSurveyCategory_Populate();
                Cloud.Draw(txtGallaeryPictureTitle).Normal();

                int AssessmentImageID = int.Parse(vAssessmentImageID.Value.ToString());
                var Image = DataModal.getAssessmentImage(AssessmentImageID).ToList()[0];
                imgGallaryPicture.ImageUrl = "http://web.mitig8.co.za" + Image.PictureURL.ToString();
                cmbGallaryPictureSurveyCategory.SelectedValue = Image.SurveyCategoryID.ToString();
                txtGallaeryPictureTitle.Text = Image.Title.ToString();
                lblImageTitle.Text = Image.Title.ToString();
                Cloud.Modal("mdlGallaryPicture").Open();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnUpdateAssessmentImage_Click(object sender, EventArgs e)
        {
            try
            {

                int AssessmentImageID = int.Parse(vAssessmentImageID.Value.ToString());

                if (txtGallaeryPictureTitle.Text.Length < 0)
                {
                    Cloud.Draw(txtGallaeryPictureTitle).Highlight();
                    Cloud.MessageBox.Show("Please ensure you provided a title?", "Missing values...", MessageBoxType.info);
                    return;
                }

                Cloud.Draw(txtGallaeryPictureTitle).Normal();

                DataModal.updAssessmentImage(AssessmentImageID, int.Parse(cmbGallaryPictureSurveyCategory.SelectedValue), txtGallaeryPictureTitle.Text);

                Cloud.MessageBox.Show("Update successfull", "You alterations were made successfully, thank you.", MessageBoxType.success);

                setPictureGallary();

                Cloud.Modal("mdlGallaryPicture").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void cmbGallaryPictureSurveyCategory_Populate()
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
                cmbGallaryPictureSurveyCategory.DataSource = dt;
                cmbGallaryPictureSurveyCategory.DataValueField = "ID";
                cmbGallaryPictureSurveyCategory.DataTextField = "Description";
                cmbGallaryPictureSurveyCategory.DataBind();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbAlbumSurveyCategory_Populate()
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
                cmbAlbumSurveyCategory.DataSource = dt;
                cmbAlbumSurveyCategory.DataValueField = "ID";
                cmbAlbumSurveyCategory.DataTextField = "Description";
                cmbAlbumSurveyCategory.DataBind();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnInitializeGallaryUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                cmbAlbumSurveyCategory_Populate();
                int AssessmentID = int.Parse(vAssessmentID.Value);
                string CurrentLocation = vCurrentAlbumSurveyLocation.Value;
                int CurrentSurveyCategoryID = int.Parse(vCurrentAlbumSurveyCategoryID.Value);
                var Album = DataModal.getAssessmentAlbumDetails(AssessmentID, CurrentSurveyCategoryID, CurrentLocation).ToList()[0];
                txtAlbumComment.Text = Album.Comment;
                txtAlbumLocation.Text = Album.Location;
                cmbAlbumSurveyCategory.SelectedValue = Album.SurveyCategoryID.ToString();
                Cloud.Modal("mdlGallaryUpdate").Open();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnUpdateAlbum_Click(object sender, EventArgs e)
        {
            try
            {


                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
txtAlbumComment,txtAlbumLocation
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
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.", "Missing values?", MessageBoxType.question); return; }


                int AssessmentID = int.Parse(vAssessmentID.Value);
                string CurrentLocation = vCurrentAlbumSurveyLocation.Value;
                int CurrentSurveyCategoryID = int.Parse(vCurrentAlbumSurveyCategoryID.Value);
                DataModal.updAssessmentAlbumDetails(AssessmentID, CurrentSurveyCategoryID, int.Parse(cmbAlbumSurveyCategory.SelectedValue), CurrentLocation, txtAlbumLocation.Text, txtAlbumComment.Text);
                Cloud.MessageBox.Show("Update successfull", "You alterations were made successfully, thank you.", MessageBoxType.success);

                setPictureGallary();
                Cloud.Modal("mdlGallaryUpdate").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }



        public void btnAssesssmentAttachments_Populate()
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                StringBuilder sb = new StringBuilder();
                litAssessmentAttachments.Text = "";
                var Results = DataModal.getAssessmentAttachmentsView(AssessmentID).ToList();
                sb.AppendLine("<table class='table table-striped' id='tblAssessmentAttachments style='zoom: 88% !important'>");
                sb.AppendLine("                                           <thead>");
                sb.AppendLine("                                               <tr>");
                sb.AppendLine("                                                    <th>Survey Category</th>");
                sb.AppendLine("                                                    <th>Title</th>");
                sb.AppendLine("                                                    <th>Type</th>");
                sb.AppendLine("                                                    <th>Options</th>");
                sb.AppendLine("                                                </tr>");
                sb.AppendLine("                                              </thead>");
                sb.AppendLine("                                              <tbody>");

                if (Results.Count != 0)
                {
                    foreach (var Row in Results)
                    {
                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Row.Survey_Categories.ToString() + "</td>");
                        sb.AppendLine("<td>" + Row.Title + "</td>");
                        sb.AppendLine("<td>" + Row.Type + "</td>");
                        sb.AppendLine("<td><a target='_blank' href='" + Row.DocumentURL + "' class='btn btn-warning' title='Download'><i class='fas fa-file-download'></i>&nbsp;Download</a></td>");
                        sb.AppendLine("</tr>");
                    }
                }
                else
                {
                    sb.AppendLine("<tr><td colspan='6' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No attachments associated.</td></tr>");
                }
                sb.AppendLine("                                              </tbody>");
                sb.AppendLine("                                           </table>");


                litAssessmentAttachments.Text = sb.ToString();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnAssessmentAttachments_Click(object sender, EventArgs e)
        {
            try
            {
                btnAssesssmentAttachments_Populate();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnUploadAttachmentsHidden_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID"));
                litAttachmentsUploadFrame.Text = "<iframe src=\"upload/attachments/upload?AssessmentID=" + AssessmentID.ToString() + "&UserID=" + UserID.ToString() + "\" width=\"100%\" height=\"450px\" style=\"border:none;overflow-x:hidden\"></iframe> ";
                Cloud.Modal("mdlAttachmentsUpload").Open();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }



        public void btnDeleteImage_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentImageID = int.Parse(vAssessmentImageID.Value.ToString());


                Cloud.Draw(txtGallaeryPictureTitle).Normal();

                DataModal.updImageToTrash(AssessmentImageID);

                Cloud.MessageBox.Show("Deleted successfully", "You alterations were made successfully, thank you.", MessageBoxType.success);

                setPictureGallary();

                Cloud.Modal("mdlGallaryPicture").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnSaveBooking_Click(object sender, EventArgs e)
        {
            try
            {


                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
                {
txtBookingDate, txtConfirmedByName, txtConfirmedByCellphone
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
                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.", "Missing values?", MessageBoxType.question); return; }


                int AssessmentID = int.Parse(vAssessmentID.Value);
                DataModal.updAssessmentBooking(AssessmentID, DateTime.Parse(txtBookingDate.Text), txtConfirmedByName.Text, txtConfirmedByCellphone.Text, txtBookingNotes.Text);
                Cloud.MessageBox.Show("Booking set successfull", "You alterations were made successfully, thank you.", MessageBoxType.success);



            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void setAssessmentBooking()
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                var BookingDetails = DataModal.getdAssessmentBooking(AssessmentID).ToList()[0];
                txtBookingDate.Text = BookingDetails.BookingDate.Value.ToString("yyyy/MM/dd");
                txtBookingNotes.Text = BookingDetails.BookingNote.ToString();
                txtConfirmedByName.Text = BookingDetails.BookingConfirmedBy.ToString();
                txtConfirmedByCellphone.Text = BookingDetails.BookingConfirmedByContact.ToString();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnSaveSpecialRequests_Click(object sender, EventArgs e)
        {
            try
            {
                if (vAssessmentID.Value.ToString().Length > 1)
                {
                    int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                    string SpecialRequest = txtSpecialRequests.Text.ToString();
                    var Results = DataModal.updAssessmentSpecialRequest(AssessmentID, SpecialRequest);
                    Cloud.MessageBox.Show("Special Request Saved Successfully", "Success", MessageBoxType.success);
                }
                else
                {
                    Cloud.MessageBox.Show("Please save client details first before adding special requests.", "Special Requests", MessageBoxType.info);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setSpecialRequests(int AssessmentID)
        {
            try
            {
                txtSpecialRequests.Text = DataModal.getAssessmentSpecialRequest(AssessmentID).ToList()[0].ToString();
            }
            catch
            {
            }
        }


        public void txtOtherReferences_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtOtherReferences.Text.Trim().Length > 0)
                {

                    string[] Parcels = txtOtherReferences.Text.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);



                    lblOtherReferences.Text = Parcels.Length.ToString();
                }
                else
                {
                    lblOtherReferences.Text = "0";

                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        protected void btnOtherReferencesNavigate_Click(object sender, EventArgs e)
        {
            AssessmentTabControl AssessmentTabControl = new AssessmentTabControl
            {
                ID = "AssessmentTabControl",
                AssessmentTabs = new List<AssessmentTab>()
                            {
                         
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnOtherReferences", TabPanel="tabOtherReferences"}


                            }
            };
            TabState(AssessmentTabControl);
        }

        public void btnUpdateOtherReferences_Click(object sender, EventArgs e)
        {
            try
            {


                string[] References = txtOtherReferences.Text.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
                string Formatted = "";

                for (int x = 0; x < References.Length; x++)
                {
                    Formatted += References[x].ToString() + ",";
                }

                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                if (AssessmentID > 0)
                {
                    if (txtOtherReferences.Text.Trim().Length > 0)
                    {

                        DataModal.updAssessmentReference(AssessmentID, UserID, Formatted);
                        Cloud.MessageBox.Show(lblOtherReferences.Text + " References added successfully", "Other References", MessageBoxType.success);

                    }
                }
                else
                {
                  Cloud.MessageBox.Show("Please save client details first before adding references.", "Other References", MessageBoxType.warning);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void getAssessmentReferences()
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());

                var References = DataModal.getAssessmentReference(AssessmentID).ToList();
                foreach (String Reference in References)
                {

                    if (References.Last() == Reference)
                    {
                        txtOtherReferences.Text += Reference;
                        return;
                    }
                    txtOtherReferences.Text += Reference + Environment.NewLine;
                }
            }
            catch (Exception ex)
            {
               // Cloud.Exception(ex);
            }
        }
    }


}