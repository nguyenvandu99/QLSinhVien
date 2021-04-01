using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;
using Newtonsoft.Json;

namespace QLSinhVien.HeThong.admin.dsGiangVien
{
    public partial class ActionHandler : System.Web.UI.Page
    {
        string doAction = "";
        int itemID;
        int page = 1;
        QLSinhVienEntities dbContext;
        GiaoVienDAP dapGiaoVien;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new QLSinhVienEntities();
            doAction = string.IsNullOrEmpty(Request["do"]) ? "" : Request["do"].ToLower();
            dapGiaoVien = new GiaoVienDAP(dbContext);
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
            List<GiaoVienEntity> tbl_GiaoViens = dapGiaoVien.Search(valueSearch);
            string json = JsonConvert.SerializeObject(tbl_GiaoViens);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }

        private void Add()
        {
            GiaoVien gv = new GiaoVien();
            gv.TEN = Request["txtTen"].ToString();
            gv.HOCHAM_HOCVI = Request["txtHocHamHocVi"].ToString();
            
            dapGiaoVien.Add(gv);
            dapGiaoVien.Save();
        }
        private void Update()
        {
            GiaoVien gv = dapGiaoVien.getByID(itemID);
            gv.TEN = Request["txtTen"].ToString();
            gv.HOCHAM_HOCVI = Request["txtHocHamHocVi"].ToString();

            dapGiaoVien.Save();
        }



        private void Delete()
        {
            dapGiaoVien.Delete(itemID);
        }
        public void LoadData()
        {
          
            List<GiaoVienEntity> lstGiaoVien = dapGiaoVien.getPaged(1, 15);
            string json = JsonConvert.SerializeObject(lstGiaoVien);
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