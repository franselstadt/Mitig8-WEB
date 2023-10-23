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
    public partial class Download_AssessmentValuationMoveableAssets_ExecutiveSummary : System.Web.UI.Page
    {
        DataModal DataModal = new DataModal();
        protected void Page_Load(object sender, EventArgs e)
        {
            int Download = int.Parse(Request.QueryString["dl"].ToString());
            int Set = int.Parse(Request.QueryString["set"].ToString());
            string pdf_page_size = "A4";
            if (Download == 1)
            {
                var Pages = DataModal.PDF_getAssessmentMoveableAssetsValuation(int.Parse(Request.QueryString["AID"].ToString())).ToList();

                PdfSharp.Pdf.PdfDocument download = new PdfSharp.Pdf.PdfDocument();
                HtmlToPdf converter = new HtmlToPdf();


                for (int x = 0; x < Pages.Count; x++)
                {
                    string url =
                        Request.Url.Scheme + "://" + Request.Url.Authority +
    Request.ApplicationPath.TrimEnd('/') + "/documents/Download-AssessmentValuationMoveableAssets-ExecutiveSummary?dl=0&aid=" + Request.QueryString["AID"].ToString() + "&set=" + Pages[x].ID.ToString();



                    //documents/download-assessmentvaluationmoveableassets-executivesummary?aid=8924&dl=1&set=0
                    converter = new HtmlToPdf();
                    PdfDocument doc;

                    if (Pages[x].OrientationID == 2)
                    {
                        PdfPageSize pageSize = (PdfPageSize)Enum.Parse(typeof(PdfPageSize),
    pdf_page_size, true);

                        string pdf_orientation = "Landscape";
                        PdfPageOrientation pdfOrientation =
                            (PdfPageOrientation)Enum.Parse(typeof(PdfPageOrientation),
                            pdf_orientation, true);

                        
                        // instantiate a html to pdf converter object
                        // set converter options

                        converter.Options.PdfPageSize = pageSize;
                        converter.Options.PdfPageOrientation = pdfOrientation;
                        converter.Options.WebPageWidth = 1123;
                        converter.Options.WebPageHeight = 950;
                        converter.Options.MaxPageLoadTime = int.MaxValue;
                        converter.Options.JpegCompressionEnabled = true;

                        converter.Options.JpegCompressionLevel = 15;
                            
                            doc = converter.ConvertUrl(url);
                       
                    }
                    else
                    {
                        PdfPageSize pageSize = (PdfPageSize)Enum.Parse(typeof(PdfPageSize),
    pdf_page_size, true);

                        string pdf_orientation = "Portrait";
                        PdfPageOrientation pdfOrientation =
                            (PdfPageOrientation)Enum.Parse(typeof(PdfPageOrientation),
                            pdf_orientation, true);

                        // instantiate a html to pdf converter object
                        // set converter options
                        converter.Options.PdfPageSize = pageSize;
                        converter.Options.PdfPageOrientation = pdfOrientation;
                        converter.Options.WebPageWidth = 795;
                        converter.Options.WebPageHeight = 795;
                        converter.Options.MaxPageLoadTime = 240;
                        converter.Options.JpegCompressionEnabled = true;

                        converter.Options.JpegCompressionLevel = 15;
                        doc = converter.ConvertUrl(url);
                    }

                    MemoryStream pdfstream = new MemoryStream();
                    doc.Save(pdfstream);
                    if (Pages[x].OrientationID == 2)
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
                Response.AddHeader("content-disposition", "attachment;filename=MoveableAssets-Valuation-" + Request.QueryString["AID"].ToString() + ".pdf");
                Response.BinaryWrite(stream.ToArray());
                Response.Flush();
                stream.Close();
                Response.End();

            }
            else
            {
                var Pages = DataModal.PDF_getAssessmentMoveableAssetsValuation(int.Parse(Request.QueryString["AID"].ToString())).ToList();
                litExecutiveReport.Text = Pages.Where(P => P.ID == Set).ToList()[0].HTML.ToString();
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