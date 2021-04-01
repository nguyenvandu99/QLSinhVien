using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using DataAccess.LiB;
using Newtonsoft.Json;

namespace QLSinhVien.HeThong.admin.dkMonHoc
{
    public partial class ActionHandler : System.Web.UI.Page
    {
        string doAction = "";
        int itemID;
        int page = 1;
        QLSinhVienEntities dbContext;
        DangKyHocDAP dapDangKyHoc;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbContext = new QLSinhVienEntities();
            doAction = string.IsNullOrEmpty(Request["do"]) ? "" : Request["do"].ToLower();
            dapDangKyHoc = new DangKyHocDAP(dbContext);
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
                case "loaddata":
                    LoadData();
                    break;               
                //case "search":
                //    Search();
                //    break;
                default:
                    break;
            }

        }
        //private void Search()
        //{
        //    string valueSearch = string.IsNullOrEmpty(Request["value"]) ? "" : Request["value"].ToLower();
        //    List<HocSinhEntity> tbl_HocSinhs = hocsinhDAP.searchLop3(valueSearch, page, 15);
        //    string json = JsonConvert.SerializeObject(tbl_HocSinhs);
        //    Response.ContentType = "json";
        //    Response.Write(json);
        //    Response.End();
        //}
        private void Add()
        {
            DangKyHoc dkh = new DangKyHoc();
            dkh.NAMHOC = Convert.ToString(Request["txtNamHoc"]);
            dkh.HOCSINH = Convert.ToInt32(Request["sltHocSinh"]);
            dkh.MONHOC = Convert.ToInt32(Request["sltMonHoc"]);
            dkh.GIAOVIEN = Convert.ToInt32(Request["sltGiaoVien"]);
            dkh.NGAYDANGKY = Convert.ToDateTime(Request["dateNgayDangKy"]);

            dapDangKyHoc.Add(dkh);
            dapDangKyHoc.Save();
        }
        private void Update()
        {
            DangKyHoc dkh = dapDangKyHoc.getByID(itemID);            
            dkh.NAMHOC = Convert.ToString(Request["txtNamHoc"]);
            dkh.HOCSINH = Convert.ToInt32(Request["sltHocSinh"]);
            dkh.MONHOC = Convert.ToInt32(Request["sltMonHoc"]);
            dkh.GIAOVIEN = Convert.ToInt32(Request["sltGiaoVien"]);
            dkh.NGAYDANGKY = Convert.ToDateTime(Request["dateNgayDangKy"]);

            dapDangKyHoc.Save();
        }



        private void Delete()
        {
            dapDangKyHoc.Delete(itemID);
        }
        public void LoadData()
        {
            //List<HocSinhEntity> lstHocSinh = hocsinhDAP.getData();
            //jMessage.jsonData = getJson(lstHocSinh);
            //jMessage.Erros = false;

            List<DangKyHocEntity> lstDangKyHoc = dapDangKyHoc.getPaged(1, 15);
            string json = JsonConvert.SerializeObject(lstDangKyHoc);
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
