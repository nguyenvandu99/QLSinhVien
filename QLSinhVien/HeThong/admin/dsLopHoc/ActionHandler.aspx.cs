using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;
using Newtonsoft.Json;

namespace QLSinhVien.HeThong.admin.dsLopHoc
{
    public partial class ActionHandler : System.Web.UI.Page
    {
        string doAction = "";
        int itemID;
        int page = 1;
        QLSinhVienEntities dbContext;
        LopHocDAP dapLopHoc;

        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new QLSinhVienEntities();
            doAction = string.IsNullOrEmpty(Request["do"]) ? "" : Request["do"].ToLower();
            dapLopHoc = new LopHocDAP(dbContext);
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
            List<LopHocEntity> tbl_LopHocs = dapLopHoc.Search(valueSearch);
            string json = JsonConvert.SerializeObject(tbl_LopHocs);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }

        private void Add()
        {
            LopHoc lh = new LopHoc();
            lh.TEN = Request["txtTen"].ToString();
            lh.CHUNHIEM = Request["sltCHUNHIEM"].ToString();
            
            dapLopHoc.Add(lh);
            dapLopHoc.Save();
        }
        private void Update()
        {

            LopHoc lh = dapLopHoc.getByID(itemID);
            lh.TEN = Request["txtTen"].ToString();
            lh.CHUNHIEM = Request["sltCHUNHIEM"].ToString();

            dapLopHoc.Save();
        }



        private void Delete()
        {
            dapLopHoc.Delete(itemID);
        }
        public void LoadData()
        {

            List<LopHocEntity> lstLopHocs = dapLopHoc.getPaged(1, 15, "");
            string json = JsonConvert.SerializeObject(lstLopHocs);
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