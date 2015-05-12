<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to W.a.I</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css' />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/custom.css" rel="stylesheet" />
</head>
<body id="default-page">
    <form id="form1" runat="server">
        <div id="wrapper">
            <div id="logo">
                <img src="images/wailogo.png" />
            </div>

            <div id="login">
               <header id="userPanel">Kullanıcı Giriş Paneli</header>
                <div id="loginForm">
                    <div class="form-group col-md-offset-2 col-md-8 col-md-offset-2">
                        <label for="username">Kullanıcı Adı</label>
                        <div class="input-group">
                            <div class="input-group-addon"><div class="glyphicon glyphicon-user"></div></div>
                        <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                    </div>
                    <div class="form-group col-md-offset-2 col-md-8 col-md-offset-2">
                        <label for="password">Şifre</label>
                        <div class="input-group">
                            <div class="input-group-addon"><div class="glyphicon glyphicon-ok"></div></div>
                        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>
                        <div style="margin-top:10px;">
                        <a href="#" data-toggle="modal" data-target="#myModal">Üye Değil misin ? Hemen Üye Ol!</a>
                            </div>
                        <asp:Button ID="gonderBtn" runat="server" CssClass="btn btn-success" Text="Giriş Yap" OnClick="gonderBtn_Click"/>
                    </div>
                    
                    <!-- LightBox -->
                    <div id="modal-sign-in">
                       
                        
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-target="modal-sm" aria-labelledby="myModalLabel" aria-hidden="true"style="margin-top:100px;">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title text-center" id="myModalLabel">WAI'ye üye olmak çok kolay.Aşağıdaki formu doldurun</h4>
                              </div>
                              <div class="modal-body">
                                <form>
                                <div class="form-group col-md-offset-2 col-md-8 col-md-offset-2">
                                    <label for="email">Ad Soyad *</label>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-offset-2 col-md-8 col-md-offset-2">
                                    <label for="email">Kullanıcı Adınız *</label>
                                    <asp:TextBox ID="txtKadi" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                              <div class="form-group col-md-offset-2 col-md-8 col-md-offset-2">
                                <label for="phone">Şifreniz *</label>
                                  <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                              </div>
                                <asp:Button ID="btnKaydol" runat="server" Text="Kaydol" CssClass="btn btn-success btn-lg" OnClick="btnKaydol_Click"/>
                                </form>
                              </div>
      
                            </div>
                          </div>
                        </div>
            
                    </div><!--#LightxBox-->
 
                
                 </div>
               </div>

            <div id="app-stores">
                <div style="margin-left:482px; margin-top:15px;">
                    <img src="images/googleplay.png"  width="130"/>
                    <img src="images/appstore.png"  width="130"/>
                    <img src="images/windowsstore.png" width="130" height="75" />
                </div>
            </div>
        </div>
    </form>

    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/main.js"></script>
</body>
</html>
