using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Reports
{
    public partial class Report : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        Data Data = new Data();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {
                Initialize();
            }
        }

        public void Initialize()
        {
            try
            {
                txtDateFrom.Text = DateTime.Now.AddDays(-7).ToString();
                txtDateTo.Text = DateTime.Now.AddDays(0).ToString();

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }



        public void btnValuationSummary_Click(object sender, EventArgs e)
        {
            try
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var wb = new XLWorkbook();
                wb.Worksheets.Add(Data.repValuationSummary(UserID, DateTime.Parse(txtDateFrom.Text), DateTime.Parse(txtDateTo.Text)), "ValuationSummary");
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=Valuation Summary From " + txtDateFrom.Text + " to " + txtDateTo.Text + ".xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnRiskReport_Click(object sender, EventArgs e)
        {
            try
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                var wb = new XLWorkbook();
                wb.Worksheets.Add(Data.repAssessmentRisk(UserID,DateTime.Parse(txtDateFrom.Text),DateTime.Parse(txtDateTo.Text)), "Risk Report");
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=Risk Report From " + txtDateFrom.Text + " to " + txtDateTo.Text + ".xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }
    }
}