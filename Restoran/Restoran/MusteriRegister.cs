using Microsoft.Win32.SafeHandles;
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
    public partial class MusteriRegister : Form
    {
        public MusteriRegister()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();
        private void button1_Click(object sender, EventArgs e)
        {
            Musteri save = new Musteri();
            save.musteriName = textBox1.Text;
            save.musteriPhone = textBox2.Text;
            save.musteriBudget = textBox3.Text;
            save.musteriAdress = textBox4.Text;
            save.RestoranID = Convert.ToInt32(comboBox1.Text);
            coon.MusteriSet.Add(save);
            coon.SaveChanges();
            MessageBox.Show("Başarıyla Kayıt Oldunuz!");
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }

        private void MusteriRegister_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource=coon.RestoranSet.ToList();
            comboBox1.ValueMember = "RestoranID";
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }
    }
}
