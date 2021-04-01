using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;
using Newtonsoft.Json;
namespace QLSinhVien.HeThong.admin.dsMonHoc
{
    public partial class ActionHandler : System.Web.UI.Page
    {

        string doAction = "";
        int itemID;
        int page = 1;
        QLSinhVienEntities dbContext;
        MonHocDAP dapMonHoc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new QLSinhVienEntities();
            doAction = string.IsNullOrEmpty(Request["do"]) ? "" : Request["do"].ToLower();
            dapMonHoc = new MonHocDAP(dbContext);
            itemID = Convert.ToInt32(Request["itemid"]);
            page = Convert.ToInt32(Request["page"]);
            switch (doAction)
            {
                case "add":
                    Add();
                    break;
                case "edit":
                    Update();
                    break;
                case "delete":
                    Delete();
                    break;
                case "search":
                    Search();
                    break;
                case "loaddata":
                    LoadData();
                    break;
                default:
                    break;
            }
        }
        private void Search()
        {
            string valueSearch = string.IsNullOrEmpty(Request["value"]) ? "" : Request["value"].ToLower();
            List<MonHocEntity> tbl_MonHocs = dapMonHoc.Search(valueSearch);
            string json = JsonConvert.SerializeObject(tbl_MonHocs);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }

        private void Add()
        {
            MonHoc mh = new MonHoc();
            mh.TEN = Request["txtTen"].ToString();
            mh.SOTINCHI = Convert.ToInt32(Request["txtSoTC"]);

            dapMonHoc.Add(mh);
            dapMonHoc.Save();
        }
        private void Update()
        {
            
            MonHoc mh = dapMonHoc.getByID(itemID);
            mh.TEN = Request["txtTen"].ToString();
            mh.SOTINCHI = Convert.ToInt32(Request["txtSoTC"]);

            dapMonHoc.Save();
        }



        private void Delete()
        {
            dapMonHoc.Delete(itemID);
        }
        public void LoadData()
        {

            List<MonHocEntity> lstMonHocs = dapMonHoc.getPaged(1, 15,"");
            string json = JsonConvert.SerializeObject(lstMonHocs);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }
        private void RenderMessage<T>(T _object)
        {
            try
            {
                string json = JsonConvert.SerializeObject(_object);
                Response.ContentType = "json";
                Response.Write(json);
                this.Page.Response.End();
            }
            catch { }
        }


    }
}