using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;
namespace QLSinhVien.HeThong.admin.dsMonHoc
{
    public partial class DetailForm : System.Web.UI.Page
    {
        public MonHoc mh = new MonHoc();
        public string doAction = "";
        public int itemID;
        public List<MonHocEntity> tbl_MonHocs = new List<MonHocEntity>();
        protected void Page_Load(object sender, EventArgs e)
        {
            QLSinhVienEntities dbContext = new QLSinhVienEntities();
            MonHocDAP dapMonHoc = new MonHocDAP(dbContext);
            doAction = !string.IsNullOrEmpty(Request["do"]) ? Request["do"].ToString() : "";
            itemID = !string.IsNullOrEmpty(Request["itemid"]) ? Convert.ToInt32(Request["itemid"]) : 0;
            if (itemID != 0)
            {
                mh = dapMonHoc.getByID(itemID);
            }
            tbl_MonHocs.AddRange(dapMonHoc.getData());
        }
    }
}