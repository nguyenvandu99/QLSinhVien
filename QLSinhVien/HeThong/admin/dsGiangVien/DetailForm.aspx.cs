using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;

namespace QLSinhVien.HeThong.admin.dsGiangVien
{
    public partial class DetailForm : System.Web.UI.Page
    {
        public GiaoVien gv = new GiaoVien();
        public string doAction = "";
        public int itemID;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            QLSinhVienEntities dbContext = new QLSinhVienEntities();
            GiaoVienDAP dapGiaoVien = new GiaoVienDAP(dbContext);          
            doAction = !string.IsNullOrEmpty(Request["do"]) ? Request["do"].ToString() : "";
            itemID = !string.IsNullOrEmpty(Request["itemid"]) ? Convert.ToInt32(Request["itemid"]) : 0;
            if (itemID != 0)
            {
                gv = dapGiaoVien.getByID(itemID);
            }
          
        }
    }
    
}