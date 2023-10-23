<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Valuations.ascx.cs" Inherits="Mitig8.Modules.Assessments.Valuations" %>


<div id="modValuations" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark"><i class="fas fa-clipboard-list"></i>&nbsp;Valuations</h1>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->


    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">


            <%--Updatepanel for hidden controls--%>
            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none !important" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <%--Updatepanel for all assessments summary stats--%>
            <asp:UpdatePanel ID="updTEST" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-3 col-sm-4 col-12" style="max-width: 20% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-certificate"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">Created</span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" ID="lblCreated"></asp:Literal></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-3 col-sm-4 col-12" style="max-width: 20% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-redo"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Awaiting Feedback </span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" ID="lblFeedback"></asp:Literal>&nbsp;In Progress</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>



                        <div class="col-md-3 col-sm-4 col-12" style="max-width: 20% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="far fa-compass"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Surveying</span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" ID="lblInProgress"></asp:Literal>&nbsp;In Progress</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>



                        <div class="col-md-3 col-sm-4 col-12" style="max-width: 20% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-award"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Complete</span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" ID="lblComplete"></asp:Literal></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-3 col-sm-4 col-12" style="max-width: 20% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="far fa-window-close"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Cancelled</span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" ID="lblCancelled"></asp:Literal></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>


                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

            <%--Updatepanel for all assessments table--%>

            <div class="row">



                <div class="card card-warning card-tabs col-md-12">
                    <div class="card-header p-0 pt-1">
                        <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="pill" href="#tabActiveValuations" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false"><i class="fas fa-mug-hot"></i>&nbsp; Active</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#tabArchivedValuations" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-archive"></i>&nbsp;Archived</a>
                            </li>

                        </ul>
                    </div>
                    <div class="card-body" style="padding: 0px !important">
                        <div class="tab-content" id="tabValuations">

                            <div class="tab-pane fade active show" id="tabActiveValuations" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel ID="udpAssessmentsTable" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:HiddenField ID="vQuoteID" runat="server" />
                                        <asp:HiddenField ID="vQuoteStatusID" runat="server" />
                                        <asp:Literal runat="server" ID="litValuationsActive"></asp:Literal>
                                        <asp:Button runat="server" ID="btnAccpetQuote" OnClick="btnAccpetQuote_Click" Style="display: none !important" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="btnAccpetQuote" EventName="Click" />

                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>

                            <div class="tab-pane fade" id="tabArchivedValuations" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Literal runat="server" ID="litValuationsArchive"></asp:Literal>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>




    let ValuationsControls = {
        Initialze: () => {
            changeUrl('MODULE', 'VALUATIONS');
            $('.content-wrapper').hide();
            $('#modValuations').fadeIn(1000);
            $('#<%= btnInitialize.ClientID.ToString()%>').click();
            setTimeout(() => {
                ValuationsControls.Declare();
            }, 250);
        },
        Declare: () => {
            try {
                $.fn.dataTable.ext.errMode = 'none';
            }
            catch (ex) { }            $('#tblValuationsArchive').DataTable();
            $('#tblValuationsActive').DataTable();
        },
        Functions: {
            Accept: (QuoteID) => {
                $('#<%=vQuoteID.ClientID.ToString()%>').val(QuoteID);
                $('#<%=vQuoteStatusID.ClientID.ToString()%>').val('2');
                $('#<%=btnAccpetQuote.ClientID.ToString()%>').click();
            },
            Decline: (QuoteID) => {
                $('#<%=vQuoteID.ClientID.ToString()%>').val(QuoteID);
                $('#<%=vQuoteStatusID.ClientID.ToString()%>').val('3');
                $('#<%=btnAccpetQuote.ClientID.ToString()%>').click();

            }
        }
    };

    function pageLoad(sender, args) {
        try {
            ValuationsControls.Declare();
        } catch (ex) {
            console.log(ex);
        }
    }

    function openAssetsValueation(Assessment) {
        window.location.href = '/dashboard?MODULE=ASSESSMENT_ASSETS_VALUATION&DATA=' + btoa(Assessment);
    }


    function openBuildingsValueation(Assessment) {
        window.location.href = '/dashboard?MODULE=ASSESSMENT_BUILDING_VALUATION&DATA=' + btoa(Assessment);
    }

</script>
