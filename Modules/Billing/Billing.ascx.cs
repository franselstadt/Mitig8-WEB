using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.Modules.Billing
{
    public partial class Billing : System.Web.UI.UserControl
    {
        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this.Page);
            if (!IsPostBack)
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                setBillingStats(UserID);
                setBillingTransaction(UserID);
                setBillingInvoices(UserID);
                setBankAccountDetails(CompanyID);
            }
            Declare();
        }

        public void Initialize()
        {
            try
            {

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
              Cloud.JS("BillingControls.Declare();");
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void btnInitialize_Click(object sender, EventArgs e)
        {
            try
            {
                int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
                int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
                setBillingStats(UserID);
                setBillingTransaction(UserID);
                setBillingInvoices(UserID);
                setBankAccountDetails(CompanyID);
            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setBillingStats(int UserID)
        {
            Mitig8.Domain.Items.View.BillingStatsViewItem stats = new Mitig8.Application.Billing.BillingApplication().ReadStats(UserID);
            lblAvailableBalance.Text = "R" + stats.AvailableBalance.ToString();
            lblRenewalFee.Text = "R" + stats.RenewalFee.ToString();
            lblUnpaidBalance.Text = "R" + stats.UnpaidInvoices.ToString();
        }

        public void setBillingTransaction(int UserID)
        {
            var Transactions = DataModal.getBillingTransactions(UserID).ToList();

            StringBuilder sb = new StringBuilder();


            sb.AppendLine("<table class='table table-striped' id='tblBillingTransactions' style='zoom: 88% !important'>");
            sb.AppendLine("                                           <thead>");
            sb.AppendLine("                                               <tr>");
            sb.AppendLine("                                                    <th>Date</th>");
            sb.AppendLine("                                                    <th>From Account</th>");
            sb.AppendLine("                                                    <th>To Account</th>");
            sb.AppendLine("                                                    <th>Reference</th>");
            sb.AppendLine("                                                    <th>Amount</th>");
            sb.AppendLine("                                                    <th>Balance</th>");
            sb.AppendLine("                                                    <th>Dispute</th>");

            sb.AppendLine("                                                </tr>");
            sb.AppendLine("                                              </thead>");
            sb.AppendLine("                                              <tbody>");

            if (Transactions.Count != 0)
            {
                foreach (var Transaction in Transactions)
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td>" + Transaction.Date.ToString() + "</td>");
                    sb.AppendLine("<td>" + Transaction.From_Account.ToString() + "</td>");
                    sb.AppendLine("<td>" + Transaction.To_Account.ToString() + "</td>");
                    sb.AppendLine("<td>" + Transaction.From_Reference.ToString() + "</td>");
                    sb.AppendLine("<td>" + Transaction.Amount.ToString() + "</td>");
                    sb.AppendLine("<td>" + Transaction.Balance.ToString() + "</td>");
                    sb.AppendLine("<td><a target='_blank'><button class='btn btn-danger' title='Download'><i class='fas fa-exclamation'></i>&nbsp;Dispute</button></a></td>");

                    sb.AppendLine("</tr>");
                }
            }
            else
            {
                sb.AppendLine("<tr><td colspan='8' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No transactions found.</td></tr>");
            }
            sb.AppendLine("</tbody>");
            sb.AppendLine("</table>");


            litTransaction.Text = sb.ToString();

        }


        public void setBillingInvoices(int UserID)
        {
            try
            {
                var Transactions = DataModal.getInvoices(UserID).ToList();

                StringBuilder sb = new StringBuilder();


                sb.AppendLine("<table class='table table-striped' id='tblBillingInvoices' style='zoom: 88% !important'>");
                sb.AppendLine("                                           <thead>");
                sb.AppendLine("                                               <tr>");
                sb.AppendLine("                                                    <th>Invoice</th>");
                sb.AppendLine("                                                    <th>Insurer</th>");
                sb.AppendLine("                                                    <th>Type</th>");
                sb.AppendLine("                                                    <th>Item</th>");
                sb.AppendLine("                                                    <th>Reference</th>");
                sb.AppendLine("                                                    <th>Date</th>");
                sb.AppendLine("                                                    <th>Amount</th>");
                sb.AppendLine("                                                    <th>Outstanding</th>");
                sb.AppendLine("                                                    <th>Status</th>");
                sb.AppendLine("                                                    <th>Actions</th>");

                sb.AppendLine("                                                </tr>");
                sb.AppendLine("                                              </thead>");
                sb.AppendLine("                                              <tbody>");

                if (Transactions.Count != 0)
                {
                    foreach (var Transaction in Transactions)
                    {
                        sb.AppendLine("<tr>");
                        sb.AppendLine("<td>" + Transaction.ID.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Insurer_Name.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Type.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Item.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Reference.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Date.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Amount.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Oustanding.ToString() + "</td>");
                        sb.AppendLine("<td>" + Transaction.Status.ToString() + "</td>");

                        if (Cloud.GetCookie("UserTypeID") == "2")
                        {
                            sb.AppendLine("<td><a href=\"http://web.mitig8.co.za/documents/invoice-insurer?Assessment=" + Transaction.Item.ToString() + "&download=yes\" target=\"_blank\"  class=\"btn btn-success\"><i class='fas fa-file-download'></i>&nbsp;Download</a></td>");
                        }
                        else
                        {

                            if (Transaction.Status != "Paid In Full")
                            {
                                sb.AppendLine("<td><a href=\"http://web.mitig8.co.za/documents/invoice-assessor?Assessment=" + Transaction.Item.ToString() + "&download=yes\" target=\"_blank\"  class=\"btn btn-success\"><i class='fas fa-file-download'></i>&nbsp;Download</a>" +
                                    "" +
                                    "<a onclick=\"markAsPaid('" + Transaction.ID.ToString() + "')\" class=\"btn btn-success\"  style=\"color:white !important;margin-left:7px\"><i class='fas fa-comments-dollar'></i>&nbsp;Paid?</a>" +
                                    "</td>");
                            }
                            else
                            {
                                sb.AppendLine("<td><a href=\"http://web.mitig8.co.za/documents/invoice-assessor?Assessment=" + Transaction.Item.ToString() + "&download=yes\" target=\"_blank\"  class=\"btn btn-success\"><i class='fas fa-file-download'></i>&nbsp;Download</a>" +
                                     "" +
                                     "</td>");
                            }

                        }



                        sb.AppendLine("</tr>");
                    }
                }
                else
                {
                    sb.AppendLine("<tr><td colspan='10' style='text-align:center !important'><i class='fas fa-map-pin'></i>&nbsp;No invoices found.</td></tr>");
                }
                sb.AppendLine("                                              </tbody>");
                sb.AppendLine("                                           </table>");


                litInvoices.Text = sb.ToString();
            }
            catch { }

        }


        public void btnSaveBankAccount_Click(object sender, EventArgs e)
        {
            try
            {

                int CompanyID = int.Parse(Cloud.GetCookie("CompanyID"));

                bool Valid = true;

                List<TextBox> Fields = new List<TextBox>()
                {
                    txtBankAccountName, txtBankAccountNumber
                };

                foreach (TextBox Field in Fields)
                {
                    if (Field.Text.Length == 0)
                    {
                        Cloud.Draw(Field).Highlight();
                        Valid = true;
                    }
                    else
                    {
                        Cloud.Draw(Field).Normal();
                    }
                }

                if (!Valid) { Cloud.MessageBox.Show("Please ensure all fields have valid values","Oh no!", MessageBoxType.warning);return; }
                DataModal.updCompanyBankAccount(CompanyID, txtBankAccountName.Text, cmbBankAccountType.SelectedValue, txtBankAccountNumber.Text, txBankAccounttNotes.Text);
                Cloud.MessageBox.Show("Bank account updated successfully","Success",MessageBoxType.success);

            }
            catch (Exception ex)
            {
                Cloud.Exception(ex);
            }
        }

        public void setBankAccountDetails(int CompanyID)
        {
            try
            {
                var x = DataModal.getCompanyDetailRaw(CompanyID).ToList()[0];
                txtBankAccountName.Text = x.BankName;
                txtBankAccountNumber.Text = x.BankAccountNumber;
                txBankAccounttNotes.Text = x.BankAccountNotes;
                cmbBankAccountType.SelectedValue = x.BankAccountType;
            }
            catch { }
        }

        public void btnPaidInvoice_Click(object sender, EventArgs e)
        {
            int InvoiceiD = int.Parse(vInvoiceID.Value);
            DataModal.updInvoicePaid(InvoiceiD);
            int UserID = int.Parse(Cloud.GetCookie("UserID").ToString());
            int CompanyID = int.Parse(Cloud.GetCookie("CompanyID").ToString());
            setBillingStats(UserID);
            setBillingTransaction(UserID);
            setBillingInvoices(UserID);
            setBankAccountDetails(CompanyID);
            Cloud.MessageBox.Show("Success, well done on keeping your finances hygienic.", "Success " + vInvoiceID.Value + " Paid", MessageBoxType.success);

        }

    }
}