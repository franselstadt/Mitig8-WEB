<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RiskManagement.ascx.cs" Inherits="Mitig8.Modules.RiskManagement.RiskManagement" %>
<%@ Register Src="~/Modules/RiskManagement/PolicyRiskManagement.ascx" TagPrefix="Modal" TagName="PolicyRiskManagement" %>



<!-- Content Wrapper. Contains page content -->
<div id="modRiskManagement" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
                 <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark"><i class="fas fa-exclamation-triangle"></i>&nbsp;Risk Management</h1>
                </div>
            </div>
                    </div>

                        <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
       
            <!-- /.row -->
        <!-- /.container-fluid -->
        <div class="row mb-2" style="margin-top: 22px !important;">
            <div class="col-md-2 col-sm-2 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-thermometer-full"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">High Risk</span>
                        <span class="info-box-number"><asp:Literal runat="server" ID="lblHighRisk"></asp:Literal> Requirements</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-2 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-thermometer-half"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Medium Risk</span>
                        <span class="info-box-number"><asp:Literal runat="server" ID="lblMediumRisk"></asp:Literal> Requirements</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-2 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-thermometer-quarter"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Low Risk</span>
                        <span class="info-box-number"><asp:Literal runat="server" ID="lblLowRisk"></asp:Literal> Requirements</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>

            <div class="col-md-2 col-sm-2 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-hourglass-half"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Pending</span>
                        <span class="info-box-number"><asp:Literal runat="server" ID="lblPendingRequirements"></asp:Literal> Requirements</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>


                        <div class="col-md-2 col-sm-2 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-clipboard-check"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">Completed</span>
                        <span class="info-box-number"><asp:Literal runat="server" ID="lblCompletedRequirements"></asp:Literal> Requirements</span>
                    </div>
                    <!-- /.info-box-content -->
                </div>
                <!-- /.info-box -->
            </div>


                        <div class="col-md-2 col-sm-2 col-12">
                <div class="info-box">
                    <span class="info-box-icon bg-warning"><i class="fas fa-tachometer-alt"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">KPI</span>
                        <span class="info-box-number"><asp:Literal runat="server" ID="lblRiskManagementKPI"></asp:Literal></span>
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
            <asp:UpdatePanel ID="updPanelRiskManagementTable" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <asp:UpdateProgress AssociatedUpdatePanelID="updPanelRiskManagementTable" ClientIDMode="AutoID" DynamicLayout="false" DisplayAfter="0" runat="server" class="overlay dark">
                                    <ProgressTemplate>
                                        <i class="fas fa-2x fa-sync-alt fa-spin"></i>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>

                                 

                                    <asp:Literal runat="server" ID="litRiskManagement"></asp:Literal>


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



<Modal:PolicyRiskManagement runat="server" ID="PolicyRiskManagement" />


<script>
    let RiskManagementControls = {
        Initialize: () => {
            changeUrl('MODULE', 'RISKMANAGEMENT');
            $('.content-wrapper').hide();
            $('#modRiskManagement').fadeIn(1000);
            setTimeout(() => {
                $('#<%Response.Write(btnInitialize.ClientID.ToString());%>').click();
                RiskManagementControls.Declare();
            }, 50);

        },
        Declare: () => {
            try {
                $.fn.dataTable.ext.errMode = 'none';
                $('#tblRiskManagement').DataTable();
            }
            catch (ex) { }
        }
    };

    function pageLoad(sender, args) {
        try {
            RiskManagementControls.Declare();
        } catch (ex) {
        }
    }

</script>
