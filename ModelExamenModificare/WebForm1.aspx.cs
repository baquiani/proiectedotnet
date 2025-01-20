using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ModelExamenModificare
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private const int Titlu = 2;
        private const int IdCarte = 1;
        private const int An = 3;
        private const int Autor = 4;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel1.Visible = false;
                GridView1.SelectedIndex = 0;
            }
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-3.6.0.min.js",
                DebugPath = "~/Scripts/jquery-3.6.0.js",
                CdnPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js",
                CdnDebugPath = "https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.js"
            });
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
            cmd.CommandText = "Select IdCarte from Carti where Titlu='" + TxtTitlu.Text +
                              "' and IdCarte <> " + TxtIdCarte.Text;
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CV.ErrorMessage = "Carte deja existenta";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                modificaInregistrare();
                Panel1.Visible = false;
                Button1.Enabled = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            TxtTitlu.Text = GridView1.SelectedRow.Cells[Titlu].Text;
            TxtIdCarte.Text = GridView1.SelectedRow.Cells[IdCarte].Text;
            if (GridView1.SelectedRow.Cells[An].Text != "&nbsp;")
                TxtAn.Text = GridView1.SelectedRow.Cells[An].Text;
            if (GridView1.SelectedRow.Cells[Autor].Text != "&nbsp;")
                DdlAutor.Text = GridView1.SelectedRow.Cells[Autor].Text;
        }

        private void modificaInregistrare()
        {
            ADS1.UpdateParameters[0].DefaultValue = TxtTitlu.Text;
            ADS1.UpdateParameters[1].DefaultValue = TxtAn.Text;
            ADS1.UpdateParameters[2].DefaultValue = DdlAutor.Text;
            ADS1.UpdateParameters[3].DefaultValue = TxtIdCarte.Text;
            ADS1.Update();
        }

        protected void BtnConfirma_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Procesează salvarea datelor sau alte acțiuni necesare
                Response.Write("Datele sunt valide. Salvare...");
                modificaInregistrare();
            }
            else
            {
                // Afisează mesajul de eroare general
                Response.Write("Formularul conține erori. Verifică din nou datele introduse.");
            }
        }
    }
}