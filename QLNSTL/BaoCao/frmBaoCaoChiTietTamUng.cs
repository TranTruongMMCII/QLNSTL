using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNSTL.BaoCao
{
    public partial class frmBaoCaoChiTietTamUng : Form
    {
        public frmBaoCaoChiTietTamUng()
        {
            InitializeComponent();
        }
        protected void LoadBaoCao()
        {
            try
            {

                BaoCaoChiTietTamUng reports = new BaoCaoChiTietTamUng(cmbTenBoPhan.Text, cmbTenBoPhan.SelectedValue.ToString(), cmbTenLoaiTamUng.Text, cmbTenLoaiTamUng.SelectedValue.ToString());

                reports.Parameters["BoPhanID"].Value = cmbTenBoPhan.SelectedValue.ToString();
                reports.Parameters["TamUngID"].Value = cmbTenLoaiTamUng.SelectedValue.ToString();
                documentViewer1.DocumentSource = reports;
                reports.CreateDocument();
            }
            catch (Exception)
            {

            }
        }

        private void cmbTenBoPhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBaoCao();
        }

        private void cmbTenLoaiTamUng_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBaoCao();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            //bỏ
        }

        private void frmBaoCaoChiTietTamUng_Load(object sender, EventArgs e)
        {
            LoadBaoCao();
            string sql = "Select * from BoPhan";
            DataTable dt = Core.Core.GetData(sql);
            cmbTenBoPhan.DataSource = dt;
            cmbTenBoPhan.ValueMember = "BoPhanID";
            cmbTenBoPhan.DisplayMember = "TenBoPhan";
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            src = dt
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenBoPhan"))
                     .ToArray();
            data.AddRange(src);
            this.cmbTenBoPhan.DroppedDown = true;
            this.cmbTenBoPhan.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTenBoPhan.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTenBoPhan.AutoCompleteCustomSource = data;
            sql = "Select *from TamUng";
            DataTable dt1 = Core.Core.GetData(sql);
            cmbTenLoaiTamUng.DataSource = dt1;
            cmbTenLoaiTamUng.ValueMember = "TamUngID";
            cmbTenLoaiTamUng.DisplayMember = "TenTamUng";
            src = dt1
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenTamUng"))
                     .ToArray();
            data.AddRange(src);
            this.cmbTenLoaiTamUng.DroppedDown = true;
            this.cmbTenLoaiTamUng.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTenLoaiTamUng.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTenLoaiTamUng.AutoCompleteCustomSource = data;
        }
    }
}
