<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Assessments.ascx.cs" Inherits="Mitig8.Modules.Assessments.Assessments" %>
<!-- Content Wrapper. Contains page content -->
<div id="modAssessments" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark"><i class="nav-icon fas fa-file-signature"></i>&nbsp;Assessments</h1>
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
                        <div class="col-md-2 col-sm-4 col-12" style="max-width: 14.28% !important;">
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

                        <div class="col-md-2 col-sm-4 col-12" style="max-width: 14.28% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-redo"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Policy Capture </span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" ID="lblFailed"></asp:Literal>&nbsp;In Progress</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-2 col-sm-4 col-12" style="max-width: 14.28% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-money-check"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Quoting</span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" ID="lblQuoting"></asp:Literal></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-2 col-sm-4 col-12" style="max-width: 14.28% !important;">
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

                        <div class="col-md-2 col-sm-4 col-12" style="max-width: 14.28% !important;">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-check-double"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">QC</span>
                                    <span class="info-box-number">
                                        <asp:Literal runat="server" Text="0" ID="lblQA"></asp:Literal>&nbsp;In Progress</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-2 col-sm-4 col-12" style="max-width: 14.28% !important;">
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

                        <div class="col-md-2 col-sm-4 col-12" style="max-width: 14.28% !important;">
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
                                <a class="nav-link active" data-toggle="pill" href="#tabActiveAssessments" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false"><i class="fas fa-mug-hot"></i>&nbsp; Active</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="pill" href="#tabArchivedAssessments" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-archive"></i>&nbsp;Archived</a>
                            </li>

                        </ul>
                    </div>
                    <div class="card-body" style="padding: 0px !important">
                        <div class="tab-content" id="tabAssessments">



                            <div class="tab-pane fade active show" id="tabActiveAssessments" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel ID="udpAssessmentsTable" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Literal runat="server" ID="litAssessments"></asp:Literal>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>


                            <div class="tab-pane fade" id="tabArchivedAssessments" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Literal runat="server" ID="litArchivedAssessments"></asp:Literal>
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

    let AssessmentsControls = {
        Initialze: () => {
            changeUrl('MODULE', 'ASSESSMENTS');
            $('.content-wrapper').hide();
            $('#modAssessments').fadeIn(1000);
            $('#Assessments_btnInitialize').click();
            setTimeout(() => {
                AssessmentsControls.Declare();
            }, 250);
        },
        Declare: () => {
            $.fn.dataTable.ext.errMode = 'none';
            $('#tblAssessmentsArchive').DataTable();
            $('#tblAssessmentsActive').DataTable();


            
        }
    };

    function pageLoad(sender, args) {
        try {
            AssessmentsControls.Declare();
        } catch (ex) {
            console.log(ex);
        }
    }


    function openAssessment(Assessment) {
        window.location.href = '/dashboard?MODULE=ASSESSMENT&DATA=' + btoa(Assessment);
    }



</script>
