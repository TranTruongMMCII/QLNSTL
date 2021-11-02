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
    public partial class frmNhanVienChucDanh : Form
    {
        public frmNhanVienChucDanh()
        {
            InitializeComponent();
            GridLocalizer.Active = new MyGridLocalizer();
        }
        int kt = 0;
        int NhanVienID = 0;
        void Load_DL()
        {
            string sql = @"SELECT DISTINCT BP.BoPhanID, BP.TenBoPhan, CDNV.TenChucDanh, CDNV.TenNV, NVBP.NhanVienID, CDNV.ChucDanhID
                           FROM NhanVienBoPhan NVBP
                           INNER JOIN BoPhan BP ON NVBP.BoPhanID = BP.BoPhanID
                           INNER JOIN 
	                       (SELECT LCD.ChucDanhID, LCD.TenChucDanh, NVCD.NhanVienID, NV.TenNV
	                        FROM NhanVienChucDanh NVCD
	                        INNER JOIN LuongChucDanh LCD ON NVCD.ChucDanhID = LCD.ChucDanhID
	                        INNER JOIN NhanVien NV ON NVCD.NhanVienID = NV.NhanVienID) 
		                    AS CDNV ON NVBP.NhanVienID = CDNV.NhanVienID";
            DataTable dt = Core.Core.GetData(sql);
            grdNhanVienChucDanh.DataSource = dt;
        }
        void Reset()
        {
            btnThem.Enabled = true;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnHuybo.Enabled = false;
            btnCapNhat.Enabled = false;
            cmbTenChucDanh.Enabled = false;
            cmbBoPhan.Enabled = false;
            cmbNhanVien.Enabled = false;
        }

        private void frmNhanVienChucDanh_Load(object sender, EventArgs e)
        {
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;

            string sql = "Select * from BoPhan";
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

            sql = "Select * from LuongChucDanh";
            DataTable dt2 = Core.Core.GetData(sql);
            cmbTenChucDanh.DataSource = dt2;
            cmbTenChucDanh.ValueMember = "ChucDanhID";
            cmbTenChucDanh.DisplayMember = "TenChucDanh";
            src = dt2
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenChucDanh"))
                     .ToArray();
            data.AddRange(src);
            this.cmbTenChucDanh.DroppedDown = true;
            this.cmbTenChucDanh.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTenChucDanh.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTenChucDanh.AutoCompleteCustomSource = data;
            Load_DL();
            Reset();
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
            cmbTenChucDanh.Enabled = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            kt = 2;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnCapNhat.Enabled = true;
            btnHuybo.Enabled = true;
            btnXoa.Enabled = false;
            cmbNhanVien.Enabled = true;
            cmbBoPhan.Enabled = true;
            cmbTenChucDanh.Enabled = true;
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (kt == 1)
            {
                if(cmbNhanVien.SelectedValue.ToString() != "")
                {
                    MessageBox.Show("Không đc phép nhập trùng");
                }
                else {  string sql = "Insert into NhanVienChucDanh(NhanVienID, ChucDanhID) values ('" + cmbNhanVien.SelectedValue + "', '" + cmbTenChucDanh.SelectedValue + "')";
                if (Core.Core.RunSql(sql) == -1)
                {
                    MessageBox.Show("Lỗi khi thêm mới");
                }
                else
                {
                    Load_DL();
                }}
               
            }
            else
            {
                string sql = "Update NhanVienChucDanh set NhanVienID ='" + cmbNhanVien.SelectedValue + "', ChucDanhID = '" + cmbTenChucDanh.SelectedValue + "' where NhanVienID = '" + cmbNhanVien.SelectedValue + "'";
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
            string sql = "Delete NhanVienChucDanh where NhanVienID = '" + cmbNhanVien.SelectedValue + "' AND ChucDanhID = '"+cmbTenChucDanh.SelectedValue+"'";
            Core.Core.RunSql(sql);
            Load_DL();
            Reset();
        }

        private void gridView1_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            cmbTenChucDanh.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("ChucDanhID").ToString());
            cmbBoPhan.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("BoPhanID").ToString());
            cmbNhanVien.SelectedValue = int.Parse(gridView1.GetFocusedRowCellValue("NhanVienID").ToString());
        }

        private void cmbBoPhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            string BoPhanID = Convert.ToString(((DataRowView)cmbBoPhan.SelectedItem).Row["BoPhanID"]);
            string sql = "select a.NhanVienID, a.TenNV from NhanVien a INNER JOIN NhanVienBoPhan b on a.NhanVienID = b.NhanVienID and b.BoPhanID = '"+BoPhanID+"'";
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
    }
}
