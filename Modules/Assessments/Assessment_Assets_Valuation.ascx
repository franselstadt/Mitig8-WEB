<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Assessment_Assets_Valuation.ascx.cs" Inherits="Mitig8.Modules.Assessments.Assessment_Assets_Valuation" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!-- Content Wrapper. Contains page content -->
<div id="modAssessmentAssetsValuation" class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">
                                <i class="fas fa-motorcycle"></i>&nbsp;
                                <asp:Literal runat="server" ID="lblAssessment" Text="<i class='fas fa-spinner fa-spin'></i>&nbsp;Loading..."></asp:Literal></h1>
                        </div>
                        <asp:Button runat="server" Text="Cancel Valuation?" Visible="false" ID="btnCancelAssessment" OnClick="btnCancelAssessment_Click" class="btn btn-block btn-danger btn-md" Style="width: 168px; display: inline-block; /* background: black !important; */border: black; float: left; right: 20px; position: absolute; top: 62PX;" />
                         <asp:Button runat="server" Text="Complete Valuation?" Visible="false" ID="btnCompleteValuation" OnClick="btnCompleteValuation_Click" class="btn btn-block btn-danger btn-md" Style="width: 168px; display: inline-block; /* background: black !important; */border: black; float: left; right: 20px; position: absolute; top: 62PX;" />
                    </div>
                    <!-- /.row -->
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="btnCompleteValuation" EventName="Click" />

                </Triggers>
            </asp:UpdatePanel>
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
                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:HiddenField runat="server" ID="vUserID" />
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none !important" />
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="row">
                <div class="col-12">
                    <div class="card card-warning card-tabs">
                        <div class="card-header p-0 pt-1">
                            <ul class="nav nav-tabs" id="MoveableAssetsControlTabControl" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="btnTabAssessmentClient" data-toggle="pill" href="#tabAssessmentClient" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-motorcycle"></i>&nbsp;Valuation Details</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentValuators" data-toggle="pill" href="#tabAssessmentValuators" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-diagnoses"></i>&nbsp;Valuators</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentProperty" data-toggle="pill" href="#tabAssessmentProperty" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-address-book"></i>&nbsp;Property Details</a>
                                </li>
                                     <li class="nav-item">
                                    <a class="nav-link" id="btnTabExpenses" data-toggle="pill" href="#tabExpenses" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-piggy-bank"></i>&nbsp;Expenses</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentAttachments" data-toggle="pill" href="#tabAssessmentAttachments" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-paperclip"></i>&nbsp;Attachments</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentBuildings" data-toggle="pill" href="#tabAssessmentBuildings" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-home"></i>&nbsp;Buildings</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentRooms" data-toggle="pill" href="#tabAssessmentRooms" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-door-open"></i>&nbsp;Rooms</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentAssetRegister" data-toggle="pill" href="#tabAssessmentAssetRegister" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-glasses"></i>&nbsp;Assets</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentUsers" data-toggle="pill" href="#tabAssessmentUsers" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-user-friends"></i>&nbsp;Users</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentTracks" data-toggle="pill" href="#tabAssessmentTracks" role="tab" aria-controls="custom-tabs-one-home" aria-selected="false"><i class="fas fa-bullseye"></i>&nbsp;Tracks</a>
                                </li>
                                     <li class="nav-item">
                                    <a class="nav-link" id="btnTabBookings" data-toggle="pill" href="#tabBookings" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="fas fa-business-time"></i>&nbsp;Booking</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentReports" data-toggle="pill" href="#tabAssessmentReports" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="fas fa-flag-checkered"></i>&nbsp;Report</a>
                                </li>
                           
                            </ul>
                        </div>
                        <div class="card-body" style="padding: 0px !important">
                            <div class="tab-content" id="tabSetMoveableAssetsValuation">

                                <%--Client Tab Start--%>
                                <div class="tab-pane fade active show" id="tabAssessmentClient" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">

                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="$('#<%=btnSaveRequest.ClientID.ToString()  %>').click();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-save"></i>&nbsp;Save Valuation</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>

                                    <div class="col-md-12">
                                        <asp:UpdatePanel ID="clientTabUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>

                                                <asp:Button runat="server" Text="Save Request" ID="btnSaveRequest" OnClick="btnSaveRequest_Click" class="btn btn-block btn-success btn-md" Style="display: none !important;" />

                                                <%--Hidden Fields End--%>
                                                <legend><i class="fas fa-info-circle"></i>&nbsp;Client Information </legend>


                                                <%--Insured Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span style="color: red;">*</span><span>Client Name</span>
                                                            <asp:TextBox ID="txtClienName" runat="server" Height="30px" placeholder="Client Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span style="color: red;">*</span><span>Client Contact Number</span>
                                                            <asp:TextBox ID="txtClientContactNumber" runat="server" Height="30px" placeholder="Client Contact Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span style="color: red;">*</span><span>Client Email Address</span>
                                                            <asp:TextBox ID="txtClientEmailAddress" runat="server" Height="30px" placeholder="Client Email Address" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Policy Number</span>
                                                            <asp:TextBox ID="txtClientPolicyNumber" runat="server" Height="30px" placeholder="Policy Address" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>



                                                </div>

                                                <%--Insured Details--%>
                                                <div class="row">


                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Claim Number</span>
                                                            <asp:TextBox ID="txtClaimNumber" runat="server" Height="30px" placeholder="Claim Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Total Valuation Amount</span>
                                                            <asp:TextBox ID="txtTotalValuationAmount" runat="server" Height="30px" placeholder="Total Valuation Amount" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>


                                                </div>






                                                <legend><i class="fas fa-map-marked-alt"></i>&nbsp;Valuation Address</legend>

                                                <div class="row">


                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span style="color: red;">*</span><span>Province</span>
                                                            <asp:DropDownList Style="padding: 0px" runat="server" ID="cmbProvince" OnTextChanged="cmbProvince_Change" OnDataBound="cmbProvince_Change" AutoPostBack="true" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span style="color: red;">*</span><span>Town</span>
                                                            <asp:DropDownList Style="padding: 0px" runat="server" ID="cmbTown" AutoPostBack="true" OnTextChanged="cmbTown_Change" OnDataBound="cmbTown_Change" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Suburb</span>
                                                            <asp:DropDownList Style="padding: 0px" runat="server" ID="cmbSuburb" AutoPostBack="true" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Postal Code</span>
                                                            <asp:TextBox Style="padding: 0px" runat="server" ID="txtPostalCode" Placeholder="Postal Code" Height="30px" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">


                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Street Number</span>
                                                            <asp:TextBox ID="txtStreetNumber" runat="server" Height="30px" placeholder="Street Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Street Name</span>
                                                            <asp:TextBox ID="txtStreetName" runat="server" Height="30px" placeholder="Street Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Building Name</span>
                                                            <asp:TextBox ID="txtBuildingName" runat="server" Height="30px" placeholder="Building Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>








                                                <legend><i class="fas fa-user-tie"></i>&nbsp;Insurer Information </legend>
                                                <%--Insurer Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Insurer Name</span>
                                                            <asp:TextBox ID="txtInsurerName" runat="server" Height="30px" placeholder="Insurer Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Insurer Contact Person</span>
                                                            <asp:TextBox ID="txtInsurerContactPerson" runat="server" Height="30px" placeholder="Insurer Contact Person" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Insurer Contact Number</span>
                                                            <asp:TextBox ID="txtInsurerContactNumber" runat="server" Height="30px" placeholder="Insurer Contact Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Insurer Email</span>
                                                            <asp:TextBox ID="txtInsurerEmail" runat="server" Height="30px" placeholder="Insurer Email Address" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Insurer Function</span>
                                                            <asp:TextBox ID="txtInsurerFunction" runat="server" Height="60px" TextMode="MultiLine" placeholder="Insurer Function" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>



                                                <legend><i class="far fa-handshake"></i>&nbsp;Broker Information </legend>
                                                <%--Insurer Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Broker Name</span>
                                                            <asp:TextBox ID="txtBrokerName" runat="server" Height="30px" placeholder="Broker Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Broker Contact Person</span>
                                                            <asp:TextBox ID="txtBrokerContactPerson" runat="server" Height="30px" placeholder="Broker Contact Person" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Broker Contact Number</span>
                                                            <asp:TextBox ID="txtBrokerContactNumber" runat="server" Height="30px" placeholder="Broker Contact Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Broker Email</span>
                                                            <asp:TextBox ID="txtBrokerEmail" runat="server" Height="30px" placeholder="Broker Email Address" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span>Broker Function</span>
                                                            <asp:TextBox ID="txtBrokerFunction" runat="server" Height="60px" TextMode="MultiLine" placeholder="Broker Function" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnSaveRequest" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <%--Client Tab End--%>

                                <%--Valueators Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentValuators" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>



                                            </ul>
                                        </div>
                                    </nav>

                                    <asp:UpdatePanel runat="server" ID="UpdatePanel18888" UpdateMode="Conditional">
                                        <ContentTemplate>


                                            <div class="alert alert-warning alert-dismissible" style="margin: 15px">
                                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                <h5><i class="far fa-smile-wink"></i>Heads up!</h5>
                                                Quotes below are based on <strong>Total Valuation Amount</strong> provided. In the event that your valuation estimate is less than the valuators estimate you might be liable to pay an additional surcharge, along with other potential expenses associated with this valuation. 
                                            </div>

                                            <asp:HiddenField runat="server" ID="vQuoteID" />
                                            <asp:Button runat="server" ID="btnAppointMoovableAssetsValuator" Style="display: none !important" OnClick="btnAppointMoovableAssetsValuator_Click" />

                                            <asp:Literal runat="server" ID="litValuators"></asp:Literal>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />

                                             <asp:AsyncPostBackTrigger ControlID="btnAppointMoovableAssetsValuator" EventName="Click" />

                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <%--Valuators Tab End--%>


                                                                <%--Valueators Tab Start--%>
                                <div class="tab-pane fade" id="tabExpenses" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="$('#<%=btnOpenAddExpense.ClientID.ToString()%>').click();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-plus"></i>&nbsp;Add Expense</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>

                                    <asp:UpdatePanel runat="server" ID="UpdatePanel8" UpdateMode="Conditional">
                                        <ContentTemplate>


                                   <asp:HiddenField ID="vExpenseID" runat="server" />
                                            <asp:Button ID="btnExpense" runat="server" style="display:none !important" OnClick="btnExpense_Click" />
                                            <asp:Literal runat="server" ID="litExpenses"></asp:Literal>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnUploadExpenseFinish" EventName="Click" />
                                            <asp:AsyncPostBackTrigger ControlID="btnExpense" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <%--Valuators Tab End--%>

                                <%--Bookings Tab Start--%>
                                <div class="tab-pane fade" id="tabBookings" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

                                    <asp:UpdatePanel runat="server" ID="UpdatePanel15" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                        <ContentTemplate>


                                            <div class="row d-flex align-items-stretch" style="padding: 10px;">
                                                <div class="col-6 col-sm-6 col-md-6 d-flex align-items-stretch" style="min-width: 500px !important; max-width: 500px;">
                                                    <div class="card bg-light">
                                                        <div class="card-header  border-bottom-0">
                                                            <i class="far fa-hourglass"></i>&nbsp;Set Booking Date
                                                        </div>
                                                        <div class="card-body pt-0">
                                                            <asp:UpdatePanel runat="server" ID="updPanelBookingDate" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                                <ContentTemplate>
                                                                    <div class="row">
                                                                        <div class="form-group">
                                                                            <span>Booking Date</span>
                                                                            <asp:TextBox CssClass="form-control" runat="server" Height="30px" placeholder="Booking Date" Width="450px" ID="txtBookingDate"></asp:TextBox>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <span>Confirmed By Name</span>
                                                                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Confirmed By Name" Height="30px" Width="450px" ID="txtConfirmedByName"></asp:TextBox>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <span>Confirmed By Contact</span>
                                                                            <asp:TextBox CssClass="form-control" runat="server" placeholder="Confirmed By Contact" Height="30px" Width="450px" ID="txtConfirmedByCellphone"></asp:TextBox>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <span>Notes</span>
                                                                            <asp:TextBox CssClass="form-control" runat="server" TextMode="MultiLine" placeholder="Notes" Height="60px" Width="450px" ID="txtBookingNotes"></asp:TextBox>
                                                                        </div>

                                                                    </div>
                                                                    <div style="margin-top: 10px !important" class="row">
                                                                        <asp:Button runat="server" Text="Save Booking" ID="btnSaveBooking" OnClick="btnSaveBooking_Click" Style="background: black !important; border-color: black !important" class="btn btn-block btn-info btn-sm" />
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <%--Bookings Tab End--%>

                                <%--Property Details Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentProperty" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
                                     <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="$('#<%=btnUpdatePropertyDetails.ClientID.ToString()  %>').click();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-save"></i>&nbsp;Save Details</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <div style="margin: 10px">

                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                            <ContentTemplate>

                                                <asp:Button runat="server" style="display:none" OnClick="btnUpdatePropertyDetails_Click" ID="btnUpdatePropertyDetails" />

                                                <legend><i class="fas fa-map-marked-alt"></i>&nbsp;Valuation Address</legend>

                                                <div class="row">


                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span style="color: red;">*</span><span>Province</span>
                                                            <asp:DropDownList Style="padding: 0px" runat="server" ID="cmbConfirmProvince" OnTextChanged="cmbConfirmProvince_Change" OnDataBound="cmbProvince_Change" AutoPostBack="true" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group" style="padding: 0px !important">
                                                            <span style="color: red;">*</span><span>Town</span>
                                                            <asp:DropDownList Style="padding: 0px" runat="server" ID="cmbConfirmTown" AutoPostBack="true" OnTextChanged="cmbConfirmTown_Change" OnDataBound="cmbTown_Change" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Suburb</span>
                                                            <asp:DropDownList Style="padding: 0px" runat="server" ID="cmbConfirmSuburb" AutoPostBack="true" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Postal Code</span>
                                                            <asp:TextBox Style="padding: 0px" runat="server" ID="txtConfirmPostalCode" Placeholder="Postal Code" Height="30px" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">


                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Street Number</span>
                                                            <asp:TextBox ID="txtConfirmStreetNumber" runat="server" Height="30px" placeholder="Street Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Street Name</span>
                                                            <asp:TextBox ID="txtConfirmStreetName" runat="server" Height="30px" placeholder="Street Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Building Name</span>
                                                            <asp:TextBox ID="txtConfirmBuildingName" runat="server" Height="30px" placeholder="Building Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                </div>


                                                <legend><i class="fas fa-asterisk"></i>&nbsp;Address Details</legend>

                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Type of Residence</span>
                                                            <asp:DropDownList ID="cmbTypeOfResidence" runat="server" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Roof Construction</span>
                                                            <asp:DropDownList ID="cmbRoofConstruction" runat="server" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Vicinity</span>
                                                            <asp:DropDownList ID="cmbVicinity" Style="padding: 0px" runat="server" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Extent of land</span>
                                                            <asp:DropDownList ID="cmbExtentOfLand" runat="server" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">



                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Surroundings / Borders</span>
                                                            <asp:DropDownList ID="cmbBorders" runat="server" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>General Comments</span>
                                                            <asp:TextBox ID="txtGeneralComments" Style="padding: 0px" runat="server" Height="30px" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>



                                                <legend><i class="fas fa-user-secret"></i>&nbsp;Security and Maintenance</legend>


                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Access Control</span>
                                                            <asp:DropDownList ID="cmbAccessControl" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Armed Response</span>
                                                            <asp:DropDownList ID="cmbArmedResponse" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>CCTV</span>
                                                            <asp:DropDownList ID="cmbCCTV" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Perimeter Wall / Fence</span>
                                                            <asp:DropDownList ID="cmbPerimeterWall" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Electric Perimeter Fence</span>
                                                            <asp:DropDownList ID="cmbElectricFence" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Barbed Wire / Razors / Spikes</span>
                                                            <asp:DropDownList ID="cmbBarbedWire" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Guards on Patrol</span>
                                                            <asp:DropDownList ID="cmbGuardOnPatrol" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Security Gate(s)</span>
                                                            <asp:DropDownList ID="cmbSecurityGates" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Internal Security Beams</span>
                                                            <asp:DropDownList ID="cmbInternalSecurityBeams" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>External Security Beams</span>
                                                            <asp:DropDownList ID="cmbExternalSecurityBeams" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Alarm System</span>
                                                            <asp:DropDownList ID="cmbAlarmSystem" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Window Security Measures (Burglar Bars)</span>
                                                            <asp:DropDownList ID="cmbWindowSecurityMeasures" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="form-group col-lg-12">
                                                        <span style="color: red;">*</span><span>General Comments</span>
                                                        <asp:TextBox TextMode="MultiLine" ID="txtSecurityComments" runat="server" Height="45px" CssClass="form-control input-sm">
                                                        </asp:TextBox>
                                                    </div>
                                                </div>

                                                <legend><i class="fas fa-fire-extinguisher"></i>&nbsp;Fire Risk and Safety</legend>



                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Thatch Structures</span>
                                                            <asp:DropDownList ID="cmbThatchStructures" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Wooden Structures</span>
                                                            <asp:DropDownList ID="cmbWoodenStructures" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Fire Fighting Equipment</span>
                                                            <asp:DropDownList ID="cmbFireFightingEquipment" runat="server" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="Please select" Selected="True" Value="-1"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="No" Selected="False" Value="0"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Yes" Selected="False" Value="1"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Other potential risk</span>
                                                            <asp:TextBox ID="txtOtherPotentialRisk" runat="server" Height="30px" CssClass="form-control input-sm">
                                                            </asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="row">
                                                    <div class="form-group col-lg-12">
                                                        <span style="color: red;">*</span><span>General Comments</span>
                                                        <asp:TextBox TextMode="MultiLine" ID="txtFireGeneralComments" runat="server" Height="45px" CssClass="form-control input-sm">
                                                        </asp:TextBox>
                                                    </div>
                                                </div>


                                                </div>

                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnSaveRequest" EventName="Click" />
                                                                                                <asp:AsyncPostBackTrigger ControlID="btnUpdatePropertyDetails" EventName="Click" />

                                                

                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <%--Property Details Tab End--%>

                                    <%--Attachments Tab Start--%>
                                    <div class="tab-pane fade " id="tabAssessmentAttachments" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <div class="collapse navbar-collapse">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item">
                                                        <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                    </li>

                                                    <li class="nav-item">
                                                        <a onclick="AssessmentAssetsValuationControls.Functions.UploadAttachments();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-file-upload"></i>&nbsp;Upload Attachments</a>
                                                    </li>

                                                </ul>
                                            </div>
                                        </nav>
                                        <asp:UpdatePanel ID="UpdatePanel13" runat="server" ChildrenAsTriggers="TRUE" UpdateMode="Conditional">

                                            <ContentTemplate>
                                                <asp:Literal runat="server" ID="litAssessmentAttachments"></asp:Literal>
                                                <asp:Button runat="server" ID="btnAssessmentAttachments" OnClick="btnAssessmentAttachments_Click" Style="display: none !important" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnAssessmentAttachments" EventName="Click" />

                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <%--Attachments Tab End--%>


                                    <%--Tracks Tab Start--%>
                                    <div class="tab-pane fade" id="tabAssessmentTracks" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <ul class="navbar-nav">
                                       
                                                <li class="nav-item">
                                                    <a onclick="AssessmentAssetsValuationControls.Functions.RefreshAssessmentTracks();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>
                                            </ul>
                                        </nav>


                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="updPanelAssessmentTracks" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                <ContentTemplate>
                                                    <asp:Literal runat="server" ID="litAssessmentTracks"></asp:Literal>
                                                    <asp:Button runat="server" ID="btnRefreshTracks" OnClick="btnRefreshTracks_Click" Style="display: none !important" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                     <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentBuilding" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentRoom" EventName="Click" />

                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <%--Tracks Tab End--%>

                                    <%--Users Tab Start--%>
                                    <div class="tab-pane fade" id="tabAssessmentUsers" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="AssessmentAssetsValuationControls.Functions.AssignUser();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-user-plus"></i>&nbsp;Assign User</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a onclick="AssessmentAssetsValuationControls.Functions.RefreshAssessmentUsers();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>
                                            </ul>
                                        </nav>


                                        <asp:UpdatePanel runat="server" ID="updPanelAssessmentUsers" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Button runat="server" Style="display: none !important" ID="btnRefereshAssessmentUsers" OnClick="btnRefereshAssessmentUsers_Click" />
                                                <asp:Button runat="server" Style="display: none !important" ID="btnUnassignUserFromAssessment" OnClick="btnUnassignUserFromAssessment_Click" />

                                                <asp:Literal runat="server" ID="litAssessmentUsers"></asp:Literal>

                                                <asp:HiddenField ID="vUnassignUserID" runat="server" />


                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />



                                            </Triggers>
                                        </asp:UpdatePanel>




                                    </div>
                                    <%--Users Tab End--%>

                          
                                    <%--Quotes Tab Start--%>
                                    <div class="tab-pane fade " id="tabAssessmentQuotes" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <div class="collapse navbar-collapse">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item">
                                                        <a id="btnAddQuote" onclick="AssessmentAssetsValuationControls.Functions.AddQuote();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-plus"></i>&nbsp;Add Quote</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a onclick="AssessmentAssetsValuationControls.Functions.RefreshAssessmentQuotes();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </nav>
                                        <asp:UpdatePanel runat="server" ID="updPanelAssessmentQuotes" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Literal runat="server" ID="litAssessmentQuotes"></asp:Literal>
                                                <asp:Button ID="btnAssessmentQuotesRefresh" OnClick="btnAssessmentQuotesRefresh_Click" runat="server" Style="display: none" />
                                                <asp:HiddenField ID="vQuoteStatusID" runat="server" />
                                                <asp:Button runat="server" ID="btnUpdateQuoteStatus" OnClick="btnUpdateQuoteStatus_Click" Style="display: none !important"></asp:Button>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <%--Quotes Tab End--%>

                                    <%--Asset Register Tab Start--%>
                                    <div class="tab-pane fade" id="tabAssessmentAssetRegister" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <div class="collapse navbar-collapse" id="navbarNavAssetRegister">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item">
                                                        <a onclick="AssessmentAssetsValuationControls.Building.Open(0);" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-home"></i>&nbsp;Add Building</a>
                                                    </li>
                                                    <li class="nav-item">

                                                        <a onclick="AssessmentAssetsValuationControls.Room.Open(0);" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-door-open"></i>&nbsp;Add Room</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </nav>
                                        <div class="col-md-12">



                                            <div class="row">



                                                <div class="col-3 col-sm-3 col-md-3">

                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel4" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                                        <ContentTemplate>



                                                            <div class="card bg-light">
                                                                <div class="card-header  border-bottom-0">
                                                                    <i class="fas fa-feather-alt"></i>&nbsp; New Asset
                                                    <div class="card-tools">

                                                        <button type="button" class="btn btn-tool" data-card-widget="maximize">
                                                            <i class="fas fa-expand"></i>
                                                        </button>
                                                    </div>
                                                                </div>
                                                                <div class="card-body pt-0">



                                                                    <div class="row">


                                                                        <div class="col-6 col-sm-6 col-md-6">

                                                                            <div class="form-group">
                                                                                <span>Buidling</span>
                                                                                <asp:DropDownList Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="cmbAssetBuilding" OnTextChanged="cmbAssetBuilding_Change" OnDataBound="cmbAssetBuilding_Change" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-6 col-sm-6 col-md-6">

                                                                            <div class="form-group">
                                                                                <span>Room</span>
                                                                                <asp:DropDownList Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="cmbAssetRoom" OnTextChanged="cmbAssetRoom_Change" OnDataBound="cmbAssetRoom_Change" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-6 col-sm-6 col-md-6">
                                                                            <div class="form-group">
                                                                                <span>Category</span>
                                                                                <asp:DropDownList Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="cmbCategory" OnTextChanged="cmbCategory_Change" OnDataBound="cmbCategory_Change" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-6 col-sm-6 col-md-6">

                                                                            <div class="form-group">
                                                                                <span>Subcategory</span>
                                                                                <asp:DropDownList Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="cmbSubCategory" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-6 col-sm-6 col-md-6">
                                                                            <div class="form-group">
                                                                                <span>Manufacturer </span>
                                                                                <asp:TextBox Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="txtManufacturer" placeholder="Manufacturer" CssClass="form-control"></asp:TextBox>

                                                                            </div>
                                                                        </div>
                                                                        <div class="col-6 col-sm-6 col-md-6">

                                                                            <div class="form-group">
                                                                                <span>Supplier </span>
                                                                                <asp:TextBox Style="padding: 0px" runat="server" Width="100%" Height="28px" placeholder="Supplier" ID="txtSupplier" CssClass="form-control"></asp:TextBox>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="form-group">
                                                                        <span>Title</span>
                                                                        <asp:TextBox runat="server" ID="txtAssetTitle" CssClass="form-control" Width="100%" Height="28px" placeholder="Asset Title"></asp:TextBox>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <span>Description</span>
                                                                        <asp:TextBox runat="server" ID="txtAssetDescription" TextMode="MultiLine" CssClass="form-control" Width="100%" Height="45px" placeholder="Asset Description"></asp:TextBox>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <span>SKU / Serial Number</span>
                                                                        <asp:TextBox runat="server" ID="txtAssetSKU" CssClass="form-control" Width="100%" Height="28px" placeholder="Asset SKU"></asp:TextBox>
                                                                    </div>



                                                                    <div class="row">



                                                                        <div class="form-group col-md-3 col-3 col-sm-3">
                                                                            <span>Qty</span>
                                                                            <asp:TextBox runat="server" TextMode="Number" ID="txtAssetQty" Text="1" CssClass="form-control" Width="100%" Height="28px" placeholder="1"></asp:TextBox>
                                                                        </div>

                                                                        <div class="form-group col-md-3 col-3 col-sm-3">
                                                                            <span>UOM</span>
                                                                            <asp:DropDownList Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="cmbUOM" CssClass="form-control"></asp:DropDownList>
                                                                        </div>

                                                                        <div class="form-group col-md-6 col-6 col-sm-6">
                                                                            <span>Measurement</span>
                                                                            <asp:TextBox runat="server" ID="txtMeasurement" CssClass="form-control" Width="100%" Height="28px" placeholder="Measurement"></asp:TextBox>
                                                                        </div>


                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="form-group col-md-12 col-12 col-sm-12">
                                                                            <span>Asset Price</span>
                                                                            <asp:TextBox runat="server" ID="txtAssetPrice" CssClass="form-control" Width="100%" Height="28px" placeholder="Asset Price"></asp:TextBox>
                                                                        </div>
                                                                    </div>

                                                                    <div style="margin-top: 10px !important" class="row">
                                                                        <asp:Button runat="server" Text="Add Asset" ID="btnAddAsset" OnClick="btnAddAsset_Click" Style="background: black !important; border-color: black !important" class="btn btn-block btn-info btn-sm" />
                                                                    </div>

                                                                </div>
                                                            </div>


                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveBuilding" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveRoom" EventName="Click" />
                                                                 <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentBuilding" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentRoom" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>




                                                <div class="col-9 col-sm-9 col-md-9">


                                                    <style>
                                                        .btn-app {
                                                            margin: 0px !important;
                                                        }

                                                        .badge {
                                                            z-index: 10;
                                                        }
                                                    </style>



                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel5" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                                        <ContentTemplate>


                                                            <asp:Button runat="server" ID="btnDropAsset" OnClick="btnDropAsset_Click" style="display:none !important"/>
                                                           <asp:Button runat="server" ID="btnDropAssetMedia" OnClick="btnDropAssetMedia_Click" style="display:none !important"/>
                                                            <asp:HiddenField ID="vAssetID" runat="server" />
                                                            <asp:HiddenField ID="vAssetMediaID" runat="server" />

                                                            <asp:Literal ID="litfrmRoom" runat="server"></asp:Literal>

                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveBuilding" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveRoom" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnAddAsset" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="cmbAssetRoom" EventName="TextChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="cmbAssetRoom" EventName="DataBound" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnUploadVideoFinish" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnUploadPhotoFinish" EventName="Click" />

                                                                                                                        <asp:AsyncPostBackTrigger ControlID="btnSaveAssetMedia" EventName="Click" />



                                                            

                                                             <asp:AsyncPostBackTrigger ControlID="btnDropAssetMedia" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnDropAsset" EventName="Click" />

                                                                                                                        <asp:AsyncPostBackTrigger ControlID="btnSaveTaggedMedia" EventName="Click" />

                                                            

                                                                 <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentBuilding" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentRoom" EventName="Click" />
                                                            

                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>




                                            </div>


                                        </div>






                                </div>
                                <%--Asset Register Tab End--%>

                                <%--Rooms Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentRooms" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNavRooms">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="AssessmentAssetsValuationControls.Room.Open(0);" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-door-open"></i>&nbsp;Add Room</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <div class="col-md-12">
                                        <asp:UpdatePanel ID="UpdatePanel16" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>
                                                  <asp:Chart Visible="true" ID="chartRooms" runat="server" Height="350px" EnableViewState="true">
                                                    <Series>
                                                        <asp:Series Name="Series1" XValueMember="Title" YValueMembers="Value">
                                                        </asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1">
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>
                                                <asp:HiddenField ID="vAssessmentRoomID" runat="server" />
                                                <asp:Button runat="server" ID="btnDropAssessmentRoom" OnClick="btnDropAssessmentRoom_Click" style="display:none !important" />

                                                <asp:Literal runat="server" ID="litAssessmentRooms"></asp:Literal>
                                            </ContentTemplate>
                                            <Triggers>
                                         <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveBuilding" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveRoom" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnAddAsset" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="cmbAssetRoom" EventName="TextChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="cmbAssetRoom" EventName="DataBound" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnUploadVideoFinish" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnUploadPhotoFinish" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveAssetMedia" EventName="Click" />
                                                             <asp:AsyncPostBackTrigger ControlID="btnDropAssetMedia" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnDropAsset" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveTaggedMedia" EventName="Click" />

                                                            

                                                                 <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentBuilding" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentRoom" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <%--Rooms Tab End--%>

                                <%--Building Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentBuildings" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNavBuilding">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="AssessmentAssetsValuationControls.Building.Open(0);" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-home"></i>&nbsp;Add Building</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <div class="col-md-12">
                                        <asp:UpdatePanel ID="UpdatePanel17" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>
                                                <asp:Chart Visible="true" ID="chartBuildings" runat="server" Height="350px" EnableViewState="true">
                                                    <Series>
                                                        <asp:Series Name="Series1" XValueMember="Title" YValueMembers="Value">
                                                        </asp:Series>
                                                    </Series>
                                                    <ChartAreas>
                                                        <asp:ChartArea Name="ChartArea1">
                                                        </asp:ChartArea>
                                                    </ChartAreas>
                                                </asp:Chart>

                                                <asp:HiddenField ID="vAssessmentBuildingID" runat="server" />
                                                <asp:Button runat="server" ID="btnDropAssessmentBuilding" OnClick="btnDropAssessmentBuilding_Click" style="display:none !important" />


                                                <asp:Literal runat="server" ID="litAssessmentBuildings"></asp:Literal>
                                            </ContentTemplate>
                                            <Triggers>
                                             <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveBuilding" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnSaveRoom" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnAddAsset" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="cmbAssetRoom" EventName="TextChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="cmbAssetRoom" EventName="DataBound" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnUploadVideoFinish" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnUploadPhotoFinish" EventName="Click" />

                                                                                                                        <asp:AsyncPostBackTrigger ControlID="btnSaveAssetMedia" EventName="Click" />



                                                            

                                                             <asp:AsyncPostBackTrigger ControlID="btnDropAssetMedia" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="btnDropAsset" EventName="Click" />

                                                                                                                        <asp:AsyncPostBackTrigger ControlID="btnSaveTaggedMedia" EventName="Click" />

                                                            

                                                                 <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentBuilding" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnDropAssessmentRoom" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <%--Rooms Tab End--%>







                                              <%--Reports Tab Start--%>
                                    <div class="tab-pane fade" id="tabAssessmentReports" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
                                        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="$('#<%=btnRefreshReport.ClientID %>').click();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>
                                                  <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important;cursor:pointer !important" class="nav-link" onclick="AssessmentAssetsValuationControls.Functions.DownloadReport();"><i class="far fa-file-pdf"></i>&nbsp;Download</a>
                                                </li>
                                            </ul>
                                        </nav>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel9" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                  <asp:Button runat="server" ID="btnRefreshReport" OnClick="btnRefreshReport_Click" style="display:none !important" />
                                                <asp:Literal runat="server" ID="litReport"></asp:Literal>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <%--Reports Tab End--%>



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















<div class="modal fade" id="mdlAttachmentsUpload" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1000px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel14" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button ID="btnUploadAttachmentsHidden" runat="server" OnClick="btnUploadAttachmentsHidden_Click" Style="display: none !important" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-paperclip"></i>&nbsp;Upload Attachment(s)</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="litAttachmentsUploadFrame"></asp:Literal>
                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" data-dismiss="modal" runat="server" OnClientClick="$('#Assessment_Assets_Valuation_btnAssessmentAttachments').click();('#Assessment_Assets_Valuation_btnAssessmentAttachments').click();" CssClass="btn btn-warning pull-right" Text="Done" />
                    </div>
                </ContentTemplate>

            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->







    
<div class="modal fade" id="mdlCancelAssessmentReason"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 400px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel11" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>


                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-ban"></i>&nbsp;<asp:Literal runat="server" ID="lblCancelAssessment" Text="Cancel Valuation"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>Reason? <span style="font-style:italic">(not compulsary)</span></span>
                            <asp:TextBox runat="server" TextMode="MultiLine" Height="65px" Width="100%" ID="txtAssessmentCancellationReason"></asp:TextBox>
                        </div>

                    </div>
                    <div class="modal-footer"> 
                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Close" />
                        <asp:Button style="float:left !important"  runat="server" CssClass="btn btn-danger pull-right" Text="Confirm" OnClick="btnConfrimCancelAssessment_Click"/>
                    </div>
                </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnCancelAssessment" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->







<div class="modal fade" id="mdlBuilding" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 525px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" Style="display: none" ID="btnOpenAssessmentBuilding" OnClick="btnOpenAssessmentBuilding_Click" />
                    <asp:HiddenField runat="server" ID="vBuildingID" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-home"></i>&nbsp;<asp:Literal runat="server" ID="lblBuidlingTitle" Text="Add Building"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>Title</span>
                            <asp:TextBox runat="server" ID="txtBuildingTitle" CssClass="form-control" Width="100%" Height="28px" placeholder="Building Title"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <span>Description</span>
                            <asp:TextBox runat="server" ID="txtBuildingDescription" CssClass="form-control" Width="100%" Height="55px" TextMode="MultiLine" placeholder="Building Description"></asp:TextBox>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Close" />
                        <asp:Button Style="float: left !important" runat="server" CssClass="btn btn-success pull-right" Text="Save" ID="btnSaveBuilding" OnClick="btnSaveBuilding_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<div class="modal fade" id="mdlRoom" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 525px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" Style="display: none" ID="btnOpenAssessmentRoom" OnClick="btnOpenAssessmentRoom_Click" />
                    <asp:HiddenField runat="server" ID="vRoomID" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-door-open"></i>&nbsp;<asp:Literal runat="server" ID="lblRoomTitle" Text="Add Room"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>Title</span>
                            <asp:TextBox runat="server" ID="txtRoomTitle" CssClass="form-control" Width="100%" Height="28px" placeholder="Room Title"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <span>Room Type</span>
                            <asp:DropDownList Style="padding: 0px" AutoPostBack="true" OnTextChanged="cmbRoomType_Change" runat="server" OnDataBound="cmbRoomType_Change" Width="100%" Height="28px" ID="cmbRoomType"></asp:DropDownList>
                        </div>

                        <div class="form-group" runat="server" id="isOtherRoomType" visible="false">
                            <span>Describe Other?</span>
                            <asp:TextBox runat="server" ID="txtDescribeOther" CssClass="form-control" Width="100%" Height="55px" TextMode="MultiLine" placeholder="Room Description"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <span>Building</span>
                            <asp:DropDownList Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="cmbRoomAssociatedBuilding"></asp:DropDownList>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Close" />
                        <asp:Button Style="float: left !important" runat="server" CssClass="btn btn-success pull-right" Text="Save" ID="btnSaveRoom" OnClick="btnSaveRoom_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->




<div class="modal fade" id="mdlPhotograph" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1005px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel6" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" Style="display: none" ID="btnOpenAddPhoto" OnClick="btnOpenAddPhoto_Click" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-camera-retro"></i>&nbsp;<asp:Literal runat="server" ID="lblPhotographt" Text="Add Photographt(s)"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="litPhoto"></asp:Literal>
                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" runat="server" CssClass="btn btn-success pull-right" Text="Finish" ID="btnUploadPhotoFinish" OnClick="btnUploadPhotoFinish_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



    

<div class="modal fade" id="mdlVideo" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1005px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel7" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" Style="display: none" ID="btnOpenAddVideo" OnClick="btnOpenAddVideo_Click" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-film"></i>&nbsp;<asp:Literal runat="server" ID="Literal1" Text="Add Video"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="litVideo"></asp:Literal>
                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" runat="server" CssClass="btn btn-success pull-right" Text="Finish" ID="btnUploadVideoFinish" OnClick="btnUploadVideoFinish_Click"/>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



        

<div class="modal fade" id="mdlExpense" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1005px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel10" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" Style="display: none" ID="btnOpenAddExpense" OnClick="btnOpenAddExpense_Click" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-piggy-bank"></i>&nbsp;<asp:Literal runat="server"  Text="Add Expense"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="litExpense"></asp:Literal>
                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" runat="server" CssClass="btn btn-success pull-right" Text="Finish" ID="btnUploadExpenseFinish" OnClick="btnUploadExpenseFinish_Click"/>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

    <div class="modal fade" id="mdlTaggedMediaItens" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 705px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel12" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" Style="display: none" ID="btnOpenTaggedMediaItems" OnClick="btnOpenTaggedMediaItems_Click" />
                    <asp:HiddenField ID="vAssetMediaItem" runat="server" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-tag"></i>&nbsp;<asp:Literal runat="server" ID="lblTaggedMediaItems"  Text="Manage Tagged Assets"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                        <div class="alert alert-warning alert-dismissible" style="zoom: 75%;">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h5><i class="icon fas fa-exclamation-triangle"></i> Note!</h5>
                  You may only tag a maximum of 5 assets.
                </div>
                          <div style="height: 225px">
                        <asp:Literal runat="server" ID="litTaggedMedia"></asp:Literal>
                              </div>

                        <div class="form-group">
                            <span>Tagged Assets</span>
                        <asp:CheckBoxList ID="chkTaggedMediaItems" runat="server" AutoPostBack="true" Width="680px" Height="200px" style="overflow:auto" CssClass="form-control"></asp:CheckBoxList>  
                            </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" runat="server" CssClass="btn btn-success pull-right" Text="Save" ID="btnSaveTaggedMedia" OnClick="btnSaveTaggedMedia_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->




        <div class="modal fade" id="mdlAssetMedia" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 705px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel18" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" Style="display: none" ID="btnOpenAssetMedia" OnClick="btnOpenAssetMedia_Click" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fa fa-pencil"></i>&nbsp;<asp:Literal runat="server" ID="lblManageAssetMedia"  Text="Manage Tagged Assets"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                          <div style="height: 225px">
                        <asp:Literal runat="server" ID="litAssetMedia"></asp:Literal>
                              </div>

                        <div class="form-group">
                            <span>Title</span>
                            <asp:TextBox runat="server" ID="txtAssetMediaTitle" CssClass="form-control" Width="100%" Height="28px" placeholder="Asset Title"></asp:TextBox>
                        </div>

                                                <div class="form-group">
                            <span>Room Cover?</span>
                           <asp:DropDownList Style="padding: 0px" runat="server" Width="100%" Height="28px" ID="cmbAssetMediaRoomCover" CssClass="form-control">
                               <asp:ListItem Enabled="true" Text="No" Value="0" Selected="True"></asp:ListItem>
                               <asp:ListItem Enabled="true" Text="Yes" Value="1" Selected="false"></asp:ListItem>

                           </asp:DropDownList>

                        </div>


                        
                    </div>
                    <div class="modal-footer">
                        <asp:Button Style="float: left !important" runat="server" CssClass="btn btn-success pull-right" Text="Save" ID="btnSaveAssetMedia" OnClick="btnSaveAssetMedia_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->





<script type="text/javascript">



    



    let AssessmentAssetsValuationControls = {
        Initialze: (Data) => {
            $('#<%=vAssessmentID.ClientID.ToString()%>').val(Data);
            $('#<%=btnInitialize.ClientID.ToString()%>').click();
            changeUrl('MODULE', 'ASSESSMENT_ASSETS_VALUATION');
            changeUrl('DATA', Router.Functions.Encode(Data));
            $('.content-wrapper').hide();
            $('#modAssessmentAssetsValuation').fadeIn(5000);
        },
        Declare: () => {

            $('#<%=txtBookingDate.ClientID.ToString()%>').datepicker({
                autoclose: true,
                orientation: 'bottom',
                format: "yyyy/mm/dd"
            });



        },
        Building: {
            Open: (ID) => {
                $('#<%=vBuildingID.ClientID.ToString()%>').val(ID);
                setTimeout(() => {
                    $('#<%=btnOpenAssessmentBuilding.ClientID.ToString()%>').click();
                }, 500);

            }
        },
        Room: {
            Open: (ID) => {
                $('#<%=vRoomID.ClientID.ToString()%>').val(ID);
                setTimeout(() => {
                    $('#<%=btnOpenAssessmentRoom.ClientID.ToString()%>').click();
                }, 500);
            }
        },
        Tabs: {
            Specifications: {
                Editor: {
                    Initialize: () => {
                        try {
                            //CKEDITOR.config.width = '100%';
                            //CKEDITOR.config.height = 370;
                            //CKEDITOR.replace('Assessment$txtSpecifications');
                        } catch (ex) { console.log(ex); }
                    }
                }
            },
            ClientDetails: {
                Save: () => {
                    $('#<%=btnSaveRequest.ClientID.ToString()%>').click();
                }
            },
            Gallary: {
                Lightbox: {
                    Initialize: () => {
                        $(document).off('click', '[data-toggle="lightbox"]');
                        $(document).on('click', '[data-toggle="lightbox"]', function (event) {
                            event.preventDefault();
                            $(this).ekkoLightbox();
                        });
                    }
                }
            },
            Quotes: {
                Accept: (QuoteID) => {
                    $('#<%=vQuoteID.ClientID.ToString()%>').val(QuoteID);
                    $('#<%=vQuoteStatusID.ClientID.ToString()%>').val('2');
                    setTimeout(() => { $('#<%=btnUpdateQuoteStatus.ClientID.ToString()%>').click(); }, 500);
                },
                Reject: (QuoteID) => {
                    $('#<%=vQuoteID.ClientID.ToString()%>').val(QuoteID);
                    $('#<%=vQuoteStatusID.ClientID.ToString()%>').val('3');
                    setTimeout(() => { $('#<%=btnUpdateQuoteStatus.ClientID.ToString()%>').click(); }, 500);

                }
            }
        },
        Functions: {
            EditAssetMedia: (ExpenseID) => {
                $('#<%=vAssetMediaID.ClientID%>').val(ExpenseID);
                $('#<%=btnOpenAssetMedia.ClientID%>').click();
            },
            TagMediaItems: (ExpenseID) => {
                $('#<%=vAssetMediaItem.ClientID%>').val(ExpenseID);
                $('#<%=btnOpenTaggedMediaItems.ClientID%>').click();
            },
            DeleteRoom: (ExpenseID) => {
                $('#<%=vAssessmentRoomID.ClientID%>').val(ExpenseID);
                Swal.fire({
                    title: 'Yoh!, are you sure about deleteing this room?',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Yes!',
                    denyButtonText: `No, eish`,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $('#<%=btnDropAssessmentRoom.ClientID%>').click();
                    } else if (result.isDenied) {
                        Swal.fire('Close call, not deleted, carefull now', '', 'info')
                    }
                });
            },
            DeleteBuilding: (ExpenseID) => {



                $('#<%=vAssessmentBuildingID.ClientID%>').val(ExpenseID);
                Swal.fire({
                    title: 'Yoh!, are you sure about deleteing this building?',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Yes!',
                    denyButtonText: `No, eish`,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $('#<%=btnDropAssessmentBuilding.ClientID%>').click();

                    } else if (result.isDenied) {
                        Swal.fire('Close call, not deleted, carefull now', '', 'info')
                    }
                });


            },
            DeleteAsset: (ExpenseID) => {





                $('#<%=vAssetID.ClientID%>').val(ExpenseID);
                Swal.fire({
                    title: 'Yoh!, are you sure about deleteing this asset(s)?',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Yes!',
                    denyButtonText: `No, eish`,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $('#<%=btnDropAsset.ClientID%>').click();
                    } else if (result.isDenied) {
                        Swal.fire('Close call, not deleted, carefull now', '', 'info')
                    }
                });


            },

            DeleteAssetMedia: (ExpenseID) => {
                $('#<%=vAssetMediaID.ClientID%>').val(ExpenseID);




                $('#<%=vAssetID.ClientID%>').val(ExpenseID);
                Swal.fire({
                    title: 'Yoh!, are you sure about deleteing this media?',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Yes!',
                    denyButtonText: `No, eish`,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $('#<%=btnDropAssetMedia.ClientID%>').click();

                    } else if (result.isDenied) {
                        Swal.fire('Close call, not deleted, carefull now', '', 'info')
                    }
                });

            },

            DeleteExpense: (ExpenseID) => {
                $('#<%=vExpenseID.ClientID%>').val(ExpenseID);



                $('#<%=vAssetID.ClientID%>').val(ExpenseID);
                Swal.fire({
                    title: 'Yoh!, are you sure about deleteing this expense?',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'Yes!',
                    denyButtonText: `No, eish`,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $('#<%=btnExpense.ClientID%>').click();

                    } else if (result.isDenied) {
                        Swal.fire('Close call, not deleted, carefull now', '', 'info')
                    }
                });

            },
            AppointValueator: (QuoteID) => {
                $('#<%=vQuoteID.ClientID.ToString()%>').val(QuoteID);

                setTimeout(() => { $('#<%=btnAppointMoovableAssetsValuator.ClientID.ToString()%>').click(); }, 1000);

            },
            UploadAttachments: () => {
                $('#<%=btnUploadAttachmentsHidden.ClientID%>').click();
            },
            UploadPhoto: () => {
                $('#<%=btnOpenAddPhoto.ClientID%>').click();
            },
            UploadVideo: () => {
                $('#<%=btnOpenAddVideo.ClientID%>').click();
            },
            AddAssessmentReview: (SurveyCategoryID) => {

                let AssessmentID = $('#<%=vAssessmentID.ClientID%>').val();
                let UserID = $('#<%=vUserID.ClientID%>').val();
                let Message = $(`#txtReview${SurveyCategoryID}`).val();
                $.ajax({
                    url: "http://api.mitig8.co.za/Review/Add?AssessmentID=" + AssessmentID + "&UserID=" + UserID + "&SurveyCategoryID=" + SurveyCategoryID + "&Message=" + Message,
                    type: "GET",
                    contentType: "text/plain",
                    success: function (data, textStatus, jqXHR) {

                        if (data[0].UserName.includes('Assessor')) {
                            let Message =
                                `<div class="direct-chat-msg">
                  <div class="direct-chat-info clearfix">
                    <span class="direct-chat-name pull-left">${data[0].UserName}</span>
                    <span class="direct-chat-timestamp pull-right">${data[0].Date}</span>
                  </div>
                  <!-- /.direct-chat-info -->
                  <img class="direct-chat-img" src="/images/nopic.jpg" alt="Message User Image"><!-- /.direct-chat-img -->
                  <div class="direct-chat-text">
                    ${data[0].Message}
                  </div>
                  <!-- /.direct-chat-text -->
                </div>`

                            $(`#msgReview${data[0].SurveyCategoryID}`).prepend(Message);
                        }
                        else {
                            let Message =
                                `<div class="direct-chat-msg right">
                  <div class="direct-chat-info clearfix">
                    <span class="direct-chat-name pull-right">${data[0].UserName}</span>
                    <span class="direct-chat-timestamp pull-right">${data[0].Date}</span>
                  </div>
                  <!-- /.direct-chat-info -->
                  <img class="direct-chat-img" src="/images/nopic.jpg" alt="Message User Image"><!-- /.direct-chat-img -->
                  <div class="direct-chat-text">
                    ${data[0].Message}
                  </div>
                  <!-- /.direct-chat-text -->
                </div>`

                            $(`#msgReview${data[0].SurveyCategoryID}`).prepend(Message);

                        }


                        $(`#txtReview${SurveyCategoryID}`).val(''); $(`#txtReview${SurveyCategoryID}`).focus();

                    },
                    error: function (data, textStatus, errorThrown) {
                        console.log(data);
                    }
                });

            },





            AddRiskAddress: () => {
                let AssessmentID = $('#<%=vAssessmentID.ClientID.ToString()%>').val();
                AddressControls.Initialze(AssessmentID, 0);
            },
            RefreshAssessmentQuotes: () => {
                $('#<%=btnAssessmentQuotesRefresh.ClientID.ToString()%>').click();
            },
            RefreshAssessmentTracks: () => {
                setTimeout(() => {
                    $('#<%=btnRefreshTracks.ClientID.ToString()%>').click();
                }, 250);
            },

            DownloadReport: () => {

                let AssessmentID = $('#<%=vAssessmentID.ClientID%>').val();
                window.open('https://web.mitig8.co.za/documents/download-assessmentvaluationmoveableassets-executivesummary?aid=' + AssessmentID+'&dl=1&set=0');
            },


            AssignUser: () => {
                setTimeout(() => {
                    let AssessmentID = $('#<%=vAssessmentID.ClientID.ToString()%>').val();
                    AssessmentUserControl.Initialize(AssessmentID);
                }, 250);
            },
            RefreshAssessmentUsers: () => {
                setTimeout(() => {
                    $('#<%=btnRefereshAssessmentUsers.ClientID.ToString()%>').click();
                }, 250);
            },
            UnassignAssessmentUser: (UserID) => {
                $('#<%=vUnassignUserID.ClientID.ToString()%>').val(UserID);
                setTimeout(() => {
                    $('#<%=btnUnassignUserFromAssessment.ClientID.ToString()%>').click();
                }, 250);
            }
        }

    };




    function runSurvey(SurveyID, AssessmentID, UserID) {

        var myWindow = window.open("/runsurvey/x?y=" + SurveyID + "&n=" + UserID + "&a= " + AssessmentID + "&xmode=0", "", "width=1200,height=1000");

    }

    function runSurveyReadOnly(SurveyID, AssessmentID, UserID) {

        var myWindow = window.open("/runsurvey/x?y=" + SurveyID + "&n=" + UserID + "&a= " + AssessmentID + "&xmode=1", "", "width=1200,height=1000");

    }

    function runEXEReport(AssessmentID) {

        var myWindow = window.open("/documents/executivereport?aid=" + AssessmentID, "width=1200,height=1000");

    }


    function rundownloadEXEReport(AssessmentID) {

        var myWindow = window.open("/documents/download-executivereport?aid=" + AssessmentID + "&dl=1&set=0", "width=1200,height=1000");

    }

    function DownloadPolicyPolicyReadOnly() {
        let AssessmentID = $('#<%=vAssessmentID.ClientID.ToString()%>').val();
        var myWindow = window.open("/documents/assessmentdetails?assessmentid=" + AssessmentID + "&download=yes", "width=1200,height=1000");
    }


    function maybeDisposeChart(chartdiv) {
        if (chartReg[chartdiv]) {
            chartReg[chartdiv].dispose();
            delete chartReg[chartdiv];
        }
    }

</script>

<style>
    .container * {
        margin: 0;
        padding: 0;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-transition: 0.5s;
        -o-transition: 0.5s;
        transition: 0.5s;
    }

        .container *:after, .container *:before {
            margin: 0;
            padding: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

    h2.title {
        font-size: 24px;
        color: #fff;
        font-weight: bold;
        font-family: tahoma;
        text-align: center;
        padding: 2em;
        display: block;
        margin: auto;
        background-color: #A97A7A;
    }

    .container {
        width: 960px;
        background: #010101;
        margin: auto;
        position: relative;
        height: 460px;
    }

    .vidcontainer {
        width: 75%;
        height: 100%;
        float: right;
        position: relative;
        overflow: hidden;
        background: black !important;
    }

    video {
        width: 100%;
        height: 405px;
        color: #fff;
        text-align: center;
        font-size: 20px;
    }

    .videolist {
        float: right;
        width: 25%;
        background-color: white;
        height: 100%;
        position: relative;
        color: #ffc107 !important;
        overflow: hidden;
    }

    .vids {
        max-height: 450px;
        min-height: 450px;
        list-style: none;
        overflow: hidden;
        margin: 0px;
    }







        .vids a {
            text-decoration: none;
            color: black;
            font-size: 16px;
            display: block;
            padding: 8px 5px;
            box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);
            margin: 5px;
        }

    /*--- controllers ---*/
    .controllers {
        position: absolute;
        bottom: 0;
        height: 50px;
        background-color: #fff;
        width: 100%;
        box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);
    }

        .controllers button {
            border: 1px solid #E7E7E7;
            background-color: #FFFFFF;
            color: #777;
            height: 40px;
            width: 40px;
            border-radius: 50%;
            margin: 5px;
            box-shadow: 1px 1px 3px #4C4C4C;
            outline: none;
            font-size: 18px;
            display: inline-block;
            float: left;
        }

            .controllers button:focus {
                box-shadow: 1px 0px 7px #4C4C4C;
                border-color: #ffc107;
                color: #ffc107;
                background-color: #4C4C4C;
            }



    .ads {
        height: 350px;
        width: 350px;
        position: absolute;
        background-color: #777;
        top: 27.5px;
        right: 40px;
        z-index: 11;
    }

    .bigplay {
        height: 150px;
        width: 150px;
        position: absolute;
        top: 127.5px;
        left: 85px;
        z-index: 11;
        color: #fff;
        font-size: 150px;
        line-height: 150px;
        text-align: center;
        cursor: pointer;
        text-shadow: 0px 0px 15px #ffc107;
    }

    .closeme {
        height: 32px;
        width: 32px;
        background-color: #fff;
        top: -10px;
        right: -10px;
        border: 1px solid #ffc107;
        display: block;
        position: absolute;
        border-radius: 50%;
        text-align: center;
        line-height: 30px !important;
        color: #ffc107;
        font-size: 25px !important;
    }

    .img-fluid {
        width: 100%;
        height: 200px;
    }

    .playing {
    }



    .topControl {
        position: absolute;
        display: block;
        width: 100%;
        bottom: 50px;
        background-color: #fff;
        z-index: 1;
    }

    .progress {
        width: 100%;
        height: 5px;
        position: relative;
        float: left;
        cursor: pointer;
        background: #999;
    }

        .progress span {
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            display: block;
        }

    .timeBar {
        z-index: 10;
        width: 0;
        background: #ffc107;
    }

    .bufferBar {
        z-index: 5;
        width: 0;
        background: #eee;
    }
    /* time and duration */
    .time {
        width: 12%;
        float: right;
        text-align: center;
        font-size: 11px;
        line-height: 12px;
        right: -12%;
        opacity: 0;
        position: absolute;
    }

    .topControl:hover .time {
        right: 0;
        opacity: 1;
    }


    .topControl:hover .progress {
        width: 88%;
        height: 12px;
    }

    /* VOLUME BAR CSS */
    /* volume bar */
    .volume {
        position: relative;
        cursor: pointer;
        width: 70px;
        height: 10px;
        float: left;
        margin-top: 20px;
        margin-right: 15px;
        background-color: #999;
    }

    .volumeBar {
        display: block;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        background-color: #ffc107;
        z-index: 10;
    }

    .loading {
        width: 100%;
        background-color: rgba(255,141,0,0.5);
        height: 405px;
        position: absolute;
        top: 0;
    }

    i.fa.fa-spinner.fa-spin {
        height: 60px;
        width: 60px;
        font-size: 60px;
        color: #fff;
        text-shadow: 0px 0px 8px #000;
        top: 172.5px;
        left: 330px;
        position: absolute;
    }

    .disabled {
        pointer-events: none;
        cursor: not-allowed;
        background-color: #C2C2C2 !important;
    }


    ul.speedcnt {
        display: none;
        position: absolute;
        right: 30px;
        bottom: 60px;
        background-color: #fff;
        border-radius: 5px;
        list-style: none;
        -webkit-transition: 0s;
        -o-transition: 0s;
        transition: 0s;
    }

        ul.speedcnt li {
            text-align: center;
            font-family: 'verdana', tahoma, serif;
            font-size: 13px;
            padding: 5px 20px;
            cursor: pointer;
            display: block;
            border-bottom: 1px solid #ccc;
        }

            ul.speedcnt li:last-child {
                border-bottom: none;
            }

            ul.speedcnt li.selected {
                background-color: rgba(255, 141, 0, 0.6);
            }
</style>
