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
    public partial class Reports : Form
    {
        public Reports()
        {
            InitializeComponent();
        }
        Model1Container coon = new Model1Container();
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            var query = from restoran in coon.RestoranSet
                        join siparis in coon.SiparisSet
                        on restoran.RestoranID equals siparis.RestoranID
                        select new
                        {
                            siparis.siparisPrice,
                            siparis.urunCount,
                            siparis.urunSecim,
                            restoran.restoranName,
                            restoran.restoranAdress,
                            restoran.restoranPhone,
                        };
            dataGridView1.DataSource = query.ToList();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            var query = from musteri in coon.MusteriSet
                        join siparis in coon.SiparisSet
                        on musteri.MusteriID equals siparis.MusteriID
                        select new
                        {
                            musteri.musteriName,
                            musteri.musteriPhone,
                            musteri.musteriBudget,
                            siparis.SiparisID,
                            siparis.siparisPrice,
                        };
            dataGridView1.DataSource=query.ToList();

        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            var query = from urun in coon.UrunSet
                        join restoran in coon.RestoranSet
                        on urun.RestoranID equals restoran.RestoranID
                        select new
                        {
                            urun.urunName,
                            urun.urunPrice,
                            urun.urunType,
                            restoran.restoranName,
                            restoran.restoranAdress,
                            restoran.restoranSalary,
                        };
            dataGridView1.DataSource=query.ToList();
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            var query = from siparis in coon.SiparisSet
                        join restoran in coon.RestoranSet
                        on siparis.RestoranID equals restoran.RestoranID
                        from urun in coon.UrunSet
                        join restoran2 in coon.RestoranSet
                        on urun.RestoranID equals restoran2.RestoranID
                        select new
                        {
                            siparis.siparisPrice,
                            siparis.urunSecim,
                            restoran.restoranName,
                            restoran.restoranPhone,
                            urun.urunPrice,
                        };
            dataGridView1.DataSource=query.ToList();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {

        }

        private void Reports_Load(object sender, EventArgs e)
        {

        }

        private void pictureBox5_Click_1(object sender, EventArgs e)
        {
            InterfacePagee go = new InterfacePagee();
            go.Show();
            this.Hide();
        }
    }
}
