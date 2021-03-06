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
    public partial class frmBaoCaoBangCapChungChi : Form
    {
        public frmBaoCaoBangCapChungChi()
        {
            InitializeComponent();
        }
        protected void LoadBaoCao()
        {
            try
            {
                BaoCaoBangCapChungChi reports = new BaoCaoBangCapChungChi(cmbTenBoPhan.Text, cmbTenBoPhan.SelectedValue.ToString());
                reports.Parameters["BoPhanID"].Value = Convert.ToString(((DataRowView)cmbTenBoPhan.SelectedItem).Row["BoPhanID"]);
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

        private void frmBaoCaoBangCapChungChi_Load(object sender, EventArgs e)
        {
            LoadBaoCao();
            string sql = "select *from BoPhan";
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
        }
    }
}
