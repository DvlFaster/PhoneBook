using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PhoneBook
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private int _pageSize = 10;
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 1;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDataFromDB();
            }
        }
        public void GetDataFromDB()
        {

            string oradb = "Data Source=xxxx;User Id=xxxxx;Password=xxxxxx;";
            OracleConnection conn = new OracleConnection(oradb);
            conn.Open();
            OracleCommand cmd = new OracleCommand();
            cmd.BindByName = true;
            OracleParameter startrowParam = new OracleParameter("startrow", OracleDbType.Int32);
            startrowParam.Value = 1 + ((CurrentPage - 1) * _pageSize);
            OracleParameter endrowParam = new OracleParameter("endrow", OracleDbType.Int32);
            endrowParam.Value = CurrentPage * _pageSize/*+1*/;
            cmd.Parameters.Add(startrowParam);
            cmd.Parameters.Add(endrowParam);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.CommandText = @"select * from (select s.*, ROW_NUMBER() OVER(ORDER BY id asc) as Ro
                                from contacts s where firstname like '" + Search.Text + "%' or lastname like '" + Search.Text + "%')x where x.ro >= :startrow and x.ro <= :endrow";
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable contacts = new DataTable();
            contacts.Load(cmd.ExecuteReader());
            ContactsREP.DataSource = contacts;
            ContactsREP.DataBind();
            conn.Dispose();
            int rowCount = contacts.Rows.Count;

            //Showing the text page(Page 1)
            PageDisapear.Text = "Page " + CurrentPage;
            // Setting empty string (When we click "previous" on last page to not see the msg)  
            TableDisapear.Text = "";

            // Previous workin btn
            if (CurrentPage <= 1)
                lbPrevious.Enabled = false;
            else if (CurrentPage > 1)
                lbPrevious.Enabled = true;
            // Next workin btn
            if (_pageSize <= rowCount)
                lbNext.Enabled = true;
            else lbNext.Enabled = false;
            // Hide the last page, if there is no contacts there
            if (rowCount == 0)
            {
                PlaceHolderHide.Visible = false;
                PageDisapear.Text = "";
                TableDisapear.Text = "There is nothing to show!";
            }
            else PlaceHolderHide.Visible = true;

            UpdatePanel1.Update();
        }

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            Main main = new Main();
            string err = main.InsertByID(FirstName.Text, SecondName.Text, LastName.Text, Email.Text, PhoneNumber.Text);

            FirstName.Text = string.Empty;
            SecondName.Text = string.Empty;
            LastName.Text = string.Empty;
            Email.Text = string.Empty;
            PhoneNumber.Text = string.Empty;
            UpdatePanel1.Update();
            GetDataFromDB();

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Main main = new Main();
            string err = main.UpdateByID(Convert.ToInt32(IDNUM.Text), FirstName.Text, SecondName.Text, LastName.Text, Email.Text, PhoneNumber.Text);

            IDNUM.Text = string.Empty;
            FirstName.Text = string.Empty;
            SecondName.Text = string.Empty;
            LastName.Text = string.Empty;
            Email.Text = string.Empty;
            PhoneNumber.Text = string.Empty;
            UpdatePanel1.Update();
            GetDataFromDB();

        }
        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            Main main = new Main();
            string err = main.DeleteByID(ID.ToString());
            GetDataFromDB();

        }

        protected void Edit_Command(object sender, CommandEventArgs e)
        {
            int ID = Convert.ToInt32(e.CommandArgument);

            Main main = new Main();
            DataTable dt = main.getDataByID(ID.ToString());
            IDNUM.Text = dt.Rows[0]["ID"].ToString();
            FirstName.Text = dt.Rows[0]["FirstName"].ToString();
            SecondName.Text = dt.Rows[0]["SecondName"].ToString();
            LastName.Text = dt.Rows[0]["LastName"].ToString();
            Email.Text = dt.Rows[0]["Email"].ToString();
            PhoneNumber.Text = dt.Rows[0]["PhoneNumber"].ToString();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
            "<script>document.getElementById('id01').style.display = 'block'</script>", false);

            UpdatePanel1.Update();
            GetDataFromDB();

        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {

            CurrentPage = 1;
            GetDataFromDB();
            UpdatePanel1.Update();

        }

        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            GetDataFromDB();
        }

        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            GetDataFromDB();
        }

    }

}

