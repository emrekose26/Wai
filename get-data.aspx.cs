using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TweetSharp;

public partial class get_data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        switch (Request.QueryString["method"])
        {
            case "save":
                var lng = Request.QueryString["lang2"];
                var lat = Request.QueryString["lat2"];
                var place_name = Request.QueryString["placename"];
                var uyeKadi = Session["uyeKadi"];
 

                //Veritabanı bağlantı
                SqlConnection baglanti = new SqlConnection(@"Data Source=.\SQLEXPRESS; Initial Catalog=waiDB;Integrated Security=True");
                baglanti.Open();

                 SqlCommand cmd = new SqlCommand("Insert Into konumlar (uyeKadi,konumLat,konumLng,konumAd) values ('"+uyeKadi+"','"+lat+"','"+lng+"','"+place_name+"')", baglanti);
                 cmd.ExecuteNonQuery();
                baglanti.Close();

                Response.Write("1");
                break;

                case "sendTweet":
                    var place_nameTweet = Request.QueryString["placename"];
                    var place_adressTweet = Request.QueryString["placeadress"];

                    //apps.twitter.com
		    //camon dude sure you cant see my twitter api consumer key :D
                    TweetSharp.TwitterService tw = new TweetSharp.TwitterService("ConsumerKeyBurada", "ConsumerSecretBurada","AccessTokenBurada", "AccessTokenSecretBurada");

                    SendTweetOptions opt = new SendTweetOptions();
                    opt.Status ="I'm at' " + place_nameTweet + " in " + place_adressTweet + " with @wai_app";
                    TweetSharp.TwitterStatus status = tw.SendTweet(opt);

                    Response.Write("2");
                break;
            default:
                break;
        }
    }
}