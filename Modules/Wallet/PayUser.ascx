<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PayUser.ascx.cs" Inherits="Mitig8.Modules.Wallet.PayUser" %>

<%--Pay User Modal Start--%>
<div class="modal fade" id="mdlPayUser" style="top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-hand-holding-usd"></i>&nbsp;Pay Frans</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>From my account</span>
                            <asp:DropDownList runat="server" ID="cmbFromAccount" Width="100%" Height="28px" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <span>To their account</span>
                            <asp:DropDownList runat="server" ID="cmbToAccount" Width="100%" Height="28px" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <span>My Reference</span>
                            <asp:TextBox runat="server" ID="txtFromReference" placeholder="My transaction reference" Width="100%" Height="28px" CssClass="form-control"></asp:TextBox> 
                        </div>

                        <div class="form-group">
                            <span>Their Reference</span>
                            <asp:TextBox runat="server" ID="txtToReference" placeholder="Their payment reference" Width="100%" Height="28px" CssClass="form-control"></asp:TextBox> 
                        </div>

                        <div class="form-group">
                            <span>Amount (ZAR)</span>
                            <asp:TextBox runat="server" ID="txtAmount" placeholder="0.00" Width="100%" Height="28px" CssClass="form-control"></asp:TextBox> 
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnClose" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                        <asp:Button ID="btnPay" runat="server" CssClass="btn btn-primary pull-left" Text="Pay" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
<%--Pay User Modal End--%>

<script type="text/javascript">

    let PayUserControl = {
        Initialize: () => {
            $('#mdlPayUser').modal('show');
        },
        Declare: () => {

        }
    };

</script>
