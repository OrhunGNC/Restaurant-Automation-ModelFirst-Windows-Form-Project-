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
    public partial class Restaurants : Form
    {
        public Restaurants()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = coon.RestoranSet.ToList();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            InterfacePagee go = new InterfacePagee();
            go.Show();
            this.Hide();
        }
    }
}
