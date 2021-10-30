using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QLNSTL.BaoCao
{
    public partial class ThongKeDanhGiaNhanVien : DevExpress.XtraReports.UI.XtraReport
    {
        public ThongKeDanhGiaNhanVien(string tenbophan, string bophanID, string thang)
        {
            InitializeComponent();
            txtTenBoPhan.Text = thang;
            txtThang.Text = tenbophan;
        }
        

    }
}
