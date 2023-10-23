<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.ascx.cs" Inherits="Mitig8.Modules.Dashboard" %>

<!-- Content Wrapper. Contains page content -->
<div id="modDashboard" class="content-wrapper">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">
                                <% Response.Write("Hi " + Cloud.GetCookie("FirstName").ToString() + " " + Cloud.GetCookie("LastName").ToString() + ", welcome to your dashboard."); %>
                            </h1>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">

                 <div class="row">
                        <div class="card" style="
    margin: 15px;
    width: 98%;
    margin-top: -8px;
">
                            <div class="card-body" style="
">
                            
                                
                         

                    

                       
                        <div class="container-fluid">
                            <div id="carouselExample" class="carousel slide" data-ride="carousel" data-interval="9000000000">

                                <div class="carousel-inner row w-100 mx-auto" role="listbox">
                                    <div class="carousel-item 2  active">
                                        <div class="panel panel-default">


                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>

                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>


                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>


                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>



                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>


                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>



                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>


                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>


                                            <div class="slider-item" style="font-size: 32px; text-align: center; margin-top: 5px;">
                                                <i class="far fa-check-square"></i>
                                                <p style="font-size: 13px;">
                                                    All
                                                </p>
                                            </div>




                                        </div>
                                    </div>





                                </div>
                                <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next text-faded" href="#carouselExample" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                          

                                   </div>
                            </div>
                        </div>
                    
                
                
                </div>

                    <div class="row">

                        <div class="col-md-6 col-sm-6 col-12">
                        </div>


                        <div class="col-md-6 col-sm-6 col-12">
                        </div>




                        <div style="display: none !important" class="col-md-2 col-sm-6 col-12">
                        </div>

                    </div>





                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<!-- /.content-wrapper -->




<script type="text/javascript">



    $('#carouselExample').carousel({
        interval: 2000000
    });


    $(document).ready(function () {
        /* show lightbox when clicking a thumbnail */
        $('a.thumb').click(function (event) {
            event.preventDefault();
            var content = $('.modal-body');
            content.empty();
            var title = $(this).attr("title");
            $('.modal-title').html(title);
            content.html($(this).html());
            $(".modal-profile").modal({ show: true });
        });

    });
</script>

<style type="text/css">
    @media (min-width: 768px) {

        /* show 3 items */
        .carousel-inner .active,
        .carousel-inner .active + .carousel-item,
        .carousel-inner .active + .carousel-item + .carousel-item,
        .carousel-inner .active + .carousel-item + .carousel-item + .carousel-item {
            display: block;
        }

        .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left),
        .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item,
        .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item,
        .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item + .carousel-item {
            transition: none;
        }

        .carousel-inner .carousel-item-next,
        .carousel-inner .carousel-item-prev {
            position: relative;
            transform: translate3d(0, 0, 0);
        }

        .carousel-inner .active.carousel-item + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
            position: absolute;
            top: 0;
            right: -25%;
            z-index: -1;
            display: block;
            visibility: visible;
        }

        /* left or forward direction */
        .active.carousel-item-left + .carousel-item-next.carousel-item-left,
        .carousel-item-next.carousel-item-left + .carousel-item,
        .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item,
        .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item,
        .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
            position: relative;
            transform: translate3d(-100%, 0, 0);
            visibility: visible;
        }

        /* farthest right hidden item must be abso position for animations */
        .carousel-inner .carousel-item-prev.carousel-item-right {
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
            display: block;
            visibility: visible;
        }

        /* right or prev direction */
        .active.carousel-item-right + .carousel-item-prev.carousel-item-right,
        .carousel-item-prev.carousel-item-right + .carousel-item,
        .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item,
        .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item,
        .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
            position: relative;
            transform: translate3d(100%, 0, 0);
            visibility: visible;
            display: block;
            visibility: visible;
        }
    }

    /* Bootstrap Lightbox using Modal */

    #profile-grid {
        overflow: auto;
        white-space: normal;
    }

        #profile-grid .profile {
            padding-bottom: 40px;
        }

        #profile-grid .panel {
            padding: 0
        }

        #profile-grid .panel-body {
            padding: 15px
        }

        #profile-grid .profile-name {
            font-weight: bold;
        }

        #profile-grid .thumbnail {
            margin-bottom: 6px;
        }

        #profile-grid .panel-thumbnail {
            overflow: hidden;
        }

        #profile-grid .img-rounded {
            border-radius: 4px 4px 0 0;
        }

    .slider-item {
        margin: 25px;
        height: 75px;
        width: 75px;
        border-radius: 15px;
        background: #fc0;
        display: inline-block;
    }
</style>
