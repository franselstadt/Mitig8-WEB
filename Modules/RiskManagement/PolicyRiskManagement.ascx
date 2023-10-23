<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PolicyRiskManagement.ascx.cs" Inherits="Mitig8.Modules.RiskManagement.PolicyRiskManagement" %>



<div class="modal fade" id="mdlRiskManagementComment"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1000px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button ID="btnRiskManagementCommentHidden" runat="server" OnClick="btnRiskManagementCommentHidden_Click" style="display:none !important" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-comment"></i>&nbsp;Comment on <asp:Literal runat="server" ID="lblCommentTitle"></asp:Literal> Requirement</h4>
                    </div>
                    <div class="modal-body">
  <div class="form-group">
                <span>Comment</span>
                <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" Width="100%" Height="232px" CssClass="form-control"></asp:TextBox>
            </div>                    </div>
                    <div class="modal-footer">             
                     <asp:Button style="float:left !important" runat="server"  ID="btnSaveComment" OnClick="btnSaveComment_Click" CssClass="btn btn-success pull-right" Text="Save" />
                      <asp:Button style="float:left !important" runat="server" OnClick="btnFinishUpload_Click" ID="Button2"  CssClass="btn btn-warning pull-right" Text="Back" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
<!-- /.modal -->

<div class="modal fade" id="mdlAttachmentsUploadRiskManagement"  style="top: 50px;">
    <div class="modal-dialog" style="min-width: 1250px !important"">
        <div class="modal-content" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel14" UpdateMode="Always" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="vAssessmnetRequiremntID" />
                    <asp:HiddenField runat="server" ID="vAreaOfObservation" />
                    <asp:Button ID="btnUploadAttachmentsHidden" runat="server" OnClick="btnUploadAttachmentsHidden_Click" style="display:none !important" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-paperclip"></i>&nbsp;Upload Attachment(s) For <asp:Literal runat="server" ID="lblAreaOfObservation"></asp:Literal> </h4>
                    </div>
                    <div class="modal-body">
                        <asp:Literal runat="server" ID="litAttachmentsUploadFrame"></asp:Literal>
                    </div>
                    <div class="modal-footer">             
                      <asp:Button style="float:left !important" runat="server" OnClick="btnFinishUpload_Click" ID="btnFinishUpload"  CssClass="btn btn-warning pull-right" Text="Back" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
<!-- /.modal -->

<div class="modal fade" id="mdlPolicyRiskManagement" style="top: 50px; zoom: 96% !important; overflow:auto !important">
    <div class="modal-dialog" style="min-width: 1575px !important; margin-bottom: 200px">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updCompany" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none;" />
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <asp:Literal runat="server" ID="lblPolicyRiskManagementTile"></asp:Literal><i class="fas fa-microscope"></i>&nbsp;Assessment:
                            <asp:Literal runat="server" ID="lblAssessmentID"></asp:Literal>
                            <i class="fas fa-umbrella"></i>&nbsp;Policy:
                            <asp:Literal runat="server" ID="lblPolicyNumber"></asp:Literal>
                        </h4>
                        <span style="float: right !important; display: none">
                            <i class="fas fa-thermometer-half"></i>&nbsp;Meduim Risk
                        </span>
                    </div>
                    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0px !important">
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a target='_blank' href='<%= (Request.Url.Scheme + "://" + Request.Url.Authority +
    Request.ApplicationPath.TrimEnd('/') + "/documents/riskreport?dl=1&aid=" + vAssessmentID.Value.ToString()).ToString()  %>&set=0' style="color: #007bff !important; padding-left: 0.4rem !important; padding-right: 0.6rem !important" class="nav-link" href="#"><i class="far fa-file-pdf"></i>&nbsp;Download PDF</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="modal-body">

                        <div class="row">
                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);" class="col-4">
                                <span style="margin: 5px; background: #ffc107 !important"><i class="far fa-lightbulb"></i>&nbsp;Assessor's General Comments</span>
                                <div style="height: 200px !important; overflow-y: scroll; font-size: 13.5px">


                                    <asp:Literal runat="server" ID="lblAssessorsGeneralComments"></asp:Literal>

                                </div>
                            </div>
                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);" class="col-4">
                                <span style="margin: 5px; background: #ffc107 !important;"><i class="fas fa-superscript"></i>&nbsp;Maximum Possible Loss</span>
                                <div style="height: 180px !important" id="chartPolicyRiskMPL"></div>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" placeholder="Provide Maximum Possible Loss" ID="txtMPL" runat="server" Width="95%" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                    <asp:HiddenField runat="server" ID="vMPL" Value="5" />
                                </div>
                            </div>
                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);" class="col-4">
                                <span style="margin: 5px; background: #ffc107 !important"><i class="fas fa-square-root-alt"></i>&nbsp;Estimated Maximum Loss</span>
                                <div style="height: 180px !important" id="chartPolicyRiskEPL"></div>
                                <div class="form-group">
                                    <asp:TextBox Enabled="false" placeholder="Provide Estimated Maximum Loss" ID="txtEML" runat="server" Width="95%" CssClass="form-control" Style="display: inline-block;"></asp:TextBox>
                                    <asp:HiddenField runat="server" ID="vEML" Value="5" />
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row" style="margin-top: -15px;">
                            <div class="card card-warning card-tabs col-md-12">
                                <div class="card-header p-0 pt-1">
                                    <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="pill" href="#tabPolicyRequirements" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false"><i class="fas fa-clipboard-list"></i>&nbsp;Requirements and Recommendations</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="pill" href="#tabPolicyRiskClassificationSummary" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="true"><i class="fas fa-ruler-combined"></i>&nbsp;Risk Classification Summary</a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="pill" href="#tabPolicyFinancialRisk" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false"><i class="fas fa-balance-scale-right"></i>&nbsp;Financial Risk</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body" style="padding: 0px !important">
                                    <div class="tab-content" id="tabPolicyRiskManagement">


                                        <div class="tab-pane fade" id="tabPolicyRiskClassificationSummary" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2); margin: 10px;">
                                                <legend style="padding: 5px"><i class="fas fa-ruler-combined"></i>&nbsp; Risk Classification Summary
                                      
                                                </legend>


                                                <table class="table table-striped" style="width: 727px; /* margin-top: 66px; *//* position: absolute; *//* margin-left: 28px; */width: 100%;">
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
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Fire" Width="100%" Height="28px">

                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Fire" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-smog"></i>&nbsp;Smoke</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Smoke" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Smoke" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
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
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Explosion" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-bolt"></i>&nbsp;Lightning</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Lightning" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Lightning" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-cloud-showers-heavy"></i>&nbsp;Flood</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Flood" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Flood" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-cloud-moon-rain"></i>&nbsp;Storm</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Storm" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Storm" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>





                                                        <tr>
                                                            <td><i class="fas fa-plug"></i>&nbsp;Electric</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Electric" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Electric" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-shopping-basket"></i>&nbsp;Goods</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Goods" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Goods" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-tree"></i>&nbsp;Falling Trees </td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_FallingTrees" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_FallingTrees" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-hammer"></i>&nbsp;Malicious Damage</td>

                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_MaliciousDamage" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_MaliciousDamage" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-theater-masks"></i>&nbsp;Theft</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Theft" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Theft" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>


                                                        <tr>
                                                            <td><i class="fas fa-radiation-alt"></i>&nbsp;Inception hazard</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Dams" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Dams" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>





                                                        <tr>
                                                            <td><i class="fas fa-radiation"></i>&nbsp;Spread hazard (internal)</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Hazard" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Hazard" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>







                                                        <tr>
                                                            <td><i class="fas fa-dumpster-fire"></i>&nbsp;Fire load</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Fireload" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_FireLoad" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>










                                                        <tr>
                                                            <td><i class="far fa-building"></i>&nbsp;Planned structural or occupational changes	</td>
                                                            <td>
                                                                <asp:DropDownList runat="server" ID="cmbRCS_Structure" Width="100%" Height="28px">
                                                                    <asp:ListItem Enabled="true" Text="No Risk" Selected="True" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Low Risk" Selected="False" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" ID="txtRCS_Structure" Width="85%" Height="35px" TextMode="MultiLine"></asp:TextBox></td>
                                                        </tr>







                                                    </tbody>
                                                </table>





                                            </div>
                                        </div>

                                        <div class="tab-pane fade active show" id="tabPolicyRequirements" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                            <div style="box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2); margin: 10px;">
                                                <legend style="padding: 5px"><i class="fas fa-clipboard-list"></i>&nbsp; Requirements and Recommendations
                                                </legend>

                                                <asp:HiddenField ID="vRequirementDetail" runat="server" />
                                                <asp:HiddenField ID="vRequirementID" runat="server" />
                                                <asp:HiddenField ID="vStatusIDRequiremewnt" runat="server" />
                                                <asp:HiddenField ID="vRequirementDeadlineDate" runat="server" />
                                                <asp:HiddenField ID="vPriorityID" runat="server" />

                                                <asp:Button Style="display: none" runat="server" ID="btnUpdateRequirementDeadlineDate" OnClick="btnUpdateRequirementDeadlineDate_Click" />

                                                <asp:Literal runat="server" ID="litRequirementsAndRecommendations"></asp:Literal>

                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="tabPolicyFinancialRisk" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                          


                                            <asp:Literal runat="server" ID="litFinancialRisk"></asp:Literal>




                                        </div>

                                    </div>
                                </div>
                                <!-- /.card -->
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnClose" OnClick="btnClose_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnInitialize" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnFinishUpload" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->





<script type="text/javascript">
    const PolicyRiskManagementControls = {
        Initialize: (AssessmentID) => {
            $('#mdlPolicyRiskManagement').modal('show');
            $('#<% Response.Write(vAssessmentID.ClientID.ToString()); %>').val(AssessmentID);
            setTimeout(() => {
                $('#<%Response.Write(btnInitialize.ClientID.ToString()); %>').click();
                PolicyRiskManagementControls.Declare();
            }, 100);

            $('.datepicker').datepicker({
                autoclose: true,
                orientation: 'top',
                format: "yyyy/mm/dd"
            });
        },
        Declare: () => {
            $('.datepicker').datepicker({
                autoclose: true,
                orientation: 'bottom',
                format: "yyyy/mm/dd"
            });
            am4core.disposeAllCharts();
            setTimeout(() => {
                PolicyRiskManagementControls.chartPolicyRiskEML(parseInt($('#<%=vEML.ClientID.ToString()%>').val().split('.')[0]));
                PolicyRiskManagementControls.chartPolicyRiskMPL(parseInt($('#<%=vMPL.ClientID.ToString()%>').val().split('.')[0]));
            }, 50);
        },
        chartPolicyRiskMPL: (MPL) => {

            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            // create chart
            var chart = am4core.create("chartPolicyRiskMPL", am4charts.GaugeChart);
            chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

            chart.innerRadius = -25;

            var axis = chart.xAxes.push(new am4charts.ValueAxis());
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

            var hand = chart.hands.push(new am4charts.ClockHand());

            // using chart.setTimeout method as the timeout will be disposed together with a chart
            hand.showValue(MPL, 100, am4core.ease.cubicOut);
            $('#<%=txtMPL.ClientID.ToString()%>').val(MPL + '% MPL');

        },
        chartPolicyRiskEML: (EML) => {

            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            // create chart
            var chart = am4core.create("chartPolicyRiskEPL", am4charts.GaugeChart);
            chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect

            chart.innerRadius = -25;

            var axis = chart.xAxes.push(new am4charts.ValueAxis());
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

            var hand = chart.hands.push(new am4charts.ClockHand());

            // using chart.setTimeout method as the timeout will be disposed together with a chart
            hand.showValue(EML, 100, am4core.ease.cubicOut);

            $('#<%=txtEML.ClientID.ToString()%>').val(EML + '% EML');
        }
    };

    function pageLoad(sender, args) {
        try {
            PolicyRiskManagementControls.Declare();
        }
        catch (ex) {
            // console.log(ex);
        }
    }

    function updateRequirementStatusDate(RequirementID, StatusID) {
        $('#<%Response.Write(vRequirementDeadlineDate.ClientID.ToString()); %>').val($('#RiskManagement_PolicyRiskManagement_txtdate' + RequirementID).val());
        $('#<%Response.Write(vRequirementDetail.ClientID.ToString()); %>').val($('#RiskManagement_PolicyRiskManagement_txtdetail' + RequirementID).val());

        $('#<%Response.Write(vStatusIDRequiremewnt.ClientID.ToString()); %>').val(StatusID);
        $('#<%Response.Write(vRequirementID.ClientID.ToString()); %>').val(RequirementID);
        var x = document.getElementById("RiskManagement_PolicyRiskManagement_cmbPriority" + RequirementID).value;
        $('#<%Response.Write(vPriorityID.ClientID.ToString()); %>').val(x);
        setTimeout(function () {
            $('#<%Response.Write(btnUpdateRequirementDeadlineDate.ClientID.ToString()); %>').click();
        }, 500);
    }



    function priorityChange(ID) {


        var x = document.getElementById("RiskManagement_PolicyRiskManagement_cmbPriority" + ID).value;

        var r = 'NA';
        if (x == 1) {

            r = 'As soon as possible';
        }
        else if (x == 2) {
            r = 'Within 3 Months';

        } else if (x == 3) {
            r = 'Within 6 Months';

        }
        else if (x == 4) {
            r = 'Whenever possible';

        }
        else if (x == 4) {
            r = 'NA';

        }

        $('#RiskManagement_PolicyRiskManagement_DeadLine' + ID).val(r);
        $('#RiskManagement_PolicyRiskManagement_DeadLine' + ID).text(r);

        $('#<%Response.Write(vPriorityID.ClientID.ToString()); %>').val(x);

    };



    function uploadRiskDocument(ID, AreaOfObservation) {
        $('#<%=vAreaOfObservation.ClientID%>').val(AreaOfObservation);

        $('#<%=vAssessmnetRequiremntID.ClientID%>').val(ID);
        setTimeout(() => {
            $('#<%=btnUploadAttachmentsHidden.ClientID%>').click();
        }, 500);
    }



    function commentRiskRequirement(ID, AreaOfObservation) {
        $('#<%=vAreaOfObservation.ClientID%>').val(AreaOfObservation);

        $('#<%=vAssessmnetRequiremntID.ClientID%>').val(ID);
        setTimeout(() => {
            $('#<%=btnRiskManagementCommentHidden.ClientID%>').click();
        }, 500);
    }



</script>

