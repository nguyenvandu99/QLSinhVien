using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;

namespace QLSinhVien.HeThong.admin.dkMonHoc
{
    public partial class MainForm : System.Web.UI.Page
    {
        public List<DangKyHoc> lstDangKyHoc = new List<DangKyHoc>();
        public List<HocSinhEntity> tbl_HocSinhs = new List<HocSinhEntity>();
        public List<GiaoVienEntity> tbl_GiaoViens = new List<GiaoVienEntity>();
        public List<MonHocEntity> tbl_MonHocs = new List<MonHocEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}