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
    public partial class DetailForm : System.Web.UI.Page
    {
        public HocSinh hs = new HocSinh();
        public string doAction = "";
        public int itemID;
        public List<LopHocEntity> tbl_lopHocs = new List<LopHocEntity>();
        public List<HocSinhEntity> tbl_HocSinhs = new List<HocSinhEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {

            QLSinhVienEntities dbContext = new QLSinhVienEntities();
            HocSinhDAP dapHocSinh = new HocSinhDAP(dbContext);
            LopHocDAP dapLopHoc = new LopHocDAP(dbContext);
            doAction = !string.IsNullOrEmpty(Request["do"]) ? Request["do"].ToString() : "";            
            itemID = !string.IsNullOrEmpty(Request["itemid"]) ? Convert.ToInt32(Request["itemid"]) : 0;
            if (itemID != 0)
            {
                hs = dapHocSinh.getByID(itemID);
            }
            tbl_lopHocs.AddRange(dapLopHoc.getData());
            tbl_HocSinhs.AddRange(dapHocSinh.getData());

        }
    }
}