<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Users.ascx.cs" Inherits="Mitig8.Modules.Users.Users" %>

<!-- Content Wrapper. Contains page content -->
<div id="modUsers" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark"><i class="fas fa-users"></i>&nbsp;Users</h1>
                </div>

                <asp:UpdatePanel runat="server" ID="udpUsersTopButtons" UpdateMode="Conditional" ChildrenAsTriggers="true">
                    <ContentTemplate>
                        <asp:Button runat="server" CssClass="btn btn-warning float-left" Text="New User" Style="float: left; right: 25px; position: absolute;" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
        <asp:UpdatePanel runat="server" ID="updPanelUsersDetails" UpdateMode="Conditional" ChildrenAsTriggers="true">
            <ContentTemplate>
                <div class="row mb-2" style="margin-top: 22px !important;">


                    <div class="col-md-3 col-sm-4 col-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-warning"><i class="fas fa-heartbeat"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Active</span>
                                <span class="info-box-number">
                                    <asp:Literal runat="server" ID="lblActiveUsers" Text="0"></asp:Literal></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>

                    <div class="col-md-3 col-sm-4 col-12">


                        <div class="info-box">
                            <span class="info-box-icon bg-warning"><i class="fas fa-radiation-alt"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Suspended</span>
                                <span class="info-box-number">
                                    <asp:Literal runat="server" ID="lblSuspendedUsers" Text="0"></asp:Literal></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>

                    <div class="col-md-3 col-sm-4 col-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-warning"><i class="fas fa-feather-alt"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Pending</span>
                                <span class="info-box-number">
                                    <asp:Literal runat="server" ID="lblPendingUsers" Text="0"></asp:Literal></span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                        <!-- /.info-box -->
                    </div>

                    <div class="col-md-3 col-sm-4 col-12">
                        <div class="info-box">
                            <span class="info-box-icon bg-warning"><i class="fas fa-calculator"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Total</span>
                                <span class="info-box-number">
                                    <asp:Literal runat="server" ID="lblTotalUsers" Text="0"></asp:Literal></span>
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
            <asp:UpdatePanel ID="updUsersTable" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <asp:UpdateProgress AssociatedUpdatePanelID="updUsersTable" ClientIDMode="AutoID" DynamicLayout="false" DisplayAfter="0" runat="server" class="overlay dark">
                                    <ProgressTemplate>
                                        <i class="fas fa-2x fa-sync-alt fa-spin"></i>
                                    </ProgressTemplate>
                                </asp:UpdateProgress>


                                <div class="card-body">
                                    <asp:Literal runat="server" ID="litUsers"></asp:Literal>
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



<script>

    let UsersControls = {
        Initialze: () => {
            changeUrl('MODULE', 'USERS');

            $('.content-wrapper').hide();
            $('#modUsers').fadeIn(1000);
            setTimeout(() => {
                $('#<%Response.Write(btnInitialize.ClientID.ToString());%>').click();
                UsersControls.Declare();
            }, 50);
        },
        Declare: () => {
            $.fn.dataTable.ext.errMode = 'none';
            $('#tblUsers').DataTable({
                "processing": true
            });
        }
    };

    function pageLoad(sender, args) {
        try {
            UsersControls.Declare();
        } catch (ex) {
            console.log(ex);
        }
    }

</script>
