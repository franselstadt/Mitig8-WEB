using SelectPdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.documents
{
    public partial class RiskReport : System.Web.UI.Page
    {
        DataModal DataModal = new DataModal();
        protected void Page_Load(object sender, EventArgs e)
        {
            int Download = int.Parse(Request.QueryString["dl"].ToString());
            int Set = int.Parse(Request.QueryString["set"].ToString());
            string pdf_page_size = "A4";
            if (Download == 1)
            {
                var Pages = DataModal.PDF_RiskReport(int.Parse(Request.QueryString["AID"].ToString())).ToList();

                PdfSharp.Pdf.PdfDocument download = new PdfSharp.Pdf.PdfDocument();
                for (int x = 0; x < Pages.Count; x++)
                {
                    string url =
                        Request.Url.Scheme + "://" + Request.Url.Authority +
    Request.ApplicationPath.TrimEnd('/') + "/documents/riskreport?dl=0&aid=" + Request.QueryString["AID"].ToString() + "&set=" + Pages[x].Number.ToString();


                    PdfDocument doc;
                    if (Pages[x].Number > 8 || Pages[x].Number == 3)
                    {
                        PdfPageSize pageSize = (PdfPageSize)Enum.Parse(typeof(PdfPageSize),
    pdf_page_size, true);

                        string pdf_orientation = "Landscape";
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
                        converter.Options.WebPageWidth = 1123;
                        converter.Options.WebPageHeight = 950;
                        converter.Options.MaxPageLoadTime = int.MaxValue;
                        doc = converter.ConvertUrl(url);
                        if (Pages[x].Number == 3)
                        {
                            System.Threading.Thread.Sleep(5000);
                        }
                    }
                    else
                    {
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
                        doc = converter.ConvertUrl(url);
                    }

                    MemoryStream pdfstream = new MemoryStream();
                    doc.Save(pdfstream);
                    if (Pages[x].Number > 8 || Pages[x].Number == 3)
                    {

                        var pagex = PdfSharp.Pdf.IO.PdfReader.Open(pdfstream, PdfSharp.Pdf.IO.PdfDocumentOpenMode.Import);
                        foreach (var pagei in pagex.Pages)
                        {
                            pagei.Orientation = PdfSharp.PageOrientation.Landscape;

                        }
                        CopyPages(pagex, download);
                    }
                    else
                    {

                        CopyPages(PdfSharp.Pdf.IO.PdfReader.Open(pdfstream, PdfSharp.Pdf.IO.PdfDocumentOpenMode.Import), download);


                    }
                }
                // Send PDF to browser
                MemoryStream stream = new MemoryStream();
                download.Save(stream, false);
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", stream.Length.ToString());
                Response.AddHeader("content-disposition", "attachment;filename=RiskReport-Assessment-" + Request.QueryString["AID"].ToString() + ".pdf");
                Response.BinaryWrite(stream.ToArray());
                Response.Flush();
                stream.Close();
                Response.End();

            }
            else
            {
                if (Set == 0)
                {
                    var Pages = DataModal.PDF_RiskReport(int.Parse(Request.QueryString["AID"].ToString())).ToList();


                    foreach (var Page in Pages)
                    {
                        litExecutiveReport.Text += Page.Page.ToString();
                    }
                    

                }
                else
                {
                    var Pages = DataModal.PDF_RiskReport(int.Parse(Request.QueryString["AID"].ToString())).ToList();

                    litExecutiveReport.Text = Pages.Where(P => P.Number == Set).ToList()[0].Page.ToString();

                }

            }


        }

        public void CopyPages(PdfSharp.Pdf.PdfDocument from, PdfSharp.Pdf.PdfDocument to)
        {
            for (int i = 0; i < from.PageCount; i++)
            {
                if (from.Pages[i].Orientation == PdfSharp.PageOrientation.Landscape)
                {
                    if (i == 0)
                    {
                        to.AddPage(from.Pages[i]);
                    }
                }
                else
                {
                    to.AddPage(from.Pages[i]);
                }
            }
        }
    }
}