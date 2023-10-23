<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Mitig8.dashboard" EnableEventValidation="true" %>

<%@ Register Src="~/Controls/Dependencies/Footer.ascx" TagPrefix="Dependency" TagName="Footer" %>
<%@ Register Src="~/Controls/Dependencies/Header.ascx" TagPrefix="Dependency" TagName="Header" %>
<%@ Register Src="~/Controls/Layout/Navbar.ascx" TagPrefix="Layout" TagName="Navbar" %>
<%@ Register Src="~/Controls/Layout/Menu.ascx" TagPrefix="Layout" TagName="Menu" %>
<%@ Register Src="~/Modules/Assessments/Assessment_Building_Valuation.ascx" TagPrefix="Module" TagName="Assessment_Building_Valuation" %>
<%@ Register Src="~/Modules/Assessments/Assessment_Assets_Valuation.ascx" TagPrefix="Module" TagName="Assessment_Assets_Valuation" %>
<%@ Register Src="~/Modules/Assessments/Valuations.ascx" TagPrefix="Module" TagName="Valuations" %>

<%--Home Module--%>
<%@ Register Src="~/Modules/Home.ascx" TagPrefix="Module" TagName="Home" %>

<%--Dashboard Module--%>
<%@ Register Src="~/Modules/Dashboard.ascx" TagPrefix="Module" TagName="Dashboard" %>

<%--Assessments Module--%>
<%@ Register Src="~/Modules/Assessments/Assessment.ascx" TagPrefix="Module" TagName="Assessment" %>

<%@ Register Src="~/Modules/Assessments/Assessments.ascx" TagPrefix="Module" TagName="Assessments" %>
<%--Notifications--%>
<%@ Register Src="~/Controls/Global/Notifications.ascx" TagPrefix="Aside" TagName="Notifications" %>
<%@ Register Src="~/Controls/Global/Notify.ascx" TagPrefix="Modal" TagName="Notify" %>

<%--Companies Module--%>
<%@ Register Src="~/Modules/Companies/Companies.ascx" TagPrefix="Module" TagName="Companies" %>

<%--Libraries Module--%>
<%@ Register Src="~/Modules/Libraries/Survey.ascx" TagPrefix="Module" TagName="Survey" %>

<%--Profile Module--%>
<%@ Register Src="~/Modules/Profile/User.ascx" TagPrefix="Module" TagName="Profile" %>

<%--Users Module--%>
<%@ Register Src="~/Modules/Users/Users.ascx" TagPrefix="Module" TagName="Users" %>

<%--Wallet Modules--%>
<%@ Register Src="~/Modules/Wallet/PayUser.ascx" TagPrefix="Modal" TagName="PayUser" %>

<%--Risk Management--%>
<%@ Register Src="~/Modules/RiskManagement/RiskManagement.ascx" TagPrefix="Module" TagName="RiskManagement" %>

<%--Billing Module--%>
<%@ Register Src="~/Modules/Billing/Billing.ascx" TagPrefix="Module" TagName="Billing" %>
<%@ Register Src="~/Modules/Support/Support.ascx" TagPrefix="Module" TagName="Support" %>



<%--Reports Module--%>
<%@ Register Src="~/Modules/Reports/Report.ascx" TagPrefix="Module" TagName="Report" %>



<%@ Register Src="~/Modules/Assessments/Booking.ascx" TagPrefix="Modal" TagName="Booking" %>
<%@ Register Src="~/Modules/Assessments/Quote.ascx" TagPrefix="Modal" TagName="Quote" %>
<%@ Register Src="~/Modules/Assessments/Address.ascx" TagPrefix="Modal" TagName="Address" %>
<%@ Register Src="~/Modules/Assessments/Users.ascx" TagPrefix="Modal" TagName="Users" %>
<%@ Register Src="~/Modules/Assessments/RiskClassificationSummary.ascx" TagPrefix="Modal" TagName="RiskClassificationSummary" %>
<%@ Register Src="~/Modules/Assessments/RequirementAndRecommendations.ascx" TagPrefix="Modal" TagName="RequirementAndRecommendations" %>





<!DOCTYPE html>
<html>
<head id="hdrDashboard" runat="server">
    <Dependency:Header runat="server" ID="Header" />
    

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.23/af-2.3.5/b-1.6.5/b-colvis-1.6.5/b-html5-1.6.5/b-print-1.6.5/cr-1.5.3/r-2.2.7/rr-1.2.7/sb-1.0.1/sp-1.2.2/datatables.min.css"/>
 

</head>
<body class="hold-transition sidebar-mini sidebar-collapse" style="background:#f4f6f9 !important">
    <form id="frmDashboard" runat="server">
        <asp:ScriptManager ID="scmDashboard" runat="server" EnableViewState="true" ScriptMode="Auto" AjaxFrameworkMode="Enabled" EnablePageMethods="true"></asp:ScriptManager>
        <div class="wrapper">


            <Layout:Menu runat="server" ID="Menu" />
            <Layout:Navbar runat="server" ID="Navbar" />
             <%--Home Module--%>
            <Module:Home runat="server" id="Home" />
            <%--Dashboard Module--%>
            <Module:Dashboard runat="server" ID="Dashboard" />
            <Module:Valuations runat="server" ID="Valuations" />
            <%--Assessments Module--%>
            <Module:Assessments runat="server" ID="Assessments" />
            <Module:Assessment runat="server" ID="Assessment" />
            <Module:Assessment_Building_Valuation runat="server" id="Assessment_Building_Valuation" />
            <Module:Assessment_Assets_Valuation runat="server" ID="Assessment_Assets_Valuation" />

            <%--Libraries Module--%>
            <Module:Survey runat="server" ID="Survey" />

            <%--Companies Module--%>
            <Module:Companies runat="server" ID="Companies" />

            <%--Profile Module--%>
            <Module:Profile runat="server" ID="User" />

            <%--Users Module--%>
            <Module:Users runat="server" ID="Users" />

            <%--Wallet Module--%>
            <Modal:PayUser runat="server" ID="PayUser" />

       

             <%--Risk Management Module--%>
            <Module:RiskManagement runat="server" id="RiskManagement" />

             <%--Support Module--%>
            <Module:Support runat="server" id="Support" />

             <%--Report Module--%>
            <Module:Report runat="server" id="Report" />



            <Modal:Booking runat="server" ID="Booking" />
<Modal:Quote runat="server" ID="Quote" />
<Modal:Address runat="server" ID="Address" />
<Modal:Users runat="server" ID="Users1" />
<Modal:RiskClassificationSummary runat="server" ID="RiskClassificationSummary" />
<Modal:RequirementAndRecommendations runat="server" ID="RequirementAndRecommendations" />


                 <%--Billing Module--%>
            <Module:Billing runat="server" id="Billing" />

            <!-- Control Sidebar -->
            <aside style="width: 650px;" class="control-sidebar control-sidebar-light">
                <%--Notifications Aside--%>
                <Aside:Notifications runat="server" ID="Notifications" />
            </aside>
            <!-- /.control-sidebar -->
            <!-- Main Footer -->
            <footer class="main-footer" style="border: none !important;bottom: 0px;position: fixed;width: calc(100% - 4.9rem);">
                <div>
                    <img style="display: inline" class="img-responsive" height="28px" src="/images/pictogram-lock.svg" alt="pictogram-lock.svg">
                    <p style="display: inline">Your security is very important to us and we protect the information shared.</p>
                    <p style="float: right; display: inline">2022 Mitig8</p>
                </div>
            </footer>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED SCRIPTS -->
        <Modal:Notify runat="server" ID="Notify" />


    </form>
    <Dependency:Footer runat="server" ID="Footer" />
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.23/datatables.min.js"></script>
    <style>
        .dataTables_wrapper {
            padding:10px !important;
        }
    </style>
</body>
</html>
