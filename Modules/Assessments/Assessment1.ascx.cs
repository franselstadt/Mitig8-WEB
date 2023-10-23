using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Assessments
{
    public partial class Assessment1 : System.Web.UI.UserControl
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
            cmbProvince_Populate("01");

            try
            {
                cmbCategory_Populate();
                Cloud.JS("AssessmentControls.Declare();");
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
                Cloud.JS("AssessmentControls.Declare();");
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

    }
}