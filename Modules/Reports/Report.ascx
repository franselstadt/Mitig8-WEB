<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Report.ascx.cs" Inherits="Mitig8.Modules.Reports.Report" %>



<!-- Content Wrapper. Contains page content -->
<div id="modReports" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                        <ContentTemplate>
                            <h1 class="m-0 text-dark">
                                <i class="fas fa-chart-pie"></i>&nbsp;
                                <asp:Literal runat="server" ID="lblAssessment" Text="Reports"></asp:Literal></h1>
                        </ContentTemplate>
                    </asp:UpdatePanel>
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



            <div class="row">


                <div class="col-md-3">
                    <div class="card card-warning">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-sliders-h"></i>&nbsp;Parameters</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="maximize">
                                    <i class="fas fa-expand"></i>
                                </button>
                            </div>
                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body container-fluid">

             
                                <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <div class="form-group col-12">
                                        <span>From</span>
                                        <asp:TextBox ID="txtDateFrom" runat="server" Width="100%" Height="30px" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>

                                    <div class="form-group col-12">
                                        <span>To</span>
                                        <asp:TextBox ID="txtDateTo" runat="server" Width="100%" Height="30px" CssClass="form-control" TextMode="Date">></asp:TextBox>
                                    </div>

                                    </ContentTemplate>
                                    </asp:UpdatePanel>

                  




                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>

                <div class="col-9">
                    <div class="card card-warning card-tabs">
                        <div class="card-header p-0 pt-1">

                            <ul class="nav nav-tabs" id="custom-tabs-one-tab-reports" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentReport" data-toggle="pill" href="#tabAssessmentReport" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-laugh"></i>&nbsp;Assessment</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active" id="btnTabAssessmentRiskReport" data-toggle="pill" href="#tabAssessmentRiskReport" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-pencil-ruler"></i>&nbsp;Risk</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentFinanceReport" data-toggle="pill" href="#tabAssessmentFinanceReport" role="tab" aria-controls="custom-tabs-one-home" aria-selected="false"><i class="fas fa-bullseye"></i>&nbsp;Finance</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentLibraryReport" data-toggle="pill" href="#tabAssessmentLibraryReport" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-user-friends"></i>&nbsp;Library</a>
                                </li>

                                               <li class="nav-item">
                                    <a class="nav-link" id="btntabAssessmentValuationReport" data-toggle="pill" href="#tabAssessmentValuationReport" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-clipboard-list"></i>&nbsp;Valuations</a>
                                </li>

                            </ul>
                        </div>
                        <div class="card-body" style="padding: 0px !important">
                            <div class="tab-content" id="tabAssessmentSetReport">

                                <%--Assessment Report Tab--%>
                                <div class="tab-pane fade" id="tabAssessmentReport" role="tabpanel">
<div class="alert alert-warning alert-dismissible" style="margin:20px">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-exclamation-triangle"></i> Alert!</h5>
                  No reports available
                </div>                                </div>

                                <%--Assessment Risk Report Tab--%>
                                <div class="tab-pane fade show active" id="tabAssessmentRiskReport" role="tabpanel">

                                    

                                    <asp:button style="margin:15px;width:150px" runat="server" class="btn btn-block btn-default" Text="Risk Report" ID="btnRiskReport" OnClick="btnRiskReport_Click" />

                                </div>
                           
                                 <%--Assessment Finance Report Tab--%>
                                <div class="tab-pane fade" id="tabAssessmentFinanceReport" role="tabpanel">
<div class="alert alert-warning alert-dismissible" style="margin:20px">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-exclamation-triangle"></i> Alert!</h5>
                  No reports available
                </div>                                  </div>




                                       <div class="tab-pane fade" id="tabAssessmentValuationReport" role="tabpanel">
                                                                               <asp:button style="margin:15px;width:150px" runat="server" class="btn btn-block btn-default" Text="Valuation Summary" ID="Button1" OnClick="btnValuationSummary_Click" />

                            </div>

                                
  
                                 <%--Assessment Library Report Tab--%>
                                <div class="tab-pane fade" id="tabAssessmentLibraryReport" role="tabpanel">
<div class="alert alert-warning alert-dismissible" style="margin:20px">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-exclamation-triangle"></i> Alert!</h5>
                  No reports available
                </div>                                  </div>                                

                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>


            </div>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script type="text/javascript">
    const ReportControl = {
        Open: () => {
            changeUrl('MODULE', 'REPORT');
            $('.content-wrapper').hide();
            $('#modReports').fadeIn(5000);
        }
    };
</script>