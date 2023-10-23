<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Booking.ascx.cs" Inherits="Mitig8.Modules.Assessments.Booking" %>

<div class="modal fade" id="mdlAssessmentBooking" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 350px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updCompany" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>

                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:HiddenField runat="server" ID="vBookingID" />

                    <asp:Button runat="server" ID="btnBooking" OnClick="btnBooking_Initialize" Style="display: none;" />

                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-clock"></i>&nbsp;<asp:Literal runat="server" ID="lblBookingTitle" Text="New Booking"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>Booking Date & Time</span>
                            <asp:TextBox ID="txtBookingDate" runat="server" Width="100%" Height="28px" CssClass="form-control datetimepicker-input" data-mask></asp:TextBox>
                        </div>



                        <div class="form-group">
                            <span>Note</span>
                            <asp:TextBox runat="server" TextMode="MultiLine" Width="100%" Height="65px" CssClass="form-control"></asp:TextBox>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnClose" OnClick="btnClose_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary pull-left" Text="Save" />
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
    const AssessmentBookingControls = {
        Initialize: (AssessmentID, BookingID) => {
            $('#mdlAssessmentBooking').modal('show');
            $('#<% Response.Write(vBookingID.ClientID.ToString()); %>').val(BookingID);
            $('#<% Response.Write(vAssessmentID.ClientID.ToString()); %>').val(AssessmentID);
            setTimeout(() => {
                $('#<%Response.Write(btnBooking.ClientID.ToString()); %>').click();
                AssessmentBookingControls.Declare();
            }, 50);
        },
        Declare: () => {
            setTimeout(() => {

                $('#<%Response.Write(txtBookingDate.ClientID.ToString());%>').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

            }, 5);
        }
    };

    function pageLoad(sender, args) {
        try {
            AssessmentBookingControls.Declare();
        }
        catch (ex) {
            console.log(ex);
        }
    }
</script>

