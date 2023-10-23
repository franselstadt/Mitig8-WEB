using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Assessments
{
    public partial class Valuations : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();


        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {
                btnInitialize_Click(sender, e);
            }
            Cloud.JS("ValuationsControls.Declare();");
        }


        public void btnInitialize_Click(object sender, EventArgs e)
        {
            try
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                
                setValuationsActive(UserID);
                setValuationsArchive(UserID);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


        public void setValuationsArchive(int UserID)
        {
            try
            {

                int Completed = 0;
                int Cancelled = 0;

                var Result = DataModal.getAssessmentValuationsAllArchive(UserID).ToList();
                StringBuilder sb = new StringBuilder();
                sb.Append("<table id='tblValuationsArchive' class='hover table table-striped table-bordered' style='font-size:13px;'>");
                sb.AppendLine("<thead><tr>");
                sb.AppendLine("<th>Valuation</th>");
                sb.AppendLine("<th>Type</th>");

                sb.AppendLine("<th>Date</th>");

                sb.AppendLine("<th>Reference</th>");
                sb.AppendLine("<th>Client</th>");
                sb.AppendLine("<th>Insurer</th>");
                sb.AppendLine("<th>Broker</th>");

                sb.AppendLine("<th>Address</th>");
                sb.AppendLine("<th>Price</th>");

                sb.AppendLine("<th>Status</th>");
                sb.AppendLine("<th>Open</th>");
                sb.AppendLine("</tr></thead><tbody>");

                foreach (var Row in Result)
                {
                    try
                    {
                        if (Row.Status.ToString().ToLower().Contains("complete"))
                        {
                            Completed++;
                        }

                        if (Row.Status.ToString().ToLower().Contains("cancel"))
                        {
                            Cancelled++;
                        }
                    }
                    catch { }

                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Row.Valuation.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Type.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Date.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Reference.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Client.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Insurer.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Broker.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Address.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Price.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Status.ToString() + "</td>");
                    sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\""+((Row.Type.ToString().ToLower() == "moveable assets") ? "openAssetsValueation" : "openBuildingsValueation") + "('" + Row.Valuation.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><i class='fas fa-external-link-alt'></i></a></div></td>");
                    sb.AppendLine("</tr>");
                }


                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                litValuationsArchive.Text = sb.ToString();
                lblComplete.Text = Completed.ToString();
                lblCancelled.Text = Cancelled.ToString();

                //}
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setValuationsActive(int UserID)
        {
            try
            {

                int Created = 0;
                int Feedback = 0;
                int Progress = 0;
                               
                var Result = DataModal.getAssessmentValuationsAllActive(UserID).ToList();
                StringBuilder sb = new StringBuilder();
                sb.Append("<table id='tblValuationsActive' class='hover table table-striped table-bordered' style='font-size:13px;'>");
                sb.AppendLine("<thead><tr>");
                sb.AppendLine("<th>Valuation</th>");
                sb.AppendLine("<th>Type</th>");
                sb.AppendLine("<th>Date</th>");
                sb.AppendLine("<th>Reference</th>");
                sb.AppendLine("<th>Client</th>");
                sb.AppendLine("<th>Insurer</th>");
                sb.AppendLine("<th>Broker</th>");
                sb.AppendLine("<th>Address</th>");
                sb.AppendLine("<th>Price</th>");
                sb.AppendLine("<th>Status</th>");
                sb.AppendLine("<th>Open</th>");
                sb.AppendLine("</tr></thead><tbody>");

                foreach (var Row in Result)
                {

                    try
                    {
                        if (Row.Status.ToString().ToLower().Contains("created"))
                        {
                            Created++;
                        }

                        if (Row.Status.ToString().ToLower().Contains("wait"))
                        {
                            Feedback++;
                        }

                        if (Row.Status.ToString().ToLower().Contains("progress"))
                        {
                            Progress++;
                        }

                    
                    }
                    catch { }

                    sb.AppendLine("<tr>");



                    sb.AppendLine("<td>" + Row.Valuation.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Type.ToString() + "</td>");

                    sb.AppendLine("<td>" + Row.Date.ToString() + "</td>");

                    sb.AppendLine("<td>" + Row.Reference.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Client.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Insurer.ToString() + "</td>");

                    sb.AppendLine("<td>" + Row.Broker.ToString() + "</td>");
                    sb.AppendLine("<td>" + Row.Address.ToString() + "</td>");
                    if (Row.QuoteID == 0)
                    {
                        sb.AppendLine("<td>" + Row.Price.ToString() + "</td>");
                    }
                    else
                    {
                        sb.AppendLine("<td>" + Row.Price.ToString() + "&nbsp<a class='btn btn-sm btn-success' OnClick='ValuationsControls.Functions.Accept(\""+Row.QuoteID.ToString()+ "\")'><i class='far fa-thumbs-up'></i></a>&nbsp;<a OnClick='ValuationsControls.Functions.Decline(\"" + Row.QuoteID.ToString() + "\")' class='btn btn-sm btn-danger'><i class='far fa-thumbs-down'></i></a></td>");
                    }
                    sb.AppendLine("<td>" + Row.Status.ToString() + "</td>");
                    sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\"" + ((Row.Type.ToString().ToLower() == "moveable assets") ? "openAssetsValueation" : "openBuildingsValueation") + "('" + Row.Valuation.ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><i class='fas fa-external-link-alt'></i></a></div></td>");
                    sb.AppendLine("</tr>");
                }


                sb.AppendLine("</tbody>");
                sb.Append("</table>");
                litValuationsActive.Text = sb.ToString();


                lblCreated.Text = Created.ToString();
                lblFeedback.Text = Feedback.ToString();
                lblInProgress.Text = Progress.ToString();
          

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnAccpetQuote_Click(object sender, EventArgs e)
        {
            try
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int QuoteID = int.Parse(vQuoteID.Value);
                int QuoteStatusID = int.Parse(vQuoteStatusID.Value);
                DataModal.confirmMoveableAssetsQuote(0, UserID, QuoteStatusID, QuoteID);
                if (QuoteStatusID == 2)
                {
                    Cloud.MessageBox.Show("Brilliant!", "Thank you, you may start the valuation.", MessageBoxType.success);
                }
                else
                {
                    Cloud.MessageBox.Show("Ouch!", "We are sorry you are not able to do this valuation.", MessageBoxType.info);
                }

                btnInitialize_Click(sender, e);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }


    }
}