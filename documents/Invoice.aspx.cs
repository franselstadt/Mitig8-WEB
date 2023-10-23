using SelectPdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Download = Request.QueryString["Download"].ToString();
            string Assessment = Request.QueryString["Assessment"].ToString();
            string Charge = Request.QueryString["Charge"].ToString();
            string VAT = Request.QueryString["VAT"].ToString();
            string FromID = Request.QueryString["FromID"].ToString();
            string ToID = Request.QueryString["ToID"].ToString();
            string Item = Request.QueryString["Item"].ToString();
            string InvoiceNo = Request.QueryString["Invoice"].ToString();

            DataModal dataModal = new DataModal();

            litInvoice.Text = dataModal.PDF_getInvoice(int.Parse(Assessment), int.Parse(VAT), decimal.Parse(Charge), int.Parse(FromID), int.Parse(ToID), int.Parse(InvoiceNo), Item).ToList()[0].Column1.ToString();

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
    Request.ApplicationPath.TrimEnd('/') + "/documents/invoice?download=no&Assessment="+Assessment+"&Charge="+Charge+"&VAT="+VAT+"&FromID="+FromID+"&ToID="+ToID+"&Item="+Item+"&Invoice=" + InvoiceNo;

                // set converter options
                converter.Options.PdfPageSize = pageSize;
                converter.Options.PdfPageOrientation = pdfOrientation;
                converter.Options.WebPageWidth = webPageWidth;
                converter.Options.WebPageHeight = webPageHeight;
                // create a new pdf document converting an url
                SelectPdf.PdfDocument doc = converter.ConvertUrl(url);
                //doc.Security.OwnerPassword = "test";
               // doc.Security.UserPassword = "test";
                doc.Save(Response, false, "Invoice-"+ InvoiceNo + ".pdf");
                doc.Close();
            }
            else
            {
              
            }
        }
    }
}