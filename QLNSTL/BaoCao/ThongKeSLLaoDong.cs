using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QLNSTL.BaoCao
{
    public partial class ThongKeSLLaoDong : DevExpress.XtraReports.UI.XtraReport
    {
        public ThongKeSLLaoDong( string trangthaiID)
        {
            InitializeComponent();
            txtTrangThai.Text = trangthaiID;
        }

    }
}
