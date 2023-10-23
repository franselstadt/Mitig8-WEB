<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Address.ascx.cs" Inherits="Mitig8.Modules.Assessments.Address" %>



<div class="modal fade" id="mdlAssessmentAddress" style="top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="udpAssessmentAddress" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>

                    <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:HiddenField runat="server" ID="vAddressID" />
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none !important" />

                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-map-marked-alt"></i>&nbsp;Add Risk Address</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <span>Province</span>
                            <asp:DropDownList ID="cmbProvince" OnTextChanged="cmbProvince_Change" runat="server" Width="100%" Height="30px" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <span>Town</span>
                            <asp:DropDownList ID="cmbTown" OnTextChanged="cmbTown_Change" runat="server" Width="100%" Height="30px" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <span>Suburb</span>
                            <asp:DropDownList ID="cmbSuburb" runat="server" Width="100%" Height="30px" CssClass="form-control"></asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <span>Street Address</span>
                            <div class="form-control" style="border: none; padding: 0px; margin-bottom: -10px;">
                                <asp:TextBox Style="display: inline-block" runat="server" ID="txtStreetNumber" CssClass="form-control" placeholder="Number" Width="20%" Height="30px"></asp:TextBox>
                                <asp:TextBox Style="display: inline-block" runat="server" ID="txtStreetName" CssClass="form-control" placeholder="Street Name" Width="79%" Height="30px"></asp:TextBox>
                            </div>
                        </div>


                        <div class="form-group">
                            <span>Building</span>
                            <div class="form-control" style="border: none; padding: 0px; margin-bottom: -10px;">
                                <asp:TextBox Style="display: inline-block" runat="server" ID="txtBuilingUnit" CssClass="form-control" placeholder="Unit" Width="20%" Height="30px"></asp:TextBox>
                                <asp:TextBox Style="display: inline-block" runat="server" ID="txtBuildingName" CssClass="form-control" placeholder="Building Name" Width="79%" Height="30px"></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button ID="btnDuplicateAssessmentAddress" OnClick="btnDuplicateAssessmentAddress_Click" runat="server" style="display:none !important" />

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCloseAssessmentAddress" OnClick="btnCloseAssessmentAddress_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                        <asp:Button ID="btnUpdateAssessmentAddress" OnClick="btnUpdateAssessmentAddress_Click" runat="server" CssClass="btn btn-primary pull-left" Text="Save" />
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

    let AddressControls = {
        Initialze: (AssessmentID, AddressID) => {

            $('#<%Response.Write(vAssessmentID.ClientID.ToString());%>').val(AssessmentID);
            $('#<%Response.Write(vAddressID.ClientID.ToString());%>').val(AddressID);

            setTimeout(() => {
                $('#<%Response.Write(btnInitialize.ClientID.ToString());%>').click();
            }, 150);

            setTimeout(() => {
                $('#mdlAssessmentAddress').modal('show');
            }, 450);

        },
        Declare: () => {
            $('#<%Response.Write(cmbProvince.ClientID);%>').select2();
            $('#<%Response.Write(cmbTown.ClientID);%>').select2();
            $('#<%Response.Write(cmbSuburb.ClientID);%>').select2();
        },
        Duplicate: () => {
             $('#mdlAssessmentAddress').modal('hide');
            Swal.fire({
                title: 'Do you want to add an additional risk address?',
                text: 'By selecting yes, you will be creating an new assessment request, linked to this policy.',
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Yes',
                denyButtonText: 'No',
            }).then((result) => {
          
                if (result) {
                    $('#<%=btnDuplicateAssessmentAddress.ClientID.ToString()%>').click();
                } else {
                    Swal.fire('Address not added', 'Alert!', 'info');
                }
            });
        }
    };

    

</script>
