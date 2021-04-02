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
        public List<LopHoc> lstLopHoc = new List<LopHoc>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}