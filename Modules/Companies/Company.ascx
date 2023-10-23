<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Company.ascx.cs" Inherits="Mitig8.Modules.Companies.Company" %>

<div class="modal fade" id="mdlCompany" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 975px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updCompany" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>

                    <asp:HiddenField runat="server" ID="vCompanyID" />
                    <asp:Button runat="server" ID="btnCompany" OnClick="btnCompany_Initialize" Style="display: none;" />

                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-user-tie"></i>&nbsp;<asp:Literal runat="server" ID="lblCompanyName" Text="Company Name"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                        <div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Company Name</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtName" Width="220px" Height="28px" placeholder="Company Name"></asp:TextBox>
                            </div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Contact Person</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtContactPerson" Width="220px" Height="28px" placeholder="Company Tell"></asp:TextBox>
                            </div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Contact Number</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtContactNumber" Width="220px" Height="28px" placeholder="Company Email"></asp:TextBox>
                            </div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Email</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtEmail" Width="220px" Height="28px" placeholder="Company Email"></asp:TextBox>
                            </div>
                        </div>


                        <div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Town</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtTown" Width="220px" Height="28px" placeholder="Company Town"></asp:TextBox>
                            </div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Postal Code</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtPostalCode" Width="220px" Height="28px" placeholder="Postal Code"></asp:TextBox>
                            </div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Address 1</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtAddress1" Width="220px" Height="28px" placeholder="Address Line 1"></asp:TextBox>
                            </div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Address 2</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtAddress2" Width="220px" Height="28px" placeholder="Address Line 2"></asp:TextBox>
                            </div>
                        </div>

                        <div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Company Type</span>
                                <asp:DropDownList CssClass="form-control" runat="server" ID="cmbCompanyType" Width="220px" Height="28px"></asp:DropDownList>
                            </div>
                            <div class="form-group" style="display: inline-block !important; padding: 5px !important">
                                <span>Registration Number</span>
                                <asp:TextBox CssClass="form-control" runat="server" ID="txtRegistrationNumber" Width="220px" Height="28px" placeholder="Registartion Number"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Literal runat="server" ID="litEmployees"></asp:Literal>

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
    const CompanyControls = {
        Initialize: (ID) => {
            $('#mdlCompany').modal('show');
            $('#<% Response.Write(vCompanyID.ClientID.ToString()); %>').val(ID);
            setTimeout(() => {
                $('#<%Response.Write(btnCompany.ClientID.ToString()); %>').click();
                CompanyControls.Declare();
            }, 50);
        },
        Declare: () => {
            setTimeout(() => {
                $('#<%Response.Write(cmbCompanyType.ClientID.ToString());%>').select2();
            }, 5);
        }
    };

    function pageLoad(sender, args) {
        try {
            CompanyControls.Declare();
        }
        catch (ex) {
            console.log(ex);
        }
    }
</script>

