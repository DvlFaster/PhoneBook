using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Oracle.ManagedDataAccess.Client;

namespace PhoneBook
{
    public class Main : WebForm1
    {

        string oradb = "Data Source=xxxxxx/xxx ;User Id=xxxxxx;Password=xxxxxxxx;";
        public string DeleteByID(string DEL_ID)
        {
            string error = "";

            try
            {
                using (MYSQLConnection conn = new OracleConnection(oradb))
                {
                    conn.Open();
                    OracleParameter parm = new OracleParameter();
                    parm.OracleDbType = OracleDbType.Varchar2;
                    parm.Value = DEL_ID;
                    parm.ParameterName = "DEL";

                    OracleCommand cmd = new OracleCommand();
                    cmd.Connection = conn;
                    cmd.Parameters.Add(parm);
                    cmd.CommandText = "DELETE from CONTACTS WHERE ID = :DEL";
                    cmd.CommandType = CommandType.Text;

                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    conn.Dispose();
                    error = "You have deleted the contact by ID successfully!";
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }
            return error;
        }

        public string InsertByID(/*int INS_ID, */string INS_FIRSTNAME, string INS_SECONDNAME, string INS_LASTNAME, string INS_EMAIL, string INS_PHONENUMBER)
        {
            string error = "";

            try
            {

                OracleConnection conn = new OracleConnection(oradb);
                conn.Open();

                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                //cmd.BindByName = true;

                OracleParameter parm1 = new OracleParameter("id", OracleDbType.Int32);
                //parm1.Value = INS_ID;

                OracleParameter FN = new OracleParameter("firstname", OracleDbType.Varchar2);
                FN.Value = INS_FIRSTNAME;

                OracleParameter SN = new OracleParameter("secondname", OracleDbType.Varchar2);
                SN.Value = INS_SECONDNAME;

                OracleParameter LN = new OracleParameter("lastname", OracleDbType.Varchar2);
                LN.Value = INS_LASTNAME;

                OracleParameter EM = new OracleParameter("email", OracleDbType.Varchar2);
                EM.Value = INS_EMAIL;

                OracleParameter PHN = new OracleParameter("phonenumber", OracleDbType.Varchar2);
                PHN.Value = INS_PHONENUMBER;

                cmd.Parameters.Add(parm1);
                cmd.Parameters.Add(FN);
                cmd.Parameters.Add(SN);
                cmd.Parameters.Add(LN);
                cmd.Parameters.Add(EM);
                cmd.Parameters.Add(PHN);

                cmd.CommandText = @"insert into contacts(id, firstname, secondname, lastname, email, phonenumber) 
                                       VALUES   (:id, :firstname, :secondname, :lastname, :email, :phonenumber)";

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                conn.Dispose();

                error = "You have inserted successfully!";

            }

            catch (Exception ex)
            {
                error = ex.Message;
            }

            return error;



        }

        public string UpdateByID(int UPD_ID, string UPD_FN, string UPD_SN, string UPD_LN, string UPD_EM, string UPD_PN)
        {
            string error = "";

            try
            {
                
                OracleConnection conn = new OracleConnection(oradb);
                conn.Open();

                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.BindByName = true;

                OracleParameter ID = new OracleParameter("id", OracleDbType.Int32);
                ID.Value = UPD_ID;

                OracleParameter FN = new OracleParameter("firstname", OracleDbType.Varchar2);
                FN.Value = UPD_FN;

                OracleParameter SN = new OracleParameter("secondname", OracleDbType.Varchar2);
                SN.Value = UPD_SN;

                OracleParameter LN = new OracleParameter("lastname", OracleDbType.Varchar2);
                LN.Value = UPD_LN;

                OracleParameter EM = new OracleParameter("email", OracleDbType.Varchar2);
                EM.Value = UPD_EM;

                OracleParameter PHN = new OracleParameter("phonenumber", OracleDbType.Varchar2);
                PHN.Value = UPD_PN;

                cmd.Parameters.Add(ID);
                cmd.Parameters.Add(FN);
                cmd.Parameters.Add(SN);
                cmd.Parameters.Add(LN);
                cmd.Parameters.Add(EM);
                cmd.Parameters.Add(PHN);

                cmd.CommandText = @"update contacts set firstname = :firstname, secondname = :secondname,
                              lastname = :lastname, email = :email, phonenumber = :phonenumber where id = :id";
                cmd.CommandType = CommandType.Text;

                cmd.ExecuteNonQuery();
                conn.Dispose();
                error = "You have Updated by ID succesfully!";

            }
            catch (Exception ex)
            {
                error = ex.Message;

            }

            return error;

        }

        public DataTable getDataByID(string id)           // Edit Method
        {
            DataTable dt = new DataTable();
            string error = "";
            try
            {
                string oradb = "Data Source=oratest19/trn ;User Id=eamishev;Password=banksoft;";
                OracleConnection conn = new OracleConnection(oradb);
                conn.Open();
                OracleCommand cmd = new OracleCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from contacts where id = " + id + " order by id";
                dt.Load(cmd.ExecuteReader());
                conn.Dispose();
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }
            return dt;
        }

    }

}



