using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    #region VeriTabanı Baglantisi
    SqlConnection baglanti = new SqlConnection(@"Data Source=.\SQLEXPRESS; Initial Catalog=waiDB;Integrated Security=True");
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        btnKaydol.Attributes.Add("style", "margin-left:130px; width:300px;");
    }
    protected void gonderBtn_Click(object sender, EventArgs e)
    {
        baglanti.Open();

        //Sql sorgusu oluşturulup satır satır okuma gerçekleştiriliyor.
        SqlCommand cmdLogin = new SqlCommand("Select * from uyeler where uyeKadi='" + username.Text + "' and uyeSifre='" + password.Text + "'", baglanti);

        SqlDataReader drRead = cmdLogin.ExecuteReader();
        

        if (drRead.Read())
        {
            //Session oluşturuluyor.
            Session["uyeId"] = drRead["uyeId"].ToString();
            Session["uyeAdSoyad"] = drRead["uyeAdSoyad"].ToString();
            Session["uyeKadi"] = drRead["uyeKadi"].ToString();
            Response.Redirect("simple-map.aspx");
        }
        else
        {
            Response.Write("<script>alert('Kullanıcı adı ya da şifreyi yanlış girdiniz')</script>");
            username.Text = "";
        }
        baglanti.Close();
    }
    protected void btnKaydol_Click(object sender, EventArgs e)
    {

        uyelik yeniUye = new uyelik(txtName.Text, txtPassword.Text, txtKadi.Text);

        baglanti.Open();

        SqlCommand cmdSignin = new SqlCommand("Insert Into Uyeler(uyeAdSoyad,uyeKadi,uyeSifre) Values('" + yeniUye.AdSoyad + "','" + yeniUye.Kadi + "','" + yeniUye.Sifre + "')", baglanti);

        cmdSignin.ExecuteNonQuery();

        baglanti.Close();

        Response.Write("<script>alert('Kullanıcı başarıyla eklendi.');</script>");

    }
}