<%@ Page Language="C#" AutoEventWireup="true" CodeFile="get-distance.aspx.cs" Inherits="get_distance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>İki Nokta Arası Mesafe Hesaplama</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/custom.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/main.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="Scripts/get-distance.js"></script>

</head>
<body onload="initialize()">
    
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

            <form name="harita" action="#">

            <table style="margin-left:300px;">
                <tr><th align="right">Nerden :</th>
                    <td><input type="text" size="25" name="nerden" value="eskişehir" class="form-control"/></td>
                    <th align="right" style="margin-left:10px;">Nereye :</th>
                    <td align="right"><input type="text" size="25"  name="nereye" value="sakarya" class="form-control"/></td>
                    <th>
                        <input name="submit" class="btn btn-warning" style="height:45px; padding:2px; margin-left:10px;"  type="button" value="Yol HaritasıGöster" onclick="YolTarifi(document.forms['harita'].elements['nerden'].value, document.forms['harita'].elements['nereye'].value)" />
                    </th>
                </tr>
            </table>

        </form>
        <br/>
        <section class="directions">
            <div>
                <div id="directions" style="width: 270px; max-height:500px; position:absolute; left:300px;" ></div>
                <div id="get-distance-map" style="width:720px; height: 500px; margin-top:10px;" ></div>
            </div>
        </section>

            <!--Menü-->
            <article id="menu">
                <header id="menu-header">
                    Menü
                </header>

                <div class="list-group">
                    <a href="geolocation.aspx" class="list-group-item">
                        <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Mevcut Konumum
                    </a>
                    <a href="save-location.aspx" class="list-group-item">
                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Konum Kaydet
                    </a>
                    <a href="get-elevation.aspx" class="list-group-item">
                        <span class="glyphicon glyphicon-resize-vertical" aria-hidden="true"></span>
                        Yükselti Bulma
                    </a>
                    <a href="get-distance.aspx" class="list-group-item active">
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
            <article id="twitter">
                <div class="fa fa-3x fa-twitter"></div>
            </article>
            <article id="google-plus">
                <div class="fa fa-3x fa-google-plus"></div>
            </article>
        </section>

        <footer>
            &copy All Right Reserved - Emre Köse @2015
        </footer>
    
</body>
</html>
