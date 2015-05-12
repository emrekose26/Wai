using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class getlocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblkadi.Text = Session["uyeKadi"].ToString();
        lbladsoyad.Text = Session["uyeAdSoyad"].ToString();

        SqlConnection baglanti = new SqlConnection(@"Data Source=.\SQLEXPRESS; Initial Catalog=waiDB;Integrated Security=True");
        baglanti.Open();

        SqlCommand cmd = new SqlCommand("Select count(uyeKadi) as badge from konumlar where uyeKadi = '" + Session["uyeKadi"] + "' group by uyeKadi ", baglanti);

        SqlDataReader drRead = cmd.ExecuteReader();

        if (drRead.Read())
        {
            badgeCount.Text = drRead["badge"].ToString();
        }
        else
        {
            //Response.Write("Hata oluştu");
        }
        baglanti.Close();
    }
}