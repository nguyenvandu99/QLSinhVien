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
    public partial class DetailForm : System.Web.UI.Page
    {
        public DangKyHoc dkh = new DangKyHoc();
        public string doAction = "";
        public int itemID;
        public List<HocSinhEntity> tbl_HocSinhs = new List<HocSinhEntity>();
        public List<GiaoVienEntity> tbl_GiaoViens = new List<GiaoVienEntity>();
        public List<MonHocEntity> tbl_MonHocs = new List<MonHocEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {
            QLSinhVienEntities dbContext = new QLSinhVienEntities();
            DangKyHocDAP dapDangKyHoc = new DangKyHocDAP(dbContext);
            HocSinhDAP dapHocSinh = new HocSinhDAP(dbContext);
            GiaoVienDAP dapGiaoVien = new GiaoVienDAP(dbContext);
            MonHocDAP dapMonHoc = new MonHocDAP(dbContext);

            doAction = !string.IsNullOrEmpty(Request["do"]) ? Request["do"].ToString() : "";
            itemID = !string.IsNullOrEmpty(Request["itemid"]) ? Convert.ToInt32(Request["itemid"]) : 0;
            if (itemID != 0)
            {
                dkh = dapDangKyHoc.getByID(itemID);
            }
            tbl_HocSinhs.AddRange(dapHocSinh.getData());
            tbl_GiaoViens.AddRange(dapGiaoVien.getData());
            tbl_MonHocs.AddRange(dapMonHoc.getData());
        }
    }
}