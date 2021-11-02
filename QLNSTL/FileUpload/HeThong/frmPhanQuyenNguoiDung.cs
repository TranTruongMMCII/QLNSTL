using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNSTL.HeThong
{
    public partial class frmPhanQuyenNguoiDung : Form
    {
        public frmPhanQuyenNguoiDung()
        {
            InitializeComponent();
        }

        private void frmPhanQuyenNguoiDung_Load(object sender, EventArgs e)
        {
            
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
            cmbBoPhan.SelectedIndex = 0;
        }

        private void cmbBoPhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbNhanVien.DataSource = null;
            string BoPhanID = Convert.ToString(((DataRowView)cmbBoPhan.SelectedItem).Row["BoPhanID"]);
            string sql = @"select a.NhanVienID, a.TenNV from NhanVien a 
                            inner join NhanVienBoPhan b on a.NhanVienID = b.NhanVienID and b.BoPhanID = '" + BoPhanID + "'";
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

        private void cmbNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cmbNhanVien.SelectedValue != null)
            {
                cmbNguoiDung.DataSource = null;
                string NhanVienID = Convert.ToString(((DataRowView)cmbNhanVien.SelectedItem).Row["NhanVienID"]);
                string sql = @"select a.NguoiDungID, a.TenDangNhap from NguoiDung a 
                           inner join NhanVien b on a.NhanVienID = b.NhanVienID and b.NhanVienID = '" + NhanVienID + "'";
                DataTable dtNguoiDung = Core.Core.GetData(sql);
                cmbNguoiDung.DataSource = dtNguoiDung;
                cmbNguoiDung.ValueMember = "NguoiDungID";
                cmbNguoiDung.DisplayMember = "TenDangNhap";
                AutoCompleteStringCollection data = new AutoCompleteStringCollection();
                string[] src;
                src = dtNguoiDung
                         .AsEnumerable()
                         .Select<System.Data.DataRow, String>(x => x.Field<String>("TenDangNhap"))
                         .ToArray();
                data.AddRange(src);
                this.cmbNguoiDung.DroppedDown = true;
                this.cmbNguoiDung.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
                this.cmbNguoiDung.AutoCompleteSource = AutoCompleteSource.ListItems;
                cmbNguoiDung.AutoCompleteCustomSource = data;
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "delete from QuyenNguoiDung where NguoiDungID = '" + cmbNguoiDung.SelectedValue + "'";
                Core.Core.RunSql(sql);
                if (cbQLHT.Checked == true)
                {
                    sql = "Insert into QuyenNguoiDung(NguoiDungID, NghiepVuID) values ('" + cmbNguoiDung.SelectedValue + "', '1')";
                    Core.Core.RunSql(sql);
                }
                if (cbQLDanhMuc.Checked == true)
                {
                    sql = "Insert into QuyenNguoiDung(NguoiDungID, NghiepVuID) values ('" + cmbNguoiDung.SelectedValue + "', '2')";
                    Core.Core.RunSql(sql);
                }
                if (cbQLNhanSu.Checked == true)
                {
                    sql = "Insert into QuyenNguoiDung(NguoiDungID, NghiepVuID) values ('" + cmbNguoiDung.SelectedValue + "', '3')";
                    Core.Core.RunSql(sql);
                }
                if (cbQLTienLuong.Checked == true)
                {
                    sql = "Insert into QuyenNguoiDung(NguoiDungID, NghiepVuID) values ('" + cmbNguoiDung.SelectedValue + "', '4')";
                    Core.Core.RunSql(sql);
                }
                if (cbTKBaoCao.Checked == true)
                {
                    sql = "Insert into QuyenNguoiDung(NguoiDungID, NghiepVuID) values ('" + cmbNguoiDung.SelectedValue + "', '5')";
                    Core.Core.RunSql(sql);
                }
                MessageBox.Show("Lưu thành công");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi lưu");
            }
            
        }

        private void cmbNguoiDung_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult hoi;
            hoi = MessageBox.Show("Bạn có muốn thoát không?", "Thông báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Hand);
            if (hoi == DialogResult.Yes)
            this.Close();
        }
    }
}
