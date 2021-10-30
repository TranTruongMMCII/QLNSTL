using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QLNSTL.BaoCao
{
    public partial class ThongKeHopDongHetHan : DevExpress.XtraReports.UI.XtraReport
    {
        public ThongKeHopDongHetHan(string trangthaiID)
        {
            InitializeComponent();
            txtTrangThai.Text = trangthaiID;
        }

    }
}
