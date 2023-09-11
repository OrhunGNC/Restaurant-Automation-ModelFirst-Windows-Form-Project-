using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Restoran
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();
        private void Form1_Load(object sender, EventArgs e)
        {

        }
        public static int deger;
        public bool Login(string namesurname, string phone)
        {
            var query = from user in coon.MusteriSet where user.musteriName == namesurname && user.musteriPhone==phone select user.MusteriID;
            foreach(var firstname in query)
            {
                deger = firstname;
            }
            if (query.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if(Login(textBox1.Text,textBox2.Text))
            {
                MessageBox.Show("You Successfully Logged in");
                InterfacePagee go = new InterfacePagee();
                go.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Wrong Name or Phone");
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {
            MusteriRegister go = new MusteriRegister();
            go.Show();
            this.Hide();
        }
    }
}
