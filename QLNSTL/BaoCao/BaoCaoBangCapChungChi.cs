using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace QLNSTL.BaoCao
{
    public partial class BaoCaoBangCapChungChi : DevExpress.XtraReports.UI.XtraReport
    {
        public BaoCaoBangCapChungChi(string tenbophan, string bophanID)
        {
            InitializeComponent();
            txtTenBoPhan.Text = tenbophan;
        }

    }
}
