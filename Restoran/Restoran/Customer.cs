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
    public partial class Customer : Form
    {
        public Customer()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();


        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow column = dataGridView1.CurrentRow;
            textBox1.Text = column.Cells["musteriName"].Value.ToString();
            textBox2.Text = column.Cells["musteriPhone"].Value.ToString();
            textBox3.Text = column.Cells["musteriBudget"].Value.ToString();
            textBox4.Text = column.Cells["musteriAdress"].Value.ToString();
            comboBox1.Text = column.Cells["RestoranID"].Value.ToString();
        }


        private void Customer_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource= coon.MusteriSet.Where(x => x.MusteriID == Form1.deger).ToList();
            comboBox1.DataSource = coon.MusteriSet.ToList();
            comboBox1.ValueMember = "RestoranID";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var update = coon.MusteriSet.Where(x => x.MusteriID == Form1.deger).FirstOrDefault();
            update.musteriName = textBox1.Text;
            update.musteriPhone = textBox2.Text;
            update.musteriBudget = textBox3.Text;
            update.musteriAdress = textBox4.Text;
            update.RestoranID = Convert.ToInt32(comboBox1.Text);
            coon.SaveChanges();
            dataGridView1.DataSource = coon.MusteriSet.Where(x => x.MusteriID == Form1.deger).ToList();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            InterfacePagee go = new InterfacePagee();
            go.Show();
            this.Hide();
        }
    }
}
