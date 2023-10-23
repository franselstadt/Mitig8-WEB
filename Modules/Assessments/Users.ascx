<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Users.ascx.cs" Inherits="Mitig8.Modules.Assessments.Users" %>
<div class="modal fade" id="mdlAssessmentUsers" style="top: 50px;">
    <div class="modal-dialog" style="min-width: 350px !important">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="updAssessmentUsersModal" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
             

                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-user-plus"></i>&nbsp;<asp:Literal runat="server" ID="lblUserTitle" Text="Assign User"></asp:Literal></h4>
                    </div>
                    <div class="modal-body">

                               <asp:HiddenField runat="server" ID="vAssessmentID" />
                    <asp:HiddenField runat="server" ID="vUserID" />
                    <asp:Button runat="server" ID="btnInitialize" OnClick="btnInitialize_Click" Style="display: none !important" />

                        <div id="UserSelection" class="form-group">
                            <span>Select User</span>
                            <asp:DropDownList Width="100%" Height="18px" ID="cmbUsers" AutoPostBack="true" OnTextChanged="cmbUsers_Changed" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>

                        <div id="UserFirstName" class="form-group">
                            <span>First Name</span>
                            <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" Width="100%" Height="28px" Enabled="false"></asp:TextBox>
                        </div>

                        <div id="UserLastName" class="form-group">
                            <span>Last Name</span>
                            <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" Width="100%" Height="28px" Enabled="false"></asp:TextBox>
                        </div>


                        <div id="UserEmail" class="form-group">
                            <span>Email</span>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" Width="100%" Height="28px" Enabled="false"></asp:TextBox>
                        </div>

                        <div id="UserCellphone" class="form-group">
                            <span>Cellphone</span>
                            <asp:TextBox runat="server" ID="txtCellphone" CssClass="form-control" Width="100%" Height="28px" Enabled="false"></asp:TextBox>
                        </div>

                        <div id="UserType" class="form-group">
                            <span>User Type / Occupation</span>
                            <asp:TextBox runat="server" ID="txtUserType" CssClass="form-control" Width="100%" Height="28px" Enabled="false"></asp:TextBox>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <asp:Button ID="btnClose" OnClick="btnClose_Click" runat="server" CssClass="btn btn-default pull-left" Text="Close" />
                        <asp:Button ID="btnSave" OnClick="btnAssign_Click" runat="server" CssClass="btn btn-primary pull-left" Text="Assign" />
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
    const AssessmentUserControl = {
        Initialize: (AssessmentID) => {
            $('#mdlAssessmentUsers').modal('show');
            $('#<% Response.Write(vAssessmentID.ClientID.ToString()); %>').val(AssessmentID);
            setTimeout(() => {
                $('#<%=btnInitialize.ClientID.ToString()%>').click();
            }, 250);
        },
        Declare: () => {
            $('#<%Response.Write(cmbUsers.ClientID.ToString());%>').select2();
        }
    };


</script>
