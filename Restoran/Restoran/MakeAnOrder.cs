using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Restoran
{
    public partial class MakeAnOrder : Form
    {
        public MakeAnOrder()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();
        private void MakeAnOrder_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = coon.UrunSet.ToList();
            textBox1.Enabled = false;
            textBox2.Enabled = false;
            textBox4.Enabled = false;
            textBox5.Enabled = false;
            textBox5.Text =Form1.deger.ToString();
                }

        private void button1_Click(object sender, EventArgs e)
        {
            Siparis save = new Siparis();
            save.urunSecim = textBox1.Text;
            save.siparisPrice = textBox2.Text;
            save.urunCount = Convert.ToInt32(textBox3.Text);
            save.RestoranID = Convert.ToInt32(textBox4.Text);
            save.MusteriID= Convert.ToInt32(textBox5.Text);
            coon.SiparisSet.Add(save);
            coon.SaveChanges();
            MessageBox.Show("You have succesfully ordered");
            InterfacePagee go = new InterfacePagee();
            go.Show();
            this.Hide();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow column = dataGridView1.CurrentRow;
            textBox1.Text = column.Cells["urunName"].Value.ToString();
            textBox2.Text = column.Cells["urunPrice"].Value.ToString();
            textBox4.Text = column.Cells["RestoranID"].Value.ToString();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            Orders go = new Orders();
            go.Show();
            this.Hide();
        }
    }
}
