using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLNSTL.BaoCao
{
    public partial class frmBaoCaoChamCongcs : Form
    {
        public frmBaoCaoChamCongcs()
        {
            InitializeComponent();
        }
        protected void LoadBaoCao()
        {
            try
            {
                this.cmbTenBoPhan.SelectedIndex = 0;
                BaoCaoChamCong reports = new BaoCaoChamCong(cmbTenBoPhan.Text, cmbTenBoPhan.SelectedValue.ToString(), dtpThang.Value.ToString("MM/yyyy"));
                reports.Parameters["BoPhanID"].Value = Convert.ToString(((DataRowView)cmbTenBoPhan.SelectedItem).Row["BoPhanID"]);
                reports.Parameters["Thang"].Value = dtpThang.Value.ToString("yyyyMM");
                //reports.Parameters["Nam"].Value = cmbNam.SelectedValue.ToString();
                documentViewer1.DocumentSource = reports;
                reports.CreateDocument();
            }
            catch (Exception)
            {

              
            }
        }

        private void cmbTenBoPhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBaoCao();
        }

        private void frmBaoCaoChamCongcs_Load(object sender, EventArgs e)
        {
            LoadBaoCao();
            string sql = "Select * from BoPhan";
            DataTable dt = Core.Core.GetData(sql);
            cmbTenBoPhan.DataSource = dt;
            cmbTenBoPhan.ValueMember = "BoPhanID";
            cmbTenBoPhan.DisplayMember = "TenBoPhan";
            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            src = dt
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenBoPhan"))
                     .ToArray();
            data.AddRange(src);
            this.cmbTenBoPhan.DroppedDown = true;
            this.cmbTenBoPhan.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbTenBoPhan.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbTenBoPhan.AutoCompleteCustomSource = data;

            //var item = this.cmbThang.GetItemText(this.cmbThang.SelectedItem);
        }

       
        private void cmbThang_SelectedIndexChanged(object sender, EventArgs e)
        {
             //LoadBaoCao();
        }

        private void cmbNam_SelectedIndexChanged(object sender, EventArgs e)
        {
           // LoadBaoCao();
        }

        private void dtpThang_ValueChanged(object sender, EventArgs e)
        {
            LoadBaoCao();
        }
    }
}
