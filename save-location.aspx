<%@ Page Language="C#" AutoEventWireup="true" CodeFile="save-location.aspx.cs" Inherits="save_location" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konum Kaydet</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/custom.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/main.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&signed_in=true"></script>
    <script src="Scripts/save-location.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <!--Main Page-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="simple-map.aspx"><img src="images/waiSmallLogo.png" id="main-logo" width="100"/></a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Hakkında <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">İletişim</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-left">
                    <li class=""><a href="#">Welcome to <strong>"Where am I"</strong> Application <span class="sr-only">(current)</span></a></li>
                    
                </ul>
                </div>
            </div>
        </nav>

        <section>
            <!--Kullanıcı Bilgileri-->
            <article id="user-box">
                <header id="user-header">
                    Kullanıcı Bilgileri
                </header>

                <div id="user-img">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                </div>
                <div id="user-data">
                    <div class="list-group">                    
                    
                    <div class="list-group-item">
                        <span class="fa fa-user" aria-hidden="true"></span>
                        Ad Soyad : <strong><asp:Label ID="lbladsoyad" runat="server" Text="from DB"></asp:Label></strong>
                    </div>
                    <div class="list-group-item">
                        <span class="fa fa-at" aria-hidden="true"></span>
                        Kullanıcı Adı : <strong><asp:Label ID="lblkadi" runat="server" Text="from DB"></asp:Label></strong>
                    </div>
                </div>
                    

                </div>
            </article>

            <div id="save-location-map"></div>
            <input id="pac-input" class="controls" type="text" placeholder="Paylasmak istediginiz konumu girin."/>

            <div style="display:none;">
                <input id="Button1" type="button" value="button" onclick="getdata();"/><br />
                <input id="Button2" type="button" value="twit" onclick="sendTweet();"/>

                <input type="text" value=""  maxlength="100" class="form-control" name="lng" id="lat2"  />
                <input type="text" value=""  maxlength="100" class="form-control" name="lng" id="lang2"  />
                <input type="text" value=""  maxlength="100" class="form-control" name="lng" id="place-name"  />
                <input type="text" value=""  maxlength="100" class="form-control" name="lng" id="place-adress"  />
            </div>
            
            <!--Menü-->
            <article id="menu">
                <header id="menu-header">
                    Menü
                </header>

                <div class="list-group">
                    <a href="geolocation.aspx" class="list-group-item">
                        <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Mevcut Konumum
                    </a>
                    <a href="save-location.aspx" class="list-group-item active">
                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Konum Kaydet
                    </a>
                    <a href="get-elevation.aspx" class="list-group-item">
                        <span class="glyphicon glyphicon-resize-vertical" aria-hidden="true"></span>
                        Yükselti Bulma
                    </a>
                    <a href="get-distance.aspx" class="list-group-item">
                        <span class="glyphicon glyphicon-screenshot" aria-hidden="true"></span>
                        İki Nokta Arası Mesafe Hesaplama
                    </a>
                    <a href="locations.aspx" class="list-group-item">
                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                        Geçmiş Konumlarım <asp:Label ID="badgeCount" runat="server" Text="0" CssClass="badge"></asp:Label>
                    </a>
                </div>
            </article>
        </section>

        <!--Social Box-->
        <section id="social-box">
            <article id="facebook">
                <div class="fa fa-3x fa-facebook"></div>
            </article>
            <article id="twitter" onclick="sendTweet();">
                <div class="fa fa-3x fa-twitter"></div>
            </article>
            <article id="google-plus">
                <div class="fa fa-3x fa-google-plus"></div>
            </article>
        </section>

        <footer>
            &copy All Right Reserved - Emre Köse @2015
        </footer>
    </form>
</body>
</html>
