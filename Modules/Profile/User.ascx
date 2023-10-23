<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="User.ascx.cs" Inherits="Mitig8.Modules.Profile.user" %>

<!-- Content Wrapper. Contains page content -->
<div id="modUserProfile" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                        <ContentTemplate>
                            <h1 class="m-0 text-dark">
                                <i class="far fa-id-card"></i>&nbsp;
                                <asp:Literal runat="server" ID="lblUserProfileFullName" Text="Loading..."></asp:Literal></h1>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <button runat="server" visible="true" type="button" class="btn btn-block btn-primary btn-md" style="width: 250px; display: inline-block; background: black !important; border: black; float: right; right: 20px; position: absolute;display:none"><i class="fas fa-medal"></i>&nbsp;Download Report Card</button>
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
                    <asp:HiddenField runat="server" ID="vUserID" />
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none !important" />
                </ContentTemplate>
            </asp:UpdatePanel>


            <div class="row">


                <div class="col-md-3">
                    <div class="card card-warning">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-info"></i>&nbsp;Profile</h3>


                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body container-fluid">

                            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                <ContentTemplate>






                                    <img src="/images/nopic.jpg" style="width: 145px; height: 145px; margin-left: 25%;" class="user-image img-circle elevation-2" alt="User Image">

                                    <div class="form-group">
                                        <span>First Name</span>
                                        <asp:TextBox runat="server" ID="txtFirstName" placeholder="First Name" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <span>Last Name</span>
                                        <asp:TextBox runat="server" ID="txtLastName" placeholder="Last Name" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <span>Cellphone</span>
                                        <asp:TextBox runat="server" ID="txtCellphone" placeholder="Cellphone" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <span>Email</span>
                                        <asp:TextBox runat="server" ID="txtEmail" placeholder="Email" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <span>Company</span>
                                        <asp:TextBox Enabled="false" runat="server" ID="txtCompany" placeholder="Company" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                                    </div>

                                    <asp:Button Text="Save" runat="server" ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-primary pull-left" Width="100%" Height="35px" />

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" />
                                </Triggers>

                            </asp:UpdatePanel>




                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>

                <div class="col-9">
                    <div class="card card-warning card-tabs">
                        <div class="card-header p-0 pt-1">

                            <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">

                                

                                <li class="nav-item">
                                    <a class="nav-link active" id="btnTabUserAssessmentHistory" data-toggle="pill" href="#tabUserAssessmentHistory" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-file-medical-alt"></i>&nbsp;Assessment History</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabUserChangePassword" data-toggle="pill" href="#tabUserPassword" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-user-lock"></i>&nbsp;Change Password</a>
                                </li>





                            </ul>
                        </div>
                        <div class="card-body" style="padding: 0px !important">
                            <div class="tab-content" id="tabSetUserProfile">



                                <%--Assessment History Tab Start--%>
                                <div class="tab-pane fade active show" id="tabUserAssessmentHistory" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                        <ContentTemplate>
                                            <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                                <div class="collapse navbar-collapse" id="navbarNav">
                                                    <ul class="navbar-nav">
                                                        <li class="nav-item">
                                                            <span class="nav-link" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important"><i class="far fa-clock"></i>&nbsp;<asp:LinkButton runat="server" OnClick="btnAssessmentHistoryDates_Click" ID="btnAssessmentHistoryDates" Text="From 2020-05-02 To 2020-05-09"></asp:LinkButton></span>
                                                        </li>
                                                        <li class="nav-item">
                                                            <span class="nav-link" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important"><i class="fas fa-sync"></i>&nbsp;<asp:LinkButton runat="server" ID="btnRefreshAssessmentHistory" Text="Refresh"></asp:LinkButton></span>
                                                        </li>

                                                    </ul>
                                                </div>
                                            </nav>





                                            <asp:Literal runat="server" ID="litUserProfileAssessmentHistory"></asp:Literal>


                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnSetAssessmentHistoryDateRange" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>



                                </div>
                                <%--Assessment History Tab End--%>

                                <%--User Password Tab Start--%>
                                <div class="tab-pane fade" id="tabUserPassword" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-question-circle"></i>&nbsp;Forgot Password</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-question-circle"></i>&nbsp;Forgot Pin</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>


                                    <div class="row d-flex align-items-stretch" style="padding: 10px;">
                                        <div class="col-6 col-sm-6 col-md-6 d-flex align-items-stretch">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="fas fa-key"></i>&nbsp;Change Password
                                                </div>
                                                <div class="card-body pt-0">
                                                    <asp:UpdatePanel runat="server" ID="updPanelUserProfilePassword" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <span>Current Password</span>
                                                                    <asp:TextBox CssClass="form-control" runat="server" Height="30px" placeholder="Current Password" TextMode="Password" Width="450px" ID="txtCurrentPassword"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <span>New Password</span>
                                                                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" placeholder="New Password" Height="30px" Width="450px" ID="txtNewPassword"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <span>Confirm New Password</span>
                                                                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" placeholder="Confirm New Password" Height="30px" Width="450px" ID="txtConfirmNewPassword"></asp:TextBox>
                                                                </div>

                                                            </div>
                                                            <div style="margin-top: 10px !important" class="row">
                                                                <asp:Button runat="server" Text="Update Password" ID="btnUpdatePassword" OnClick="btnUpdatePassword_Click" Style="background: black !important; border-color: black !important" class="btn btn-block btn-info btn-sm" />
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-6 col-sm-6 col-md-6 d-flex align-items-stretch">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="fas fa-shield-alt"></i>&nbsp;Change Pin
                                                </div>
                                                <div class="card-body pt-0">
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                        <ContentTemplate>
                                                            <div class="row">

                                                                <div class="form-group">
                                                                    <span>Current Pin</span>
                                                                    <asp:TextBox CssClass="form-control" runat="server" Height="30px" placeholder="Current Pin" onkeypress="UserProfileControls.Functions.validatePin(event);" TextMode="Password" Width="450px" ID="txtCurrentPin"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <span>New Pin</span>
                                                                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" onkeypress="UserProfileControls.Functions.validatePin(event);" placeholder="New Pin" Height="30px" Width="450px" ID="txtNewPin"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <span>Confirm New Pin</span>
                                                                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" onkeypress="UserProfileControls.Functions.validatePin(event);" placeholder="Confirm New Pin" Height="30px" Width="450px" ID="txtConfirmNewPin"></asp:TextBox>
                                                                </div>


                                                            </div>
                                                            <div style="margin-top: 10px !important" class="row">
                                                                <asp:Button runat="server" Text="Update Pin" ID="btnUpdatePin" OnClick="btnUpdatePin_Click" Style="background: black !important; border-color: black !important" class="btn btn-block btn-info btn-sm" />
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <%--User Password Tab End--%>
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


<%--Modals Start--%>


<%--Location History Date Modal Start--%>
<div class="modal fade" id="mdlLocationHistoryDate" style="top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="udpLocationHistoryDate" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-clock"></i>&nbsp;Location History Date</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <span>Date</span>
                            <asp:TextBox runat="server" ID="txtLocationHistoryDate" placeholder="yyyy-mm-dd" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCloseAssessmentReferences" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                        <asp:Button ID="btnUpdateAssessmentReferences" runat="server" CssClass="btn btn-primary pull-left" Text="Set" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
<%--Location History Date Modal Start--%>

<%--Assessment History Date Modal Start--%>
<div class="modal fade" id="mdlAssessmentHistoryDates" style="top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-clock"></i>&nbsp;Assessment History Date Range</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <span>From</span>
                            <asp:TextBox runat="server" ID="txtAssessmentHistoryDateFrom" placeholder="yyyy-mm-dd" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <span>To</span>
                            <asp:TextBox runat="server" ID="txtAssessmentHistoryDateTo" placeholder="yyyy-mm-dd" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCloseAssessmentHistoryDateRange" runat="server" CssClass="btn btn-default pull-left" OnClick="btnCloseAssessmentHistoryDateRange_Click" Text="Close" />
                        <asp:Button ID="btnSetAssessmentHistoryDateRange" runat="server" CssClass="btn btn-primary pull-left" OnClick="btnSetAssessmentHistoryDateRange_Click" Text="Set" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
<%--Assessment History Date Modal End--%>


<%--Modals End--%>


<script>
    let UserProfileControls = {
        Initialize: (Data) => {

            $('#<%=vUserID.ClientID.ToString()%>').val(Data);
            $('#<%=btnInitialize.ClientID.ToString()%>').click();

            changeUrl('MODULE', 'PROFILE');
            changeUrl('DATA', Router.Functions.Encode(Data));
            $('.content-wrapper').hide();
            $('#modUserProfile').fadeIn(5000);

            UserProfileControls.Declare();

            //var mymap = L.map('mapUserLocationHistory').setView([-29.712538, 31.067896], 13);
            //L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
            //    maxZoom: 13,
            //    id: 'mapbox/streets-v11',
            //    tileSize: 512,
            //    zoomOffset: -1,
            //    minHeight: 400

            //}).addTo(mymap);

            //setTimeout(() => { mymap.invalidateSize(); mymap.invalidateSize(); }, 500);

        },
        Declare: () => {


              $('#<%Response.Write(txtAssessmentHistoryDateTo.ClientID.ToString());%>').datepicker({
                    autoclose: true,
                    orientation: 'bottom',
                    format: "yyyy/mm/dd"
            });


              $('#<%Response.Write(txtAssessmentHistoryDateFrom.ClientID.ToString());%>').datepicker({
                    autoclose: true,
                    orientation: 'bottom',
                    format: "yyyy/mm/dd"
            });



        },
        Functions: {
            validatePin: (evt) => {
                var theEvent = evt || window.event;

                // Handle paste
                if (theEvent.type === 'paste') {
                    key = event.clipboardData.getData('text/plain');
                } else {
                    // Handle key press
                    var key = theEvent.keyCode || theEvent.which;
                    key = String.fromCharCode(key);
                }
                var regex = /[0-9]|\./;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    if (theEvent.preventDefault) theEvent.preventDefault();
                }
            }
        }
    };


</script>
