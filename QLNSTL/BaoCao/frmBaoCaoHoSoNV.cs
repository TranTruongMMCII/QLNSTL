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
    public partial class frmBaoCaoHoSoNV : Form
    {
        public frmBaoCaoHoSoNV()
        {
            InitializeComponent();
        }

        protected void LoadBaoCao()
        {
            try
            {

                BaoCaoHoSoNV reports = new BaoCaoHoSoNV(cmbDonVi.Text, cmbDonVi.SelectedValue.ToString());
                reports.Parameters["BoPhanID"].Value = Convert.ToString(((DataRowView)cmbDonVi.SelectedItem).Row["BoPhanID"]);
                documentViewer1.DocumentSource = reports;
                reports.CreateDocument();
            }catch(Exception)
            {

            }
        }

        private void cmbDonVi_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBaoCao();
        }

        private void frmBaoCaoHoSoNV_Load(object sender, EventArgs e)
        {
            
            string sql = "Select * from BoPhan Order by TenBoPhan";
            DataTable dt = Core.Core.GetData(sql);
            DataRow dr = dt.NewRow();
            dr["BoPhanID"] = "-1";
            dr["TenBoPhan"] = "Tất cả";
            dt.Rows.InsertAt(dr, 0);

            cmbDonVi.DataSource = dt;
            cmbDonVi.ValueMember = "BoPhanID";
            cmbDonVi.DisplayMember = "TenBoPhan";
            cmbDonVi.SelectedIndex = 0;

            AutoCompleteStringCollection data = new AutoCompleteStringCollection();
            string[] src;
            src = dt
                     .AsEnumerable()
                     .Select<System.Data.DataRow, String>(x => x.Field<String>("TenBoPhan"))
                     .ToArray();
            data.AddRange(src);
            this.cmbDonVi.DroppedDown = true;
            this.cmbDonVi.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.cmbDonVi.AutoCompleteSource = AutoCompleteSource.ListItems;
            cmbDonVi.AutoCompleteCustomSource = data;

            LoadBaoCao();
        }
    }
}
