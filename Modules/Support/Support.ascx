<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Support.ascx.cs" Inherits="Mitig8.Modules.Support.Support" %>

<div class="modal fade" id="mdlSupport" style="top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updPanelSupport" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="far fa-life-ring"></i>&nbsp;Contact Support</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>Email</span>
                            <div><asp:TextBox runat="server" Width="100%" Height="24px" Text="support@mitig8.co.za" CssClass="form-control"></asp:TextBox></div>
                        </div>

                         <div class="form-group">
                            <span>Phone</span>
                            <div><asp:TextBox runat="server" Width="100%" Height="24px" Text="Michael - 079 860 2545" CssClass="form-control"></asp:TextBox></div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCloseSupport" OnClick="btnCloseSupport_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
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

    let SupportControls = {
        Initialze: () => {
            $('#mdlSupport').modal('show');
        },
        Declare: () => {

        }
    };

</script>
