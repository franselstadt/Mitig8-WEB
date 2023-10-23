<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Notify.ascx.cs" Inherits="Mitig8.Controls.Global.Notify" %>


<div class="modal fade" id="mdlNotify" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 350px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updPanelNotify" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
             

                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-paper-plane"></i>&nbsp;<asp:Literal runat="server" ID="lblUserTitle" Text="Notify"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                    <asp:HiddenField runat="server" ID="vUserID" />
                    <asp:Button OnClick="btnInitialize_Click" runat="server" ID="btnInitialize" Style="display: none !important" />

                        <div id="NotificationTitle" class="form-group">
                            <span>Title</span>
                            <asp:TextBox runat="server" id="txtTitle" Width="100%" Height="28px" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div id="NotificationMessage" class="form-group">
                            <span>Message</span>
                            <asp:TextBox runat="server" TextMode="MultiLine" id="txtMessage" Width="100%" Height="60px" CssClass="form-control"></asp:TextBox>
                        </div>

                       
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnClose" OnClick="btnClose_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                        <asp:Button ID="btnSend" OnClick="btnSend_Click" runat="server" CssClass="btn btn-primary pull-left" Text="Send" />
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
    const NotifyControl = {
        Initialize: (UserID) => {
            $('#mdlNotify').modal('show');
            $('#<% Response.Write(vUserID.ClientID.ToString()); %>').val(UserID);
            setTimeout(() => {
                $('#<%=btnInitialize.ClientID.ToString()%>').click();
            }, 250);
        },
        Declare: () => {
        }
    };


</script>
