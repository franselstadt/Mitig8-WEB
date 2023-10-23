<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Wallet.ascx.cs" Inherits="Mitig8.Controls.Global.Wallet" %>




<div id="asideWallet" class="aspSidebar">

    <div class="p-3">
        <h5><i class="far fa-bell"></i>&nbsp;Wallet</h5>
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
                    <tr>
                        <td>2020-01-27T18:48</td>
                        <td>Test Notification</td>
                        <td>
                            <button onclick="$('#mdlNotification').modal('show');return false;" class="btn btn-warning" title="Read"><i class="fas fa-glasses"></i>&nbsp;Read</button>
                        </td>
                    </tr>
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
                    <tr>
                        <td>2020-01-27T18:48</td>
                        <td>Test Notification</td>
                        <td>
                            <button onclick="$('#mdlNotification').modal('show');" class="btn btn-warning" title="Read"><i class="fas fa-glasses"></i>&nbsp;Read</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>








<script type="text/javascript">
    const btnWallet = $('#btnWallet');
    btnNotifications.click(() => {
        $('.aspSidebar').hide();
        setTimeout(() => {
            $('#asideWallet').show('fast');
        }, 250);
    });

</script>
