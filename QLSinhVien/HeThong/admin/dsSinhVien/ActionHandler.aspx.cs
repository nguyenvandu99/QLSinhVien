using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;
using Newtonsoft.Json;
using System.Reflection;

namespace QLSinhVien.HeThong.admin.dsSinhVien
{
    public partial class ActionHandler : System.Web.UI.Page
    {
        string doAction = "";
        int itemID ;
        int page = 1;
        QLSinhVienEntities dbContext;
        HocSinhDAP hocsinhDAP;

        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new QLSinhVienEntities();
            doAction = string.IsNullOrEmpty(Request["do"]) ? "" : Request["do"].ToLower();
            hocsinhDAP = new HocSinhDAP(dbContext);
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
                case "loaddatalop1":
                    LoadDataLop1();
                    break;
                case "loaddatalop2":
                    LoadDataLop2();
                    break;
                case "loaddatalop3":
                    LoadDataLop3();
                    break;
                case "searchlop1":
                    SearchLop1();
                    break;
                case "searchlop2":
                    SearchLop2();
                    break;
                case "searchlop3":
                    SearchLop3();
                    break;
                default:
                    break;
            }

        }
        private void SearchLop1()
        {
            string valueSearch = string.IsNullOrEmpty(Request["value"]) ? "" : Request["value"].ToLower();           
            List<HocSinhEntity> tbl_HocSinhs = hocsinhDAP.searchLop1(valueSearch , page , 15);
            string json = JsonConvert.SerializeObject(tbl_HocSinhs);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }
        private void SearchLop2()
        {
            string valueSearch = string.IsNullOrEmpty(Request["value"]) ? "" : Request["value"].ToLower();
            List<HocSinhEntity> tbl_HocSinhs = hocsinhDAP.searchLop2(valueSearch, page, 15);
            string json = JsonConvert.SerializeObject(tbl_HocSinhs);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }
        private void SearchLop3()
        {
            string valueSearch = string.IsNullOrEmpty(Request["value"]) ? "" : Request["value"].ToLower();
            List<HocSinhEntity> tbl_HocSinhs = hocsinhDAP.searchLop3(valueSearch, page, 15);
            string json = JsonConvert.SerializeObject(tbl_HocSinhs);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }
        private void Add()
        {
            HocSinh hs = new HocSinh();
            hs.TEN = Request["txtTen"].ToString();
            hs.NGAYSINH = Convert.ToDateTime(Request["dateNgaySinh"]);
            hs.GIOITINH = Convert.ToBoolean(Request["rdoGioiTinh"]);
            hs.QUEQUAN = Request["txtQueQuan"].ToString();
            hs.LOPID = Convert.ToInt32(Request["sltLop"]);

            hocsinhDAP.Add(hs);
            hocsinhDAP.Save();
        }
        private void Update()
        {
            HocSinh hs = hocsinhDAP.getByID(itemID);
            hs.TEN = Request["txtTen"].ToString();
            hs.NGAYSINH = Convert.ToDateTime(Request["dateNgaySinh"]);
            hs.GIOITINH = Convert.ToBoolean(Request["rdoGioiTinh"]);
            hs.QUEQUAN = Request["txtQueQuan"].ToString();
            hs.LOPID = Convert.ToInt32(Request["sltLop"]);

            hocsinhDAP.Save();
        }
    


        private void Delete()
        {
            hocsinhDAP.Delete(itemID);
        }
        public void LoadDataLop1()
        {
            //List<HocSinhEntity> lstHocSinh = hocsinhDAP.getData();
            //jMessage.jsonData = getJson(lstHocSinh);
            //jMessage.Erros = false;
            
            List<HocSinhEntity> lstHocSinh = hocsinhDAP.getPagedLop1(1 , 15);
            string json = JsonConvert.SerializeObject(lstHocSinh);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }
        public void LoadDataLop2()
        {
            //List<HocSinhEntity> lstHocSinh = hocsinhDAP.getData();
            //jMessage.jsonData = getJson(lstHocSinh);
            //jMessage.Erros = false;

            List<HocSinhEntity> lstHocSinh = hocsinhDAP.getPagedLop2(1, 15);
            string json = JsonConvert.SerializeObject(lstHocSinh);
            Response.ContentType = "json";
            Response.Write(json);
            Response.End();
        }
        public void LoadDataLop3()
        {
            //List<HocSinhEntity> lstHocSinh = hocsinhDAP.getData();
            //jMessage.jsonData = getJson(lstHocSinh);
            //jMessage.Erros = false;

            List<HocSinhEntity> lstHocSinh = hocsinhDAP.getPagedLop3(1, 15);
            string json = JsonConvert.SerializeObject(lstHocSinh);
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
      
