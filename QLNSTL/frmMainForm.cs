using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraBars;
using QLNSTL.DanhMuc;
using QLNSTL.NghiepVu;
using QLNSTL.HeThong;
using QLNSTL.BaoCao;
namespace QLNSTL
{
    public partial class frmMainForm : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        string NguoiDungID;
        public frmMainForm(string NguoiDungID_Login)
        {
            InitializeComponent();
            // maximum form
            NguoiDungID = NguoiDungID_Login;
        }

        private void btnDanToc_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmDanToc = new DanhMuc.frmDanToc();
            frmDanToc.ShowDialog();
        }

        private void btnTonGiao_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmTonGiao = new DanhMuc.frmTonGiao();
            frmTonGiao.ShowDialog();
        }

        private void btnTinhThanh_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmTinhThanh = new DanhMuc.frmTinhThanh();
            frmTinhThanh.ShowDialog();
        }

        private void btnBoPhan_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmBoPhan = new DanhMuc.frmBoPhan();
            frmBoPhan.ShowDialog();
        }

        private void btnLoaiHopDong_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmLoaiHopDong = new DanhMuc.frmLoaiHopDong();
            frmLoaiHopDong.ShowDialog();
        }

        private void btnBangCap_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmBangCap = new DanhMuc.frmBangCap();
            frmBangCap.ShowDialog();
        }

        private void btnCCNgoaiNgu_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmCCNgoaiNgu = new DanhMuc.frmChungChiNgoaiNgu();
            frmCCNgoaiNgu.ShowDialog();
        }

        private void btnCCTinHoc_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmCCTinHoc = new DanhMuc.frmChungChiTinHoc();
            frmCCTinHoc.ShowDialog();
        }

        private void btnTamUng_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmTamUng = new DanhMuc.frmTamUng();
            frmTamUng.ShowDialog();
        }

        private void btnMoiQuanHe_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmMoiQuanHe = new DanhMuc.frmMoiQuanHe();
            frmMoiQuanHe.ShowDialog();
        }

        private void btnLoaiQuyetDinh_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmLoaiQuyetDinh = new DanhMuc.frmLoaiQuyetDinh();
            frmLoaiQuyetDinh.ShowDialog();
        }

        private void btnNhanVien_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmNhanVien = new NghiepVu.frmNhanVien();
            frmNhanVien.ShowDialog();
        }

        private void btnHoSoNhanVien_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new NghiepVu.frmHoSoNhanVien();
            form.ShowDialog();
        }

        private void btnThanNhan_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new NghiepVu.frmQuanLyNhanThan();
            form.ShowDialog();
        }

        private void btnNhanVienChucDanh_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new NghiepVu.frmNhanVienChucDanh();
            form.ShowDialog();
        }

        private void btnNhanVienBP_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new NghiepVu.frmNhanVienBoPhan();
            form.ShowDialog();
        }

        private void btnKhenThuongKyLuat_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new NghiepVu.frmKhenThuongKiLuat();
            form.ShowDialog();
        }

        private void btnDanhGia_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new NghiepVu.frmDanhGiaHieuSuat();
            form.ShowDialog();
        }

        private void btnLuongChucDanh_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new NghiepVu.frmLuongChucDanh();
            form.ShowDialog();
        }

        private void btnDoiMK_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmDoiMatKhau = new HeThong.frmDoiMatKhau();
            frmDoiMatKhau.ShowDialog();
        }

        private void btnHSNhanVien_ItemClick(object sender, ItemClickEventArgs e)
        {

            var form = new BaoCao.frmBaoCaoHoSoNV();
            form.ShowDialog();
        }

        private void frmMainForm_Load(object sender, EventArgs e)
        {
            LoadQuyen();
        }

        private void LoadQuyen()
        {
            // load phan quyen
            string sql = @"Select QuanTri From NguoiDung Where NguoiDungID = '" + NguoiDungID + "'";
            DataTable dt = Core.Core.GetData(sql);

            if (dt != null && dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["QuanTri"].ToString() == "0" || dt.Rows[0]["QuanTri"].ToString().ToLower() == "false")
                {
                    sql = @"Select a.NGuoiDungID, a.NghiepVuID, b.URL 
            from QuyenNguoiDung a join NghiepVu b on b.NghiepVuID = a.NghiepVuID Where NguoiDungID = '" + NguoiDungID + "'";

                    dt = Core.Core.GetData(sql);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            switch (dr["URL"].ToString())
                            {
                                case "rbpHeThong":
                                    rbpHeThong.Visible = true;
                                    break;
                                case "rbpDanhMuc":
                                    rbpDanhMuc.Visible = true;
                                    break;
                                case "rbpTienLuong":
                                    rbpTienLuong.Visible = true;
                                    break;
                                case "tbpNhanSu":
                                    tbpNhanSu.Visible = true;
                                    break;
                                case "rbpThongKeBaoCao":
                                    rbpThongKeBaoCao.Visible = true;
                                    break;
                            }
                        }
                    }
                }
                else
                {
                    rbpHeThong.Visible = true;
                    rbpDanhMuc.Visible = true;
                    rbpTienLuong.Visible = true;
                    tbpNhanSu.Visible = true;
                    rbpThongKeBaoCao.Visible = true;
                }
            }
        }

        private void frmMainForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void btnQLTamUng_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmChiTietTamUng = new NghiepVu.frmChiTietTamUng();
            frmChiTietTamUng.ShowDialog();
        }

        private void btnChamCong_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmChamCong = new NghiepVu.frmChamCong();
            frmChamCong.ShowDialog();
        }

        private void btnBKL_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmBanKeLuong = new NghiepVu.frmBanKeLuong();
            frmBanKeLuong.ShowDialog();
        }

        private void btnTienLuong_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new BaoCao.frmBaoCaoLuongHangThang();
            form.ShowDialog();
        }

        private void btnBangChamCong_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new BaoCao.frmBaoCaoChamCongcs();
            form.ShowDialog();
        }

        private void btnBCTamUngHoanUng_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new BaoCao.frmBaoCaoChiTietTamUng();
            form.ShowDialog();
        }

        private void btnBCSoLuongLD_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new BaoCao.frmThongkeSLLaoDong();
            form.ShowDialog();
        }

        private void btnBCKTKL_ItemClick(object sender, ItemClickEventArgs e)
        {
            var form = new BaoCao.frmBaoCaoKTKL();
            form.ShowDialog();
        }

        private void btnBCDanhGiaNV_ItemClick(object sender, ItemClickEventArgs e)
        {

        }

        private void btnBCHopDongHetHan_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmHopDongHetHan = new BaoCao.frmBaoCaoHopDongSapHetHan();
            frmHopDongHetHan.ShowDialog();
        }

        private void btnNguoiDung_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmNguoiDung = new HeThong.frmQuanLyNguoiDung();
            frmNguoiDung.ShowDialog();
        }

        private void btnPhanQuyen_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmPhanQuyen = new HeThong.frmPhanQuyenNguoiDung();
            frmPhanQuyen.ShowDialog();
        }

        private void btnPhucHoi_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmPhucHoi = new HeThong.frmPhucHoiDuLieu();
            frmPhucHoi.ShowDialog();
        }

        private void btnSaoLuu_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmSaoLuu = new HeThong.frmSaoLuuDuLieu();
            frmSaoLuu.ShowDialog();
        }

        private void btnLogOut_ItemClick(object sender, ItemClickEventArgs e)
        {
            var check = MessageBox.Show("Bạn có muốn đăng xuất ra khỏi hệ thống hay không?", " Thông báo ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (check == DialogResult.Yes)
            {
                // log out
                this.Hide();

                var frmDangNhap = new HeThong.frmDangNhap();
                frmDangNhap.Show();
            }
        }

        private void btnHopDong_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmHopDong = new NghiepVu.frmHopDong();
            frmHopDong.ShowDialog();
        }

        private void btnMauHopDong_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmMauHopDong = new BaoCao.frmMauHopDongLaoDong();
            frmMauHopDong.ShowDialog();
        }

        private void btnHoSoMotNV_ItemClick(object sender, ItemClickEventArgs e)
        {
            var frmHoSoMotNV = new BaoCao.frmBaoCaoHoSoMotNV();
            frmHoSoMotNV.ShowDialog();
        }
    }
}