<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Assessment1.ascx.cs" Inherits="Mitig8.Modules.Assessments.Assessment1" %>
<%@ Register Src="~/Modules/Assessments/Booking.ascx" TagPrefix="Modal" TagName="Booking" %>
<%@ Register Src="~/Modules/Assessments/Quote.ascx" TagPrefix="Modal" TagName="Quote" %>


<!-- Content Wrapper. Contains page content -->
<div id="modAssessment" class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                        <ContentTemplate>
                            <h1 class="m-0 text-dark">
                                <i class="fas fa-microscope"></i>&nbsp;
                                <asp:Literal runat="server" ID="lblAssessment" Text="New Assessment"></asp:Literal></h1>
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


            <%--Updatepanel for hidden controls--%>
            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none !important" />
                </ContentTemplate>
            </asp:UpdatePanel>


            <div class="row">


                <div class="col-md-3">
                    <div class="card card-warning">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-info"></i>&nbsp;Details</h3>

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
                                        <span>Category</span>
                                        <asp:DropDownList ID="cmbCategory" OnTextChanged="cmbCategory_Change" runat="server" Width="100%" Height="30px" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                    </div>


                                    <div class="form-group col-12">
                                        <span>Subcategory</span>
                                        <asp:DropDownList ID="cmbSubcategory" AutoPostBack="true" OnTextChanged="cmbSubCategory_Change" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:DropDownList>
                                    </div>

                                    <div class="form-group col-12">
                                        <span>Type</span>
                                        <asp:DropDownList ID="cmbType" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:DropDownList>
                                    </div>

                                    <div class="form-group col-12">
                                        <span>Province</span>
                                        <asp:DropDownList ID="cmbProvince" OnTextChanged="cmbProvince_Change" runat="server" Width="100%" Height="30px" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                    </div>

                                    <div class="form-group col-12">
                                        <span>Town</span>
                                        <asp:DropDownList ID="cmbTown" OnTextChanged="cmbTown_Change" runat="server" Width="100%" Height="30px" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                    </div>

                                    <div class="form-group col-12">
                                        <span>Suburb</span>
                                        <asp:DropDownList ID="cmbSuburb" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:DropDownList>
                                    </div>

                                    <div class="form-group col-12">
                                        <span>Reference&nbsp;<asp:LinkButton runat="server" Text="[More]" OnClick="btnReferences_Click" ID="btnReferences"></asp:LinkButton></span>
                                        <asp:TextBox ID="txtReference" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:TextBox>
                                    </div>

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
                                    <a class="nav-link active" id="btnTabAssessmentClient" data-toggle="pill" href="#tabAssessmentClient" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-laugh"></i>&nbsp;Client</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentSpecifications" data-toggle="pill" href="#tabAssessmentSpesifications" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-pencil-ruler"></i>&nbsp;Specifications</a>
                                </li>




                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentTracks" data-toggle="pill" href="#tabAssessmentTracks" role="tab" aria-controls="custom-tabs-one-home" aria-selected="false"><i class="fas fa-bullseye"></i>&nbsp;Tracks</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentUsers" data-toggle="pill" href="#tabAssessmentUsers" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false"><i class="fas fa-user-friends"></i>&nbsp;Users</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" id="btnTabAssessmentReports" data-toggle="pill" href="#tabAssessmentReports" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false"><i class="fas fa-flag-checkered"></i>&nbsp;Reports</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentSurveys" data-toggle="pill" href="#tabAssessmentSurveys" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-question-circle"></i>&nbsp;Surveys</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabAssessmentQuotes" data-toggle="pill" href="#tabAssessmentQuotes" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-file-invoice"></i>&nbsp;Quotes</a>
                                </li>



                                <li class="nav-item">
                                    <a class="nav-link " id="btnTabGallery" data-toggle="pill" href="#tabAssessmentGallery" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="far fa-images"></i>&nbsp;Gallery</a>
                                </li>



                            </ul>
                        </div>
                        <div class="card-body" style="padding: 0px !important">
                            <div class="tab-content" id="tabSetAssessments">

                                <%--Spesifications Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentSpesifications" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-save"></i>&nbsp;Save Specifications</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtSpecifications"></asp:TextBox>
                                </div>
                                <%--Spesifications Tab End--%>

                                <%--Tracks Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentTracks" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <ul class="navbar-nav">
                                            <li class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-cloud-download-alt"></i>&nbsp;Download Tracking Report</a>
                                            </li>
                                            <li class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-paper-plane"></i>&nbsp;Email Tracking Report</a>
                                            </li>
                                            <li class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
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
                                        <!-- The time line -->
                                        <div class="timeline">
                                            <!-- timeline time label -->
                                            <div class="time-label">
                                                <span class="bg-red">10 Dec. 2019</span>
                                            </div>
                                            <!-- /.timeline-label -->
                                            <!-- timeline item -->
                                            <div>
                                                <i class="fas fa-envelope bg-blue"></i>
                                                <div class="timeline-item">
                                                    <span class="time"><i class="fas fa-clock"></i>12:05</span>
                                                    <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                                                    <div class="timeline-body">
                                                        TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST
                                                    </div>

                                                </div>
                                            </div>
                                            <!-- END timeline item -->
                                            <!-- timeline item -->
                                            <div>
                                                <i class="fas fa-user bg-green"></i>
                                                <div class="timeline-item">
                                                    <span class="time"><i class="fas fa-clock"></i>5 mins ago</span>
                                                    <h3 class="timeline-header no-border"><a href="#">Joe Soap</a> assigned as assessor</h3>
                                                </div>
                                            </div>
                                            <!-- END timeline item -->
                                            <%--                                            <!-- timeline item -->
                                            <div>
                                                <i class="fas fa-comments bg-yellow"></i>
                                                <div class="timeline-item">
                                                    <span class="time"><i class="fas fa-clock"></i>27 mins ago</span>
                                                    <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>
                                                    <div class="timeline-body">
                                                        Take me to your leader!
                    Switzerland is small and neutral!
                    We are more like Germany, ambitious and misunderstood!
                                                    </div>
                                                    <div class="timeline-footer">
                                                        <a class="btn btn-warning btn-sm">View comment</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END timeline item -->--%>
                                            <!-- timeline time label -->
                                            <div class="time-label">
                                                <span class="bg-green">3 Dec. 2019</span>
                                            </div>
                                            <!-- /.timeline-label -->
                                            <!-- timeline item -->
                                            <div>
                                                <i class="fa fa-camera bg-purple"></i>
                                                <div class="timeline-item">
                                                    <span class="time"><i class="fas fa-clock"></i>2 days ago</span>
                                                    <h3 class="timeline-header"><a href="#">Joe Soap </a>uploaded assessment photos</h3>
                                                    <div class="timeline-body">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                        <img src="http://placehold.it/150x100" alt="...">
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END timeline item -->
                                            <%--<!-- timeline item -->
                                            <div>
                                                <i class="fas fa-video bg-maroon"></i>

                                                <div class="timeline-item">
                                                    <span class="time"><i class="fas fa-clock"></i>5 days ago</span>

                                                    <h3 class="timeline-header"><a href="#">Mr. Doe</a> shared a video</h3>

                                                    <div class="timeline-body">
                                                        <div class="embed-responsive embed-responsive-16by9">
                                                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tMWkeBIohBs" frameborder="0" allowfullscreen=""></iframe>
                                                        </div>
                                                    </div>
                                                    <div class="timeline-footer">
                                                        <a href="#" class="btn btn-sm bg-maroon">See comments</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- END timeline item -->--%>
                                            <div>
                                                <i class="fas fa-clock bg-gray"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--Tracks Tab End--%>

                                <%--Users Tab Start--%>
                                <div class="tab-pane fade" id="tabAssessmentUsers" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <ul class="navbar-nav">
                                            <li class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-user-plus"></i>&nbsp;Add User</a>
                                            </li>
                                            <li class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-user-minus"></i>&nbsp;Remove User</a>
                                            </li>
                                            <li class="nav-item">
                                                <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <div class="row d-flex align-items-stretch" style="padding: 10px;">
                                        <%--Assessor Demo--%>
                                        <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="fas fa-diagnoses"></i>&nbsp;Assessor
                                                </div>
                                                <div class="card-body pt-0">
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <h2 class="lead"><b>Joe Soap</b></h2>
                                                            <p class="text-muted text-sm"><b>Assigned: </b>2019-12-19T12:54:41 </p>

                                                            <ul class="ml-4 mb-0 fa-ul text-muted">
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Equipro: Demo Street 123, Demo City 4051, KZN</li>
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 123 - 12 12 23 52</li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-5 text-center">
                                                            <img src="/images/nopic.jpg" alt="" class="img-circle img-fluid">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--Insurer Demo--%>
                                        <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="fas fa-user-shield"></i>&nbsp;Insurer
                                                </div>
                                                <div class="card-body pt-0">
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <h2 class="lead"><b>Jonathan Bear</b></h2>
                                                            <p class="text-muted text-sm"><b>Assigned: </b>2019-12-18T12:54:41 </p>

                                                            <ul class="ml-4 mb-0 fa-ul text-muted">
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Zurick Insurce: Demo Street 123, Demo City 4051, KZN</li>
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 123 - 12 12 23 52</li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-5 text-center">
                                                            <img src="/images/nopic.jpg" alt="" class="img-circle img-fluid">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%--Specialst Demo--%>
                                        <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="fas fa-user-tie"></i>&nbsp;Specialist
                                                </div>
                                                <div class="card-body pt-0">
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <h2 class="lead"><b>Jason Muller</b></h2>
                                                            <p class="text-muted text-sm"><b>Assigned: </b>2019-12-22T12:14:41 </p>

                                                            <ul class="ml-4 mb-0 fa-ul text-muted">
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Mitig8 Risk Dep: Demo Street 123, Demo City 4051, KZN</li>
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 123 - 12 12 23 52</li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-5 text-center">
                                                            <img src="/images/nopic.jpg" alt="" class="img-circle img-fluid">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <%--Client Demo--%>
                                        <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                            <div class="card bg-light">
                                                <div class="card-header  border-bottom-0">
                                                    <i class="far fa-laugh"></i>&nbsp;Client
                                                </div>
                                                <div class="card-body pt-0">
                                                    <div class="row">
                                                        <div class="col-7">
                                                            <h2 class="lead"><b>Donald Trumpo</b></h2>
                                                            <p class="text-muted text-sm"><b>Assigned: </b>2019-12-18T12:14:41 </p>

                                                            <ul class="ml-4 mb-0 fa-ul text-muted">
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>48 Demo Street 123, Demo City 4051, KZN</li>
                                                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone #: + 123 - 12 12 23 52</li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-5 text-center">
                                                            <img src="/images/nopic.jpg" alt="" class="img-circle img-fluid">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
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



                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width: 20px">ID</th>
                                                <th>Type</th>
                                                <th>Status</th>
                                                <th style="width: 500px">Options</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>158975</td>
                                                <td><i class="fas fa-umbrella"></i>&nbsp;Assessment Report</td>
                                                <td>Awaiting Payment
                                                </td>
                                                <td>
                                                    <button class="btn btn-warning" title="Download"><i class="fas fa-eye"></i>&nbsp;View</button>
                                                    <button class="btn btn-warning" title="Download"><i class="fas fa-file-download"></i>&nbsp;Download</button>
                                                    <button class="btn btn-warning" title="Dispute"><i class="far fa-angry"></i>&nbsp;Dispute</button>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>158987</td>
                                                <td><i class="fas fa-stopwatch"></i>&nbsp;Tracking Report</td>
                                                <td>Awaiting Payment
                                                </td>
                                                <td>
                                                    <button class="btn btn-warning" title="Download"><i class="fas fa-eye"></i>&nbsp;View</button>
                                                    <button class="btn btn-warning" title="Download"><i class="fas fa-file-download"></i>&nbsp;Download</button>
                                                    <button class="btn btn-warning" title="Dispute"><i class="far fa-angry"></i>&nbsp;Dispute</button>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <%--Reports Tab End--%>

                                <%--Surveys Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentSurveys" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-plus"></i>&nbsp;Add Survey</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-minus"></i>&nbsp;Remove Survey</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width: 20px">ID</th>
                                                <th>Type</th>
                                                <th>Status</th>
                                                <th>Assessor</th>
                                                <th style="width: 500px">Options</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>158975</td>
                                                <td>&nbsp;Comercial Farm Survey</td>
                                                <td>In-Progress
                                                </td>
                                                <td>Joe Soap
                                                </td>
                                                <td>
                                                    <button class="btn btn-warning" title="Open"><i class="fas fa-pencil-alt"></i>&nbsp;Open</button>
                                                    <button class="btn btn-warning" title="Asign"><i class="fas fa-diagnoses"></i>&nbsp;Asign</button>
                                                    <button class="btn btn-warning" title="Drop"><i class="fas fa-trash-alt"></i>&nbsp;Drop</button>
                                                    <button class="btn btn-warning" title="Reset"><i class="fas fa-recycle"></i>&nbsp;Reset</button>

                                                </td>
                                            </tr>



                                        </tbody>
                                    </table>
                                </div>
                                <%--Surveys Tab End--%>

                                <%--Quotes Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentQuotes" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a onclick="AssessmentQuoteControls.Initialize('0','0');" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-plus"></i>&nbsp;Add Quote</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-minus"></i>&nbsp;Remove Quote</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync"></i>&nbsp;Refresh</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width: 20px">ID</th>
                                                <th>Company</th>
                                                <th>Rating</th>
                                                <th>Service Date</th>
                                                <th>Quote Date</th>
                                                <th>Price</th>

                                                <th style="width: 250px">Response</th>
                                                <th style="width: 250px">Options</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>158975</td>
                                                <td>&nbsp;John Foxx's Assesors</td>
                                                <td>
                                                    <div class="progress progress-xs" style="height: 30px;">

                                                        <div class="progress-bar progress-bar-yellow" style="width: 70%">7/10</div>
                                                    </div>
                                                </td>
                                                <td>2020-02-05
                                                </td>
                                                <td>2020-01-28
                                                </td>
                                                <td>R3885.00
                                                </td>
                                                <td>
                                                    <button class="btn btn-success" title="Accept"><i class="far fa-thumbs-up"></i>&nbsp;Accept</button>
                                                    <button class="btn btn-danger" title="Reject"><i class="far fa-thumbs-down"></i>&nbsp;Reject</button>
                                                </td>
                                                <td>
                                                    <button class="btn btn-warning" title="Download"><i class="fas fa-eye"></i>&nbsp;View</button>
                                                    <button class="btn btn-warning" title="Download"><i class="fas fa-file-download"></i>&nbsp;Download</button>

                                                </td>
                                            </tr>



                                        </tbody>
                                    </table>
                                </div>
                                <%--Quotes Tab End--%>

                                <%--Client Tab Start--%>
                                <div class="tab-pane fade active show" id="tabAssessmentClient" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse" id="navbarNav">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-save"></i>&nbsp;Save Client Details</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a onclick="AssessmentBookingControls.Initialize('0','0');" style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-clock"></i>&nbsp;Add Booking</a>
                                                </li>

                                            </ul>
                                        </div>
                                    </nav>
                                    <div class="col-md-12">

                                        <legend class="group-border" style="margin-bottom: 0px !important"><i class="fas fa-user-edit"></i>&nbsp;Personal Details</legend>
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <span style="color: red;">*</span><span>First Name</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="First Name" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <span>Middle Name</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="Middle Name" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <span style="color: red;">*</span><span>Last Name</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="Last Name" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <span style="color: red;">*</span><span>Cellphone</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="Cellphone Number" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <span>Telephone</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="Telephone Number" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <span>Email</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="Email" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-8">
                                                <div class="form-group">
                                                    <span style="color: red;">*</span><span>Address</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="Address" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <span>Instructions</span>
                                                    <asp:TextBox runat="server" Height="30px" placeholder="Instructions" CssClass="form-control input-sm"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <legend class="group-border" style="margin-bottom: 0px !important"><i class="fas fa-user-clock"></i>&nbsp;Booking</legend>

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
                                        </table>



                                    </div>
                                </div>
                                <%--Client Tab End--%>

                                <%--Galary Tab Start--%>
                                <div class="tab-pane fade " id="tabAssessmentGallery" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                                        <div class="collapse navbar-collapse">
                                            <ul class="navbar-nav">
                                                <li class="nav-item">
                                                    <a style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="fas fa-sync-alt"></i>&nbsp;Refresh</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>

                                    <div class="row">
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FFFFFF.png?text=1" data-toggle="lightbox" data-title="sample 1 - white" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FFFFFF?text=1" class="img-fluid mb-2" alt="white sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/000000.png?text=2" data-toggle="lightbox" data-title="sample 2 - black" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/000000?text=2" class="img-fluid mb-2" alt="black sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FF0000/FFFFFF.png?text=3" data-toggle="lightbox" data-title="sample 3 - red" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FF0000/FFFFFF?text=3" class="img-fluid mb-2" alt="red sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FF0000/FFFFFF.png?text=4" data-toggle="lightbox" data-title="sample 4 - red" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FF0000/FFFFFF?text=4" class="img-fluid mb-2" alt="red sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/000000.png?text=5" data-toggle="lightbox" data-title="sample 5 - black" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/000000?text=5" class="img-fluid mb-2" alt="black sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FFFFFF.png?text=6" data-toggle="lightbox" data-title="sample 6 - white" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FFFFFF?text=6" class="img-fluid mb-2" alt="white sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FFFFFF.png?text=7" data-toggle="lightbox" data-title="sample 7 - white" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FFFFFF?text=7" class="img-fluid mb-2" alt="white sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/000000.png?text=8" data-toggle="lightbox" data-title="sample 8 - black" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/000000?text=8" class="img-fluid mb-2" alt="black sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FF0000/FFFFFF.png?text=9" data-toggle="lightbox" data-title="sample 9 - red" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FF0000/FFFFFF?text=9" class="img-fluid mb-2" alt="red sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FFFFFF.png?text=10" data-toggle="lightbox" data-title="sample 10 - white" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FFFFFF?text=10" class="img-fluid mb-2" alt="white sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/FFFFFF.png?text=11" data-toggle="lightbox" data-title="sample 11 - white" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/FFFFFF?text=11" class="img-fluid mb-2" alt="white sample">
                                            </a>
                                        </div>
                                        <div class="col-sm-2">
                                            <a href="https://via.placeholder.com/1200/000000.png?text=12" data-toggle="lightbox" data-title="sample 12 - black" data-gallery="gallery">
                                                <img src="https://via.placeholder.com/300/000000?text=12" class="img-fluid mb-2" alt="black sample">
                                            </a>
                                        </div>
                                    </div>

                                </div>
                                <%--Galary Tab End--%>
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



<Modal:Booking runat="server" ID="Booking" />
<Modal:Quote runat="server" ID="Quote" />

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



<script>

    let AssessmentControls1 = {
        Initialze: (Data) => {
            changeUrl('MODULE', 'ASSESSMENT');
            changeUrl('DATA', Router.Functions.Encode(Data));
            $('.content-wrapper').hide();
            $('#Assessment_btnInitialize').click();
            $('#modAssessment').fadeIn(5000);

        },
        Declare: () => {
            $('#<%Response.Write(cmbCategory.ClientID);%>').select2();
            $('#<%Response.Write(cmbSubcategory.ClientID);%>').select2();
            $('#<%Response.Write(cmbType.ClientID);%>').select2();
            $('#<%Response.Write(cmbProvince.ClientID);%>').select2();
            $('#<%Response.Write(cmbTown.ClientID);%>').select2();
            $('#<%Response.Write(cmbSuburb.ClientID);%>').select2();
            AssessmentControls.Tabs.Specifications.Editor.Initialize();
            AssessmentControls.Tabs.Gallary.Lightbox.Initialize();
        },
        Tabs: {
            Specifications: {
                Editor: {
                    Initialize: () => {
                        try {
                            CKEDITOR.config.width = '100%';
                            CKEDITOR.config.height = 370;
                            CKEDITOR.replace('Assessment$txtSpecifications');
                        } catch (ex) { console.log(ex); }
                    }
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
            }
        }
    };






</script>

