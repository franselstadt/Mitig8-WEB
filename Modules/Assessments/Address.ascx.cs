using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Assessments
{
    public partial class Address : System.Web.UI.UserControl
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
            Address_Clear();

           

            int AddressID = int.Parse(vAddressID.Value.ToString());       
            cmbProvince_Populate("01");
            try
            {
                Cloud.JS("AddressControls.Declare();");
                if (AddressID != 0)
                {
                    getAssessmentAddress_Result1 Result = DataModal.getAssessmentAddress(AddressID).ToList()[0];
                    txtBuildingName.Text = Result.BuildingName;
                    txtBuilingUnit.Text = Result.BuildingUnit;
                    txtStreetName.Text = Result.StreetName;
                    txtStreetNumber.Text = Result.StreetNumber;
                    cmbProvince.SelectedValue = Result.Province;
                    cmbSuburb.SelectedValue = Result.Suburb;
                    cmbTown.SelectedValue = Result.Town;
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void Address_Clear()
        {
            try
            {
                txtStreetName.Text = "";
                txtStreetNumber.Text = "";
                txtBuilingUnit.Text = "";
                txtBuildingName.Text = "";
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
                Cloud.JS("AddressControls.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnInitialize_Click(object sender, EventArgs e)
        {
            Initialize();
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

        public void btnCloseAssessmentAddress_Click(object sender, EventArgs e)
        {
            try
            {
                Cloud.Modal("mdlAssessmentAddress").Close();
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void btnUpdateAssessmentAddress_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                int AddressID = int.Parse(vAddressID.Value.ToString());

                if (AssessmentID == 0)
                {
                    Cloud.MessageBox.Show("Please ensure you save client details first before adding a risk address.", "Risk Address", MessageBoxType.error);
                    return;
                }
                else
                {
                    bool Valid = true;
                    List<TextBox> Fields = new List<TextBox>()
                    {
                        txtBuildingName, txtBuilingUnit, txtStreetName, txtStreetNumber
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
                    if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values.","Missing values",MessageBoxType.error);return; }

                    if (AddressID == 0)
                    {



                        var Results = DataModal.getAssessmentAddresses(AssessmentID).ToList();
                        if (Results.Count > 0)
                        {
                            Cloud.JS("AddressControls.Duplicate();");
                            return;
                        }

                        int? DistrictID = DataModal.getDistrictID(cmbProvince.SelectedItem.Text.ToString(), cmbSuburb.SelectedItem.Text.ToString(), cmbTown.SelectedItem.Text.ToString()).ToList()[0];
                        DataModal.addAssessmentAddress(AssessmentID, DistrictID, txtStreetNumber.Text, txtStreetName.Text, txtBuilingUnit.Text, txtBuildingName.Text);
                        Cloud.JS("setTimeout(()=>{" +
                            "$('#Assessment_btnClientDetailsRiskAddresses').click();" +
                            "},250);");
                        Cloud.MessageBox.Show("Risk address added successfully.", "Success", MessageBoxType.success);
                    }
                    else
                    {
                        int? DistrictID = DataModal.getDistrictID(cmbProvince.SelectedItem.Text.ToString(), cmbSuburb.SelectedItem.Text.ToString(), cmbTown.SelectedItem.Text.ToString()).ToList()[0];
                        DataModal.updAssessmentAddress(AddressID,DistrictID,txtStreetNumber.Text,txtStreetName.Text,txtBuilingUnit.Text,txtBuildingName.Text);
                        Cloud.JS("setTimeout(()=>{" +
                            "$('#Assessment_btnClientDetailsRiskAddresses').click();" +
                            "},250);");
                        Cloud.MessageBox.Show("Risk address updated successfully.", "Success", MessageBoxType.success);
                    }
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnDuplicateAssessmentAddress_Click(object sender, EventArgs e)
        {
            try
            {
                int AssessmentID = int.Parse(vAssessmentID.Value.ToString());
                int? DistrictID = DataModal.getDistrictID(cmbProvince.SelectedItem.Text.ToString(), cmbSuburb.SelectedItem.Text.ToString(), cmbTown.SelectedItem.Text.ToString()).ToList()[0];

                var Results = DataModal.DuplicateAssessmentWithAddress(AssessmentID, DistrictID, txtStreetNumber.Text, txtStreetName.Text, txtBuilingUnit.Text, txtBuildingName.Text);

                Cloud.MessageBox.Show("View assessments page for new assessment with risk adress.", "Assessment duplicated successfully", MessageBoxType.info);
            }
            catch(Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}