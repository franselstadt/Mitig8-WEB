<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Assessment.ascx.cs" Inherits="Mitig8.Modules.Assessments.Assessment" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<!-- Content Wrapper. Contains page content -->
<div id="modAssessment" class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">
                                <i class="fas fa-microscope"></i>&nbsp;
                                <asp:Literal runat="server" ID="lblAssessment" Text="<i class='fas fa-spinner fa-spin'></i>&nbsp;Loading..."></asp:Literal></h1>
                        </div>
                        <asp:Button runat="server" Text="Request Policy Capture?" Visible="false" ID="btnUploadPolicyDocument" OnClick="btnUploadPolicyDocument_Click" class="btn btn-block btn-primary btn-md" Style="width: 250px; display: inline-block; background: black !important; border: black; float: right; right: 20px; position: absolute;" />
                        <asp:Button runat="server" Text="Request Quotes?" Visible="false" ID="btnRequestQuote" OnClick="btnRequestQuote_Click" class="btn btn-block btn-primary btn-md" Style="width: 250px;display: inline-block;background: black !important;border: black;float: right;/* left: 111px; */right: 195px;position: absolute;" />
                        <asp:Button runat="server" Text="Cancel Assessment?" Visible="false" ID="btnCancelAssessment" OnClick="btnCancelAssessment_Click" class="btn btn-block btn-danger btn-md" Style="width: 168px;display: inline-block;/* background: black !important; */border: black;float: left;right: 20px;position: absolute;TOP: 62PX;" />
                        <asp:Button runat="server" Text="Send for specialist review" Visible="false" ID="btnSendForSpecialistReview" OnClick="btnSendForSpecialistReview_Click" class="btn btn-block btn-success btn-md" Style="width: 190px;display: inline-block;background: black !important; border: black;float: left;right: 20px;position: absolute;TOP: 62PX;" />
                        <asp:Button runat="server" Text="Finalize QA" Visible="false" ID="btnFinalizeQA" OnClick="btnFinalizeQA_Confirm_Click" class="btn btn-block btn-success btn-md" Style="width: 190px;display: inline-block; background: black !important; border: black;float: left;right: 20px;position: absolute;TOP: 62PX;" />
                    </div>
                    <!-- /.row -->
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
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
                    <asp:Button runat="server" Text="Request auto-capture?" Style="display: none !important" ID="btnUploadPolicyDocumentHidden" OnClick="btnUploadPolicyDocument_Click" class="btn btn-block btn-primary btn-md"  />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnUploadPolicyDocument" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="btnUploadPolicyDocumentHidden" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="row">
                <div class="col-12">
                    <div class="card card-warning card-tabs">
                        <div class="card-header p-0 pt-1">

                            <ul class="nav nav-tabs" id="AssessmentTabControl" role="tablist">


                                <li class="nav-item">
                                    <a class="nav-link active" id="btnTabAssessmentClient" data-toggle="pill" href="#tabAssessmentClient" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-building"></i>&nbsp;Client Details</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentPolicy" data-toggle="pill" href="#tabAssessmentPolicy" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-umbrella"></i>&nbsp;Policy Details</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentPolicyReadOnly" data-toggle="pill" href="#tabAssessmentPolicyPolicyReadOnly" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-umbrella"></i>&nbsp;Policy Details</a>
                                </li>


                               <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentAttachments" data-toggle="pill" href="#tabAssessmentAttachments" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-paperclip"></i>&nbsp;Attachments</a>
                                </li>

                                

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentQuotes" data-toggle="pill" href="#tabAssessmentQuotes" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-file-invoice"></i>&nbsp;Quotes</a>
                                </li>


                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentSurveys" data-toggle="pill" href="#tabAssessmentSurveys" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-question-circle"></i>&nbsp;Surveys</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentRiskManagement" data-toggle="pill" href="#tabAssessmentRiskManagement" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-exclamation-triangle"></i>&nbsp;Risk Management</a>
                                </li>


                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentUsers" data-toggle="pill" href="#tabAssessmentUsers" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-user-friends"></i>&nbsp;Users</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentTracks" data-toggle="pill" href="#tabAssessmentTracks" role="tab" aria-controls="custom-tabs-one-home" aria-selected="false"><i class="fas fa-bullseye"></i>&nbsp;Tracks</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabGallery" data-toggle="pill" href="#tabAssessmentGallery" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-images"></i>&nbsp;Pictures</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabVideos" data-toggle="pill" href="#tabAssessmentVideos" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true">
                                        <img src="https://static.thenounproject.com/png/1177292-200.png" style="width: 22px; margin-right: -2px; margin-top: -5px;">&nbsp;Videos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentReports" data-toggle="pill" href="#tabAssessmentReports" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="fas fa-flag-checkered"></i>&nbsp;Reports</a>
                                </li>
                                 <li class="nav-item">
                                    <a class="nav-link" id="btnTabReview" data-toggle="pill" href="#tabReview" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="fas fa-check-double"></i>&nbsp;Review</a>
                                </li>

                                                                 <li class="nav-item">
                                    <a class="nav-link" id="btnTabBookings" data-toggle="pill" href="#tabBookings" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="fas fa-business-time"></i>&nbsp;Booking</a>
                                </li>

                                
                                                                 <li class="nav-item">
                                    <a class="nav-link" id="btnSpecialRequests" data-toggle="pill" href="#tabSpecialRequests" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="far fa-gem"></i>&nbsp;Special Requests</a>
                                </li>

                                                                
                                                                 <li class="nav-item">
                                    <a class="nav-link" id="btnOtherReferences" data-toggle="pill" href="#tabOtherReferences" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="fas fa-asterisk"></i>&nbsp;References</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body" style="padding: 0px !important">
                            <div class="tab-content" id="tabSetAssessments">





                                 <%--More/Other References--%>
                                <div class="tab-pane fade" id="tabOtherReferences" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
       
                                    <asp:UpdatePanel ID="UpdatePanel18" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            
                                                                            <div class="row d-flex align-items-stretch" style="padding: 10px;">
                                        <div class="col-6 col-sm-6 col-md-6 d-flex align-items-stretch" style="min-width: 500px !important;max-width: 500px;">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="fas fa-feather-alt"></i>&nbsp; Other References (<asp:Label ID="lblOtherReferences" runat="server" Text="0"></asp:Label>)
                                                </div>
                                                <p style="margin: 5px;">You may add one reference per line below.</p>
                                                <div class="card-body pt-0">
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel19" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                 
                                                                    <asp:TextBox CssClass="form-control" AutoPostBack="true" OnTextChanged="txtOtherReferences_TextChanged" TextMode="MultiLine" runat="server" Height="180px" style="margin-top:15px" placeholder="Add one reference per line..." Width="450px" ID="txtOtherReferences"></asp:TextBox>
                                                                </div>
                                                               

                                                            </div>
                                                            <div style="margin-top: 10px !important" class="row">
                                                                <asp:Button runat="server" Text="Update" ID="btnUpdateOtherReferences" OnClick="btnUpdateOtherReferences_Click"  Style="background: black !important; border-color: black !important" class="btn btn-block btn-info btn-sm" />
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
                                                                                        <asp:AsyncPostBackTrigger ControlID="txtOtherReferences" EventName="TextChanged" />

                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>


                                  <%--Policy Details Read Only--%>
                                <div class="tab-pane fade " id="tabSpecialRequests" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
       
                                    <asp:UpdatePanel ID="UpdatePanel16" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            
                                                                            <div class="row d-flex align-items-stretch" style="padding: 10px;">
                                        <div class="col-6 col-sm-6 col-md-6 d-flex align-items-stretch" style="min-width: 500px !important;max-width: 500px;">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="fas fa-feather-alt"></i>&nbsp; Special Requests
                                                </div>
                                                <div class="card-body pt-0">
                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel17" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="form-group">
                                                                 
                                                                    <asp:TextBox CssClass="form-control" TextMode="MultiLine" runat="server" Height="180px" style="margin-top:15px" placeholder="Provide special requests here." Width="450px" ID="txtSpecialRequests"></asp:TextBox>
                                                                </div>
                                                               

                                                            </div>
                                                            <div style="margin-top: 10px !important" class="row">
                                                                <asp:Button runat="server" Text="Save Special Request" ID="btnSaveSpecialRequests" OnClick="btnSaveSpecialRequests_Click"  Style="background: black !important; border-color: black !important" class="btn btn-block btn-info btn-sm" />
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




                                <%--Bookings Tab Start--%>
                                <div class="tab-pane fade" id="tabBookings" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

                                    <asp:UpdatePanel runat="server" ID="UpdatePanel15" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                        <ContentTemplate>


                                              <div class="row d-flex align-items-stretch" style="padding: 10px;">
                                        <div class="col-6 col-sm-6 col-md-6 d-flex align-items-stretch" style="min-width: 500px !important;max-width: 500px;">
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
                                                                    <asp:TextBox CssClass="form-control" runat="server"  placeholder="Confirmed By Name" Height="30px" Width="450px" ID="txtConfirmedByName"></asp:TextBox>
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





                                <%--QA Review--%>
                                <div class="tab-pane fade " id="tabReview" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                   <li class="nav-item">
                                                    <a onclick="AssessmentControls.Functions.RefreshAssessmentReview();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>
                                                <li id="SpecialistAddReview" class="nav-item">
                                                    <a onclick="AssessmentControls.Functions.OpenAssessmentReview('0');" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-comments"></i>&nbsp;Add Review</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <asp:button runat="server" id="btnAssessmentReviewInitialize" OnClick="btnAssessmentReviewInitialize_Click" style="display:none !important" />


                                            <asp:Literal runat="server" ID="litReview"></asp:Literal>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                             <asp:AsyncPostBackTrigger ControlID="btnAssessmentReviewInitialize" EventName="Click" />
                                              <asp:AsyncPostBackTrigger ControlID="btnAddReview" EventName="Click" />

                                            
                                            
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>


                                <%--Policy Details Read Only--%>
                                <div class="tab-pane fade " id="tabAssessmentPolicyPolicyReadOnly" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                     <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                   <li class="nav-item">
                                                    <a  onclick="DownloadPolicyPolicyReadOnly();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-file-download"></i>&nbsp;Download</a>
                                                </li>

                                      
                                                
                                            </ul>
                                        </div>
                                    </nav>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Literal runat="server" ID="litAssessmentPolicyReadOnly"></asp:Literal>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>



                                                  <%--Policy Details Read Only--%>
                                <div class="tab-pane fade " id="tabAssessmentAttachments" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                     <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                   <li class="nav-item">
                                                    <a  style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a onclick="AssessmentControls.Functions.UploadAttachments();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-file-upload"></i>&nbsp;Upload Attachments</a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                    </nav>
                                    <asp:UpdatePanel ID="UpdatePanel13" runat="server" ChildrenAsTriggers="TRUE" UpdateMode="Conditional">

                                        <ContentTemplate>
                                            <asp:Literal runat="server" ID="litAssessmentAttachments"></asp:Literal>
                                            <asp:Button runat="server" ID="btnAssessmentAttachments" OnClick="btnAssessmentAttachments_Click" style="display:none !important" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <%--Videos Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentVideos" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <asp:UpdatePanel ID="updPanelAssessmentVideos" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                        <ContentTemplate>


                                            <div class="container-fluid">
                                                <div class="vidcontainer">
                                                    <video id="myvid" style="height: 435px !important">
                                                        Your browser does not support the video tag.
                                                    </video>
                                                    <div class="topControl">
                                                        <div class="progress">
                                                            <span class="bufferBar"></span>
                                                            <span class="timeBar"></span>
                                                        </div>
                                                        <div class="time">
                                                            <span class="current"></span>/ 
				<span class="duration"></span>
                                                        </div>
                                                    </div>

                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="controllers">
                                                                <button runat="server" class="prevvid disabled" title="Previous video"><i class="fas fa-step-forward fa-rotate-180"></i></button>
                                                                <button runat="server" class="nextvid" title="Next video"><i class="fas fa-step-forward"></i></button>
                                                                <button runat="server" class="sound sound2 btn" title="Mute/Unmute sound"></button>
                                                                <div class="volume" title="Set volume">
                                                                    <span class="volumeBar"></span>
                                                                </div>
                                                                <button runat="server" class="btnFS " style="float: right" title="full screen"></button>
                                                                <button runat="server" class="btnspeed " style="float: right" title="Video speed"><i class="fas fa-gear"></i></button>
                                                                <ul class="speedcnt">
                                                                    <li class="spdx50">1.5</li>
                                                                    <li class="spdx25">1.25</li>
                                                                    <li class="spdx1 selected">Normal</li>
                                                                    <li class="spdx050">0.5</li>
                                                                </ul>
                                                                <button runat="server" class="btnLight lighton " style="float: right" title="on/off light"><i class="fas fa-lightbulb-o"></i></button>
                                                            </div>
                                                        </ContentTemplate>

                                                    </asp:UpdatePanel>


                                                    <div class="bigplay" title="play the video"><i class="fa fa-play-circle-o"></i></div>
                                                    <div class="loading"><i class="fa fa-spinner fa-spin"></i></div>
                                                </div>

                                                <div class="videolist">
                                                    <nav class="vids">
                                                        <a class="link" href="http://lmsapp.citylogistics.co.za/zebra.mp4"><span><i class="far fa-file-video"></i>&nbsp;McDonalds Flight Outside</span></a>


                                                    </nav>
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2); margin: 10px;">
                                                <legend style="padding: 5px"><i class="far fa-file-video"></i>&nbsp; McDonalds Flight Outside
                                                    <span style="font-size: 12px; float: right"><i class="fas fa-diagnoses"></i>Filmed by John Foxx Assessors on 29-04-2020</span>
                                                </legend>

                                                <div class="timeline" style="padding: 10px">
                                                    <div class="time-label">
                                                        <span class="bg-red">0 Minutes 14 Seconds</span>
                                                    </div>

                                                    <div>
                                                        <i class="fas fa-camera-retro"></i>
                                                        <div class="timeline-item">
                                                            <h3 class="timeline-header">Flying over roof</h3>

                                                            <div class="timeline-body">
                                                                Clear sign that the cutters are full, this poses a risk to the structure.
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="time-label">
                                                        <span class="bg-red">1 Minutes 12 Seconds</span>
                                                    </div>

                                                    <div>
                                                        <i class="fas fa-camera-retro"></i>
                                                        <div class="timeline-item">
                                                            <h3 class="timeline-header">Flying over carpark</h3>

                                                            <div class="timeline-body">
                                                                Cars are too close together, there need be clearer lines.
                                                            </div>

                                                        </div>
                                                    </div>


                                                    <div class="time-label">
                                                        <span class="bg-red">2 Minutes 18 Seconds</span>
                                                    </div>

                                                    <div>
                                                        <i class="fas fa-camera-retro"></i>
                                                        <div class="timeline-item">
                                                            <h3 class="timeline-header">Flying over outside seating</h3>

                                                            <div class="timeline-body">
                                                                Merchant is not cleaning their customer seating, and the seating is not stable, public liablity risk.
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="time-label">
                                                        <span class="bg-red">3 Minutes 45 Seconds</span>
                                                    </div>

                                                    <div>
                                                        <i class="fas fa-camera-retro"></i>
                                                        <div class="timeline-item">
                                                            <h3 class="timeline-header">Flying over ventilator system</h3>

                                                            <div class="timeline-body">
                                                                System seems blocked...
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>


                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <%--Spesifications Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentPolicy" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li id="qSavePolicyDetailsJS" class="nav-item">
                                                    <a onclick="$('#Assessment_btnSavePolicyDetails').click();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-save"></i>&nbsp;Save Policy Details</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>

                                    <asp:UpdatePanel runat="server" ID="updPanelPolicyDetails" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <%--Hidden Fields Start For Policy Details--%>
                                            <asp:Button runat="server" ID="btnSavePolicyDetails" Style="display: none !important" OnClick="btnSavePolicyDetails_Click" />
                                            <%--Hidden Fields End For Policy Details--%>


                                            <%--Fire--%>
                                            <div>
                                                <legend style="padding: 5px"><i class="fas fa-fire-extinguisher"></i>&nbsp; Fire</legend>
                                                <table class="table table-striped" id="tblPolicyDetailsFire" style="zoom: 100% !important">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 350px">Elements</th>
                                                            <th style="width: 350px">Covered</th>
                                                            <th style="width: 350px">Sums Insured</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Plant and Machinery</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbPlantAndMachinery_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="Policy_txtPlantAndMachinery" placeholder="0.00" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Building(s)</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbBuilding_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtBuilding" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Contents/Stock</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbContents_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtContents" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Miscellaneous</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbMiscellaneous_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtMiscellaneous" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>




                                             <%--Asset All Risk--%>
                                            <div>
                                                <legend style="padding: 5px"><i class="fas fa-boxes"></i>&nbsp; Asset All Risk</legend>
                                                <table class="table table-striped" id="tblPolicyAssetAllRisk" style="zoom: 100% !important">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 350px">Elements</th>
                                                            <th style="width: 350px">Covered</th>
                                                            <th style="width: 350px">Sums Insured</th>

                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Plant and Machinery</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Assest_Policy_cmbPlantsAndMachinery" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="Assest_Policy_txtPlantsAndMachinery" placeholder="0.00" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Building(s)</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Assest_Policy_cmbBuildings" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Assest_Policy_txtBuildings" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Contents/Stock</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Assest_Policy_cmbStock" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Assest_Policy_txtStock" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Miscellaneous</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Assest_Policy_cmbMiscellaneous" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Assest_Policy_txtMiscellaneous" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>





                                            <%--Buildings Combined--%>
                                            <div>
                                                <legend style="padding: 5px"><i class="fas fa-city"></i>&nbsp; Buildings Combined</legend>
                                                <table class="table table-striped" style="zoom: 100% !important">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 350px">Elements</th>
                                                            <th style="width: 350px">Covered</th>
                                                            <th style="width: 350px">Sums Insured</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Buildings</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbBuildings_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtBuildings" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Escalation</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbEscalation_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtEscalation" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Inflation</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbInflation_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtInflation" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Rental</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbRental_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtRental_Covered" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <%--Business Interruption--%>
                                            <div>
                                                <legend style="padding: 5px"><i class="fas fa-radiation-alt"></i>&nbsp; Business Interruption</legend>
                                                <table class="table table-striped" id="tblPolicyDetailsBusinessInterruptions" style="zoom: 100% !important">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 350px">Elements</th>
                                                            <th style="width: 350px">Covered</th>
                                                            <th style="width: 350px">Sums Insured</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Gross Profit</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbGrossProfit_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtGrossProfit" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>PUB/Utilities</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbUtilities_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtUtilities" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>P.O.A.</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbPOA_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtPOA" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Loss of Rent</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbLossOfRent_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtLossOfRent" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>AICOW</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbAICOW_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtAICOW" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <%--Other--%>
                                            <div>
                                                <legend style="padding: 5px"><i class="fas fa-clipboard-list"></i>&nbsp; Other</legend>
                                                <table class="table table-striped" style="zoom: 100% !important">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 350px">Elements</th>
                                                            <th style="width: 350px">Covered</th>
                                                            <th style="width: 350px">Sums Insured</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Office Contents</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbOfficeContents_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtOfficeContents" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Money</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbMoney_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtMoney_Covered" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Electronic Equipment</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbElectronicEquipment_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtElectronicEquipment" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Glass</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbGlass_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtGlass" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Theft</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbTheft_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" Width="200px" ID="Policy_txtTheft" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Fidelity</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbFidelity_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtFidelity_Covered" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Liability</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbLiability_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtLiability_Covered" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>GIT</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbGIT_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtGIT" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>BAR (Business All Risk)</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbBAR_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtBAR" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Accidental Damage</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbAccidentalDamage_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" runat="server" ID="Policy_txtAccidentalDamage" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Machinery Breakdown</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="Policy_cmbMachineryBreakdown_Covered" Width="200px" Height="30px" CssClass="form-control" Style="padding: 0px !important">
                                                                    <asp:ListItem Selected="True" Text="No" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox placeholder="0.00" ID="Policy_txtMacineryBreakdown" runat="server" Width="200px" Height="30px" CssClass="form-control" Style="text-align: right !important"></asp:TextBox></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>




                                </div>
                                <%--Spesifications Tab End--%>




                                <%--Tracks Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentTracks" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <ul class="navbar-nav">
                                            <li style="display:none !important" class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-cloud-download-alt"></i>&nbsp;Download Tracking Report</a>
                                            </li>
                                            <li class="nav-item">
                                                <a onclick="AssessmentControls.Functions.RefreshAssessmentTracks();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <%--             <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 5px !important">
                                        <div class="form-inline">
                                            <button class="btn btn-sm bg-black" type="button">Download</button>
                                            <button class="btn btn-sm bg-black" type="button">Share</button>
                                            <button class="btn btn-sm bg-black" type="button">Dispute</button>
                                        </div>
                                    </nav>--%>

                                    <div class="col-md-12">
                                        <asp:UpdatePanel ID="updPanelAssessmentTracks" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>
                                                <!-- The time line -->

                                                <asp:Literal runat="server" ID="litAssessmentTracks"></asp:Literal>

                                                <asp:Button runat="server" ID="btnRefreshTracks" OnClick="btnRefreshTracks_Click" Style="display: none !important" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
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
                                                <a onclick="AssessmentControls.Functions.AssignUser();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-user-plus"></i>&nbsp;Assign User</a>
                                            </li>

                                            <li class="nav-item">
                                                <a onclick="AssessmentControls.Functions.RefreshAssessmentUsers();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
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
                                                                                        <asp:AsyncPostBackTrigger ControlID="btnUploadPolicyDocument" EventName="Click" />

                                            
                                        </Triggers>
                                    </asp:UpdatePanel>




                                </div>
                                <%--Users Tab End--%>

                                <%--Reports Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentReports" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <ul class="navbar-nav">
                                            <li class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                            </li>
                                        </ul>
                                    </nav>
                                       <asp:UpdatePanel runat="server" ID="UpdatePanel9" ChildrenAsTriggers="true" UpdateMode="Always">
                                        <ContentTemplate>

                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th style="width: 500px">Options</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><i class="fas fa-umbrella"></i>&nbsp;Executive Report</td>
                                             
                                                <td>
<asp:Literal runat="server" ID="btnExecutiveReport"></asp:Literal>
                                                    <asp:Literal runat="server" ID="btnExecutiveReportDownload"></asp:Literal>

                                                   
                                                    <button disabled="disabled" class="btn btn-warning" title="Dispute"><i class="far fa-angry"></i>&nbsp;Dispute</button>
                                                </td>
                                            </tr>
                                             
                                            <tr>
                                                <td><i class="fas fa-stopwatch"></i>&nbsp;Survey Report</td>
                                             
                                                <td>
                                                   <asp:Literal runat="server" ID="btnSurveyReport"></asp:Literal>

                                                      <asp:Literal runat="server" ID="btnSurveyReportDownload"></asp:Literal>
                                                   
                                                    <button disabled="disabled" class="btn btn-warning" title="Dispute"><i class="far fa-angry"></i>&nbsp;Dispute</button>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                            </ContentTemplate>
                                           </asp:UpdatePanel>

                                </div>
                                <%--Reports Tab End--%>

                                <%--Surveys Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentSurveys" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <asp:UpdatePanel runat="server" ID="updPanelAssessmentSurveys" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <%--                                        <asp:Button runat="server" ID="btnAssessmentSurveys" OnClick="btnAssessmentSurveys_Click" style="display:none" />--%>
                                            <asp:Literal runat="server" ID="litAssessmentSurveys"></asp:Literal>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>


                                </div>
                                <%--Surveys Tab End--%>

                                <%--Quotes Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentQuotes" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a id="btnAddQuote" onclick="AssessmentControls.Functions.AddQuote();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-plus"></i>&nbsp;Add Quote</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a onclick="AssessmentControls.Functions.RefreshAssessmentQuotes();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <asp:UpdatePanel runat="server" ID="updPanelAssessmentQuotes" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Literal runat="server" ID="litAssessmentQuotes"></asp:Literal>
                                            <asp:Button ID="btnAssessmentQuotesRefresh" OnClick="btnAssessmentQuotesRefresh_Click" runat="server" Style="display: none" />
                                            <asp:HiddenField ID="vQuoteID" runat="server" />
                                            <asp:HiddenField ID="vQuoteStatusID" runat="server" />
                                            <asp:Button runat="server" ID="btnUpdateQuoteStatus" OnClick="btnUpdateQuoteStatus_Click" Style="display: none !important"></asp:Button>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>


                                </div>
                                <%--Quotes Tab End--%>

                                <%--Client Tab Start--%>
                                <div class="tab-pane fade active show" id="tabAssessmentClient" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li id="qbtnSaveClientDetailsJS" class="nav-item">
                                                    <a onclick="AssessmentControls.Tabs.ClientDetails.Save();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-save"></i>&nbsp;Save Client Details</a>
                                                </li>
                                                <li  id="qbtnAddRiskAddressJS" class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#" onclick="AssessmentControls.Functions.AddRiskAddress();"><i class="fas fa-plus"></i>&nbsp;Add Risk Address</a>
                                                </li>


                                               <li  class="nav-item">
                                                    <a  id="btnManageAutoCapture" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#" onclick="AssessmentControls.Functions.AutoCapture();"> <i class="fas fa-spinner fa-spin"></i>&nbsp;Policy capture requested (Click to manage documents)</a>
                                                </li>



                                               


                                                <%--       <li class="nav-item">
                                                    <a onclick="AssessmentBookingControls.Initialize('0','0');" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-clock"></i>&nbsp;Add Booking</a>
                                                </li>--%>
                                            </ul>
                                        </div>
                                    </nav>
                                    <div class="col-md-12">
                                        <asp:UpdatePanel ID="clientTabUpdatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>
                                                <%--Hidden Fields Start--%>
                                                <asp:Button ID="btnSaveClientDetails" OnClick="btnSaveClientDetails_Click" runat="server" Style="display: none" />
                                                <%--Hidden Fields End--%>
                                                <legend><i class="fas fa-info-circle"></i>&nbsp;General Information </legend>
                                                <%--Insurer Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insurer Name</span>
                                                            <asp:TextBox ID="txtInsurerName" runat="server" Height="30px" placeholder="Insurer Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insurer Contact Person</span>
                                                            <asp:TextBox ID="txtInsurerContactPerson" runat="server" Height="30px" placeholder="Insurer Contact Person" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insurer Email Address</span>
                                                            <asp:TextBox ID="txtInsurerEmailAddress" runat="server" Height="30px" placeholder="Insurer Email Address" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insurer Contact Number</span>
                                                            <asp:TextBox ID="txtInsurerContactNumber" runat="server" Height="30px" placeholder="Insurer Contact Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%--Broker Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insurance Policy Number</span>
                                                            <asp:TextBox ID="txtInsurancePolicyNumber" runat="server" Height="30px" placeholder="Insurance Policy Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Broker Name</span>
                                                            <asp:TextBox ID="txtBrokerName" runat="server" Height="30px" placeholder="Broker Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Broker Email Address</span>
                                                            <asp:TextBox ID="txtBrokerEmailAddress" runat="server" Height="30px" placeholder="Broker Email Address" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Broker Contact Number</span>
                                                            <asp:TextBox ID="txtBrokerContactNumber" runat="server" Height="30px" placeholder="Broker Contact Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%--Insured Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insured Name</span>
                                                            <asp:TextBox ID="txtInsuredName" runat="server" Height="30px" placeholder="Insured Name" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insured Contact Number</span>
                                                            <asp:TextBox ID="txtInsuredContactNumber" runat="server" Height="30px" placeholder="Insured Contact Number" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Insured Email Address</span>
                                                            <asp:TextBox ID="txtInsuredEmailAddress" runat="server" Height="30px" placeholder="Insured Email Address" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                   <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Is this an existing policy?</span>
                                                            <asp:DropDownList runat="server" ID="cmbExistingPolicy" AutoPostBack="true" OnTextChanged="cmbIndustrySector_Change" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Text="Yes" Enabled="true" Selected="False" Value="1"></asp:ListItem>
                                                                                                                                <asp:ListItem Text="No" Enabled="true" Selected="True" Value="0"></asp:ListItem>

                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                                 <%--Insured Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Industry Sector</span>
                                                            <asp:DropDownList runat="server" ID="cmbIndustrySector" AutoPostBack="true" OnTextChanged="cmbIndustrySector_Change" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Industry Sub Sector</span>
                                                            <asp:DropDownList runat="server" ID="cmbIndustrySubSector" AutoPostBack="true" OnTextChanged="cmbIndustrySubSector_Change" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Industry Type</span>
                                                            <asp:DropDownList runat="server" ID="cmbIndustryType" Height="30px" CssClass="form-control input-sm"></asp:DropDownList>
                                                        </div>
                                                    </div>

                                                          <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Industry Sector Description</span>
                                                            <asp:TextBox ID="txtInsuredIndustrySector" runat="server" Height="30px" placeholder="Industry Sector Description" CssClass="form-control input-sm"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>


                                                             <%--Other Details--%>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <span style="color: red;">*</span><span>Delegate</span>
                                                            <asp:DropDownList runat="server" ID="cmbDelegate" AutoPostBack="true" Height="30px" CssClass="form-control input-sm">
                                                                <asp:ListItem Enabled="true" Text="External" Value="0" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Enabled="true" Text="Internal" Value="1" Selected="False"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                              

                                                                            <asp:Button runat="server" Text="Other References?" Visible="true" ID="btnOtherReferencesNavigate" OnClick="btnOtherReferencesNavigate_Click" class="btn btn-block btn-primary btn-md" style="width: 150px;display: inline-block;background: black !important;height: 35px;margin-top: 20px;margin-left: 7px;border: 1px solid black;" />


                                                </div>






                                                <legend><i class="fas fa-map-marked-alt"></i>&nbsp;Risk Address</legend>

                                                <div class="row">
                                                    <asp:Button runat="server" ID="btnClientDetailsRiskAddresses" OnClick="btnClientDetailsRiskAddresses_Click" Style="display: none !important" />
                                                    <asp:Literal runat="server" ID="litClientDetailsRiskAddresses" Text="<table class='table table-striped' id='tblAssessmentAddresses' style='zoom: 88% !important'> <thead> <tr> <th>Province</th> <th>Town</th> <th>Suburb</th> <th>Street</th> <th>Building</th> <th style='width: 250px'>Options</th> </tr> </thead> <tbody> <tr><td colspan='6' style='text-align:center !important'><i class='fas fa-spinner fa-spin'></i>&nbsp;Loading risk addresses...</td></tr> </tbody> </table>"></asp:Literal>
                                                </div>

                                                <div class="form-group col-12" style="display: none">
                                                    <span>Category</span>
                                                    <asp:DropDownList ID="cmbCategory" OnTextChanged="cmbCategory_Change" runat="server" Width="100%" Height="30px" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                                </div>


                                                <div class="form-group col-12" style="display: none">
                                                    <span>Subcategory</span>
                                                    <asp:DropDownList ID="cmbSubcategory" AutoPostBack="true" OnTextChanged="cmbSubCategory_Change" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:DropDownList>
                                                </div>

                                                <div class="form-group col-12" style="display: none">
                                                    <span>Type</span>
                                                    <asp:DropDownList ID="cmbType" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:DropDownList>
                                                </div>



                                                <div class="form-group col-12" style="display: none">
                                                    <span>Reference&nbsp;<asp:LinkButton runat="server" Text="[More]" OnClick="btnReferences_Click" ID="btnReferences"></asp:LinkButton></span>
                                                    <asp:TextBox ID="txtReference" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:TextBox>
                                                </div>




                                                <%--                  <legend class="group-border" style="margin-bottom: 0px !important"><i class="fas fa-user-clock"></i>&nbsp;Booking</legend>

                                                <table id="tblAssessmentBookings" class="hover table table-striped table-bordered dataTable" style="font-size: 13px;">
                                                    <thead>
                                                        <tr>
                                                            <th>BookingID</th>
                                                            <th>Date</th>
                                                            <th>Time</th>
                                                            <th>Confirmed?</th>
                                                            <th>Options</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>--%>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <%--Client Tab End--%>

                                <%--Galary Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentGallery" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="AssessmentControls.Functions.OpenImageUpload();" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-camera-retro"></i>&nbsp;Upload Image(s)</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    


    <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <asp:Button runat="server" ID="btnInitializePictureGallary" OnClick="btnInitializePictureGallary_Click" style="display:none !important"/>
                                            <asp:Literal runat="server" ID ="litGallery"></asp:Literal>
                                            </ContentTemplate>
        <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="btnUpdateAssessmentImage" EventName="Click" />

                                                                                <asp:AsyncPostBackTrigger ControlID="btnDeleteImage" EventName="Click" />

            
                                                                                <asp:AsyncPostBackTrigger ControlID="btnUpdateAlbum" EventName="Click" />

            

            

        </Triggers>
        </asp:UpdatePanel>
                                    
                           

                                </div>
                                <%--Galary Tab End--%>



                                <%--Risk Management Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentRiskManagement" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync-alt"></i>&nbsp;Refresh</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>

                                    <asp:UpdatePanel runat="server" ID="updPanelRiskManagemenst" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                        <ContentTemplate>

                                            <asp:Button runat="server" ID="btnRiskManagemensInitialize" OnClick="btnRiskManagemensInitialize_Click" style="display:none !important" />

                                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2); margin: 10px;">
                                                <legend style="padding: 5px"><i class="fas fa-square-root-alt"></i>&nbsp;MPL and EML Calculation
                                                </legend>

                                                <div class="row">


                                                    <div style="display: none !important; box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);" class="col-4">
                                                        <span style="margin: 5px">Probable Maximum Loss</span>
                                                        <div style="height: 380px !important" id="chartRiskPML"></div>
                                                        <div class="form-group">
                                                            <asp:TextBox TextMode="Number" placeholder="Provide Probable Maximum Loss "  ID="txtPML" runat="server" Width="75%" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                                            <span style="display: inline-block; width: 22%">
                                                                <asp:Button Width="95%" runat="server" Text="Adjust" CssClass="btn btn-warning" /></span>
                                                        </div>


                                                    </div>




                                                    <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);" class="col-6">
                                                        <span style="margin: 5px">Maximum Possible Loss</span>
                                                        <div style="height: 380px !important">

                                                            <asp:Chart EnableViewState="true" ID="chartMPL" runat="server" Visible="false">
                                                                <Series>
                                                                    <asp:Series Name="Series1" ChartType="Bar">
                                                                        <Points>
                                                                                                                                                        <asp:DataPoint />

                                                                        </Points>
                                                                    </asp:Series>
                                                                </Series>
                                                                <ChartAreas>
                                                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                                </ChartAreas>
                                                            </asp:Chart>
                                                            <p runat="server" style="font-size:220px;font-style:italic;text-align:center"  ID="lblMPL"></p>

                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox TextMode="Number" placeholder="Provide Maximum Possible Loss" ID="txtMPL" runat="server" Width="100%" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                                            <span style="display: inline-block; width: 22%">
                                                        </div>
                                                                  <div class="form-group">
                                                            <asp:TextBox TextMode="MultiLine" placeholder="Provide Maximum Possible Loss Comment" ID="txtMPLComment" runat="server" Width="100%" Height="55px" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                                        </div>

                                                                                                                        <asp:Button Width="95%" runat="server" Text="Save MPL" ID="btnUpdateMPL" OnClick="btnUpdatePML_Click" CssClass="btn btn-warning" /></span>

                                                    </div>

                                                    <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);" class="col-6">
                                                        <span style="margin: 5px">Estimated Maximum Loss</span>
                                                        <div style="height: 380px !important">

                                                             <asp:Chart EnableViewState="true" ID="chartEML" runat="server" Visible="false">
                                                                <Series>
                                                                    <asp:Series Name="Series1" ChartType="Bar">
                                                                        <Points>
                                                                            <asp:DataPoint />
                                                                        </Points>
                                                                    </asp:Series>
                                                                </Series>
                                                                <ChartAreas>
                                                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                                </ChartAreas>
                                                            </asp:Chart>


                                                           <p runat="server" style="font-size:220px;font-style:italic;text-align:center" ID="lblEML"> </p>


                                                        </div>
                                                        <div class="form-group">
                                                            <asp:TextBox TextMode="Number" placeholder="Provide Estimated Maximum Loss"  ID="txtEML" runat="server" Width="100%" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                                            <span style="display: inline-block; width: 22%">
                                                        </div>
                                                              <div class="form-group">
                                                            <asp:TextBox TextMode="MultiLine" placeholder="Provide Estimated Maximum Loss Comment"  ID="txtEMLComments" runat="server" Width="100%" Height="55px" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                                        </div>
                                                                                                                        <asp:Button Width="95%" runat="server" Text="Save EML" ID="btnUpdateEML" OnClick="btnUpdateEML_Click" CssClass="btn btn-warning" /></span>

                                                    </div>
                                                </div>
                                            </div>




                                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2); margin: 10px;">
                                                <legend style="padding: 5px"><i class="fas fa-ruler-combined"></i>&nbsp; Risk Classification Summary
                                       

                                                    <asp:Button runat="server" Text="Save" ID="btnSaveRiskClassificationSummary" OnClick="btnSaveRiskClassificationSummary_Click" CssClass="btn btn-warning"  style="float: right !important;" />

                                                </legend>


                                                <asp:Literal Visible="false" runat="server" ID="litRiskClassificationSummary"></asp:Literal>


                                                <table class="table table-striped" style="width: 727px;/* margin-top: 66px; *//* position: absolute; *//* margin-left: 28px; */width: 100%;">
                 <thead>
                                                <tr>
                                                    <th>Factor</th>
                                                    <th>Rating</th>
                                                    <th>Reason</th>
                                                </tr>
                                            </thead>
                 <tbody>
                     
                     <tr>
                              <td><i class="fas fa-fire-extinguisher"></i>&nbsp;Fire</td>
                    <td>
                        <asp:DropDownList runat="server" ID="cmbRCS_Fire" Width="100%" Height="28px" >
                           
                                 <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                              <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Fire" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                          <tr>
                              <td><i class="fas fa-smog"></i>&nbsp;Smoke</td>
                          <td>
                        <asp:DropDownList runat="server" ID="cmbRCS_Smoke" Width="100%" Height="28px">
          <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Smoke" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                                               <tr>
                              <td><i class="fas fa-bomb"></i>&nbsp;Explosion</td>
            <td>
                        <asp:DropDownList runat="server" ID="cmbRCS_Explosion" Width="100%" Height="28px">
                                <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Explosion" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                                                                    <tr>
                              <td> <i class="fas fa-bolt"></i>&nbsp;Lightning</td>
              <td>
                        <asp:DropDownList runat="server" ID="cmbRCS_Lightning" Width="100%" Height="28px">
                                          <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Lightning" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                                                                                         <tr>
                              <td> <i class="fas fa-cloud-showers-heavy"></i>&nbsp;Flood</td>
           <td>
                        <asp:DropDownList runat="server" ID="cmbRCS_Flood" Width="100%" Height="28px">
                                         <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Flood" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                                                                                                              <tr>
                              <td> <i class="fas fa-cloud-moon-rain"></i>&nbsp;Storm</td>
                                <td>
 <asp:DropDownList runat="server" ID="cmbRCS_Storm" Width="100%" Height="28px">
                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Storm" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>





                                                                                                                                                                        <tr>
                              <td> <i class="fas fa-plug"></i>&nbsp;Electric</td>
                 <td>
             <asp:DropDownList runat="server" ID="cmbRCS_Electric" Width="100%" Height="28px">
                                       <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Electric" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                                                                                                                                                                             <tr>
                              <td> <i class="fas fa-shopping-basket"></i>&nbsp;Goods</td>
 <td>
 <asp:DropDownList runat="server" ID="cmbRCS_Goods" Width="100%" Height="28px">
                                <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Goods" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                                                                                                                                                                                                  <tr>
                              <td> <i class="fas fa-tree"></i>&nbsp;Falling Trees </td>
          <td>
 <asp:DropDownList runat="server" ID="cmbRCS_FallingTrees" Width="100%" Height="28px">
                                         <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_FallingTrees" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>
             
                     
                                                                                                                                                                                                                                       <tr>
                              <td> <i class="fas fa-hammer"></i>&nbsp;Malicious Damage</td>
                  
          <td>
 <asp:DropDownList runat="server" ID="cmbRCS_MaliciousDamage" Width="100%" Height="28px">
                                       <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_MaliciousDamage" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                                                                                                                                                                                                                                                            <tr>
                              <td> <i class="fas fa-theater-masks"></i>&nbsp;Theft</td>
          <td>
 <asp:DropDownList runat="server" ID="cmbRCS_Theft" Width="100%" Height="28px">
                                       <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Theft" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>
                    
                     
                                                                                                                                                                                                                                                                   <tr>
                              <td> <i class="fas fa-radiation-alt"></i>&nbsp;Inception hazard</td>
 <td>
 <asp:DropDownList runat="server" ID="cmbRCS_Dams" Width="100%" Height="28px">
                                          <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Dams" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>



                                         
                     
                                                                                                                                                                                                                                                                   <tr>
                              <td> <i class="fas fa-radiation"></i>&nbsp;Spread hazard (internal)</td>
 <td>
 <asp:DropDownList runat="server" ID="cmbRCS_Hazard" Width="100%" Height="28px">
                                         <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Hazard" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>


                     


                                         
                     
                                                                                                                                                                                                                                                                   <tr>
                              <td> <i class="fas fa-dumpster-fire"></i>&nbsp;Fire load</td>
 <td>
 <asp:DropDownList runat="server" ID="cmbRCS_Fireload" Width="100%" Height="28px">
                                      <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_FireLoad" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>



                     

                     


                                         
                     
                                                                                                                                                                                                                                                                   <tr>
                              <td> <i class="far fa-building"></i>&nbsp;Planned structural or occupational changes	</td>
 <td>
 <asp:DropDownList runat="server" ID="cmbRCS_Structure" Width="100%" Height="28px">
                                        <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td><asp:TextBox runat="server" ID="txtRCS_Structure" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
</tr>



                     



                 </tbody>
            </table>

                                            </div>

                                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2); margin: 10px;">
                                                <legend style="padding: 5px"><i class="fas fa-clipboard-list"></i>&nbsp; Requirements and Recommendations
                                            <button onclick="AssessmentControls.Functions.RequirementsAndRecommendations();" class="btn btn-warning" title="Download" style="float: right;">
                                                <i class="far fa-plus-square"></i>&nbsp;Add</button></legend>

                                                
                                                <asp:Literal runat="server" ID="litRequirementsAndRecommendations"></asp:Literal>
                                            </div>


                                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2); margin: 10px;">
                                                <legend style="padding: 5px"><i class="far fa-lightbulb"></i>&nbsp; General Comments and Ideas

                <asp:Button runat="server" Text="Save" ID="btnUpdateGeneralCommentsRisk" style="float: right;" OnClick="btnUpdateGeneralCommentsRisk_Click" CssClass="btn btn-warning" /></span>

                                                </legend>
                                                <asp:TextBox runat="server" ID="txtRiskComment" Height="200px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                                            </div>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>


                                </div>
                                <%--Risk Management Tab End--%>
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


<div class="modal fade" id="mdlAssessmentReferences" style="top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="udpAssessmentReferences" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-asterisk"></i>&nbsp;References</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>Policy Reference</span>
                            <asp:TextBox runat="server" ID="txtPolicyReference" placeholder="Policy Reference" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <span>Client Reference</span>
                            <asp:TextBox runat="server" ID="txtClientReference" placeholder="Client Reference" CssClass="form-control" Width="100%" Height="30px"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <span>Other Reference</span>
                            <asp:TextBox runat="server" ID="txtOtherReference" CssClass="form-control" placeholder="Other Reference" Width="100%" Height="30px"></asp:TextBox>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCloseAssessmentReferences" OnClick="btnCloseAssessmentReferences_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                        <asp:Button ID="btnUpdateAssessmentReferences" runat="server" CssClass="btn btn-primary pull-left" Text="Update" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->







<div class="modal fade" id="mdlPolicyDocumentUpload"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1000px !important"
">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-cloud-upload-alt"></i>&nbsp;Upload Policy Document(s) For Policy Capture</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="UploadDocumentFrame"></asp:Literal>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCloseAutoCapture"  OnClick="btnCloseAutoCapture_Click" runat="server" CssClass="btn btn-danger pull-left" Text="Cancel Policy Capture Request?" />
                                                                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Done" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnUploadPolicyDocument" EventName="Click" />
                                             <asp:AsyncPostBackTrigger ControlID="btnUploadPolicyDocumentHidden" EventName="Click" />

                </Triggers>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->




<div class="modal fade" id="mdlPolicyImageUpload"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1000px !important"
">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel5" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>


                    
                    <asp:Button ID="btnUploadImagesHidden" runat="server" OnClick="btnUploadImagesHidden_Click" style="display:none !important" />

                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-cloud-upload-alt"></i>&nbsp;Upload Images</h4>
                    </div>
                    <div class="modal-body">

                        <asp:Literal runat="server" ID="litUploadImages"></asp:Literal>

                    </div>
                    <div class="modal-footer">
               



                                                                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" OnClientClick="$('#Assessment_btnInitializePictureGallary').click();$('#Assessment_btnInitializePictureGallary').click();" CssClass="btn btn-warning pull-right" Text="Done" />



                    </div>
                </ContentTemplate>
            
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->





<div class="modal fade" id="mdlAttachmentsUpload"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1000px !important"
">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel14" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button ID="btnUploadAttachmentsHidden" runat="server" OnClick="btnUploadAttachmentsHidden_Click" style="display:none !important" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-paperclip"></i>&nbsp;Upload Attachment(s)</h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="litAttachmentsUploadFrame"></asp:Literal>
                    </div>
                    <div class="modal-footer">             
                      <asp:Button style="float:left !important" data-dismiss="modal" runat="server" OnClientClick="$('#Assessment_btnAssessmentAttachments').click();$('#Assessment_btnAssessmentAttachments').click();" CssClass="btn btn-warning pull-right" Text="Done" />
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
            <asp:UpdatePanel runat="server" ID="UpdatePanel6" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>


                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-ban"></i>&nbsp;<asp:Literal runat="server" ID="lblCancelAssessment" Text="Cancel Assessment"></asp:Literal></h4>
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



<div class="modal fade" id="mdlAddReviewMessage"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 550px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel8" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" style="display:none" ID="btnInitializeAddReviewMessage" OnClick="btnInitializeAddReviewMessage_Click" />
                    <asp:HiddenField runat="server" ID="vAssessmentReviewID" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-comment-dots"></i>&nbsp;<asp:Literal runat="server" ID="lblAddReviewMessageTitle" Text="Add Review"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <span>Survey Category</span>
                            <asp:DropDownList runat="server" Width="100%" Height="28px" ID="cmbReviewSurveyCategory" ></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span>Review</span>
                            <asp:TextBox runat="server" TextMode="MultiLine" Width="100%" Height="185px" ID="txtReviewText" placeholder="Please add your comments here..."></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer"> 
                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Close" />
                        <asp:Button style="float:left !important"  runat="server" CssClass="btn btn-success pull-right" Text="Add" ID="btnAddReview" OnClick="btnAddReview_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<div class="modal fade" id="mdlSureFinalizeQA"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 625px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel10" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" style="display:none" ID="Button1" OnClick="btnInitializeAddReviewMessage_Click" />
                    <asp:HiddenField runat="server" ID="HiddenField1" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-signature"></i>&nbsp;<asp:Literal runat="server" ID="Literal1" Text="Are you sure you would like sign off report as complete?"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <span>Survey Rating</span>
                            <asp:DropDownList runat="server" Width="100%" Height="28px" ID="cmbSurveyRating" >
                                <asp:ListItem Text="Excellent" Value="0" Enabled="true" Selected="True"></asp:ListItem>
                                  <asp:ListItem Text="Good" Value="1" Enabled="true" Selected="false"></asp:ListItem>
                                   <asp:ListItem Text="Average" Value="2" Enabled="true" Selected="false"></asp:ListItem>
                                 <asp:ListItem Text="Below Average" Value="3" Enabled="true" Selected="false"></asp:ListItem>
                                  <asp:ListItem Text="Poor" Value="4" Enabled="true" Selected="false"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span>Review</span>
                            <asp:TextBox runat="server" TextMode="MultiLine" Width="100%" Height="185px" ID="TextBox1" placeholder="Please add your comments here..."></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer"> 
                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="No, close" />
                        <asp:Button style="float:left !important"  runat="server" CssClass="btn btn-success pull-right" Text="Yes, I am sure." ID="Button2" OnClick="btnFinalizeQA_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->




<div class="modal fade" id="mdlGallaryPicture"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 525px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel11" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" style="display:none" ID="btnInitializeGallaryPicture" OnClick="btnInitializeGallaryPicture_Click" />
                    <asp:HiddenField runat="server" ID="vAssessmentImageID" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-camera-retro"></i>&nbsp;<asp:Literal runat="server" ID="lblImageTitle" Text=""></asp:Literal></h4>
                    </div>
                    <div class="modal-body">


                        <asp:Image runat="server" Width="100%" Height="450px" ID="imgGallaryPicture" />


                        <div class="form-group">
                            <span>Title</span>
                           <asp:TextBox runat="server" ID="txtGallaeryPictureTitle" CssClass="form-control" Width="100%" Height="28px"></asp:TextBox>
                        </div>


                        <div class="form-group">
                            <span>Move To Survey Category</span>
                            <asp:DropDownList runat="server" Width="100%" Height="28px" ID="cmbGallaryPictureSurveyCategory" ></asp:DropDownList>
                        </div>

                    </div>
                    <div class="modal-footer"> 
                                                <asp:Button style="float:right !important"  runat="server" CssClass="btn btn-danger pull-left" Text="Delete" ID="btnDeleteImage" OnClick="btnDeleteImage_Click" />

                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Close" />
                        <asp:Button style="float:left !important"  runat="server" CssClass="btn btn-success pull-right" Text="Update" ID="btnUpdateAssessmentImage" OnClick="btnUpdateAssessmentImage_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->






<div class="modal fade" id="mdlGallaryUpdate"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 525px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel12" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button runat="server" style="display:none" ID="btnInitializeGallaryUpdate" OnClick="btnInitializeGallaryUpdate_Click" />
                    <asp:HiddenField runat="server" ID="vCurrentAlbumSurveyCategoryID" />
                    <asp:HiddenField runat="server" ID="vCurrentAlbumSurveyLocation" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-photo-video"></i>&nbsp;Update Album</h4>
                    </div>
                    <div class="modal-body">

                          <div class="form-group">
                            <span>Survey Category</span>
                            <asp:DropDownList runat="server" Width="100%" Height="28px" ID="cmbAlbumSurveyCategory" ></asp:DropDownList>
                        </div>
                    


                        <div class="form-group">
                            <span>Location</span>
                           <asp:TextBox runat="server" ID="txtAlbumLocation" CssClass="form-control" Width="100%" Height="28px"></asp:TextBox>
                        </div>

                                 <div class="form-group">
                            <span>Comment</span>
                           <asp:TextBox runat="server" ID="txtAlbumComment" CssClass="form-control" Width="100%" Height="55px" TextMode="MultiLine"></asp:TextBox>
                        </div>


                      

                    </div>
                    <div class="modal-footer"> 
                        <asp:Button style="float:left !important" data-dismiss="modal" runat="server" CssClass="btn btn-warning pull-right" Text="Close" />
                        <asp:Button style="float:left !important"  runat="server" CssClass="btn btn-success pull-right" Text="Update" ID="btnUpdateAlbum" OnClick="btnUpdateAlbum_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->






<script>




    let chartReg = {};
    let AssessmentControls = {
        Initialze: (Data) => {
            // alert(Data);
            $('#<%=vAssessmentID.ClientID.ToString()%>').val(Data);
            $('#<%=btnInitialize.ClientID.ToString()%>').click();
            changeUrl('MODULE', 'ASSESSMENT');
            changeUrl('DATA', Router.Functions.Encode(Data));
            $('.content-wrapper').hide();
            $('#modAssessment').fadeIn(5000);
        },
        Declare: () => {


            $('#<%Response.Write(cmbDelegate.ClientID);%>').select2();

            $('#<%Response.Write(cmbIndustrySector.ClientID);%>').select2();
            $('#<%Response.Write(cmbIndustryType.ClientID);%>').select2();
            $('#<%Response.Write(cmbIndustrySubSector.ClientID);%>').select2();
            $('#<%Response.Write(cmbExistingPolicy.ClientID);%>').select2();
            am4core.disposeAllCharts();
            $('#<%Response.Write(cmbIndustrySector.ClientID);%>').select2();
            $('#<%Response.Write(cmbIndustryType.ClientID);%>').select2();
            $('#<%Response.Write(cmbIndustrySubSector.ClientID);%>').select2();
            $('#<%Response.Write(cmbExistingPolicy.ClientID);%>').select2();
            $('#<%Response.Write(cmbIndustrySector.ClientID);%>').select2();
            $('#<%Response.Write(cmbIndustryType.ClientID);%>').select2();
            $('#<%Response.Write(cmbIndustrySubSector.ClientID);%>').select2();
            $('#<%Response.Write(cmbExistingPolicy.ClientID);%>').select2();
            AssessmentControls.Tabs.Specifications.Editor.Initialize();
            AssessmentControls.Tabs.Gallary.Lightbox.Initialize();
            AssessmentControls.Functions.AdjustMPL();
            AssessmentControls.Functions.AdjustEML();
            AssessmentControls.SetVideos();




            $('#<%=txtBookingDate.ClientID.ToString()%>').datepicker({
                autoclose: true,
                orientation: 'bottom',
                format: "yyyy/mm/dd"
            });


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
                    $('#<%=btnSaveClientDetails.ClientID.ToString()%>').click();
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
            UploadAttachments: () => {
                $('#<%=btnUploadAttachmentsHidden.ClientID%>').click();
            },
            OpenAssessmentAlbum: (CurrentSurveyCategoryID, CurrentSurveyLocation) => {
                $('#<%=vCurrentAlbumSurveyCategoryID.ClientID.ToString()%>').val(CurrentSurveyCategoryID);
                $('#<%=vCurrentAlbumSurveyLocation.ClientID.ToString()%>').val(CurrentSurveyLocation);
                $('#<%=btnInitializeGallaryUpdate.ClientID%>').click();
            },
            OpenAssessmentImage: (AssessmentImageID) => {
                $('#<%=vAssessmentImageID.ClientID.ToString()%>').val(AssessmentImageID);
                $('#<%=btnInitializeGallaryPicture.ClientID%>').click();
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
            RefreshAssessmentReview: () => {
                setTimeout(() => { $('#<%=btnAssessmentReviewInitialize.ClientID%>').click(); }, 250);

            },

            OpenAssessmentReview: (ID) => {
                $('#<%=vAssessmentReviewID.ClientID%>').val(ID);
                setTimeout(() => { $('#<%=btnInitializeAddReviewMessage.ClientID%>').click(); }, 250);

            },
            OpenImageUpload: () => {

                setTimeout(() => { $('#<%=btnUploadImagesHidden.ClientID.ToString()%>').click(); }, 500);

            },

            InitializeRiskManagement: () => {
                setTimeout(() => { $('#<%=btnRiskManagemensInitialize.ClientID.ToString()%>').click(); }, 500);

            },
            RequirementsAndRecommendations: () => {
                let AssessmentID = $('#<%=vAssessmentID.ClientID.ToString()%>').val();

                RequirementsAndRecommendations.Open(AssessmentID, '0');
            },




            RiskClassificationSummary: () => {
                let AssessmentID = $('#<%=vAssessmentID.ClientID.ToString()%>').val();

                RiskClassificationSummaryControls.Open(AssessmentID, 0);
            },
            AutoCapture: () => {
                setTimeout(() => { $('#<%=btnUploadPolicyDocumentHidden.ClientID.ToString()%>').click(); }, 250);

            },
            AddRiskAddress: () => {
                let AssessmentID = $('#<%=vAssessmentID.ClientID.ToString()%>').val();
                AddressControls.Initialze(AssessmentID, 0);
            },
            RefreshAssessmentQuotes: () => {
                $('#<%=btnAssessmentQuotesRefresh.ClientID.ToString()%>').click();
            },
            AddQuote: () => {
                let AssessmentID = $('#<%=vAssessmentID.ClientID.ToString()%>').val();
                AssessmentQuoteControls.Initialize(AssessmentID, '0');
            },
            RefreshAssessmentTracks: () => {
                setTimeout(() => {
                    $('#<%=btnRefreshTracks.ClientID.ToString()%>').click();
                }, 250);
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
            },
            AdjustMPL: () => {
                let MPL = $('#<%=txtMPL.ClientID.ToString()%>').val();
                MPL = (MPL === null) ? 0 : MPL;
                AssessmentControls.chartRiskMPL(MPL);
            },
            AdjustEML: () => {
                let EML = $('#<%=txtEML.ClientID.ToString()%>').val();
                EML = (EML === null) ? 0 : EML;

                AssessmentControls.chartRiskEPL(EML);
            }
        },
        chartRiskPML: (ePML) => {

            //var base = am4core.registry.baseSprites;
            //      for (var x = 0; x < base.length; x++) {
            //          var charts = am4core.registry.baseSprites[x];
            //          for (var i = 0; i < charts.length; i++) {
            //              charts[i].dispose();
            //          }
            //      }

            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            // create chart
            chartReg["chartRiskPML"] = am4core.create("chartRiskPML", am4charts.GaugeChart);
            chartReg["chartRiskPML"].hiddenState.properties.opacity = 0; // this makes initial fade in effect

            chartReg["chartRiskPML"].innerRadius = -25;

            var axis = chartReg["chartRiskPML"].xAxes.push(new am4charts.ValueAxis());
            axis.min = 0;
            axis.max = 100;
            axis.strictMinMax = true;
            axis.renderer.grid.template.stroke = new am4core.InterfaceColorSet().getFor("background");
            axis.renderer.grid.template.strokeOpacity = 0.3;

            var colorSet = new am4core.ColorSet();

            var range0 = axis.axisRanges.create();
            range0.value = 0;
            range0.endValue = 50;
            range0.axisFill.fillOpacity = 1;
            range0.axisFill.fill = colorSet.getIndex(0);
            range0.axisFill.zIndex = - 1;

            var range1 = axis.axisRanges.create();
            range1.value = 50;
            range1.endValue = 80;
            range1.axisFill.fillOpacity = 1;
            range1.axisFill.fill = colorSet.getIndex(2);
            range1.axisFill.zIndex = -1;

            var range2 = axis.axisRanges.create();
            range2.value = 80;
            range2.endValue = 100;
            range2.axisFill.fillOpacity = 1;
            range2.axisFill.fill = colorSet.getIndex(4);
            range2.axisFill.zIndex = -1;

            var hand = chartReg["chartRiskPML"].hands.push(new am4charts.ClockHand());

            // using chart.setTimeout method as the timeout will be disposed together with a chart
            let PML = $('#<%=txtPML.ClientID.ToString()%>').val();
            hand.showValue(15, 100, am4core.ease.cubicOut);

        },

        chartRiskMPL: (eMPL) => {

            //var base = am4core.registry.baseSprites;
            //    for (var x = 0; x < base.length; x++) {
            //        var charts = am4core.registry.baseSprites[x];
            //        for (var i = 0; i < charts.length; i++) {
            //            charts[i].dispose();
            //        }
            //    }




            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            // create chart
            chartReg["chartRiskMPL"] = am4core.create("chartRiskMPL", am4charts.GaugeChart);
            chartReg["chartRiskMPL"].hiddenState.properties.opacity = 0; // this makes initial fade in effect

            chartReg["chartRiskMPL"].innerRadius = -25;

            var axis = chartReg["chartRiskMPL"].xAxes.push(new am4charts.ValueAxis());
            axis.min = 0;
            axis.max = 100;
            axis.strictMinMax = true;
            axis.renderer.grid.template.stroke = new am4core.InterfaceColorSet().getFor("background");
            axis.renderer.grid.template.strokeOpacity = 0.3;

            var colorSet = new am4core.ColorSet();

            var range0 = axis.axisRanges.create();
            range0.value = 0;
            range0.endValue = 50;
            range0.axisFill.fillOpacity = 1;
            range0.axisFill.fill = colorSet.getIndex(0);
            range0.axisFill.zIndex = - 1;

            var range1 = axis.axisRanges.create();
            range1.value = 50;
            range1.endValue = 80;
            range1.axisFill.fillOpacity = 1;
            range1.axisFill.fill = colorSet.getIndex(2);
            range1.axisFill.zIndex = -1;

            var range2 = axis.axisRanges.create();
            range2.value = 80;
            range2.endValue = 100;
            range2.axisFill.fillOpacity = 1;
            range2.axisFill.fill = colorSet.getIndex(4);
            range2.axisFill.zIndex = -1;

            var hand = chartReg["chartRiskMPL"].hands.push(new am4charts.ClockHand());

            // using chart.setTimeout method as the timeout will be disposed together with a chart
            let MPL = $('#<%=txtMPL.ClientID.ToString()%>').val();
            // alert(MPL);
            hand.showValue(MPL, 100, am4core.ease.cubicOut);


            //  chart.dispose();


        },

        chartRiskEPL: (eEPL) => {


            ////var base = am4core.registry.baseSprites;
            ////for (var x = 0; x < base.length; x++) {
            ////    var charts = am4core.registry.baseSprites[x];
            ////    for (var i = 0; i < charts.length; i++) {
            ////        charts[i].dispose();
            ////    }
            ////}
            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            // create chart
            chartReg["chartRiskEPL"] = am4core.create("chartRiskEPL", am4charts.GaugeChart);

            chartReg["chartRiskEPL"].hiddenState.properties.opacity = 0; // this makes initial fade in effect

            chartReg["chartRiskEPL"].innerRadius = -25;

            var axis = chartReg["chartRiskEPL"].xAxes.push(new am4charts.ValueAxis());
            axis.min = 0;
            axis.max = 100;
            axis.strictMinMax = true;
            axis.renderer.grid.template.stroke = new am4core.InterfaceColorSet().getFor("background");
            axis.renderer.grid.template.strokeOpacity = 0.3;

            var colorSet = new am4core.ColorSet();

            var range0 = axis.axisRanges.create();
            range0.value = 0;
            range0.endValue = 50;
            range0.axisFill.fillOpacity = 1;
            range0.axisFill.fill = colorSet.getIndex(0);
            range0.axisFill.zIndex = - 1;

            var range1 = axis.axisRanges.create();
            range1.value = 50;
            range1.endValue = 80;
            range1.axisFill.fillOpacity = 1;
            range1.axisFill.fill = colorSet.getIndex(2);
            range1.axisFill.zIndex = -1;

            var range2 = axis.axisRanges.create();
            range2.value = 80;
            range2.endValue = 100;
            range2.axisFill.fillOpacity = 1;
            range2.axisFill.fill = colorSet.getIndex(4);
            range2.axisFill.zIndex = -1;

            var hand = chartReg["chartRiskEPL"].hands.push(new am4charts.ClockHand());

            // using chart.setTimeout method as the timeout will be disposed together with a chart

            let EPL = $('#<%=txtEML.ClientID.ToString()%>').val();
            chartReg["chartRiskEPL"].setTimeout(EPL, 2000);



        },
        SetVideos: () => {





        }

    };

    $(document).ready(function () {
        var vid = $('#myvid');

        //default video source
        $(vid).attr("src", $("a.link:first").attr("href"));

        // addClass playing to first video link
        $("a.link:first").addClass("playing");


        $("a.link").on("click", function (event) {

            // prevent link default
            event.preventDefault();

            // change video source
            $(vid).attr("src", $(this).attr("href"));

            // remouve class playing from unplayed video href
            $(".vids a").removeClass("playing");

            // add class playing to video href
            $(this).addClass("playing");

            // add class paused to give the play/pause button the right look  
            $('.btnPlay').addClass('paused');

            // play the video
            vid[0].play();

            // adjust prev button state
            if ($("a.link:first").hasClass("playing")) {
                $(".prevvid").addClass("disabled");
            }
            else {
                $(".prevvid").removeClass("disabled");
            }

            // adjust next button state
            if ($("a.link:last").hasClass("playing")) {
                $(".nextvid").addClass("disabled");
            }
            else {
                $(".nextvid").removeClass("disabled");
            }

        });


        //VIDEO EVENTS
        //video canplay event
        vid.on('canplay', function () {
            $('.loading').fadeOut(100);
        });

        //video canplaythrough event
        //solve Chrome cache issue
        var completeloaded = false;
        vid.on('canplaythrough', function () {
            completeloaded = true;
        });

        //video ended event
        vid.on('ended', function () {
            $('.btnPlay').removeClass('paused');
            vid[0].pause();
        });

        //video seeking event
        vid.on('seeking', function () {
            //if video fully loaded, ignore loading screen
            if (!completeloaded) {
                $('.loading').fadeIn(200);
            }
        });

        //video seeked event
        vid.on('seeked', function () { });

        //video waiting for more data event
        vid.on('waiting', function () {
            $('.loading').fadeIn(200);
        });

        /*controllers*/
        //before everything get started
        vid.on('loadedmetadata', function () {
            //set video properties
            $('.current').text(timeFormat(0));
            $('.duration').text(timeFormat(vid[0].duration));
            if (vid[0].muted) {
                updateVolume(0, 0);
            } else {
                updateVolume(0, 0.7);
            }
        });

        //display video buffering bar
        var startBuffer = function () {
            var currentBuffer = vid[0].buffered.end(0);
            var maxduration = vid[0].duration;
            var perc = 100 * currentBuffer / maxduration;
            $('.bufferBar').css('width', perc + '%');

            if (currentBuffer < maxduration) {
                setTimeout(startBuffer, 500);
            }
        };


        //display current video play time
        vid.on('timeupdate', function () {
            var currentPos = vid[0].currentTime;
            var maxduration = vid[0].duration;
            var perc = 100 * currentPos / maxduration;
            $('.timeBar').css('width', perc + '%');
            $('.current').text(timeFormat(currentPos));
        });

        //CONTROLS EVENTS
        //video screen and play button clicked
        vid.on('click', function () { playpause(); return false });
        var playpause = function () {
            if (vid[0].paused || vid[0].ended) {
                $('.btnPlay').addClass('paused');
                vid[0].play();
            }
            else {
                $('.btnPlay').removeClass('paused');
                vid[0].pause();
            }
        };

        //VIDEO PROGRESS BAR
        //when video timebar clicked
        var timeDrag = false;   /* check for drag event */
        $('.progress').on('mousedown', function (e) {
            timeDrag = true;
            updatebar(e.pageX);
        });
        $(document).on('mouseup', function (e) {
            if (timeDrag) {
                timeDrag = false;
                updatebar(e.pageX);
            }
        });
        $(document).on('mousemove', function (e) {
            if (timeDrag) {
                updatebar(e.pageX);
            }
        });
        var updatebar = function (x) {
            var progress = $('.progress');

            //calculate drag position
            //and update video currenttime
            //as well as progress bar
            var maxduration = vid[0].duration;
            var position = x - progress.offset().left;
            var percentage = 100 * position / progress.width();
            if (percentage > 100) {
                percentage = 100;
            }
            if (percentage < 0) {
                percentage = 0;
            }
            $('.timeBar').css('width', percentage + '%');
            vid[0].currentTime = maxduration * percentage / 100;
        };
        //sound button clicked
        $('.sound').click(function () {
            vid[0].muted = !vid[0].muted;
            $(this).toggleClass('muted');
            if (vid[0].muted) {
                $('.volumeBar').css('width', 0);
            }
            else {
                $('.volumeBar').css('width', vid[0].volume * 100 + '%');
            }
        });

        //VOLUME BAR
        //volume bar event
        var volumeDrag = false;
        $('.volume').on('mousedown', function (e) {
            volumeDrag = true;
            vid[0].muted = false;
            $('.sound').removeClass('muted');
            updateVolume(e.pageX);
        });
        $(document).on('mouseup', function (e) {
            if (volumeDrag) {
                volumeDrag = false;
                updateVolume(e.pageX);
            }
        });
        $(document).on('mousemove', function (e) {
            if (volumeDrag) {
                updateVolume(e.pageX);
            }
        });
        var updateVolume = function (x, vol) {
            var volume = $('.volume');
            var percentage;
            //if only volume have specificed
            //then direct update volume
            if (vol) {
                percentage = vol * 100;
            }
            else {
                var position = x - volume.offset().left;
                percentage = 100 * position / volume.width();
            }

            if (percentage > 100) {
                percentage = 100;
            }
            if (percentage < 0) {
                percentage = 0;
            }

            //update volume bar and video volume
            $('.volumeBar').css('width', percentage + '%');
            vid[0].volume = percentage / 100;

            //change sound icon based on volume
            if (vid[0].volume == 0) {
                $('.sound').removeClass('sound2').addClass('muted');
            }
            else if (vid[0].volume > 0.5) {
                $('.sound').removeClass('muted').addClass('sound2');
            }
            else {
                $('.sound').removeClass('muted').removeClass('sound2');
            }

        };

        //speed text clicked
        $('.spdx50').on('click', function () { fastfowrd(this, 1.5); });
        $('.spdx25').on('click', function () { fastfowrd(this, 1.25); });
        $('.spdx1').on('click', function () { fastfowrd(this, 1); });
        $('.spdx050').on('click', function () { fastfowrd(this, 0.5); });
        var fastfowrd = function (obj, spd) {
            $('.speedcnt li').removeClass('selected');
            $(obj).addClass('selected');
            vid[0].playbackRate = spd;
            vid[0].play();
            $("ul.speedcnt").fadeOut("fast");
            $('.btnPlay').addClass('paused');
        };
        $(".btnspeed").click(function () {

            $("ul.speedcnt").slideToggle(100);
        });

        //fullscreen button clicked
        $('.btnFS').on('click', function () {
            if ($.isFunction(vid[0].webkitEnterFullscreen)) {
                vid[0].webkitEnterFullscreen();
            }
            else if ($.isFunction(vid[0].mozRequestFullScreen)) {
                vid[0].mozRequestFullScreen();
            }
            else {
                alert('Your browsers doesn\'t support fullscreen');
            }
            return false;
        });

        //light bulb button clicked
        $('.btnLight').click(function () {
            $(this).toggleClass('lighton');

            //if lightoff, create an overlay
            if (!$(this).hasClass('lighton')) {
                $('body').append('<div class="overlay"></div>');
                $('.overlay').css({
                    'position': 'absolute',
                    'width': 100 + '%',
                    'height': $(document).height(),
                    'background': '#000',
                    'opacity': 0.9,
                    'top': 0,
                    'left': 0,
                    'z-index': 999
                });
                $('.vidcontainer').css({
                    'z-index': 1000
                });
            }
            //if lighton, remove overlay
            else {
                $('.overlay').remove();
            }
            return false;
        });

        //hide pause button if video onplaying
        //if (vid.onplaying = true) { $('.btnPlay').addClass('paused'); };


        //previous video button
        $(".prevvid").click(function () {
            $(vid).attr("src", $(".playing").prev().attr("href"));
            vid[0].play();
            $(".playing").prev().addClass("playing");
            $(".playing:last").removeClass("playing");
            $('.btnPlay').addClass('paused');
            $(".nextvid").removeClass("disabled");
            if ($("a.link:first").hasClass("playing")) {
                $(this).addClass("disabled");
            } else {
                $(this).removeClass("disabled");
            };
            return false;
        });

        //previous video button
        $(".nextvid").click(function () {
            $(vid).attr("src", $(".playing").next().attr("href"));
            vid[0].play();
            $(".playing").next().addClass("playing");
            $(".playing:first").removeClass("playing");
            $('.btnPlay').addClass('paused');
            $(".prevvid").removeClass("disabled");
            if ($("a.link:last").hasClass("playing")) {
                $(this).addClass("disabled");
            } else {
                $(this).removeClass("disabled");
            };
            return false;
        });



        //Time format converter - 00:00
        var timeFormat = function (seconds) {
            var m = Math.floor(seconds / 60) < 10 ? "0" + Math.floor(seconds / 60) : Math.floor(seconds / 60);
            var s = Math.floor(seconds - (m * 60)) < 10 ? "0" + Math.floor(seconds - (m * 60)) : Math.floor(seconds - (m * 60));
            return m + ":" + s;
        };
        $(".closeme , .bigplay").click(function () {
            $("this,.ads,.bigplay").fadeOut(200);
            vid[0].play();
            $('.btnPlay').addClass('paused');
        });
        //end
    });



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
