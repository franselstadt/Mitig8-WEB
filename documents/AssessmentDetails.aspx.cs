using SelectPdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.documents
{
    public partial class AssessmentDetails : System.Web.UI.Page
    {
        DataModal DataModal = new DataModal();

        protected void Page_Load(object sender, EventArgs e)
        {

            string Download = Request.QueryString["Download"].ToString();
            string AssessmentID = Request.QueryString["AssessmentID"].ToString();

            string pdf_page_size = "A4";
            PdfPageSize pageSize = (PdfPageSize)Enum.Parse(typeof(PdfPageSize),
                pdf_page_size, true);

            string pdf_orientation = "Portrait";
            PdfPageOrientation pdfOrientation =
                (PdfPageOrientation)Enum.Parse(typeof(PdfPageOrientation),
                pdf_orientation, true);

            int webPageWidth = 1014;
            try
            {
                webPageWidth = 794;
            }
            catch { }

            int webPageHeight = 0;
            try
            {
                webPageHeight = 795;
            }
            catch { }

            // instantiate a html to pdf converter object
            HtmlToPdf converter = new HtmlToPdf();
            // set converter options
            converter.Options.PdfPageSize = pageSize;
            converter.Options.PdfPageOrientation = pdfOrientation;
            converter.Options.WebPageWidth = webPageWidth;
            converter.Options.WebPageHeight = webPageHeight;
            converter.Options.MaxPageLoadTime = 240;

            if (Download == "yes")
            {
                // string url = "http://localhost:1375/documents/assessmentdetails?download=no;
                string url = Request.Url.Scheme + "://" + Request.Url.Authority +
    Request.ApplicationPath.TrimEnd('/') + "/documents/assessmentdetails?download=no&assessmentID=" + AssessmentID;

                // set converter options
                converter.Options.PdfPageSize = pageSize;
                converter.Options.PdfPageOrientation = pdfOrientation;
                converter.Options.WebPageWidth = webPageWidth;
                converter.Options.WebPageHeight = webPageHeight;
                // create a new pdf document converting an url
                SelectPdf.PdfDocument doc = converter.ConvertUrl(url);
        
                doc.Save(Response, false, "Assessment.pdf");
                doc.Close();
            }
            else
            {
                List<string> AssessmentHTMLRows = DataModal.PDF_getAssessmentDetails(int.Parse(AssessmentID)).ToList();
                foreach (string Row in AssessmentHTMLRows)
                {
                    litAssessmentDetails.Text += Row;
                }
                
            }
        }

        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }
    }
}