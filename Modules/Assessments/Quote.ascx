<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quote.ascx.cs" Inherits="Mitig8.Modules.Assessments.Quote" %>


<div class="modal fade" id="mdlAssessmentQuote" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 350px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updCompany" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="vQuoteID" />
                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:Button runat="server" ID="btnQuote" OnClick="btnQuote_Initialize" Style="display: none;" />
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-file-invoice"></i>&nbsp;<asp:Literal runat="server" ID="lblQuoteTitle" Text="New Quote"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <span>Quote (Inc. Vat)</span>
                            <asp:TextBox ID="txtQuoteValue" runat="server" placeholder="0.00" Width="100%" Height="28px" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <span>Proposed Assessment Date</span>
                            <asp:TextBox ID="txtQuoteServiceDate" runat="server" Width="100%" Height="28px" CssClass="form-control" placeholder="yyyy/mm/dd"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <span>Note</span>
                            <asp:TextBox runat="server" ID="txtNote" TextMode="MultiLine" Width="100%" Height="65px" CssClass="form-control"></asp:TextBox>
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
    const AssessmentQuoteControls = {
        Initialize: (AssessmentID, QuoteID) => {
            $('#mdlAssessmentQuote').modal('show');
            $('#<% Response.Write(vQuoteID.ClientID.ToString()); %>').val(QuoteID);
            $('#<% Response.Write(vAssessmentID.ClientID.ToString()); %>').val(AssessmentID);
            setTimeout(() => {
                $('#<%Response.Write(btnQuote.ClientID.ToString()); %>').click();
                AssessmentQuoteControls.Declare();
            }, 50);
        },
        Declare: () => {
            setTimeout(() => {

                $('#<%Response.Write(txtQuoteServiceDate.ClientID.ToString());%>').datepicker({
                    autoclose: true,
                    orientation: 'bottom',
                    format: "yyyy/mm/dd"
                });

          //      $('#<%Response.Write(txtQuoteServiceDate.ClientID.ToString());%>').inputmask('dd/mm/yyyy');
           //     $('#<%Response.Write(txtQuoteValue.ClientID.ToString());%>').inputmask('0.00');

            }, 5);
        }
    };

    function pageLoad(sender, args) {
        try {
            AssessmentQuoteControls.Declare();
        }
        catch (ex) {
            console.log(ex);
        }
    }
</script>
