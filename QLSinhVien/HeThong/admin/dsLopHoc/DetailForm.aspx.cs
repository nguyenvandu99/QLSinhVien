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
    public partial class DetailForm : System.Web.UI.Page
    {
        public LopHoc lh = new LopHoc();
        public string doAction = "";
        public int itemID;
        public List<LopHocEntity> tbl_LopHocs = new List<LopHocEntity>();
        public List<GiaoVienEntity> tbl_GiaoViens = new List<GiaoVienEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {
            QLSinhVienEntities dbContext = new QLSinhVienEntities();
            LopHocDAP dapLopHoc = new LopHocDAP(dbContext);
            GiaoVienDAP dapGiaoVien = new GiaoVienDAP(dbContext);
            doAction = !string.IsNullOrEmpty(Request["do"]) ? Request["do"].ToString() : "";
            itemID = !string.IsNullOrEmpty(Request["itemid"]) ? Convert.ToInt32(Request["itemid"]) : 0;
            if (itemID != 0)
            {
                lh = dapLopHoc.getByID(itemID);
            }
            tbl_LopHocs.AddRange(dapLopHoc.getData());
            tbl_GiaoViens.AddRange(dapGiaoVien.getData());
        }
    }
}