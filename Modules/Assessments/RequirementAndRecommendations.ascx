<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequirementAndRecommendations.ascx.cs" Inherits="Mitig8.Modules.Assessments.RequirementAndRecommendations" %>



<div class="modal fade" id="mdlRequirementsAndRecommendations" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 550px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updRequirementsAndRecommendations" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="vRequirementsAndRecommendationsID" />
                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:Button runat="server" ID="btnRequirementsAndRecommendations" OnClick="btnRequirementsAndRecommendations_Initialize" Style="display: none;" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-file-invoice"></i>&nbsp;<asp:Literal runat="server" ID="lblRbtnRequirementsAndRecommendations" Text="Add  Requirements and Recommendations"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                          <div class="form-group">
                            <span>Type</span>
                            <asp:DropDownList runat="server" ID="cmbRiskType" Width="100%" Height="35px" CssClass="form-control"></asp:DropDownList>
                        </div> 

                        <div class="form-group">
                            <span>Area of Observation</span>
                            <asp:TextBox runat="server" Width="100%" Height="35px" CssClass="form-control" ID="txtAreaOfObservation"></asp:TextBox>
                        </div>


                        <div class="form-group">
                            <span>Priority</span>
                            <asp:DropDownList runat="server" ID="cmbRiskRating" Width="100%" Height="35px" CssClass="form-control">
                                <asp:ListItem Enabled="true" Text="Please select option..." Selected="True" Value="0"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="High Priority" Selected="False" Value="1"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="Severe Priority" Selected="False" Value="2"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="Moderate Priority" Selected="False" Value="3"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="Low Priority" Selected="False" Value="4"></asp:ListItem>

                            </asp:DropDownList>
                        </div>


                           <div class="form-group">
                            <span>Deadline</span>
                            <asp:DropDownList runat="server" ID="cmbDeadline" Width="100%" Height="35px" CssClass="form-control">
                                <asp:ListItem Enabled="true" Text="Please select option..." Selected="True" Value="0"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="1 Week" Selected="False" Value="1"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="1 Month" Selected="False" Value="2"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="3 Months" Selected="False" Value="3"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="6 Months" Selected="False" Value="4"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="1 Year" Selected="False" Value="5"></asp:ListItem>

                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span>Detail of Requirement/Recommendation</span>
                            <asp:TextBox runat="server" ID="txtDetail" TextMode="MultiLine" Width="100%" Height="105px" CssClass="form-control"></asp:TextBox>
                        </div>


                    </div>
                    <div class="modal-footer">

                        <asp:Button ID="btnClose" OnClick="btnClose_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                                              <asp:Button ID="btnDelete" OnClick="btnDelete_Click" runat="server" CssClass="btn btn-warning pull-left" Text="Delete" />

                        <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CssClass="btn btn-primary pull-left" Text="Save" />


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



    const RequirementsAndRecommendations = {
        Open: (AssessmentID, RequirementsAndRecommendationsID) => {
            $('#<%=vRequirementsAndRecommendationsID.ClientID.ToString()%>').val(RequirementsAndRecommendationsID);
            $('#<%=vAssessmentID.ClientID.ToString()%>').val(AssessmentID);
            $('#mdlRequirementsAndRecommendations').modal('show');
            setTimeout(function () {                         $('#<%=btnRequirementsAndRecommendations.ClientID.ToString()%>').click();
}, 50);

        },
        Declare: () => {
            $('#<%Response.Write(cmbRiskRating.ClientID);%>').select2();
                         $('#<%Response.Write(cmbDeadline.ClientID);%>').select2();

        }
    };


</script>
