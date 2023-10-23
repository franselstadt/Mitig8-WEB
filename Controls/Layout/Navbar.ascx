<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="Mitig8.Controls.Layout.Navbar" %>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="position: fixed; z-index: 8000000 !important; width: 100%;">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <%--        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>--%>




        <li runat="server" id="New" class="nav-item dropdown">
            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-plus-circle"></i>New
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a runat="server" id="NewAssessment" class="dropdown-item" href="/dashboard?MODULE=ASSESSMENT&DATA=MA==#"><i class="fas fa-microscope"></i>&nbsp;Risk Assessment</a>
                <a runat="server" id="NewValuationMovableAssets" class="dropdown-item" href="/dashboard?MODULE=ASSESSMENT_ASSETS_VALUATION&DATA=MA==#"><i class="fas fa-bicycle"></i>&nbsp;Moveable Assets Valuation</a>
                <a runat="server" id="NewBuidlingsValuation" class="dropdown-item" href="/dashboard?MODULE=ASSESSMENT_BUILDING_VALUATION&DATA=MA==#"><i class="far fa-building"></i>&nbsp;Buildings Valuation</a>

              
            </div>
        </li>



        <li runat="server" id="Search" class="nav-item dropdown">
            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-search"></i>Search
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#"><i class="fab fa-fly"></i>&nbsp;On Assessment Number</a>
                <a class="dropdown-item" href="#"><i class="fab fa-fly"></i>&nbsp;On Policy Number</a>
                <a class="dropdown-item" href="#"><i class="fab fa-fly"></i>&nbsp;On Insured Name</a>
                <a class="dropdown-item" href="#"><i class="fab fa-fly"></i>&nbsp;On Broker Name</a>
            </div>
        </li>

        <li runat="server" id="Support" class="nav-item">
            <a href="https://support.mitig8.co.za/index.php" target="_blank" class="nav-link"><i class="nav-icon fas fa-headset"></i>Support</a>
        </li>

        <li class="nav-item">
            <a href="http://secure.mitig8.co.za/login" class="nav-link"><i class="fas fa-power-off"></i>Sign out</a>
        </li>

    </ul>



    <!-- Right navbar links -->
    <ul style="display: none !important" class="navbar-nav ml-auto">
        <!-- Messages Dropdown Menu -->
        <li class="nav-item dropdown user-menu">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                <img src="/images/nopic.jpg" class="user-image img-circle elevation-2" alt="User Image">
                <span class="d-none d-md-inline"><%Response.Write(Cloud.GetCookie("FirstName") + " " + Cloud.GetCookie("LastName"));%></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <!-- User image -->
                <li class="user-header bg-primary">
                    <img src="/images/nopic.jpg" class="img-circle elevation-2" alt="User Image">

                    <p>
                        <%Response.Write(Cloud.GetCookie("FirstName") + " " + Cloud.GetCookie("LastName"));%>
                    </p>
                </li>
                <!-- Menu Body -->
                <li class="user-body">
                    <div class="row">
                        <div class="col-4 text-center">
                            <a href="#">Followers</a>
                        </div>
                        <div class="col-4 text-center">
                            <a href="#">Sales</a>
                        </div>
                        <div class="col-4 text-center">
                            <a href="#">Friends</a>
                        </div>
                    </div>
                    <!-- /.row -->
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                    <a href="#" class="btn btn-default btn-flat float-right">Sign out</a>
                </li>
            </ul>
        </li>
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="far fa-bell"></i>
                <span class="badge badge-warning navbar-badge">15</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-header">15 Notifications</span>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-envelope mr-2"></i>4 new messages
           
                            <span class="float-right text-muted text-sm">3 mins</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-users mr-2"></i>8 friend requests
           
                            <span class="float-right text-muted text-sm">12 hours</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fas fa-file mr-2"></i>3 new reports
           
                            <span class="float-right text-muted text-sm">2 days</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
                class="fas fa-th-large"></i></a>
        </li>
    </ul>
</nav>
<!-- /.navbar -->
