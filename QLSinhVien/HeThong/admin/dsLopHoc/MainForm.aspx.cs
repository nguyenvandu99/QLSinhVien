using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;

namespace QLSinhVien.HeThong.admin.dsLopHoc
{
    public partial class MainForm : System.Web.UI.Page
    {
        public LopHoc lh= new LopHoc();
        public List<LopHoc> lstLopHoc = new List<LopHoc>();
        public List<LopHocEntity> tbl_LopHocs = new List<LopHocEntity>();
        public List<HocSinhEntity> tbl_HocSinhs = new List<HocSinhEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {
            QLSinhVienEntities dbContext = new QLSinhVienEntities();
            LopHocDAP dapLopHoc = new LopHocDAP(dbContext);
            HocSinhDAP dapHocSinh = new HocSinhDAP(dbContext);

            tbl_LopHocs.AddRange(dapLopHoc.getData());
            tbl_HocSinhs.AddRange(dapHocSinh.getData());
        }
    }
}