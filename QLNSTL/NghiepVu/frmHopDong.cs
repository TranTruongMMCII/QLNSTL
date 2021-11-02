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
    public partial class frmHopDong : Form
    {
        public frmHopDong()
        {
            InitializeComponent();
            GridLocalizer.Active = new MyGridLocalizer();
        }
        int kt = 0;
        int HopDongID = 0;
        void Load_DL()
        {
            string sql = @"select f.TenBoPhan, e.NhanVienID, e.HopDongID, e.LoaiHopDongID, e.TenNV, e.MaHopDong, e.TenLoaiHopDong, e.NgayKy, e.NgayHieuLuc, e.NgayHetHan, e.NgayKetThuc, e.BoPhanID, e.TrangThai from BoPhan f inner join
                           (select a.NhanVienID, a.TrangThai, a.HopDongID, a.LoaiHopDongID, a.MaHopDong, a.NgayHetHan, a.NgayHieuLuc, a.NgayKetThuc, a.NgayKy, b.TenLoaiHopDong, c.TenNV, d.BoPhanID from HopDong a
                           inner join LoaiHopDong b on a.LoaiHopDongID = b.LoaiHopDongID 
                           inner join NhanVien c on a.NhanVienID = c.NhanVienID
                           inner join NhanVienBoPhan d on a.NhanVienID = d.NhanVienID) as e on f.BoPhanID = e.BoPhanID";
            DataTable dt = Core.Core.GetData(sql);
            grdHopDong.DataSource = dt;
        }
        void Reset()
        {
            cmbBoPhan.Enabled = false;
            cmbNhanVien.Enabled = false;
            cmbTenLoaiHopDong.Enabled = false;
            dtpNgayHetHan.Enabled = false;
            dtpNgayHieuLuc.Enabled = false;
            dtpNgayKetThuc.Enabled = false;
            dtpNgayKy.Enabled = false;
            btnCapNhat.Enabled = false;
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnHuybo.Enabled = false;
            txtMaHopDong.Enabled = false;
            txtMaHopDong.Text = "";
            cbTrangThai.Enabled = false;
        }

        private void frmHopDong_Load(object sender, EventArgs e)
        {
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            string sql = "Select * from LoaiHopDong";
            DataTable dt = Core.Core.GetData(sql);
            cmbTenLoaiHopDong.DataSource = dt;
            cmbTenLoaiHopDong.ValueMember = "LoaiHopDongID";
            cmbTenLoaiHopDong.DisplayMember = "TenLoaiHopDong";
            src = dt
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenLoaiHopDong"))
                     .ToArray();
            data.AddRange(src);
            this.cmbTenLoaiHopDong.DroppedDown = true;
            this.cmbTenLoaiHopDong.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTenLoaiHopDong.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTenLoaiHopDong.AutoCompleteCustomSource = data;

            sql = "Select * from BoPhan";
            DataTable dt1 = Core.Core.GetData(sql);
            cmbBoPhan.DataSource = dt1;
            cmbBoPhan.ValueMember = "BoPhanID";
            cmbBoPhan.DisplayMember = "TenBoPhan";
            src = dt1
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenBoPhan"))
                     .ToArray();
            data.AddRange(src);
            this.cmbBoPhan.DroppedDown = true;
            this.cmbBoPhan.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbBoPhan.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbBoPhan.AutoCompleteCustomSource = data;
            Load_DL();
            Reset();
        }

        private void cmbBoPhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            string BoPhanID = Convert.ToString(((DataRowView)cmbBoPhan.SelectedItem).Row["BoPhanID"]);
            string sql = "select a.NhanVienID, a.TenNV from NhanVien a INNER JOIN NhanVienBoPhan b on a.NhanVienID = b.NhanVienID and b.BoPhanID = '" + BoPhanID + "'";
            DataTable dtNhanVien = Core.Core.GetData(sql);
            cmbNhanVien.DataSource = dtNhanVien;
            cmbNhanVien.ValueMember = "NhanVienID";
            cmbNhanVien.DisplayMember = "TenNV";
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
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
            cmbBoPhan.Enabled = true;
            cmbNhanVien.Enabled = true;
            cmbTenLoaiHopDong.Enabled = true;
            dtpNgayHetHan.Enabled = true;
            dtpNgayHieuLuc.Enabled = true;
            dtpNgayKetThuc.Enabled = true;
            dtpNgayKy.Enabled = true;
            btnCapNhat.Enabled = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnHuybo.Enabled = true;
            txtMaHopDong.Enabled = true;
            txtMaHopDong.Text = "";
            cbTrangThai.Enabled = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            kt = 2;
            cmbBoPhan.Enabled = true;
            cmbNhanVien.Enabled = true;
            cmbTenLoaiHopDong.Enabled = true;
            dtpNgayHetHan.Enabled = true;
            dtpNgayHieuLuc.Enabled = true;
            dtpNgayKetThuc.Enabled = true;
            dtpNgayKy.Enabled = true;
            btnCapNhat.Enabled = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnHuybo.Enabled = true;
            txtMaHopDong.Enabled = true;
            cbTrangThai.Enabled = true;
        }

        private void btnHuybo_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (kt == 1)
            {
                string sql = "Insert into HopDong( MaHopDong, LoaiHopDongID, NgayKy, NgayHieuLuc, NgayHetHan, NhanVienID, NgayKetThuc, TrangThai) values ('" + txtMaHopDong.Text + "', '" + cmbTenLoaiHopDong.SelectedValue + "', '" + dtpNgayKy.Value + "', '" + dtpNgayHieuLuc.Value + "', '"+dtpNgayHetHan.Value+"', '"+cmbNhanVien.SelectedValue+"', '"+dtpNgayKetThuc.Value+"', '"+cbTrangThai.Checked+"')";
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
                string sql = "Update HopDong set MaHopDong ='" + txtMaHopDong.Text + "', LoaiHopDongID = '" + cmbTenLoaiHopDong.SelectedValue + "', NgayKy = '" + dtpNgayKy.Value + "', NgayHieuLuc = '" + dtpNgayHieuLuc.Value + "', NgayHetHan = '"+dtpNgayHetHan.Value+"', NgayKetThuc = '"+dtpNgayKetThuc.Value+"', NhanVienID = '"+cmbNhanVien.SelectedValue+"', TrangThai = '"+cbTrangThai.Checked+"' where HopDongID = '" + HopDongID + "'";
                Core.Core.RunSql(sql);
                Load_DL();
            }
            Reset();
        }

        private void gridView1_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            HopDongID = int.Parse(gridView1.GetFocusedRowCellValue("HopDongID").ToString());
            txtMaHopDong.Text = gridView1.GetFocusedRowCellValue("MaHopDong").ToString();
            cmbBoPhan.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("BoPhanID").ToString());
            cmbNhanVien.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("NhanVienID").ToString());
            cmbTenLoaiHopDong.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("LoaiHopDongID").ToString());
            dtpNgayKy.Value = DateTime.Parse(gridView1.GetFocusedRowCellValue("NgayKy").ToString());
            dtpNgayHieuLuc.Value = DateTime.Parse(gridView1.GetFocusedRowCellValue("NgayHieuLuc").ToString());
            dtpNgayKetThuc.Value = DateTime.Parse(gridView1.GetFocusedRowCellValue("NgayKetThuc").ToString());
            dtpNgayHetHan.Value = DateTime.Parse(gridView1.GetFocusedRowCellValue("NgayHetHan").ToString());
            cbTrangThai.Checked = Boolean.Parse(gridView1.GetFocusedRowCellValue("TrangThai").ToString());
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql = "Delete HopDong where HopDongID = '" + HopDongID + "'";
            Core.Core.RunSql(sql);
            Load_DL();
            Reset();
        }
    }
}
