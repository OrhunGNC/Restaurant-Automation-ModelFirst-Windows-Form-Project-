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
    public partial class Products : Form
    {
        public Products()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();

        private void Products_Load(object sender, EventArgs e)
        {
            textBox1.Visible = false;
            textBox2.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Visible = true;
            textBox2.Visible = true;
            dataGridView1.DataSource = coon.UrunSet.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = coon.UrunSet.Where(x=>x.urunType.Contains(textBox1.Text)).ToList();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = coon.UrunSet.Where(x => x.urunName.Contains(textBox2.Text)).ToList();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            InterfacePagee go = new InterfacePagee();
            go.Show();
            this.Hide();
        }
    }
}
