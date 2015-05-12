using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Üyelik işlemleri için tanımlı class yapısı
/// </summary>
public class uyelik
{
    private string kadi;
    private string adSoyad;
    private string sifre;

    public string Kadi
    {
        get { return kadi; }
        set { kadi = value; }
    }
    public string AdSoyad
    {
        get { return adSoyad; }
        set { adSoyad = value; }
    }
    public string Sifre
    {
        get { return sifre; }
        set { sifre = value; }
    }
    
    public uyelik(string adSoyad, string sifre, string kadi)
    {
        this.AdSoyad = adSoyad;
        this.Kadi = kadi;
        this.Sifre = sifre;
    }
}