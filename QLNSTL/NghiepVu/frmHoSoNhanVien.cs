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
    public partial class frmHoSoNhanVien : Form
    {
        public frmHoSoNhanVien()
        {
            InitializeComponent();
            GridLocalizer.Active = new MyGridLocalizer();
        }
        int kt = 0;
        //int NhanVienID = 0;
        void Load_DL()
        {
            string sql = @"select b.NhanVienID, b.TenNV, a.NgayVaoLam, c.DanTocID, c.TenDanToc, d.TonGiaoID, d.TenTonGiao, e.TinhThanhID, e.TenTinhThanh,f.NgoaiNguID, f.TenCCNN, g.TinHocID, g.TenCCTH, h.BangCapID, h.TenBangCap, a.GhiChu 
                            from HoSoNhanVien a 
                            inner join NhanVien b on a.NhanVienID=b.NhanVienID
                            inner join DanToc c on a.DanTocID=c.DanTocID
                            inner join TonGiao d on a.TonGiaoID=d.TonGiaoID
                            inner join TinhThanh e on a.TinhThanhID=e.TinhThanhID
                            inner join NgoaiNgu f on a.NgoaiNguID=f.NgoaiNguID
                            inner join TinHoc g on a.TinHocID=g.TinHocID
                            inner join BangCap h on a.BangCapID=h.BangCapID";
            DataTable dt = Core.Core.GetData(sql);
            grdHoSoNhanVien.DataSource = dt;
        }
        void Reset()
        {
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnHuybo.Enabled = false;
            btnCapNhat.Enabled = false;
            cmbTenNV.Enabled = false;
            cmbBangCap.Enabled = false;
            cmbDanToc.Enabled = false;
            cmbNgoaiNgu.Enabled = false;
            cmbTinHoc.Enabled = false;
            cmbTinhThanh.Enabled = false;
            cmbTonGiao.Enabled = false;
            txtGhiChu.Enabled = false;
            dtpNgayVaoLam.Enabled = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            kt = 1;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnCapNhat.Enabled = true;
            btnHuybo.Enabled = true;
            btnXoa.Enabled = false;
            cmbTenNV.Enabled = true;
            cmbBangCap.Enabled = true;
            cmbDanToc.Enabled = true;
            cmbNgoaiNgu.Enabled = true;
            cmbTinHoc.Enabled = true;
            cmbTinhThanh.Enabled = true;
            cmbTonGiao.Enabled = true;
            txtGhiChu.Enabled = true;
            dtpNgayVaoLam.Enabled = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            kt = 2;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnCapNhat.Enabled = true;
            btnHuybo.Enabled = true;
            btnXoa.Enabled = false;
            cmbBangCap.Enabled = true;
            cmbDanToc.Enabled = true;
            cmbNgoaiNgu.Enabled = true;
            cmbTinHoc.Enabled = true;
            cmbTinhThanh.Enabled = true;
            cmbTonGiao.Enabled = true;
            txtGhiChu.Enabled = true;
            dtpNgayVaoLam.Enabled = true;
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (kt == 1)
            {
                string sql = "Insert into HoSoNhanVien(NhanVienID, NgayVaoLam, DanTocID, TonGiaoID, TinhThanhID, NgoaiNguID, TinHocID, BangCapID, GhiChu) values ('" + cmbTenNV.SelectedValue + "', '" + dtpNgayVaoLam.Value + "', '" + cmbDanToc.SelectedValue + "', '" + cmbTonGiao.SelectedValue + "', '" + cmbTinhThanh.SelectedValue + "', '" + cmbNgoaiNgu.SelectedValue + "', '" + cmbTinHoc.SelectedValue + "', '" + cmbBangCap.SelectedValue + "', '" + txtGhiChu.Text + "' )";
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
                string sql = "Update HoSoNhanVien set NhanVienID ='" + cmbTenNV.SelectedValue + "', NgayVaoLam = '" + dtpNgayVaoLam.Value + "', DanTocID='" + cmbDanToc.SelectedValue + "',  TonGiaoID='" + cmbTonGiao.SelectedValue + "', TinhThanhID='" + cmbTinhThanh.SelectedValue + "', NgoaiNguID='" + cmbNgoaiNgu.SelectedValue + "', TinHocID='" + cmbTinHoc.SelectedValue + "', BangCapID='" + cmbBangCap.SelectedValue + "',GhiChu='" + txtGhiChu.Text + "' where NhanVienID = '" + cmbTenNV.SelectedValue + "'";
                Core.Core.RunSql(sql);
                Load_DL();
            }
            Reset();
        }

        private void btnHuybo_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql = "Delete HoSoNhanVien where NhanVienID='" + cmbTenNV.SelectedValue + "'";
            Core.Core.RunSql(sql);
            Load_DL();
            Reset();

        }

        private void frmHoSoNV_Load(object sender, EventArgs e)
        {
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            string sql = "Select * from DanToc";
            DataTable dt1 = Core.Core.GetData(sql);
            cmbDanToc.DataSource = dt1;
            cmbDanToc.ValueMember = "DanTocID";
            cmbDanToc.DisplayMember = "TenDanToc";
            src = dt1
                    .AsEnumerable()
                    .Select<System.Data.DataRow, String>(x => x.Field<String>("TenDanToc"))
                    .ToArray();
            data.AddRange(src);
            this.cmbDanToc.DroppedDown = true;
            this.cmbDanToc.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbDanToc.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbDanToc.AutoCompleteCustomSource = data;

            sql = "Select * from TonGiao";
            DataTable dt2 = Core.Core.GetData(sql);
            cmbTonGiao.DataSource = dt2;
            cmbTonGiao.ValueMember = "TonGiaoID";
            cmbTonGiao.DisplayMember = "TenTonGiao";
            src = dt2
                    .AsEnumerable()
                    .Select<System.Data.DataRow, String>(x => x.Field<String>("TenTonGiao"))
                    .ToArray();
            data.AddRange(src);
            this.cmbTonGiao.DroppedDown = true;
            this.cmbTonGiao.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTonGiao.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTonGiao.AutoCompleteCustomSource = data;

            sql = "Select * from TinhThanh";
            DataTable dt3 = Core.Core.GetData(sql);
            cmbTinhThanh.DataSource = dt3;
            cmbTinhThanh.ValueMember = "TinhThanhID";
            cmbTinhThanh.DisplayMember = "TenTinhThanh";
            src = dt3
                    .AsEnumerable()
                    .Select<System.Data.DataRow, String>(x => x.Field<String>("TenTinhThanh"))
                    .ToArray();
            data.AddRange(src);
            this.cmbTinhThanh.DroppedDown = true;
            this.cmbTinhThanh.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTinhThanh.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTinhThanh.AutoCompleteCustomSource = data;

            sql = "Select * from NgoaiNgu";
            DataTable dt4 = Core.Core.GetData(sql);
            cmbNgoaiNgu.DataSource = dt4;
            cmbNgoaiNgu.ValueMember = "NgoaiNguID";
            cmbNgoaiNgu.DisplayMember = "TenCCNN";
            src = dt4
                    .AsEnumerable()
                    .Select<System.Data.DataRow, String>(x => x.Field<String>("TenCCNN"))
                    .ToArray();
            data.AddRange(src);
            this.cmbNgoaiNgu.DroppedDown = true;
            this.cmbNgoaiNgu.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbNgoaiNgu.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbNgoaiNgu.AutoCompleteCustomSource = data;

            sql = "Select * from TinHoc";
            DataTable dt5 = Core.Core.GetData(sql);
            cmbTinHoc.DataSource = dt5;
            cmbTinHoc.ValueMember = "TinHocID";
            cmbTinHoc.DisplayMember = "TenCCTH";
            src = dt5
                    .AsEnumerable()
                    .Select<System.Data.DataRow, String>(x => x.Field<String>("TenCCTH"))
                    .ToArray();
            data.AddRange(src);
            this.cmbTinHoc.DroppedDown = true;
            this.cmbTinHoc.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTinHoc.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTinHoc.AutoCompleteCustomSource = data;

            sql = "Select * from BangCap";
            DataTable dt6 = Core.Core.GetData(sql);
            cmbBangCap.DataSource = dt6;
            cmbBangCap.ValueMember = "BangCapID";
            cmbBangCap.DisplayMember = "TenBangCap";
            src = dt6
                    .AsEnumerable()
                    .Select<System.Data.DataRow, String>(x => x.Field<String>("TenBangCap"))
                    .ToArray();
            data.AddRange(src);
            this.cmbBangCap.DroppedDown = true;
            this.cmbBangCap.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbBangCap.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbBangCap.AutoCompleteCustomSource = data;

            sql = "Select * from NhanVien";
            DataTable dt7 = Core.Core.GetData(sql);
            cmbTenNV.DataSource = dt7;
            cmbTenNV.ValueMember = "NhanVienID";
            cmbTenNV.DisplayMember = "TenNV";
            src = dt7
                    .AsEnumerable()
                    .Select<System.Data.DataRow, String>(x => x.Field<String>("TenNV"))
                    .ToArray();
            data.AddRange(src);
            this.cmbTenNV.DroppedDown = true;
            this.cmbTenNV.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTenNV.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTenNV.AutoCompleteCustomSource = data;
            Load_DL();
            Reset();
        }

        private void gridView1_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            //NhanVienID= int.Parse(gridView1.GetFocusedRowCellValue("NhanVienID").ToString());
            cmbTenNV.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("NhanVienID").ToString());
            dtpNgayVaoLam.Value = DateTime.Parse(gridView1.GetFocusedRowCellValue("NgayVaoLam").ToString());
            cmbDanToc.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("DanTocID").ToString());
            cmbTonGiao.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("TonGiaoID").ToString());
            cmbTinhThanh.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("TinhThanhID").ToString());
            cmbNgoaiNgu.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("NgoaiNguID").ToString());
            cmbTinHoc.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("TinHocID").ToString());
            cmbBangCap.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("BangCapID").ToString());
            txtGhiChu.Text = gridView1.GetFocusedRowCellValue("GhiChu").ToString();
        }
    }
}
