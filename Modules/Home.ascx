<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home.ascx.cs" Inherits="Mitig8.Modules.Home" %>

<!-- Content Wrapper. Contains page content -->
<div id="modHome" class="content-wrapper">
    <asp:UpdatePanel runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">
                            </h1>
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

                        <div class="col-md-3 col-sm-4 col-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="far fa-bell"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Notifications</span>
                                    <span class="info-box-number"><asp:Literal runat="server" ID="lblNotifications" Text="0"></asp:Literal> Today</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div style="display: none" class="col-md-2 col-sm-4 col-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-wallet"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Wallet</span>
                                    <span class="info-box-number">R0.00 Available</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-3 col-sm-4 col-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-file-signature"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Assessments</span>
                                    <span class="info-box-number"><asp:Literal runat="server" ID="lblAssessments" Text="0"></asp:Literal></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-3 col-sm-4 col-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-users"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Users</span>
                                    <span class="info-box-number"><asp:Literal runat="server" ID="lblUsers" Text="0"></asp:Literal></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div class="col-md-3 col-sm-4 col-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="fas fa-file-invoice"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Invoices</span>
                                    <span class="info-box-number"><asp:Literal runat="server" ID="lblInvoices" Text="0"></asp:Literal></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>

                        <div style="display: none !important" class="col-md-2 col-sm-4 col-12">
                            <div class="info-box">
                                <span class="info-box-icon bg-warning"><i class="far fa-life-ring"></i></span>

                                <div class="info-box-content">
                                    <span class="info-box-text">Tickets</span>
                                    <span class="info-box-number">0 Open</span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-6 col-sm-6 col-12">
                            <div class="card card-widget" style="background: url('/images/dashboard-picture-1.jpeg'); height: 320px; background-size: cover;">
                                <div style="color: white !important; width: 100%; height: 100%;">

                                    <div style="background: rgba(0,0,0,0.5); padding: 10px" class="widget-user-header text-white">
                                        <h3 class="widget-user-username text-left"><i class="fas fa-medal"></i>World class performance</h3>
                                        <h5 class="widget-user-desc text-left">Our stats till date, together we never stop growing.</h5>
                                    </div>
                                </div>

                                <div class="card-footer" style="background: rgba(0,0,0,0.5); color: white !important;">
                                    <div class="row">
                                        <div class="col-sm-3 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header"><asp:Literal runat="server" ID="lblTotaAssessments" Text="0"></asp:Literal></h5>
                                                <span class="description-text">Assessments</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-3 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header"><asp:Literal runat="server" ID="lblInsurers" Text="0"></asp:Literal></h5>
                                                <span class="description-text">Insurers</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-3 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header"><asp:Literal runat="server" ID="lblSpecialists" Text="0"></asp:Literal></h5>
                                                <span class="description-text">Specialists</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-3">
                                            <div class="description-block">
                                                <h5 class="description-header"><asp:Literal runat="server" ID="lblAssessors" Text="0"></asp:Literal></h5>
                                                <span class="description-text">Assessors</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6 col-sm-6 col-12">
                            <div class="card card-widget" style="background: url('/images/dashboard-picture-2.jpeg'); height: 320px; background-size: cover;">
                                <div style="color: white !important; width: 100%; height: 100%;">

                                    <div style="background: rgba(0,0,0,0.5); padding: 10px" class="widget-user-header text-white">
                                        <h3 class="widget-user-username text-left"><i class="fas fa-graduation-cap"></i>Get qualified</h3>
                                        <h5 class="widget-user-desc text-left">Be better in what you do, visit our academy.</h5>
                                    </div>
                                </div>

                                <div class="card-footer" style="background: rgba(0,0,0,0.5); color: white !important;">
                                    <div class="row">
                                        <div class="col-sm-4 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header">0</h5>
                                                <span class="description-text">Courses</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header">0</h5>
                                                <span class="description-text">Graduates</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header">R0.00</h5>
                                                <span class="description-text">Average Cost</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>

                                    </div>
                                    <!-- /.row -->
                                </div>
                            </div>
                        </div>




                        <div style="display: none !important" class="col-md-2 col-sm-6 col-12">
                            <div class="card card-widget" style="background: url('/images/dashboard-picture-3.jpeg'); height: 320px; background-size: cover;">
                                <div style="color: white !important; width: 100%; height: 100%;">

                                    <div style="background: rgba(0,0,0,0.5); padding: 10px" class="widget-user-header text-white">
                                        <h3 class="widget-user-username text-left"><i class="fas fa-wallet"></i>Wallet</h3>
                                        <h5 class="widget-user-desc text-left">Instant payments!</h5>
                                    </div>
                                </div>


                                <div class="card-footer" style="background: rgba(0,0,0,0.5); color: white !important;">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="description-block">
                                                <h5 class="description-header">15489</h5>
                                                <span class="description-text">Transactions</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>


                                    </div>
                                    <!-- /.row -->
                                </div>
                            </div>
                        </div>

                    </div>



                    <div style="display:none !important" class="row">
                        <div class="col-md-12">

                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title">Recent Assessments</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                    <div class="table-responsive">
                                        <table id="tblAssessments" class="hover table table-striped table-bordered dataTable no-footer" style="font-size: 13px;" role="grid" aria-describedby="tblAssessments_info">
                                            <thead>
                                                <tr role="row">
                                                    <th class="sorting_asc" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-sort="ascending" aria-label="ID: activate to sort column descending" style="width: 63.6667px;">ID</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Reference: activate to sort column ascending" style="width: 149.889px;">Reference</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Category: activate to sort column ascending" style="width: 139.222px;">Category</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Subcategory: activate to sort column ascending" style="width: 178.333px;">Subcategory</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Type: activate to sort column ascending" style="width: 93px;">Type</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 110.778px;">Status</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Quote: activate to sort column ascending" style="width: 107.222px;">Quote</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Last Updated: activate to sort column ascending" style="width: 186.333px;">Last Updated</th>
                                                    <th class="sorting" tabindex="0" aria-controls="tblAssessments" rowspan="1" colspan="1" aria-label="Options: activate to sort column ascending" style="width: 126.889px;">Options</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="odd">
                                                    <td valign="top" colspan="9" class="dataTables_empty">No data available in table</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer clearfix">
                                    <a href="javascript:void(0)" class="btn btn-sm btn-info float-left">View all Assessments</a>
                                    <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">Create New Assessment</a>
                                </div>
                                <!-- /.card-footer -->
                            </div>

                        </div>

                    </div>



                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<!-- /.content-wrapper -->


<script type="text/javascript">

    let HomeControls = {
        Initialize: () => {
            changeUrl('MODULE', 'HOME');
            $('.content-wrapper').hide();
            $('#modHome').fadeIn(1000);
        },
        Declare: () => {

        }
    };

</script>
