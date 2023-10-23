<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Notifications.ascx.cs" Inherits="Mitig8.Controls.Global.Notifications" %>



<div id="asideNotifications" class="aspSidebar">

    <div class="p-3">
        <h5><i class="far fa-bell"></i>&nbsp;Notifications</h5>
    </div>

    <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" style="color: black!important" id="custom-tabs-three-home-tab" data-toggle="pill" href="#tabNotificationNew" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true">New</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="color: black!important" id="custom-tabs-three-profile-tab" data-toggle="pill" href="#tabNotificationRead" role="tab" aria-controls="custom-tabs-three-profile" aria-selected="false">Read</a>
        </li>
    </ul>

    <div class="tab-content" id="custom-tabs-three-tabContent">
        <div class="tab-pane fade show active" id="tabNotificationNew" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Title</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                 <%--   <tr>
                        <td>2020-01-27T18:48</td>
                        <td>Test Notification</td>
                        <td>
                            <button onclick="$('#mdlNotification').modal('show');return false;" class="btn btn-warning" title="Read"><i class="fas fa-glasses"></i>&nbsp;Read</button>
                        </td>
                    </tr>--%>
                </tbody>
            </table>

        </div>
        <div class="tab-pane fade" id="tabNotificationRead" role="tabpanel" aria-labelledby="custom-tabs-three-profile-tab">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Title</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                   <%-- <tr>
                        <td>2020-01-27T18:48</td>
                        <td>Test Notification</td>
                        <td>
                            <button onclick="$('#mdlNotification').modal('show');" class="btn btn-warning" title="Read"><i class="fas fa-glasses"></i>&nbsp;Read</button>
                        </td>
                    </tr>--%>
                </tbody>
            </table>
        </div>
    </div>
</div>





<div class="modal fade" id="mdlNotification" style="top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <asp:UpdatePanel runat="server" ID="udpNotifications" UpdateMode="Conditional" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title"><i class="fas fa-bell"></i>&nbsp;Notification Title</h4>
                    </div>
                    <div class="modal-body">

                       <h6>Notification Text</h6>

                    </div>
                    <div class="modal-footer">

                        <asp:Button  runat="server" CssClass="btn btn-default pull-left" Text="Close" />
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
    const btnNotifications = $('#btnNotifications');
    btnNotifications.click(() => {
        $('.aspSidebar').hide();
        setTimeout(() => {
            $('#asideNotifications').show('fast');
        }, 250);
    });

</script>
