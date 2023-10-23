<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Companies.ascx.cs" Inherits="Mitig8.Modules.Companies.Companies" %>
<%@ Register Src="~/Modules/Companies/Company.ascx" TagPrefix="Modal" TagName="Company" %>




<!-- Content Wrapper. Contains page content -->
<div id="modCompanies" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark"><i class="nav-icon fas fa-university"></i>&nbsp;Companies</h1>
                </div>



                <asp:UpdatePanel runat="server" ID="udpCompanyTopButtons" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>
                        <asp:Button runat="server" CssClass="btn btn-warning float-left" Text="New Company" OnClientClick="CompanyControls.Initialize(0);" Style="float: left; right: 25px; position: fixed;" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
        <div class="row mb-2" style="margin-top: 22px !important;">
            <div class="col-md-2 col-sm-4 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-user-shield"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Insurance</span>
                        <span class="info-box-number">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-4 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-diagnoses"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Assessment</span>
                        <span class="info-box-number">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-4 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-user-tie"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Specialist</span>
                        <span class="info-box-number">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-4 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="far fa-handshake"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Brokerage</span>
                        <span class="info-box-number">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-4 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-feather"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Other</span>
                        <span class="info-box-number">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-4 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-redo"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Pending Validity</span>
                        <span class="info-box-number">0</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>
        </div>

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

            <%--Updatepanel for all assessments table--%>
            <asp:UpdatePanel ID="updCompaniesTable" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <asp:UpdateProgress AssociatedUpdatePanelID="updCompaniesTable" ClientIDMode="AutoID" DynamicLayout="false" DisplayAfter="0" runat="server" class="overlay dark">
                                    <ProgressTemplate>
                                        <i class="fas fa-2x fa-sync-alt fa-spin"></i>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>


                                <div class="card-body">
                                    <asp:Literal runat="server" ID="litCompanies"></asp:Literal>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<Modal:Company runat="server" ID="Company" />


<script>

    let CompaniesControls = {
        Initialze: () => {
            changeUrl('MODULE', 'COMPANIES');
 
            $('.content-wrapper').hide();
            $('#modCompanies').fadeIn(1000);
            setTimeout(() => {
                $('#<%Response.Write(btnInitialize.ClientID.ToString());%>').click();
                CompaniesControls.Declare();
            }, 50);
        },
        Declare: () => {
                $.fn.dataTable.ext.errMode = 'none';
                $('#tblCompanies').DataTable({
                    "bServerSide": true,
                    "bDestroy": true
                });
        }
    };

    function pageLoad(sender, args) {
        try {
            CompaniesControls.Declare();
        } catch (ex) {
            console.log(ex);
        }
    }

</script>
