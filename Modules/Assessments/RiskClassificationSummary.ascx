<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RiskClassificationSummary.ascx.cs" Inherits="Mitig8.Modules.Assessments.RiskClassificationSummary" %>

<div class="modal fade" id="mdlRiskClassificationSummary" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 350px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updRiskClassificationSummary" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="vRiskClassificationSummaryID" />
                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:Button runat="server" ID="btnRiskClassificationSummary" OnClick="btnRiskClassificationSummary_Initialize" Style="display: none;" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-file-invoice"></i>&nbsp;<asp:Literal runat="server" ID="lblRiskClassificationSummary" Text="Add Summary"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <span>Risk Factor</span>
                            <asp:DropDownList runat="server" ID="cmbRiskFactor" Width="100%" Height="28px" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span>Risk Rating</span>
                            <asp:DropDownList runat="server" ID="cmbRiskRating" Width="100%" Height="28px" CssClass="form-control">
                                 <asp:ListItem Enabled="true" Text="Please select option..." Selected="True" Value="0"></asp:ListItem>
                                <asp:ListItem Enabled="true" Text="High Risk" Selected="False" Value="1"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Severe Risk" Selected="False" Value="2"></asp:ListItem>
                                 <asp:ListItem Enabled="true" Text="Moderate Risk" Selected="False" Value="3"></asp:ListItem>

                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <span>Reason</span>
                            <asp:TextBox runat="server" ID="txtReason" TextMode="MultiLine" Width="100%" Height="65px" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnClose" OnClick="btnClose_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
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
    const RiskClassificationSummaryControls = {
        Open: (AssessmentID, RiskClassificationSummaryID) => {
            $('#<%=vRiskClassificationSummaryID.ClientID.ToString()%>').val(RiskClassificationSummaryID);
            $('#<%=vAssessmentID.ClientID.ToString()%>').val(AssessmentID);
            $('#mdlRiskClassificationSummary').modal('show');
            setTimeout(() => {
                $('#<%=btnRiskClassificationSummary.ClientID.ToString()%>').click();
            }, 250);
        },
         Declare: () => {
            $('#<%Response.Write(cmbRiskFactor.ClientID);%>').select2();
            $('#<%Response.Write(cmbRiskRating.ClientID);%>').select2();
        }
    };
</script>
