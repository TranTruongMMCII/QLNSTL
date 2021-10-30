﻿using DevExpress.XtraGrid.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLNSTL
{
    public class MyGridLocalizer : GridLocalizer
    {
        public override string GetLocalizedString(GridStringId id)
        {
            switch (id)
            {
                case GridStringId.FindControlFindButton:
                    return "Tìm kiếm";
                case GridStringId.FindControlClearButton:
                    return "Xóa";
                case GridStringId.FilterPanelCustomizeButton:
                    return "Lọc";
                default:
                    return base.GetLocalizedString(id);
            }
        }
    }
}
