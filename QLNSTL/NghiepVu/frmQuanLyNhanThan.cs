using DevExpress.XtraGrid.Localization;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNSTL.NghiepVu
{
    public partial class frmQuanLyNhanThan : Form
    {
        public frmQuanLyNhanThan()
        {
            InitializeComponent();
            GridLocalizer.Active = new MyGridLocalizer();
        }
        int kt = 0;
        int NguoiThanID = 0;
        void Load_DL()
        {
            string sql = @"select a.NhanVienID, a.NguoiThanID, b.TenNV, b.MaNV, c.MoiQuanHeID, c.TenMoiQuanHe, a.TenNguoiThan, a.NgheNghiep, a.SDT, a.DiaChi, d.BoPhanID from NguoiThan a 
                           inner join NhanVien b on a.NhanVienID = b.NhanVienID
                           inner join MoiQuanHe c on a.MoiQuanHeID = c.MoiQuanHeID
                           inner join NhanVienBoPhan d on a.NhanVienID = d.NhanVienID";
            DataTable dt = Core.Core.GetData(sql);
            grdQuanlinhanthan.DataSource = dt;
        }
        void Reset()
        {
            cmbBoPhan.Enabled = false;
            cmbNhanVien.Enabled = false;
            cmbMQH.Enabled = false;
            btnCapNhat.Enabled = false;
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnHuybo.Enabled = false;
            txtDiaChi.Enabled = false;
            txtDiaChi.Text = "";
            txtNgheNghiep.Text = "";
            txtSDT.Text = "";
            txtTenNguoiThan.Text = "";
            txtNgheNghiep.Enabled = false;
            txtSDT.Enabled = false;
            txtTenNguoiThan.Enabled = false;
        }

        private void frmQuanLiNhanThan_Load(object sender, EventArgs e)
        {
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            string sql = "Select * from BoPhan";
            DataTable dt = Core.Core.GetData(sql);
            cmbBoPhan.DataSource = dt;
            cmbBoPhan.ValueMember = "BoPhanID";
            cmbBoPhan.DisplayMember = "TenBoPhan";
            src = dt
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenBoPhan"))
                     .ToArray();
            data.AddRange(src);
            this.cmbBoPhan.DroppedDown = true;
            this.cmbBoPhan.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbBoPhan.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbBoPhan.AutoCompleteCustomSource = data;

            sql = "Select * from MoiQuanHe";
            DataTable dt1 = Core.Core.GetData(sql);
            cmbMQH.DataSource = dt1;
            cmbMQH.ValueMember = "MoiQuanHeID";
            cmbMQH.DisplayMember = "TenMoiQuanHe";
            src = dt1
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenMoiQuanHe"))
                     .ToArray();
            data.AddRange(src);
            this.cmbMQH.DroppedDown = true;
            this.cmbMQH.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbMQH.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbMQH.AutoCompleteCustomSource = data;
            Load_DL();
            Reset();
        }

        private void cmbBoPhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            string BoPhanID = Convert.ToString(((DataRowView)cmbBoPhan.SelectedItem).Row["BoPhanID"]);
            string sql = "select a.NhanVienID, a.TenNV from NhanVien a INNER JOIN NhanVienBoPhan b on a.NhanVienID = b.NhanVienID and b.BoPhanID = '" + BoPhanID + "'";
            DataTable dtNhanVien = Core.Core.GetData(sql);
            cmbNhanVien.DataSource = dtNhanVien;
            cmbNhanVien.ValueMember = "NhanVienID";
            cmbNhanVien.DisplayMember = "TenNV";
            src = dtNhanVien
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenNV"))
                     .ToArray();
            data.AddRange(src);
            this.cmbNhanVien.DroppedDown = true;
            this.cmbNhanVien.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbNhanVien.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbNhanVien.AutoCompleteCustomSource = data;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            kt = 1;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnCapNhat.Enabled = true;
            btnHuybo.Enabled = true;
            btnXoa.Enabled = false;
            cmbBoPhan.Enabled = true;
            cmbNhanVien.Enabled = true;
            cmbMQH.Enabled = true;
            txtDiaChi.Enabled = true;
            txtNgheNghiep.Enabled = true;
            txtSDT.Enabled = true;
            txtTenNguoiThan.Enabled = true;
            txtDiaChi.Text = "";
            txtNgheNghiep.Text = "";
            txtSDT.Text = "";
            txtTenNguoiThan.Text = "";
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            kt = 2;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnCapNhat.Enabled = true;
            btnHuybo.Enabled = true;
            btnXoa.Enabled = false;
            cmbBoPhan.Enabled = true;
            cmbNhanVien.Enabled = true;
            cmbMQH.Enabled = true;
            txtDiaChi.Enabled = true;
            txtNgheNghiep.Enabled = true;
            txtSDT.Enabled = true;
            txtTenNguoiThan.Enabled = true;
        }

        private void btnHuybo_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (kt == 1)
            {
                string sql = "Insert into NguoiThan(NhanVienID, MoiQuanHeID, TenNguoiThan, NgheNghiep, SDT, DiaChi) values ('" + cmbNhanVien.SelectedValue + "', '" + cmbMQH.SelectedValue + "', N'" + txtTenNguoiThan.Text + "', N'" + txtNgheNghiep.Text + "', '"+txtSDT.Text+"', N'"+txtDiaChi.Text+"')";
                if (Core.Core.RunSql(sql) == -1)
                {
                    MessageBox.Show("Lỗi khi thêm mới");
                }
                else
                {
                    Load_DL();
                }
            }
            else
            {
                string sql = "Update NguoiThan set NhanVienID ='" + cmbNhanVien.SelectedValue + "', MoiQuanHeID = '" + cmbMQH.SelectedValue + "', TenNguoiThan = N'" + txtTenNguoiThan.Text + "', NgheNghiep = N'" + txtNgheNghiep.Text + "', SDT = '"+txtSDT.Text+"', DiaChi = '"+txtDiaChi.Text+"' where NguoiThanID = '" + NguoiThanID + "'";
                Core.Core.RunSql(sql);
                Load_DL();
            }
            Reset();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql = "Delete NguoiThan where NguoiThanID = '" + NguoiThanID + "'";
            Core.Core.RunSql(sql);
            Load_DL();
            Reset();
        }

        private void gridView1_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            NguoiThanID = int.Parse(gridView1.GetFocusedRowCellValue("NguoiThanID").ToString());
            txtDiaChi.Text = gridView1.GetFocusedRowCellValue("DiaChi").ToString();
            cmbBoPhan.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("BoPhanID").ToString());
            cmbMQH.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("MoiQuanHeID").ToString());
            txtNgheNghiep.Text = gridView1.GetFocusedRowCellValue("NgheNghiep").ToString();
            txtSDT.Text = gridView1.GetFocusedRowCellValue("SDT").ToString();
            txtTenNguoiThan.Text = gridView1.GetFocusedRowCellValue("TenNguoiThan").ToString();
            cmbNhanVien.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("NhanVienID").ToString());
        }

        private void txtSDT_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Bạn không được phép nhập chữ");
            }
        }

        private void txtTenNguoiThan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Bạn không được phép nhập số");
            }
        }
    }
}
