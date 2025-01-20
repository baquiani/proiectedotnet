using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
namespace ModeleExamen
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Panel1.Visible = false;
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.6.0.min.js",
                DebugPath = "~/Scripts/jquery-3.6.0.js",
                CdnPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js",
                CdnDebugPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"
            });
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            nullControale();

        }

        protected void BtnConfirma_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                
                    // Procesează salvarea datelor sau alte acțiuni necesare
                    Response.Write("Datele sunt valide. Salvare...");
                    adaugaInregistrare();
               
            }
            else
            {
                
                // Afisează mesajul de eroare general
                Response.Write("Formularul conține erori. Verifică din nou datele introduse.");
            }
        }

        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Enabled = true;

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = ADS1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select IdHotel from Hoteluri where NumeHotel='" + TxtTitlu.Text + "'";
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Hotel deja existent";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                adaugaInregistrare();
            }

        }
        private void nullControale()
        {
            TxtTitlu.Text = null;
            TxtAn.Text = null;
            DdlAutor.SelectedIndex = 0;
        }
        private void adaugaInregistrare()
        {
            ADS1.InsertParameters[0].DefaultValue = TxtTitlu.Text;
            ADS1.InsertParameters[1].DefaultValue = TxtAn.Text;
            ADS1.InsertParameters[2].DefaultValue = DdlAutor.Text;
            ADS1.Insert();
            nullControale();
        }
       
    }
}