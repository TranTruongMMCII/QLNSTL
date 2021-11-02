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
    public partial class frmBaoCaoKTKL : Form
    {
        public frmBaoCaoKTKL()
        {
            InitializeComponent();
        }
        protected void LoadBaoCao()
        {
            try
            {

                BaoCaoKhenThuongKyLuat reports = new BaoCaoKhenThuongKyLuat(cmbBoPhan.Text, cmbBoPhan.SelectedValue.ToString(), cmbLoaiQuyetDinh.Text, cmbLoaiQuyetDinh.SelectedValue.ToString());
                
                reports.Parameters["BoPhanID"].Value = cmbBoPhan.SelectedValue.ToString();
                reports.Parameters["LoaiQuyetDinhID"].Value = cmbLoaiQuyetDinh.SelectedValue.ToString();
                documentViewer1.DocumentSource = reports;
                reports.CreateDocument();
            }
            catch (Exception)
            {

            }
        }

        private void cmbBoPhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBaoCao();
        }

        private void cmbLoaiQuyetDinh_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBaoCao();
        }

        private void frmBaoCaoKTKL_Load(object sender, EventArgs e)
        {
            LoadBaoCao();
            string sql = "Select * from BoPhan";
            DataTable dt = Core.Core.GetData(sql);
            cmbBoPhan.DataSource = dt;
            cmbBoPhan.ValueMember = "BoPhanID";
            cmbBoPhan.DisplayMember = "TenBoPhan";
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            src = dt
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenBoPhan"))
                     .ToArray();
            data.AddRange(src);
            this.cmbBoPhan.DroppedDown = true;
            this.cmbBoPhan.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbBoPhan.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbBoPhan.AutoCompleteCustomSource = data;
            sql = "Select *from LoaiQuyetDinh";
            DataTable dt1 = Core.Core.GetData(sql);
            cmbLoaiQuyetDinh.DataSource = dt1;
            cmbLoaiQuyetDinh.ValueMember = "LoaiQuyetDinhID";
            cmbLoaiQuyetDinh.DisplayMember = "TenLoaiQuyetDinh";
            src = dt1
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenLoaiQuyetDinh"))
                     .ToArray();
            data.AddRange(src);
            this.cmbLoaiQuyetDinh.DroppedDown = true;
            this.cmbLoaiQuyetDinh.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbLoaiQuyetDinh.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbLoaiQuyetDinh.AutoCompleteCustomSource = data;
        }
    }
}
