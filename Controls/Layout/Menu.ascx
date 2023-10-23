<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="Mitig8.Controls.Layout.Menu" %>

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4" style="position: fixed !important">
    <!-- Brand Logo -->
    <a href="dashboard.aspx" class="brand-link" style="background: #231f20 !important; padding: .2125rem .5rem">
     <img src="http://web.mitig8.co.za/images/logo-icon-white.png" style="
    width: 48px;
    margin-left: 7px;
">
    </a>


    <asp:HiddenField runat="server" ID="vUserID" /> 
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <%--<div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Alexander Pierce</a>
            </div>
        </div>--%>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                <li>Me</li>

                <li class="nav-item">
                    <a id="btnProfile" style="cursor: pointer !important" class="nav-link">
                        <i class="nav-icon fas fa-user-tie"></i>
                        <p>
                            Profile
                        </p>
                    </a>

                </li>

                <li class="nav-item">
                    <a style="cursor: pointer !important" id="btnNotifications" class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="false">
                        <i class="nav-icon far fa-bell"></i>
                        <p>
                            Notifications
                        </p>
                    </a>

                </li>




                <li>Modules</li>

                <li id="btnHome" class="nav-item">
                    <a style="cursor: pointer !important" class="nav-link">
                        <i class="nav-icon fa fa-home"></i>
                        <p>
                            Home
                        </p>
                    </a>

                </li>

                <li style="display:none" id="btnDashboard" class="nav-item">
                    <a style="cursor: pointer !important" class="nav-link">
                        <i class="nav-icon fa fa-lightbulb"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>

                </li>


                <li  id="btnAssessments" class="nav-item">
                    <a style="cursor: pointer !important" class="nav-link">
                        <i class="nav-icon fas fa-file-signature"></i>
                        <p>
                            Assessments
                        </p>
                    </a>
                </li>

                                <li  id="btnValuation" class="nav-item">
                    <a style="cursor: pointer !important" class="nav-link">
                        <i class="nav-icon fas fa-clipboard-list"></i>
                        <p>
                          Valuations
                        </p>
                    </a>
                </li>

                <li runat="server" id="btnRiskManagement" class="nav-item">
                    <a style="cursor: pointer !important" class="nav-link" onclick="RiskManagementControls.Initialize();">
                        <i class="fas fa-exclamation-triangle"></i> &nbsp;
                        <p>
                            Risk Management
                        </p>
                    </a>
                </li>


                <li class="nav-item" id="btnReport"  runat="server">
                    <a  style="cursor: pointer !important" class="nav-link"  onclick="ReportControl.Open();">
                        <i class="fas fa-chart-pie"></i>
                        <p>
                            Reports
                        </p>
                    </a>
                </li>

                <li style="display:none" id="btnCompanies" class="nav-item">
                    <a style="cursor: pointer !important" class="nav-link">
                        <i class="nav-icon fas fa-university"></i>
                        <p>
                            Companies
                        </p>
                    </a>
                </li>


                <li style="display:none" id="btnUsers" class="nav-item">
                    <a style="cursor: pointer !important" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            Users
                        </p>
                    </a>
                </li>

                <li runat="server" id="btnBilling" class="nav-item">
                    <a onclick="BillingControls.Initialize();" class="nav-link">
                        <i class="nav-icon fas fa-balance-scale"></i>
                        <p>
                            Billing
                        </p>
                    </a>
                </li>

                <li style="display:none" class="nav-item">
                    <a href="dashboard.aspx" class="nav-link">
                        <i class="nav-icon fas fa-atlas"></i>
                        <p>
                            Libraries
                        </p>
                    </a>
                </li>


          


                <li style="display:none" class="nav-item">
                    <a href="dashboard.aspx" class="nav-link">
                        <i class="nav-icon fas fa-tools"></i>
                        <p>
                            Tools
                        </p>
                    </a>
                </li>


                <li>Other</li>

                <li class="nav-item">
                    <a href="http://academy.mitig8.co.za/" class="nav-link">
                        <i class="nav-icon fas fa-graduation-cap"></i>
                        <p>
                            Academy
                        </p>
                    </a>
                </li>











            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>


<script type="text/javascript">

    const getUrlVars = () => {
        var vars = [], hash;
        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
        for (var i = 0; i < hashes.length; i++) {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        return vars;
    };

    let objQueryString = {};

    //Get querystring value
    const getParameterByName = (name) => {
        name = name;
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    };

    const changeUrl = (key, value) => {
        //Get query string value
        key = key;
        value = value;
        var searchUrl = location.search;
        if (searchUrl.indexOf("?") == "-1") {
            var urlValue = '?' + key + '=' + value;
            history.pushState({ state: 1, rand: Math.random() }, '', urlValue);
        }
        else {
            //Check for key in query string, if not present
            if (searchUrl.indexOf(key) == "-1") {
                var urlValue = searchUrl + '&' + key + '=' + value;
            }
            else {	//If key present in query string
                oldValue = getParameterByName(key);
                if (searchUrl.indexOf("?" + key + "=") != "-1") {
                    urlValue = searchUrl.replace('?' + key + '=' + oldValue, '?' + key + '=' + value);
                }
                else {
                    urlValue = searchUrl.replace('&' + key + '=' + oldValue, '&' + key + '=' + value);
                }
            }
            history.pushState({ state: 1, rand: Math.random() }, '', urlValue);
            //history.pushState function is used to add history state.
            //It takes three parameters: a state object, a title (which is currently ignored), and (optionally) a URL.
        }

        objQueryString.key = value;
        sendAjaxReq(objQueryString);
    };


    //Used to display data in webpage from ajax
    const sendAjaxReq = (objQueryString) => {
        $.post('/', objQueryString, function (data) {
        })
    }


    //Function used to remove querystring
    const removeQString = (key) => {
        key = key;
        var urlValue = document.location.href;

        //Get query string value
        var searchUrl = location.search;

        if (key != "") {
            oldValue = getParameterByName(key);
            removeVal = key + "=" + oldValue;
            if (searchUrl.indexOf('?' + removeVal + '&') != "-1") {
                urlValue = urlValue.replace('?' + removeVal + '&', '?');
            }
            else if (searchUrl.indexOf('&' + removeVal + '&') != "-1") {
                urlValue = urlValue.replace('&' + removeVal + '&', '&');
            }
            else if (searchUrl.indexOf('?' + removeVal) != "-1") {
                urlValue = urlValue.replace('?' + removeVal, '');
            }
            else if (searchUrl.indexOf('&' + removeVal) != "-1") {
                urlValue = urlValue.replace('&' + removeVal, '');
            }
        }
        else {
            var searchUrl = location.search;
            urlValue = urlValue.replace(searchUrl, '');
        }
        history.pushState({ state: 1, rand: Math.random() }, '', urlValue);
    };

    let Router = {
        Run: () => {
            $('.content-wrapper').hide();
            let Route = getUrlVars();
            try {
                switch (Route["MODULE"]) {
                    //Dashboard
                    case 'DASHBOARD':
                        $('#modDashboard').fadeIn(1000);
                        break;

                    //User Profile
                    case 'PROFILE':
                        UserProfileControls.Initialize(Router.Functions.Decode(Route["DATA"]));
                        break;

                    //Assessments
                    case 'ASSESSMENTS':
                        AssessmentsControls.Initialze();
                        break;

                    //Assessment
                    case 'ASSESSMENT':
                        AssessmentControls.Initialze(Router.Functions.Decode(Route["DATA"]));
                        break;

                    case 'VALUATIONS':
                        ValuationsControls.Initialze();
                        break;

                    case 'ASSESSMENT_BUILDING_VALUATION':
                        AssessmentBuildingValuationControls.Initialze(Router.Functions.Decode(Route["DATA"]));
                        break;


                    case 'ASSESSMENT_ASSETS_VALUATION':
                        AssessmentAssetsValuationControls.Initialze(Router.Functions.Decode(Route["DATA"]));
                        break;

                    //Companies
                    case 'COMPANIES':
                        CompaniesControls.Initialze();
                        break;

                    //Users
                    case 'USERS':
                        UsersControls.Initialze();
                        break;

                    //Users
                    case 'HOME':
                        HomeControls.Initialze();
                        break;

                    //Risk Management
                    case 'RISKMANAGEMENT':
                        RiskManagementControls.Initialize();
                        break;


                    case 'BILLING':
                        BillingControls.Initialize();
                        break;


                    case 'REPORT':
                        ReportControl.Open();
                        break;

                    default:
                       HomeControls.Initialize();
                }
            }
            catch (ex) {
                HomeControls.Initialize();
            }
        },
        Initialize: () => {
            window.onpopstate = (e) => {
                if (e.state != undefined) {
                    Router.Run();
                }
            };
        },
        Functions: {
            Encode: (Data) => {
                return btoa(Data);
            },
            Decode: (Data) => {
                return atob(Data);
            },
            HasDataProperties: (Keys) => {
                let Valid = true;
                try {
                    let Data = Router.Functions.Decode(Route["Data"]);
                    for (let x = 0; x < Keys.length; x++) {
                        try {
                            if (!Data.hasOwnProperty(Keys[x])) {
                                Valid = false;
                            }
                        } catch (ex) {
                            Valid = false;
                        }
                    }
                }
                catch (ex) {
                    Valid = false;
                }
                return Valid;
            }
        }
    };

    $(document).ready(() => {
        Router.Initialize();
        Router.Run();
        $('#btnDashboard').click(() => {
            changeUrl('Module', 'Dashboard');
            $('.content-wrapper').hide();
            $('#modDashboard').fadeIn(1000);
        });

        $('#btnAssessments').click(() => {
            AssessmentsControls.Initialze();
        });

        $('#btnCompanies').click(() => {
            CompaniesControls.Initialze();
        });

        $('#btnUsers').click(() => {
            UsersControls.Initialze();
        });

        $('#btnHome').click(() => {
            HomeControls.Initialize();
        });

        $('#btnReport').click(() => {
            ReportControl.Initialize();
        });

        $('#btnProfile').click(() => {
            window.location.href = '/dashboard?MODULE=PROFILE&DATA=' + btoa($('#<%=vUserID.ClientID.ToString()%>').val());
        });


        $('#btnValuation').click(() => {
            ValuationsControls.Initialze();
        });

    });



</script>
