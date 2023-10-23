<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="authenticate.aspx.cs" Inherits="Mitig8.authenticate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authenticate</title>
    <script
    src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
    crossorigin="anonymous"></script>

</head>
<body>
    <form id="frmAuthenticate" runat="server">
        <asp:ScriptManager ID="scmAuthenticate" runat="server"></asp:ScriptManager>
        <video class="background" autoplay muted loop src="videos/city-traffic.mp4" id="bgVideo" preload="true"></video>
        <div class="background" style="width: 100%; height: 100%; background-color: rgba(0,0,0,0.5) !important;"></div>

        <img src="images/logo-full-white.png"  height="60" style="fill: white !important; position: absolute; transform: translateX(-50%); left: 50%; top: 20%;"  />



        <img src="https://i.gifer.com/origin/34/34338d26023e5515f6cc8969aa027bca_w200.gif" style="position: absolute; width: 28px; fill: white !important; position: absolute; transform: translateX(-50%); left: 50%; top: 35%;">

        <asp:UpdatePanel ID="updPanelAuthenticate" runat="server">
            <ContentTemplate>
                <asp:TextBox ID="txtConsole" runat="server" TextMode="MultiLine" Width="700px" Height="150px" Style="display:none;height: 150px; width: 700px; background: black; color: white; position: fixed; fill: white !important; position: absolute; transform: translateX(-50%); left: 50%; bottom: 2px; resize: none;"></asp:TextBox>
                <asp:Button runat="server" OnClick="btnAuthenticate_Click" ID="btnAuthenticate" style="display:none !important" />
                
                <asp:Button runat="server" OnClick="btnAuthenticateSuccess_Click" ID="btnAuthenticateSuccess" style="display:none !important" />
                <asp:Button runat="server" OnClick="btnAuthenticateError_Click" ID="btnAuthenticateError" style="display:none !important" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

<style type="text/css">
    .background {
        position: fixed;
        right: 0;
        bottom: 0;
        min-width: 100%;
        min-height: 100%;
    }
</style>

<script type="text/javascript">
    $(document).ready(function () {
        setTimeout(function () { $('#btnAuthenticate').click();}, 500);
    });
</script>
