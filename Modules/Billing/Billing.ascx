<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Billing.ascx.cs" Inherits="Mitig8.Modules.Billing.Billing" %>


<!-- Content Wrapper. Contains page content -->
<div id="modBilling" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark"><i class="fas fa-piggy-bank"></i>&nbsp;Billing</h1>
                </div>
            </div>
        </div>
        <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
            <ContentTemplate>

                <!-- /.row -->
                <!-- /.container-fluid -->
                <div class="row mb-4" style="margin-top: 22px !important;">
                    <div class="col-md-4 col-sm-4 col-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-warning"><i class="fas fa-cubes"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Available Balance</span>
                                <span class="info-box-number">
                                    <asp:Literal runat="server" ID="lblAvailableBalance" Text="R0.00"></asp:Literal></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>




                    <div class="col-md-4 col-sm-4 col-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-warning"><i class="fas fa-retweet"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Renewal Fee</span>
                                <span class="info-box-number">
                                    <asp:Literal runat="server" Text="R0.00" ID="lblRenewalFee"></asp:Literal></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>

                    <div class="col-md-4 col-sm-4 col-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-warning"><i class="far fa-file-alt"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Unpaid Invoices</span>
                                <span class="info-box-number">
                                    <asp:Literal runat="server" Text="R0.00" ID="lblUnpaidBalance"></asp:Literal></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>



    </div>

    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">


            <%--Updatepanel for hidden controls--%>
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none !important" />
                </ContentTemplate>
            </asp:UpdatePanel>







            <div class="col-12">
                <div class="card card-warning card-tabs">
                    <div class="card-header p-0 pt-1">

                        <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">

                            <li class="nav-item">
                                <a class="nav-link active" id="btnTabBillingTransactions" data-toggle="pill" href="#tabBillingTransactions" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-compress-arrows-alt"></i>&nbsp;Transactions</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " id="btnTabBillingWithdrawels" data-toggle="pill" href="#tabBillingWithdrawels" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-hand-holding-usd"></i>&nbsp;Withdraw</a>
                            </li>


                            <li class="nav-item">
                                <a class="nav-link " id="btnTabBillingDeposit" data-toggle="pill" href="#tabBillingDeposit" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-donate"></i>&nbsp;Deposit</a>
                            </li>


                            <li class="nav-item">
                                <a class="nav-link " id="btnTabBillingInvoices" data-toggle="pill" href="#tabBillingInvoices" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-file-alt"></i>&nbsp;Invoices</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " id="btnTabBillingBankAccount" data-toggle="pill" href="#tabBillingBankAccount" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-university"></i>&nbsp;Bank Account</a>
                            </li>






                        </ul>
                    </div>
                    <div class="card-body" style="padding: 0px !important">
                        <div class="tab-content" id="tabSetUserProfile">





                            <%--Transactions Tab Start--%>
                            <div class="tab-pane fade active show" id="tabBillingTransactions" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <div class="collapse navbar-collapse" id="navbarNav">
                                                <ul class="navbar-nav">

                                                    <li class="nav-item">
                                                        <span class="nav-link" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important"><i class="fas fa-sync"></i>&nbsp;<asp:LinkButton runat="server" ID="btnRefreshAssessmentHistory" Text="Refresh"></asp:LinkButton></span>
                                                    </li>

                                                </ul>
                                            </div>
                                        </nav>

                                        <asp:Literal runat="server" ID="litTransaction"></asp:Literal>


                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <%--Transactions Tab End--%>




                            <%--Withdrawels Tab Start--%>
                            <div class="tab-pane fade" id="tabBillingWithdrawels" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <div class="collapse navbar-collapse" id="navbarNav">
                                                <ul class="navbar-nav">

                                                    <li class="nav-item">
                                                        <span class="nav-link" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important"><i class="fas fa-sync"></i>&nbsp;<asp:LinkButton runat="server" ID="LinkButton1" Text="Refresh"></asp:LinkButton></span>
                                                    </li>

                                                </ul>
                                            </div>
                                        </nav>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <%--Withdrawels Tab End--%>


                            <%--Deposit Tab Start--%>
                            <div class="tab-pane fade" id="tabBillingDeposit" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <div class="collapse navbar-collapse" id="navbarNav">
                                                <ul class="navbar-nav">

                                                    <li class="nav-item">
                                                        <span class="nav-link" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important"><i class="fas fa-sync"></i>&nbsp;<asp:LinkButton runat="server" ID="LinkButton2" Text="Refresh"></asp:LinkButton></span>
                                                    </li>

                                                </ul>
                                            </div>
                                        </nav>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <%--Deposit Tab End--%>

                            <%--Invoices Tab Start--%>
                            <div class="tab-pane fade" id="tabBillingInvoices" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <div class="collapse navbar-collapse" id="navbarNav">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item">
                                                        <span class="nav-link" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important"><i class="fas fa-sync"></i>&nbsp;<asp:LinkButton runat="server" ID="LinkButton3" Text="Refresh"></asp:LinkButton></span>
                                                    </li>

                                                </ul>
                                            </div>
                                        </nav>

                                        <asp:HiddenField ID="vInvoiceID" runat="server" />
                                        <asp:Button runat="server" ID="btnPaidInvoice" OnClick="btnPaidInvoice_Click" Style="display: none !important" />

                                        <asp:Literal runat="server" ID="litInvoices"></asp:Literal>
                                    </ContentTemplate>




                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />

                                        <asp:AsyncPostBackTrigger ControlID="btnPaidInvoice" EventName="Click" />


                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <%--Invoices Tab End--%>




                            <%--Bank Account Tab Start--%>
                            <div class="tab-pane fade" id="tabBillingBankAccount" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <div class="card card-primary" style="padding: 25px; width: 650px;">
                                            <div class="card-header">
                                                <h3 class="card-title">Please provide banking details below.</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <!-- form start -->
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <span>Bank Name</span>
                                                    <asp:TextBox runat="server" ID="txtBankAccountName" CssClass="form-control" Width="100%" Height="28px"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <span>Bank Account Type</span>
                                                    <asp:DropDownList runat="server" Width="100%" Height="38px" CssClass="form-control" ID="cmbBankAccountType">
                                                        <asp:ListItem Enabled="true" Selected="True" Text="Cheque" Value="Cheque"></asp:ListItem>
                                                        <asp:ListItem Enabled="true" Selected="false" Text="Saving" Value="Saving"></asp:ListItem>
                                                        <asp:ListItem Enabled="true" Selected="false" Text="Trust" Value="Trust"></asp:ListItem>
                                                        <asp:ListItem Enabled="true" Selected="false" Text="Credit" Value="Credit"></asp:ListItem>
                                                        <asp:ListItem Enabled="true" Selected="false" Text="Bond" Value="Bond"></asp:ListItem>
                                                        <asp:ListItem Enabled="true" Selected="false" Text="Current" Value="Current"></asp:ListItem>
                                                        <asp:ListItem Enabled="true" Selected="false" Text="Offshore" Value="Offshore"></asp:ListItem>
                                                        <asp:ListItem Enabled="true" Selected="false" Text="Crypto" Value="Crypto"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <span>Bank Account Number</span>
                                                    <asp:TextBox runat="server" ID="txtBankAccountNumber" CssClass="form-control" Width="100%" Height="28px"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <span>Notes</span>
                                                    <asp:TextBox TextMode="MultiLine" runat="server" ID="txBankAccounttNotes" CssClass="form-control" Width="100%" Height="78px"></asp:TextBox>
                                                </div>
                                            </div>
                                            <!-- /.card-body -->
                                            <div class="card-footer">
                                                <asp:Button runat="server" ID="btnSaveBankAccount" OnClick="btnSaveBankAccount_Click" Text="Save" Width="100%" CssClass="btn btn-primary btn-sm" />
                                            </div>
                                        </div>
                                    </ContentTemplate>




                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <%--Bank Account Tab End--%>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</div>
<!-- /.content -->
<!-- /.content-wrapper -->



<script>
    let BillingControls = {
        Initialize: () => {
            changeUrl('MODULE', 'BILLING');
            $('.content-wrapper').hide();
            $('#modBilling').fadeIn(1000);
            setTimeout(() => {
                $('#<%Response.Write(btnInitialize.ClientID.ToString());%>').click();
            }, 50);
        },
        Declare: () => {
            $.fn.dataTable.ext.errMode = 'none';
            // $('#tblBillingTransactions').DataTable();
            $('#tblBillingInvoices').DataTable();

        }
    };


    const markAsPaid = (ID) => {
        Swal.fire({
            title: 'Yay!, are you certain ' + ID + ' is paid in full?',
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: 'Yes, its paid!',
            denyButtonText: `No, its not :(`,
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                $('#<%=vInvoiceID.ClientID%>').val(ID);
                $('#<%=btnPaidInvoice.ClientID%>').click();

            } else if (result.isDenied) {
                Swal.fire('Always ensure funds reflect into your account.', '', 'info')
            }
        });
    };

</script>
