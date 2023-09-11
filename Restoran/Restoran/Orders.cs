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
    public partial class Orders : Form
    {
        public Orders()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();
        private void button1_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(textBox1.Text);
            dataGridView1.DataSource = coon.SiparisSet.Where(x => x.SiparisID == a).ToList();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            MakeAnOrder go = new MakeAnOrder();
            go.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = coon.SiparisSet.ToList();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            InterfacePagee go = new InterfacePagee();
            go.Show();
            this.Hide();
        }
    }
}
