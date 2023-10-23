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
    public partial class Assessment_Building_Valuation : System.Web.UI.UserControl
    {
        DataModal DataModal = new DataModal();
        Cloud Cloud = new Cloud();
        public void TabState(AssessmentBuildingTabControl TabControl)
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

        public class AssessmentBuildingTabControl
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
                int? AssessmentStatusID = 0;
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());

                tblAssesssmentBuildings_Populate();
                cmbTypeOfResidence_Populate();
                cmbRoofConstruction_Populate();
                cmbVicinity_Populate();
                cmbExtendOfLand_Populate();
                cmbBorders_Populate();
                setValuationDetails();
                setReports(AssessmentID);


                if (AssessmentID != 0)
                {
                    lblAssessment.Text = "Buidlings Valuation: " + AssessmentID.ToString();
                    setAssessmentUsers(AssessmentID);
                    setPropertyDetails(AssessmentID);
                    btnAssesssmentAttachments_Populate();
                    litExpenses.Text = DataModal.getAssessmentExpenses(AssessmentID).ToList()[0];


                    try
                    {
                        AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];
                    }
                    catch
                    {
                        AssessmentStatusID = 0;
                    }
                    setAssessmentBooking();
                }
                else
                {
                    lblAssessment.Text = "New Builings Valuation";
                }
                setAssessmentQuotes(AssessmentID);
                setAssessmentTracks(AssessmentID);
                int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                switch (UserTypeID)
                {
                    case 2: //Insurer or Broker
                    case 6:

                        //Delineate whether or not the Cancel/Delete button should be shown
                        if ((AssessmentID != 0 && AssessmentStatusID == 0) || (AssessmentID != 0 && AssessmentStatusID == 1) || (AssessmentID != 0 && AssessmentStatusID == 7))
                        {
                            btnCancelAssessment.Visible = true;
                            btnCancelAssessment.Text = "Cancel Valuation";
                        }
                        else
                        {
                            btnCancelAssessment.Visible = true;
                        }

                        if (AssessmentID == 0)
                        {
                            {
                                AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                                {
                                    ID = "BuildingControlTabControl",
                                    AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                //new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}

                            }
                                };
                                TabState(BuildingControlTabControl);
                            }
                        }
                        else if (AssessmentStatusID == 5)
                        {
                            {
                                AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                                {
                                    ID = "BuildingControlTabControl",
                                    AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                //new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}

                            }
                                };
                                TabState(BuildingControlTabControl);
                            }
                        }
                        else if (AssessmentStatusID == 4)
                        {
                            {
                                AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                                {
                                    ID = "BuildingControlTabControl",
                                    AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}

                            }
                                };
                                TabState(BuildingControlTabControl);
                            }
                        }
                        else if (AssessmentStatusID == 3 || AssessmentStatusID == 9)
                        {
                            btnCancelAssessment.Visible = true;
                            AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                            {
                                ID = "BuildingControlTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                //new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                 new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}




                            }
                            };
                            TabState(BuildingControlTabControl);
                            Cloud.JS("$('#btnAddQuote').hide();");
                        }
                        else if (AssessmentStatusID == 1)
                        {
                            btnCancelAssessment.Visible = true;
                            AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                            {
                                ID = "BuildingControlTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                //new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}

                            }
                            };
                            TabState(BuildingControlTabControl);
                            Cloud.JS("$('#btnAddQuote').hide();");
                        }
                        break;
                    case 5: //Assessor


                        if (AssessmentStatusID == 3)
                        {
                            btnCompleteValuation.Visible = true;
                        }
                        else
                        {
                            btnCompleteValuation.Visible = false;
                        }

                        if (AssessmentID == 0 || AssessmentID == 1)
                        {
                            Cloud.JS(" $(document).ready(function(){ let timerIntervalUnauthorized; Swal.fire({ title: 'Unauthorized',icon:'error', html: 'You will be redirected in <b></b> milliseconds.', timer: 5000,allowOutsideClick:false, timerProgressBar: true, onBeforeOpen: () => { Swal.showLoading(); timerIntervalUnauthorized = setInterval(() => { Swal.getContent().querySelector('b').textContent = Swal.getTimerLeft(); }, 100); }, onClose: () => { clearInterval(timerIntervalUnauthorized); window.location = '/dashboard'; } }).then((result) => { if (result.dismiss === Swal.DismissReason.timer) { console.log('I was closed by the timer'); } }); });");
                        }
                        else if (AssessmentStatusID == 9 || AssessmentStatusID == 5)
                        {

                            btnCancelAssessment.Visible = false;
                            AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                            {
                                ID = "BuildingControlTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                //new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}

                            }
                            };
                            TabState(BuildingControlTabControl);

                        }
                        else if (AssessmentStatusID == 3)
                        {
                            btnCancelAssessment.Visible = false;
                            AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                            {
                                ID = "BuildingControlTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}

                            }
                            };
                            TabState(BuildingControlTabControl);

                        }
                        else if (AssessmentStatusID == 4)
                        {
                            btnCancelAssessment.Visible = false;
                            AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                            {
                                ID = "BuildingControlTabControl",
                                AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentValuators", TabPanel="tabAssessmentValuators"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabBookings", TabPanel="tabBookings"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentProperty", TabPanel="tabAssessmentProperty"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentAttachments", TabPanel="tabAssessmentAttachments"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentBuildings", TabPanel="tabAssessmentBuildings"},
                                                                                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabExpenses", TabPanel="tabExpenses"}

                            }
                            };
                            TabState(BuildingControlTabControl);
                        }
                        break;
                }



                Declare();
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
                if (vAssessmentID.Value.Length > 0)
                {
                    int AssessmentID = int.Parse(vAssessmentID.Value);

                    int? AssessmentStatusID = 0;
                    try
                    {

                        AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];
                    }
                    catch
                    {
                        AssessmentStatusID = 0;
                    }

                    // string Script = "AssessmentBuildingValuationControls.Declare();";
                    string Script = "AssessmentBuildingValuationControls.Declare();$('.form-group').find('select').select2();";

                    int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                    if (UserTypeID == 3)
                    {
                        btnSaveRequest.Visible = true;
                    }
                    else if (UserTypeID == 5)
                    {
                        if (AssessmentStatusID == 3)
                        {
                            btnCompleteValuation.Visible = true;
                        }
                        else
                        {
                            btnCompleteValuation.Visible = false;
                        }
                    }
                    else if (UserTypeID == 2 || UserTypeID == 6)
                    {
                        try
                        {
                            //   btnSaveRequest.Visible = true;

                        }
                        catch
                        {
                            //Script += "$('#btnManageAutoCapture').hide();";
                        }

                        try
                        {

                            if (AssessmentStatusID > 1 || AssessmentStatusID == 7)
                            {
                                btnCancelAssessment.Visible = true;
                                btnSaveRequest.Visible = true;
                            }
                            else if (AssessmentStatusID < 2 || AssessmentStatusID == 7)
                            {
                                btnCancelAssessment.Visible = true;
                                btnSaveRequest.Visible = true;

                                if (AssessmentStatusID == 0 || AssessmentStatusID == 1)
                                {
                                    btnCancelAssessment.Text = "Cancel Valuation";
                                }
                                else
                                {
                                    btnCancelAssessment.Text = "Cancel Valuation";
                                }
                            }
                            else if (AssessmentStatusID > 1)
                            {
                                btnCancelAssessment.Visible = true;

                            }
                        }
                        catch
                        {
                            btnSaveRequest.Visible = true;
                        }


                        // Script += "$('#btnAddQuote').hide();";
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
                        //string Script = "";
                        //Script += "$('#btnAddRiskAddressJS').show();";
                        //Script += "$('#btnSaveClientDetailsJS').show();";
                        //Script += "$('#SavePolicyDetailsJS').show();";
                        //btnCancelAssessment.Visible = false;
                        //Cloud.JS("setTimeout(()=>{" + Script + "},5);");

                    }

                    if (AssessmentStatusID != 1 && AssessmentStatusID != 7)
                    {
                        btnCancelAssessment.Visible = false;
                    }
                }
                catch { }

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




        public void Assessment_Clear()
        {
            cmbProvince_Populate("01");
            cmbConfirmProvince_Populate("01");
        }

        public void cmbProvince_Populate(string CountryCode)
        {
            cmbProvince.DataSource = DataModal.getProvinces(CountryCode);
            cmbProvince.DataBind();
            cmbTown_Populate(cmbProvince.SelectedValue.ToString());
        }

        public void cmbProvince_Change(object sender, EventArgs e)
        {
            cmbTown_Populate(cmbProvince.SelectedValue);
        }

        public void cmbTown_Populate(string Province)
        {
            cmbTown.DataSource = DataModal.getTowns(Province);
            cmbTown.DataBind();
            cmbSuburb_Populate(cmbTown.SelectedValue.ToString());
        }

        public void cmbTown_Change(object sender, EventArgs e)
        {
            cmbSuburb_Populate(cmbTown.SelectedValue);
        }

        public void cmbSuburb_Populate(string Town)
        {
            cmbSuburb.DataSource = DataModal.getSuburbs(Town);
            cmbSuburb.DataBind();
        }




        public void cmbConfirmProvince_Populate(string CountryCode)
        {
            cmbConfirmProvince.DataSource = DataModal.getProvinces(CountryCode);
            cmbConfirmProvince.DataBind();
            cmbConfirmTown_Populate(cmbConfirmProvince.SelectedValue.ToString());
        }


        public void btnDropAssessmentBuilding_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int BuildingID = int.Parse(vAssessmentBuildingID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());

                DataModal.deleteAssessmentBuilding(AssessmentID, BuildingID, UserID);

                setAssessmentTracks(AssessmentID);

                setAssessmentTracks(AssessmentID);

                tblAssesssmentBuildings_Populate();


                Cloud.MessageBox.Show("Building deleted successfully along with room(s) and assets.", "Building deleted...", MessageBoxType.info);

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

            public void cmbConfirmProvince_Change(object sender, EventArgs e)
        {
            cmbConfirmTown_Populate(cmbConfirmProvince.SelectedValue);
        }

        public void cmbConfirmTown_Populate(string Province)
        {
            cmbConfirmTown.DataSource = DataModal.getTowns(Province);
            cmbConfirmTown.DataBind();
            cmbConfirmSuburb_Populate(cmbConfirmTown.SelectedValue.ToString());
        }

        public void cmbConfirmTown_Change(object sender, EventArgs e)
        {
            cmbConfirmSuburb_Populate(cmbConfirmTown.SelectedValue);
        }

        public void cmbConfirmSuburb_Populate(string Town)
        {
            cmbConfirmSuburb.DataSource = DataModal.getSuburbs(Town);
            cmbConfirmSuburb.DataBind();
        }

        public void setAssessmentRiskAddresses(int AssessmentID)
        {
            StringBuilder sb = new StringBuilder();


            // litClientDetailsRiskAddresses.Text = "";
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


            //  litClientDetailsRiskAddresses.Text = sb.ToString();
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


        public void setAssessmentQuotes(int AssessmentID)
        {
            try
            {
                int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var Results = DataModal.getAssessmentMoveableAssetsQuotes(AssessmentID).ToList();
                StringBuilder sb = new StringBuilder();
                sb.AppendLine("             <table class='table table-striped'>");
                sb.AppendLine("                    <thead>");
                sb.AppendLine("                        <tr>");
                sb.AppendLine("                            <th style='width: 20px'>ID</th>");
                sb.AppendLine("                            <th>Company</th>");
                sb.AppendLine("                            <th>Rating</th>");
                sb.AppendLine("                            <th>Respond Time</th>");
                sb.AppendLine("                            <th>Price</th>");
                if (UserTypeID == 2 || UserTypeID == 6)
                {
                    sb.AppendLine("                            <th style='width: 250px'>Response</th>");
                }
                //if (UserTypeID == 2 || UserTypeID == 1 || UserTypeID == 6)
                //{
                //    sb.AppendLine("                            <th style='width: 250px'>Options</th>");
                //}
                sb.AppendLine("                        </tr>");
                sb.AppendLine("                    </thead>");

                bool QuoteAccepted = false;

                if (AssessmentID != 0)
                {
                    sb.AppendLine("                    <tbody>");
                    foreach (var Quote in Results)
                    {



                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Quote.ID.ToString() + "</td>");
                        sb.AppendLine("<td>" + Quote.Company.ToString() + "</td>");
                        sb.AppendLine("<td><div class='progress progress-xs' style='height: 30px;'><div class='progress-bar progress-bar-yellow' style='width: " + (decimal.Parse(Quote.Rating.ToString()) * 10).ToString().Replace(",", ".") + "%'>" + Quote.Rating.ToString() + "/10</div></div></td>");
                        sb.AppendLine("<td>" + Quote.Typically_Responds.ToString() + "</td>");
                        sb.AppendLine("<td>R" + Quote.Quote.ToString() + "</td>");
                        if (Quote.StatusID == 2)
                        {
                            QuoteAccepted = true;
                            sb.AppendLine("<td><a><button class='btn btn-success' title='Accepted'><i class='far fa-handshake'></i>&nbsp;Accepted!</button></a></td>");
                        }
                        else if (Quote.StatusID == 3)
                        {
                            sb.AppendLine("<td><a><button class='btn btn-danger' title='Rejected'><i class='far fa-thumbs-down'></i>&nbsp;Rejected</button></a></td>");
                        }

                        else if (Quote.StatusID == 4)
                        {
                            sb.AppendLine("<td><a><button class='btn btn-warning' title='Rejected'><i class='fas fa-adjust fa-spin'></i>&nbsp;Awaiting Feedback</button></a></td>");
                        }
                        else
                        {
                            if (UserTypeID == 2 || UserTypeID == 6 || UserTypeID == 1)
                            {
                                sb.AppendLine("<td><a onclick=\"AssessmentBuildingValuationControls.Functions.AppointValueator('" + Quote.ID.ToString() + "');\" ><button class='btn btn-primary' title='Appoint'><i class='far fa-handshake'></i>&nbsp;Appoint</button></a></td>");
                            }
                            else
                            {
                                sb.AppendLine("<td><a><button class='btn btn-primary' title='Pending'><i class='fas fa-hourglass-half fa-spin'></i>&nbsp;Pending</button></a></td>");

                            }

                        }

                        //                    if (UserTypeID == 2 || UserTypeID == 6 || UserTypeID == 1)
                        //                    {
                        //                        sb.AppendLine("<td><a target='_blank' href='" + (Request.Url.Scheme + "://" + Request.Url.Authority +
                        //Request.ApplicationPath.TrimEnd('/') + "/documents/quote?download=no&quoteID=" + Quote.ID.ToString()).ToString() + "' class='btn btn-warning' title='View'><i class='fas fa-eye'></i>&nbsp;View</a>&nbsp;<a target='_blank' href='" + (Request.Url.Scheme + "://" + Request.Url.Authority +
                        //Request.ApplicationPath.TrimEnd('/') + "/documents/quote?download=yes&quoteID=" + Quote.ID.ToString()).ToString() + "' class='btn btn-warning' title='Download'><i class='fas fa-file-download'></i>&nbsp;Download</a></td>");

                        //                    }




                        sb.AppendLine("</tr>");
                    }
                    sb.AppendLine("</tbody>");
                    sb.AppendLine("</table>");
                }
                else
                {
                    sb.AppendLine("<tbody>");
                    sb.AppendLine("<tr><td colspan='8' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No valuators available contact Mitig8.</td></tr>");
                    sb.AppendLine("</tbody>");
                    sb.AppendLine("</table>");
                }
                litValuators.Text = sb.ToString();
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
                                sb.AppendLine("<button onclick=\"AssessmentBuildingValuationControls.Functions.UnassignAssessmentUser('" + Result.UserID.ToString() + "');\" type='button' class='btn btn-block btn-danger btn-sm'><i class='fas fa-user-minus'></i>&nbsp;Unassign</button>");
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
                                sb.AppendLine("<button onclick=\"AssessmentBuildingValuationControls.Functions.UnassignAssessmentUser('" + Result.UserID.ToString() + "');\" type='button' class='btn btn-block btn-danger btn-sm'><i class='fas fa-user-minus'></i>&nbsp;Unassign</button>");
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
            //btnSurveyReport.Text = "<button onclick='runSurveyReadOnly(\"" + SurveyID.ToString() + "\",\"" + vAssessmentID.Value + "\",\"" + Cloud.GetCookie("UserID") + "\");return false;' class=\"btn btn-warning\" title=\"Download\"><i class=\"fas fa-eye\"></i>&nbsp;View</button>";
            //btnExecutiveReport.Text = "<button   onclick='runEXEReport(\"" + vAssessmentID.Value + "\");return false;' class=\"btn btn-warning\" title=\"Download\"><i class=\"fas fa-eye\"></i>&nbsp;View</button>";
            //btnExecutiveReportDownload.Text = "<button  onclick='rundownloadEXEReport(\"" + vAssessmentID.Value + "\");return false;' class='btn btn-warning' title='Download'><i class='fas fa-file-download'></i>&nbsp;Download</button>";
            //btnSurveyReportDownload.Text = "<a href='/runsurvey/download?s=" + SurveyID.ToString() + "' class='btn btn-warning' title='Download'><i class='fas fa-file-download'></i>&nbsp;Download</a>";

            litReport.Text = "";

            //var Pages = DataModal.PDF_getAssessmentMoveableAssetsValuation(SurveyID).ToList();

            //foreach (var Page in Pages)
            //{
            //    litReport.Text += Page;
            //}

            litReport.Text = "<iframe src=\"/documents/assessmentvaluationmoveableassets-executivesummary?AssessmentID=" + SurveyID.ToString() + "\"  height=\"650px\" width=\"100%\" ></iframe>";

        }

        public void btnRefreshReport_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                setReports(AssessmentID);
            }
            catch { }
        }




        public void setAssessmentPolicyReadOnly(int AssessmentID)
        {
            //try
            //{
            //    litAssessmentPolicyReadOnly.Text = "<iframe src=\"/documents/assessmentdetails?assessmentid=" + AssessmentID.ToString() + "&download=no\"  height=\"650px\" width=\"100%\" ></iframe>";
            //}
            //catch (Exception ex)
            //{
            //    Cloud.Exception(ex);
            //}
        }




        public void btnCloseAutoCapture_Click(object sender, EventArgs e)
        {
            try
            {

                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID"));
                DataModal.cancelAutoCapture(AssessmentID, UserID);


                Cloud.Modal("mdlPolicyDocumentUpload").Close();
                Cloud.MessageBox.Show("Auto-capture request cancelled.", "Cancelled", MessageBoxType.info);
                string Script = "AssessmentBuildingValuationControls.Declare();";
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
                        Response.Redirect("/dashboard?MODULE=ASSESSMENT_ASSETS_VALUATION");
                        Cloud.MessageBox.Show("Valuation: " + AssessmentID.ToString() + " cancelled successfully.", "Valuation cancelled", MessageBoxType.info);

                    }
                    else
                    {
                        AssessmentBuildingTabControl BuildingControlTabControl = new AssessmentBuildingTabControl
                        {
                            ID = "BuildingControlTabControl",
                            AssessmentTabs = new List<AssessmentTab>()
                            {
                                new AssessmentTab {Active = true,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentClient", TabPanel="tabAssessmentClient"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentPolicy", TabPanel="tabAssessmentPolicy"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentQuotes", TabPanel="tabAssessmentQuotes"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentSurveys", TabPanel="tabAssessmentSurveys"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentUsers", TabPanel="tabAssessmentUsers"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Visible,TabButton = "btnTabAssessmentTracks", TabPanel="tabAssessmentTracks"},
//                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabGallery", TabPanel="tabAssessmentGallery"},
                                //new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentReports", TabPanel="tabAssessmentReports"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabVideos", TabPanel="tabAssessmentVideos"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentRiskManagement", TabPanel="tabAssessmentRiskManagement"},
                                new AssessmentTab {Active = false,State = AssessmentTabState.Hidden,TabButton = "btnTabAssessmentPolicyReadOnly", TabPanel="tabAssessmentPolicyPolicyReadOnly"}

                            }
                        };
                        TabState(BuildingControlTabControl);
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
                Cloud.MessageBox.Show("Thank you for supplying booking details.", "It is set!", MessageBoxType.success);



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
                var BookingDetails = DataModal.getdAssessmentBooking(AssessmentID).ToList();
                if (BookingDetails.Count > 0)
                {
                    txtBookingDate.Text = BookingDetails[0].BookingDate.Value.ToString("yyyy/MM/dd");
                    txtBookingNotes.Text = BookingDetails[0].BookingNote.ToString();
                    txtConfirmedByName.Text = BookingDetails[0].BookingConfirmedBy.ToString();
                    txtConfirmedByCellphone.Text = BookingDetails[0].BookingConfirmedByContact.ToString();
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }




        public void tblAssesssmentBuildings_Populate()
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                StringBuilder sb = new StringBuilder();
                litAssessmentAttachments.Text = "";
                var Results = DataModal.getAssessmentAssetValuationBuildings(AssessmentID).ToList();
                sb.AppendLine("<table class='table table-striped' id='tblAssessmentBuildings style='zoom: 88% !important'>");
                sb.AppendLine("                                           <thead>");
                sb.AppendLine("                                               <tr>");
                sb.AppendLine("                                                    <th>Title</th>");
                sb.AppendLine("                                                    <th>Description</th>");
                sb.AppendLine("                                                    <th>Rooms</th>");
                sb.AppendLine("                                                    <th>Assets</th>");
                sb.AppendLine("                                                    <th>Value</th>");
                sb.AppendLine("                                                    <th>Options</th>");
                sb.AppendLine("                                                </tr>");
                sb.AppendLine("                                              </thead>");
                sb.AppendLine("                                              <tbody>");

                if (Results.Count != 0)
                {
                    foreach (var Row in Results)
                    {
                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Row.Title.ToString() + "</td>");
                        sb.AppendLine("<td>" + Row.Description.ToString() + "</td>");
                        sb.AppendLine("<td>" + Row.Rooms.ToString() + "</td>");
                        sb.AppendLine("<td>" + Row.Assets.ToString() + "</td>");
                        sb.AppendLine("<td>" + Row.Value.ToString() + "</td>");
                        sb.AppendLine("<td><a class='btn btn-warning' onclick='AssessmentBuildingValuationControls.Building.Open(\"" + Row.ID.ToString() + "\");' title='Open'><i class='far fa-eye'></i>&nbsp;Open</a>&nbsp;<a onclick='AssessmentBuildingValuationControls.Functions.DeleteBuilding(\"" + Row.ID.ToString() + "\");' class='btn btn-danger' title='Open'><i class='far fa-trash-alt'></i>&nbsp;Delete</a></td>");
                        sb.AppendLine("</tr>");
                    }

                    chartBuildings.Visible = true;
                }
                else
                {
                    sb.AppendLine("<tr><td colspan='6' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No buidlings associated.</td></tr>");
                    chartBuildings.Visible = false;

                }
                sb.AppendLine("</tbody>");
                sb.AppendLine("</table>");



                chartBuildings.DataSource = Results;
                chartBuildings.DataBind();


                litAssessmentBuildings.Text = sb.ToString();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }




        public void btnOpenAssessmentBuilding_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlBuilding").Open();
                AssessmentBuilding_Reset();
                int BuildingID = int.Parse(vBuildingID.Value.ToString());
                if (BuildingID == 0)
                {
                    lblBuidlingTitle.Text = "New Building";
                    return;
                }
                else
                {

                    lblBuidlingTitle.Text = "Edit Building";
                }


                var Building = DataModal.getAssessmentBuilding(BuildingID).ToList()[0];
                txtBuildingDescription.Text = Building.Description.ToString();
                txtBuildingTitle.Text = Building.Title.ToString();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void AssessmentBuilding_Reset()
        {
            try
            {
                txtBuildingDescription.Text = "";
                txtBuildingTitle.Text = "";
                Cloud.Draw(txtBuildingDescription).Normal();
                Cloud.Draw(txtBuildingTitle).Normal();

            }
            catch (Exception ex) { }
        }

 




        

        public void btnSaveBuilding_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int BuildingID = int.Parse(vBuildingID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                string BuildingTitle = txtBuildingTitle.Text.ToString();
                string BuildingDescription = txtBuildingDescription.Text;

                if (BuildingID == 0)
                {
                    DataModal.AddAssessmentBuilding(BuildingDescription, UserID, AssessmentID, BuildingTitle);
                }
                else
                {
                    DataModal.updAssessmentBuilding(BuildingID, BuildingTitle, BuildingDescription, 0, UserID);
                }
                tblAssesssmentBuildings_Populate();
                Cloud.MessageBox.Show("Building saved successfully", BuildingTitle, MessageBoxType.success);

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnSaveAndNext_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void cmbTypeOfResidence_Populate()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Objects = DataModal.getTypeOfResidence().ToList();
                foreach (var Object in Objects)
                {
                    dt.Rows.Add(Object.ID, Object.Description);
                }
                cmbTypeOfResidence.DataSource = dt;
                cmbTypeOfResidence.DataValueField = "ID";
                cmbTypeOfResidence.DataTextField = "Description";
                cmbTypeOfResidence.DataBind();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbRoofConstruction_Populate()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Objects = DataModal.getRoofConstruction().ToList();
                foreach (var Object in Objects)
                {
                    dt.Rows.Add(Object.ID, Object.Description);
                }
                cmbRoofConstruction.DataSource = dt;
                cmbRoofConstruction.DataValueField = "ID";
                cmbRoofConstruction.DataTextField = "Description";
                cmbRoofConstruction.DataBind();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }



        public void cmbVicinity_Populate()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Objects = DataModal.getVicinity().ToList();
                foreach (var Object in Objects)
                {
                    dt.Rows.Add(Object.ID, Object.Description);
                }
                cmbVicinity.DataSource = dt;
                cmbVicinity.DataValueField = "ID";
                cmbVicinity.DataTextField = "Description";
                cmbVicinity.DataBind();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbExtendOfLand_Populate()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Objects = DataModal.getExtentOfLand().ToList();
                foreach (var Object in Objects)
                {
                    dt.Rows.Add(Object.ID, Object.Description);
                }
                cmbExtentOfLand.DataSource = dt;
                cmbExtentOfLand.DataValueField = "ID";
                cmbExtentOfLand.DataTextField = "Description";
                cmbExtentOfLand.DataBind();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void cmbBorders_Populate()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Description");
                var Objects = DataModal.getBorders().ToList();
                foreach (var Object in Objects)
                {
                    dt.Rows.Add(Object.ID, Object.Description);
                }
                cmbBorders.DataSource = dt;
                cmbBorders.DataValueField = "ID";
                cmbBorders.DataTextField = "Description";
                cmbBorders.DataBind();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnSaveRequest_Click(object senderef, EventArgs e)
        {

            int? AssessmentID = int.Parse(vAssessmentID.Value.ToString());

            if (AssessmentID != 0)
            {
                int? AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];

                int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                if ((UserTypeID != 2))
                {
                    Cloud.MessageBox.Show("You do not have permissions to perform this function", "Permissions Denied", MessageBoxType.error);
                    return;
                }
            }
            int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());

            bool Valid = true;
            List<TextBox> Fields = new List<TextBox>()
            {
                txtClienName, txtClientContactNumber, txtClientEmailAddress, txtStreetName, txtPostalCode, txtStreetNumber, txtBuildingName, txtTotalValuationAmount
            };

            foreach (TextBox Field in Fields)
            {
                if (Field.Text.Length < 1)
                {
                    Cloud.Draw(Field).Highlight();
                    Valid = false;
                }
                else
                {
                    Cloud.Draw(Field).Normal();
                }
            }

            if (!Valid)
            {
                Cloud.MessageBox.Show("Please ensure valid valution-and-property details.", "Inavlid Details", MessageBoxType.warning); return;
            }

            //List<DropDownList> DropDownLists = new List<DropDownList>()
            //{
            //    cmbAccessControl, cmbArmedResponse, cmbCCTV, cmbPerimeterWall, cmbElectricFence, cmbBarbedWire, cmbGuardOnPatrol, cmbSecurityGates, cmbInternalSecurityBeams, cmbExternalSecurityBeams, cmbAlarmSystem, cmbWindowSecurityMeasures, cmbThatchStructures, cmbWoodenStructures, cmbFireFightingEquipment
            //};


            //foreach (DropDownList RiskOption in DropDownLists)
            //{
            //    if (RiskOption.SelectedItem.Value == "-1") { Cloud.Draw(RiskOption).Highlight(); Valid = false; }
            //    else { Cloud.Draw(RiskOption).Normal(); }
            //}

            //if (!Valid)
            //{
            //    Cloud.MessageBox.Show("Please ensure valid property details.", "Inavlid Property Details", MessageBoxType.warning); return;
            //}


            if (AssessmentID == 0)
            {
                AssessmentID = DataModal.addAssessmentBuildingValuation(
                         txtClienName.Text,
                         txtClientContactNumber.Text,
                         txtClientEmailAddress.Text,
                         txtClientPolicyNumber.Text,
                         txtClaimNumber.Text,
                         txtInsurerName.Text,
                         txtInsurerContactPerson.Text,
                         txtInsurerContactNumber.Text,
                         txtInsurerEmail.Text,
                         txtInsurerFunction.Text,
                         txtBrokerName.Text,
                         txtBrokerContactPerson.Text,
                         txtBrokerContactNumber.Text,
                         txtBrokerEmail.Text,
                         txtBrokerFunction.Text,
                         cmbProvince.SelectedItem.Text.ToString(),
                         cmbTown.SelectedItem.Text.ToString(),
                         cmbSuburb.SelectedItem.Text.ToString(),
                         txtPostalCode.Text,
                         txtStreetNumber.Text,
                         txtStreetName.Text,
                         txtBuildingName.Text,
                         0,
                         int.Parse(cmbTypeOfResidence.SelectedValue.ToString()),
                         int.Parse(cmbRoofConstruction.SelectedValue.ToString()),
                         int.Parse(cmbVicinity.SelectedValue.ToString()),
                         int.Parse(cmbExtentOfLand.SelectedValue.ToString()),
                         int.Parse(cmbBorders.SelectedValue.ToString()),
                         txtSecurityComments.Text,
                         int.Parse(cmbAccessControl.SelectedValue.ToString()),
                         int.Parse(cmbArmedResponse.SelectedValue.ToString()),
                         int.Parse(cmbCCTV.SelectedValue.ToString()),
                         int.Parse(cmbPerimeterWall.SelectedValue.ToString()),
                         int.Parse(cmbElectricFence.SelectedValue.ToString()),
                         int.Parse(cmbBarbedWire.SelectedValue.ToString()),
                         int.Parse(cmbGuardOnPatrol.SelectedValue.ToString()),
                         int.Parse(cmbSecurityGates.SelectedValue.ToString()),
                         int.Parse(cmbInternalSecurityBeams.SelectedValue.ToString()),
                         int.Parse(cmbExternalSecurityBeams.SelectedValue.ToString()),
                         int.Parse(cmbAlarmSystem.SelectedValue.ToString()),
                         int.Parse(cmbWindowSecurityMeasures.SelectedValue.ToString()),
                         txtSecurityComments.Text,
                                  int.Parse(cmbThatchStructures.SelectedValue.ToString()),
                         int.Parse(cmbWoodenStructures.SelectedValue.ToString()),
                         int.Parse(cmbFireFightingEquipment.SelectedValue.ToString()),
                         txtOtherPotentialRisk.Text,
                         txtFireGeneralComments.Text,
                         decimal.Parse(txtTotalValuationAmount.Text),
                         UserID).ToList()[0];


                lblAssessment.Text = "<i class='fas fa-spinner fa-spin'></i>&nbsp;Loading...";
                Cloud.JS("AssessmentBuildingValuationControls.Initialze('" + AssessmentID.ToString() + "');");
                Cloud.MessageBox.Show("Valuation with ID: " + AssessmentID.ToString() + " created successfully.", "Valuation Saved", MessageBoxType.success);
            }
            else
            {

                DataModal.updAssessmentBuildingValuation(AssessmentID,
                    txtClienName.Text,
                    txtClientContactNumber.Text,
                    txtClientEmailAddress.Text,
                    txtClientPolicyNumber.Text,
                    txtClaimNumber.Text,
                    txtInsurerName.Text,
                    txtInsurerContactPerson.Text,
                    txtInsurerContactNumber.Text,
                    txtInsurerEmail.Text,
                    txtInsurerFunction.Text,
                    txtBrokerName.Text,
                    txtBrokerContactPerson.Text,
                    txtBrokerContactNumber.Text,
                    txtBrokerEmail.Text,
                    txtBrokerFunction.Text,
                    cmbProvince.SelectedItem.Text,
                    cmbTown.SelectedItem.Text,
                    cmbSuburb.SelectedItem.Text,
                    txtPostalCode.Text,
                    txtStreetNumber.Text,
                    txtStreetName.Text,
                    txtBuildingName.Text,
                    decimal.Parse(txtTotalValuationAmount.Text),
                    UserID
                    );
                Cloud.MessageBox.Show("Valuation with ID: " + AssessmentID.ToString() + " updated successfully.", "Valuation Saved", MessageBoxType.success);
            }

        }

        public void setValuationDetails()
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                if (AssessmentID != 0)
                {
                    var x = DataModal.getAssessmentMovableAssetsValuation(AssessmentID).ToList()[0];
                    txtClienName.Text = x.InsuredName;
                    txtClientContactNumber.Text = x.InsuredContactNumber;
                    txtClientEmailAddress.Text = x.InsuredEmailAddress;
                    txtClientPolicyNumber.Text = x.InsurancePolicyNumber;
                    txtClaimNumber.Text = x.ClaimNumber;
                    txtInsurerName.Text = x.InsurerName;
                    txtInsurerContactPerson.Text = x.InsurerContactPerson;
                    txtInsurerContactNumber.Text = x.InsurerContactNumber;
                    txtInsurerEmail.Text = x.InsurerEmailAddress;
                    txtInsurerFunction.Text = x.InsurerFunction;
                    txtBrokerName.Text = x.BrokerName;
                    txtBrokerContactPerson.Text = "";
                    txtBrokerContactNumber.Text = x.BrokerContactNumber;
                    txtBrokerEmail.Text = x.BrokerEmailAddress;
                    txtBrokerFunction.Text = x.BrokerFunction;
                    cmbProvince.SelectedValue = x.Province;
                    cmbTown_Populate(x.Province);
                    cmbTown.SelectedValue = x.Town;
                    cmbSuburb_Populate(x.Town);
                    cmbSuburb.SelectedValue = x.Suburb;
                    txtPostalCode.Text = x.PostalCode;
                    txtStreetNumber.Text = x.StreetNumber;
                    txtStreetName.Text = x.StreetName;
                    txtBuildingName.Text = x.BuildingName;
                    txtTotalValuationAmount.Text = x.TotalValuationAmmount.ToString();
                    txtBrokerContactPerson.Text = x.BrokerContactPerson;
                    lblAssessment.Text = "Valuation: " + AssessmentID.ToString();
                    setAssessmentQuotes(AssessmentID);
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }

        }

        public void btnAppointMoovableAssetsValuator_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int QuoteID = int.Parse(vQuoteID.Value.ToString());
                DataModal.appointMoovableAssetsValuator(QuoteID, UserID);

                btnCancelAssessment.Visible = true;
                setAssessmentQuotes(AssessmentID);
                Cloud.JS("swal.fire('Fantastic', 'We notified valuator and you should receive feedback shortly', 'success');");
            }
            catch
            {
                //   Cloud.Exception(ex);
            }
        }


        













        public void btnOpenAddExpense_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID"));
                litExpense.Text = "<iframe src=\"upload/assets/expense/item?AssessmentID=" + AssessmentID.ToString() + "&UserID=" + UserID.ToString() + "\" width=\"100%\" height=\"450px\" style=\"border:none;overflow-x:hidden\"></iframe>";
                Cloud.Modal("mdlExpense").Open();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }





        public void btnUploadExpenseFinish_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                litExpenses.Text = "";
                litExpenses.Text = DataModal.getAssessmentExpenses(AssessmentID).ToList()[0];
                Cloud.Modal("mdlExpense").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }





        public void btnUpdatePropertyDetails_Click(object sender, EventArgs e)
        {
            try
            {
                int? AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                if (AssessmentID != 0)
                {
                    int? AssessmentStatusID = DataModal.getAssessmentStatusID(AssessmentID).ToList()[0];

                    int UserTypeID = int.Parse(Cloud.GetCookie("UserTypeID").ToString());
                    if (UserTypeID != 5)
                    {
                        Cloud.MessageBox.Show("You do not have permissions to perform this function", "Permissions Denied", MessageBoxType.error);
                        return;
                    }
                }
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());

                bool Valid = true;
                List<TextBox> Fields = new List<TextBox>()
            {
                txtConfirmBuildingName, txtConfirmStreetName, txtConfirmStreetNumber, txtConfirmPostalCode
            };

                foreach (TextBox Field in Fields)
                {
                    if (Field.Text.Length < 1)
                    {
                        Cloud.Draw(Field).Highlight();
                        Valid = false;
                    }
                    else
                    {
                        Cloud.Draw(Field).Normal();
                    }
                }

                if (!Valid)
                {
                    Cloud.MessageBox.Show("Please ensure valid property details.", "Eish!", MessageBoxType.warning); return;
                }

                List<DropDownList> DropDownLists = new List<DropDownList>()
                {
                    cmbAccessControl, cmbArmedResponse, cmbCCTV, cmbPerimeterWall, cmbElectricFence, cmbBarbedWire, cmbGuardOnPatrol, cmbSecurityGates, cmbInternalSecurityBeams, cmbExternalSecurityBeams, cmbAlarmSystem, cmbWindowSecurityMeasures, cmbThatchStructures, cmbWoodenStructures, cmbFireFightingEquipment
                };


                foreach (DropDownList RiskOption in DropDownLists)
                {
                    if (RiskOption.SelectedItem.Value == "-1") { Cloud.Draw(RiskOption).Highlight(); Valid = false; }
                    else { Cloud.Draw(RiskOption).Normal(); }
                }

                if (!Valid)
                {
                    Cloud.MessageBox.Show("Please ensure valid property details.", "Eish!", MessageBoxType.warning); return;
                }


                DataModal.updAssessmentMovableAssetsValuationPropertyDetails(AssessmentID,
                     int.Parse(cmbTypeOfResidence.SelectedValue),
                     int.Parse(cmbRoofConstruction.SelectedValue),
                     int.Parse(cmbVicinity.SelectedValue),
                     int.Parse(cmbExtentOfLand.SelectedValue),
                     int.Parse(cmbBorders.SelectedValue),
                     txtGeneralComments.Text,
                     int.Parse(cmbAccessControl.SelectedValue),
                     int.Parse(cmbArmedResponse.SelectedValue),
                     int.Parse(cmbCCTV.SelectedValue),
                     int.Parse(cmbPerimeterWall.SelectedValue),
                     int.Parse(cmbElectricFence.SelectedValue),
                     int.Parse(cmbBarbedWire.SelectedValue),
                     int.Parse(cmbGuardOnPatrol.SelectedValue),
                     int.Parse(cmbSecurityGates.SelectedValue),
                     int.Parse(cmbInternalSecurityBeams.SelectedValue),
                     int.Parse(cmbExternalSecurityBeams.SelectedValue),
                     int.Parse(cmbAlarmSystem.SelectedValue),
                     int.Parse(cmbWindowSecurityMeasures.SelectedValue),
                     txtSecurityComments.Text,
                     int.Parse(cmbThatchStructures.SelectedValue),
                     int.Parse(cmbWoodenStructures.SelectedValue),
                     int.Parse(cmbFireFightingEquipment.SelectedValue),
                     txtOtherPotentialRisk.Text,
                     txtFireGeneralComments.Text,
                     cmbConfirmProvince.SelectedItem.Text,
                     cmbConfirmTown.SelectedItem.Text,
                     cmbConfirmSuburb.SelectedItem.Text,
                     txtConfirmPostalCode.Text,
                     txtConfirmStreetNumber.Text,
                     txtConfirmStreetName.Text,
                     txtConfirmBuildingName.Text,
                     UserID);
                setPropertyDetails(int.Parse(AssessmentID.ToString()));
                Cloud.MessageBox.Show("Property details saved successfully", "Brilliant!", MessageBoxType.success);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setPropertyDetails(int AssementID)
        {
            try
            {
                var x = DataModal.getAssessmentMovableAssetsValuationPropertyDetails(AssementID).ToList()[0];

                try
                {
                    cmbConfirmProvince.SelectedValue = x.Province;
                    cmbConfirmTown_Populate(x.Province);
                    cmbConfirmTown.SelectedValue = x.Town;
                    cmbConfirmSuburb_Populate(x.Town);
                    cmbConfirmSuburb.SelectedValue = x.Suburb;
                    txtConfirmStreetName.Text = x.StreetName;
                    txtConfirmStreetNumber.Text = x.StreetNumber;
                    txtConfirmPostalCode.Text = x.PostalCode;
                    txtConfirmBuildingName.Text = x.BuildingName;
                }
                catch { }

                try
                {
                    cmbTypeOfResidence.SelectedValue = x.TypeOfResidenceID.ToString();
                    cmbRoofConstruction.SelectedValue = x.RoofConstructionID.ToString();
                    cmbVicinity.SelectedValue = x.VicinityID.ToString();
                    cmbExtentOfLand.SelectedValue = x.ExtendoflandID.ToString();
                    cmbBorders.SelectedValue = x.BordersID.ToString();
                    txtGeneralComments.Text = x.AddressGeneralComments;
                }
                catch { }

                try
                {
                    cmbAccessControl.SelectedValue = x.AccessControl.ToString();
                    cmbArmedResponse.SelectedValue = x.ArmedResponse.ToString();
                    cmbCCTV.SelectedValue = x.CCTV.ToString();
                    cmbPerimeterWall.SelectedValue = x.PerimeterWall.ToString();
                    cmbElectricFence.SelectedValue = x.ElectricFence.ToString();
                    cmbBarbedWire.SelectedValue = x.BarbedWire.ToString();
                    cmbGuardOnPatrol.SelectedValue = x.Guards.ToString();
                    cmbSecurityGates.SelectedValue = x.SecurityGate.ToString();
                    cmbInternalSecurityBeams.SelectedValue = x.InternalSecurityBeams.ToString();
                    cmbExternalSecurityBeams.SelectedValue = x.ExternalSecurityBeams.ToString();
                    cmbAlarmSystem.SelectedValue = x.AlarmSystem.ToString();
                    cmbWindowSecurityMeasures.SelectedValue = x.WindowSecurity.ToString();
                    txtSecurityComments.Text = x.SecurityGeneralComments.ToString();
                    cmbThatchStructures.SelectedValue = x.FireThatch.ToString();
                    cmbWoodenStructures.SelectedValue = x.FireWoodenStruct.ToString();
                    cmbFireFightingEquipment.SelectedValue = x.FireFighthingEquipment.ToString();
                    txtOtherPotentialRisk.Text = x.OtherFireRisk;
                    txtFireGeneralComments.Text = x.FireGeneralComments;
                }
                catch { }
            }
            catch { }
        }


        public void btnExpense_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int ExpenseID = int.Parse(vExpenseID.Value);
                DataModal.deleteAssessmentExpense(ExpenseID);
                Cloud.MessageBox.Show("Expense deleted successfully", "Expense: " + ExpenseID.ToString(), MessageBoxType.info);
                litExpenses.Text = DataModal.getAssessmentExpenses(AssessmentID).ToList()[0];
            }
            catch
            {
                //   Cloud.Exception(ex);
            }
        }


      

   


      

  

 

       


     
        public void btnCompleteValuation_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value);
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                btnCompleteValuation.Visible = false;
                DataModal.updCompleteMoveableAssetsvaluation(AssessmentID, UserID);
                Cloud.MessageBox.Show("Well done valuation is complete now.", "Bravo!", MessageBoxType.success);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }


}