using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Interfata_Baza_de_Date
{

    public partial class Form1 : Form
    {
        DBAccess objDbAccess = new DBAccess();

        bool locatii = false;
        bool joburi = false;
        bool campusuri = false;
        bool camere = false;
        bool studenti = false;
        bool contracte = false;
        bool angajati = false;
        bool cladiri = false;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataTable dtLOCATII = new DataTable();
            string query = "select * from LOCATII";
            objDbAccess.readDatathroughAdapter(query, dtLOCATII);
            dataGridView1.DataSource = dtLOCATII;
            objDbAccess.closeConn();
            locatii = true;
            joburi = false;
            campusuri = false;
            camere = false;
            studenti = false;
            contracte = false;
            angajati = false;
            cladiri = false;

        }

        private void button2_Click(object sender, EventArgs e)
        {
            DataTable dtCAMPUSURI = new DataTable();
            string query = "select * from CAMPUSURI";
            objDbAccess.readDatathroughAdapter(query, dtCAMPUSURI);
            dataGridView1.DataSource = dtCAMPUSURI;
            objDbAccess.closeConn();
            locatii = false;
            joburi = false;
            campusuri = true;
            camere = false;
            studenti = false;
            contracte = false;
            angajati = false;
            cladiri = false;


        }
        private void button3_Click(object sender, EventArgs e)
        {
            DataTable dtCLADIRI = new DataTable();
            string query = "select * from CLADIRI";
            objDbAccess.readDatathroughAdapter(query, dtCLADIRI);
            dataGridView1.DataSource = dtCLADIRI;
            objDbAccess.closeConn();
            locatii = false;
            joburi = false;
            campusuri = false;
            camere = false;
            studenti = false;
            contracte = false;
            angajati = false;
            cladiri = true;
        }
        private void button4_Click(object sender, EventArgs e)
        {
            DataTable dtCAMERE = new DataTable();
            string query = "select * from CAMERE";
            objDbAccess.readDatathroughAdapter(query, dtCAMERE);
            dataGridView1.DataSource = dtCAMERE;
            objDbAccess.closeConn();
            locatii = false;
            joburi = false;
            campusuri = false;
            camere = true;
            studenti = false;
            contracte = false;
            angajati = false;
            cladiri = false;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            DataTable dtSTUDENTI = new DataTable();
            string query = "select * from STUDENTI";
            objDbAccess.readDatathroughAdapter(query, dtSTUDENTI);
            dataGridView1.DataSource = dtSTUDENTI;
            objDbAccess.closeConn();
            locatii = false;
            joburi = false;
            campusuri = false;
            camere = false;
            studenti = true;
            contracte = false;
            angajati = false;
            cladiri = false;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            DataTable dtCONTRACTE = new DataTable();
            string query = "select * from CONTRACTE";
            objDbAccess.readDatathroughAdapter(query, dtCONTRACTE);
            dataGridView1.DataSource = dtCONTRACTE;
            objDbAccess.closeConn();
            locatii = false;
            joburi = false;
            campusuri = false;
            camere = false;
            studenti = false;
            contracte = true;
            angajati = false;
            cladiri = false;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            DataTable dtANGAJATI = new DataTable();
            string query = "select * from ANGAJATI";
            objDbAccess.readDatathroughAdapter(query, dtANGAJATI);
            dataGridView1.DataSource = dtANGAJATI;
            objDbAccess.closeConn();
            locatii = false;
            joburi = false;
            campusuri = false;
            camere = false;
            studenti = false;
            contracte = false;
            angajati = true;
            cladiri = false;
        }
        private void button8_Click(object sender, EventArgs e)
        {
            DataTable dtJOBURI = new DataTable();
            string query = "select * from JOBURI";
            objDbAccess.readDatathroughAdapter(query, dtJOBURI);
            dataGridView1.DataSource = dtJOBURI;
            objDbAccess.closeConn();
            locatii = false;
            joburi = true;
            campusuri = false;
            camere = false;
            studenti = false;
            contracte = false;
            angajati = false;
            cladiri = false;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button9_Click(object sender, EventArgs e)
        {
            string id = idtext.Text;
            string query;
            
            if (id != "")
            {
                DialogResult dialog = MessageBox.Show("Esti sigur ca vrei sa stergi informatia cu id-ul:'" + id + "'", "Informatie stearsa", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (dialog == DialogResult.Yes)
                {

                    if (joburi)
                    {
                        query = "delete from JOBURI where id_job = " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtJOBURI = new DataTable();
                            string query1 = "select * from JOBURI";
                            objDbAccess.readDatathroughAdapter(query1, dtJOBURI);
                            dataGridView1.DataSource = dtJOBURI;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }
                    else
                    if (angajati)
                    {
                        query = "delete from ANGAJATI where id_angajat= " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtANGAJATI = new DataTable();
                            string query1 = "select * from ANGAJATI";
                            objDbAccess.readDatathroughAdapter(query1, dtANGAJATI);
                            dataGridView1.DataSource = dtANGAJATI;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }
                    else
                    if (contracte)
                    {
                        query = "delete from CONTRACTE where id_contract = " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtCONTRACTE = new DataTable();
                            string query1 = "select * from CONTRACTE";
                            objDbAccess.readDatathroughAdapter(query1, dtCONTRACTE);
                            dataGridView1.DataSource = dtCONTRACTE;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }
                    else
                    if (cladiri)
                    {
                        query = "delete from CLADIRI where id_cladire = " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtCLADIRI = new DataTable();
                            string query1 = "select * from CLADIRI";
                            objDbAccess.readDatathroughAdapter(query1, dtCLADIRI);
                            dataGridView1.DataSource = dtCLADIRI;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }
                    else
                    if (camere)
                    {
                        query = "delete from CAMERE where id_camera = " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtCAMERE = new DataTable();
                            string query1 = "select * from CAMERE";
                            objDbAccess.readDatathroughAdapter(query1, dtCAMERE);
                            dataGridView1.DataSource = dtCAMERE;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }
                    else
                    if (studenti)
                    {
                        query = "delete from STUDENTI where id_student = " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtSTUDENTI = new DataTable();
                            string query1 = "select * from STUDENTI";
                            objDbAccess.readDatathroughAdapter(query1, dtSTUDENTI);
                            dataGridView1.DataSource = dtSTUDENTI;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }
                    else
                    if (campusuri)
                    {
                        query = "delete from CAMPUSURI where id_campus = " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtCAMPUSURI = new DataTable();
                            string query1 = "select * from CAMPUSURI";
                            objDbAccess.readDatathroughAdapter(query1, dtCAMPUSURI);
                            dataGridView1.DataSource = dtCAMPUSURI;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }
                    else
                    if (locatii)
                    {
                        query = "delete from LOCATII where id_locatie = " + id;
                        SqlCommand deleteCommand = new SqlCommand(query);
                        int row = objDbAccess.executeQuery(deleteCommand);
                        if (row == 1)
                        {
                            MessageBox.Show("Informatie stearsa cu succes");
                            DataTable dtLOCATII = new DataTable();
                            string query1 = "select * from LOCATII";
                            objDbAccess.readDatathroughAdapter(query1, dtLOCATII);
                            dataGridView1.DataSource = dtLOCATII;
                            objDbAccess.closeConn();
                        }
                        else

                        {
                            MessageBox.Show("Informatia cu id-ul:" + id + " nu exista!");
                        }
                    }



                }
                else
                {
                    MessageBox.Show("Nu s-a putut sterge!");
                }
            }
            else
                MessageBox.Show("Introduceti un id !");
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void button9_Click_1(object sender, EventArgs e)
        {
            string id = id_cauta_text.Text;
            string query;
            if (id != "")
            {
                if (joburi)
                {
                    query = "select * from JOBURI where id_job = " + id;
                    DataTable dtJOBURI = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtJOBURI);
                    dataGridView2.DataSource = dtJOBURI;
                    objDbAccess.closeConn();

                }
                else
                if (angajati)
                {
                    query = "select * from ANGAJATI where id_angajat = " + id;
                    DataTable dtANGAJATI = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtANGAJATI);
                    dataGridView2.DataSource = dtANGAJATI;
                    objDbAccess.closeConn();
                }
                else
                if (contracte)
                {
                    query = "select* from CONTRACTE where id_contract = " + id;
                    DataTable dtCONTRACTE = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtCONTRACTE);
                    dataGridView2.DataSource = dtCONTRACTE;
                    objDbAccess.closeConn();

                }
                else
                if (cladiri)
                {
                    query = "select * from CLADIRI where id_cladire = " + id;
                    SqlCommand deleteCommand = new SqlCommand(query);
                    DataTable dtCLADIRI = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtCLADIRI);
                    dataGridView2.DataSource = dtCLADIRI;
                    objDbAccess.closeConn();

                }
                else
                if (camere)
                {
                    query = "select * from CAMERE where id_camera = " + id;
                    DataTable dtCAMERE = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtCAMERE);
                    dataGridView2.DataSource = dtCAMERE;
                    objDbAccess.closeConn();
                }
                else
                if (studenti)
                {
                    query = "select * from STUDENTI where id_student = " + id;
                    DataTable dtSTUDENTI = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtSTUDENTI);
                    dataGridView2.DataSource = dtSTUDENTI;
                    objDbAccess.closeConn();

                }
                else
                if (campusuri)
                {
                    query = "select * from CAMPUSURI where id_campus = " + id;
                    DataTable dtCAMPUSURI = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtCAMPUSURI);
                    dataGridView2.DataSource = dtCAMPUSURI;
                    objDbAccess.closeConn();

                }
                else
                if (locatii)
                {
                    query = "select * from LOCATII where id_locatie = " + id;
                    DataTable dtLOCATII = new DataTable();
                    objDbAccess.readDatathroughAdapter(query, dtLOCATII);
                    dataGridView2.DataSource = dtLOCATII;
                    objDbAccess.closeConn();

                }
            }
            else
                MessageBox.Show("Introduceti un id ");
        }

        private void button10_Click(object sender, EventArgs e)
        {
            string id = id_cauta_text.Text;
            if (id != "")
            {
                if (joburi)
                {

                    string denumire = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string salariu_minim = dataGridView2.Rows[0].Cells[2].Value.ToString();
                    string salariu_maxim = dataGridView2.Rows[0].Cells[3].Value.ToString();
                    string query = "Update JOBURI SET denumire = '" + denumire + "',salariul_minim =" + salariu_minim + ", salariul_maxim = " + salariu_maxim + " where id_job = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtJOBURI = new DataTable();
                        string query1 = "select * from JOBURI";
                        objDbAccess.readDatathroughAdapter(query1, dtJOBURI);
                        dataGridView1.DataSource = dtJOBURI;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
                else
                if (locatii)
                {

                    string sector = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string cartier = dataGridView2.Rows[0].Cells[2].Value.ToString();
                    string cod_postal = dataGridView2.Rows[0].Cells[3].Value.ToString();
                    string query = "Update LOCATII SET sector = '" + sector + "',cartier = '" + cartier + "' , cod_postal = " + cod_postal + " where id_locatie = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtLOCATII = new DataTable();
                        string query1 = "select * from LOCATII";
                        objDbAccess.readDatathroughAdapter(query1, dtLOCATII);
                        dataGridView1.DataSource = dtLOCATII;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
                else
                if (campusuri)
                {

                    string denumire = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string id_locatie = dataGridView2.Rows[0].Cells[2].Value.ToString();
                    string query = "Update CAMPUSURI SET denumire = '" + denumire + "',id_locatie =" + id_locatie + " where id_campus = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtCAMPUSURI = new DataTable();
                        string query1 = "select * from CAMPUSURI";
                        objDbAccess.readDatathroughAdapter(query1, dtCAMPUSURI);
                        dataGridView1.DataSource = dtCAMPUSURI;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
                else
                if (cladiri)
                {

                    string nume = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string nr_etaje = dataGridView2.Rows[0].Cells[2].Value.ToString();
                    string id_campus = dataGridView2.Rows[0].Cells[3].Value.ToString();
                    string query = "Update CLADIRI SET nume = '" + nume + "',nr_etaje =" + nr_etaje + ", id_campus = " + id_campus + " where id_cladire = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtCLADIRI = new DataTable();
                        string query1 = "select * from CLADIRI";
                        objDbAccess.readDatathroughAdapter(query1, dtCLADIRI);
                        dataGridView1.DataSource = dtCLADIRI;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
                else
                if (camere)
                {

                    string numar_camera = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string dimensiune = dataGridView2.Rows[0].Cells[2].Value.ToString();
                    string chirie = dataGridView2.Rows[0].Cells[3].Value.ToString();
                    string id_cladire = dataGridView2.Rows[0].Cells[4].Value.ToString();
                    string query = "Update CAMERE SET numar_camera = " + numar_camera + ",dimensiune =" + dimensiune + ", chirie = " + chirie + ", id_cladire = " + id_cladire + " where id_camera = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtCAMERE = new DataTable();
                        string query1 = "select * from CAMERE";
                        objDbAccess.readDatathroughAdapter(query1, dtCAMERE);
                        dataGridView1.DataSource = dtCAMERE;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
                else
                if (studenti)
                {

                    string nume = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string prenume = dataGridView2.Rows[0].Cells[2].Value.ToString();
                    string sex = dataGridView2.Rows[0].Cells[3].Value.ToString();
                    string oras = dataGridView2.Rows[0].Cells[4].Value.ToString();
                    string email = dataGridView2.Rows[0].Cells[5].Value.ToString();
                    string nr_telefon = dataGridView2.Rows[0].Cells[6].Value.ToString();
                    string id_camera = dataGridView2.Rows[0].Cells[7].Value.ToString();
                    string query = "Update STUDENTI SET nume = '" + nume + "',prenume ='" + prenume + "' , sex = '" + sex + "',oras ='" + oras + "' , email = '" + email + "' , nr_telefon ='" + nr_telefon + "', id_camera =" + id_camera + " where id_student = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtSTUNDETI = new DataTable();
                        string query1 = "select * from STUDENTI";
                        objDbAccess.readDatathroughAdapter(query1, dtSTUNDETI);
                        dataGridView1.DataSource = dtSTUNDETI;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
                else
                if (angajati)
                {

                    string nume = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string prenume = dataGridView2.Rows[0].Cells[2].Value.ToString();
                    string data_nasteri = dataGridView2.Rows[0].Cells[3].Value.ToString();
                    string oras = dataGridView2.Rows[0].Cells[4].Value.ToString();
                    string strada = dataGridView2.Rows[0].Cells[5].Value.ToString();
                    string nr_telefon = dataGridView2.Rows[0].Cells[6].Value.ToString();
                    string salariu = dataGridView2.Rows[0].Cells[7].Value.ToString();
                    string id_job = dataGridView2.Rows[0].Cells[8].Value.ToString();
                    string query = "Update ANGAJATI SET nume = '" + nume + "',prenume ='" + prenume + "' , data_nastere = convert(date,'" + data_nasteri + "',103) ,oras ='" + oras + "' , strada = '" + strada + "' , nr_telefon ='" + nr_telefon + "' , salariul =" + salariu + ", id_job =" + id_job + " where id_angajat = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtANGAJATI = new DataTable();
                        string query1 = "select * from ANGAJATI";
                        objDbAccess.readDatathroughAdapter(query1, dtANGAJATI);
                        dataGridView1.DataSource = dtANGAJATI;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
                else
                if (contracte)
                {

                    string data_inceput = dataGridView2.Rows[0].Cells[0].Value.ToString();
                    string data_final = dataGridView2.Rows[0].Cells[1].Value.ToString();
                    string id_cladire = dataGridView2.Rows[0].Cells[3].Value.ToString();
                    string id_angajat = dataGridView2.Rows[0].Cells[4].Value.ToString();
                    string query = "Update CONTRACTE SET data_inceput = convert(date,'" + data_inceput + "',103) ,data_final = convert(date,'" + data_final + "',103), id_cladire = " + id_cladire + ", id_angajat = " + id_angajat + " where id_contract = " + id;
                    SqlCommand updateCommand = new SqlCommand(query);
                    int row = objDbAccess.executeQuery(updateCommand);
                    if (row == 1)
                    {
                        MessageBox.Show("Informatia a fost modificata cu succes");
                        DataTable dtCONTRACTE = new DataTable();
                        string query1 = "select * from CONTRACTE";
                        objDbAccess.readDatathroughAdapter(query1, dtCONTRACTE);
                        dataGridView1.DataSource = dtCONTRACTE;
                        objDbAccess.closeConn();
                    }
                    else

                    {
                        MessageBox.Show("Informatia nu se poate modifica, incercati alte date");
                    }
                }
            }
            else
            {
                MessageBox.Show("Introduceti un id !");
            }
            

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button11_Click(object sender, EventArgs e)
        {
            string query = "select s.nume ,s.prenume, convert(int ,c.chirie/2) as 'chirie', cl.nume as 'camin' "+
            "from STUDENTI s, CAMERE c, CLADIRI cl, CONTRACTE co, ANGAJATI an, JOBURI j, CAMPUSURI cam"+
             " where s.id_camera = c.id_camera and c.id_cladire = cl.id_cladire and cl.id_cladire = co.id_cladire and co.id_angajat = an.id_angajat and an.id_job = j.id_job and cl.id_campus = cam.id_campus and lower(cam.denumire) = 'campus leu' and lower(j.denumire) = 'administrator' and an.salariul < 3500; ";
            DataTable dttable = new DataTable();
            objDbAccess.readDatathroughAdapter(query, dttable);
            dataGridView4.DataSource = dttable;
            objDbAccess.closeConn();
        }

        private void button12_Click(object sender, EventArgs e)
        {
            string query = "select cl.nume as 'Nume facultate', count(a.id_angajat) as 'Numarul de angajati ', cam.denumire as 'Nume campus' " +
                "from ANGAJATI a, CONTRACTE c, CLADIRI cl, CAMPUSURI cam " +
                "where a.id_angajat = c.id_angajat and c.id_cladire = cam.id_campus and cl.id_campus = cam.id_campus " +
                "group by cam.denumire, cl.nume " +
                "having lower(cl.nume) like 'facultatea%'; ";
            DataTable dttable = new DataTable();
            objDbAccess.readDatathroughAdapter(query, dttable);
            dataGridView3.DataSource = dttable;
            objDbAccess.closeConn();
        }
    }
}
