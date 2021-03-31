using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;


namespace QLSinhVien.HeThong.admin.dsSinhVien
{
    public partial class MainForm : System.Web.UI.Page
    {
        public List<HocSinh> lstHocSinh = new List<HocSinh>();
        public List<LopHocEntity> tbl_lopHocs = new List<LopHocEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //QLSinhVienEntities dbcontext = new QLSinhVienEntities();
            //HocSinhDAP hocSinhDAP = new HocSinhDAP(dbcontext);
           
        }
    }
}