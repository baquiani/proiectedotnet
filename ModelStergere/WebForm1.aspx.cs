using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ModelStergere
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private const int Titlu = 2;
        private const int IdCarte = 1;
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Enabled = false;
            TxtTitlu.Text = GridView1.SelectedRow.Cells[Titlu].Text;
            TxtIdCarte.Text = GridView1.SelectedRow.Cells[IdCarte].Text;
        }
        protected void BtnRenunta_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Button1.Enabled = true;
        }
        protected void CV_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection con = new OleDbConnection();
            con.ConnectionString = ADS1.ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = con;
            cmd.CommandText = "Select Data from Imprumuturi where IdCarte=" + TxtIdCarte.Text;
            OleDbDataReader rd;
            con.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                args.IsValid = false;
                CV.ErrorMessage = "Carte referita in tabela Imprumuturi";
                con.Close();
            }
            else
            {
                args.IsValid = true;
                con.Close();
                stergeInregistrare();
                Panel1.Visible = false;
                Button1.Enabled = true;
            }
        }
        private void stergeInregistrare()
        {
            int p = GridView1.SelectedIndex;
            int n;
            ADS1.DeleteParameters[0].DefaultValue = TxtIdCarte.Text;
            ADS1.Delete();
            GridView1.DataBind();
            n = GridView1.Rows.Count;

            if (n > 0)
                if (p == n) GridView1.SelectedIndex = p - 1;
                else GridView1.SelectedIndex = p;
        }

    }
}