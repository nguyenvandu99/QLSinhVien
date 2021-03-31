using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.LiB
{
    public class DangKyHocDAP
    {
        QLSinhVienEntities dbContext;

        public DangKyHocDAP(QLSinhVienEntities __dbContext)
        {
            dbContext = __dbContext;
        }

        public List<DangKyHocEntity> getPaged(int pageNum, int pageSize, string strTenHocSinh)
        {
            int excludedRows = (pageNum - 1) * pageSize;
            strTenHocSinh = strTenHocSinh.Trim().ToLower();
            var query = (from obj in dbContext.DangKyHocs
                         where obj.HocSinh1.TEN.Contains(strTenHocSinh)
                         select new DangKyHocEntity
                         {
                             ID = obj.ID,
                             NAMHOC = obj.NAMHOC,
                             TenHocSinh = obj.HocSinh1.TEN,
                             TenGiaoVien = obj.GiaoVien1.TEN,
                             TenMonHoc = obj.MonHoc1.TEN,
                             NGAYDANGKY = obj.NGAYDANGKY
                         });
            return query.Take(pageSize).Skip(excludedRows).ToList();
        }

        public List<DangKyHocEntity> getData()
        {
            var query = (from obj in dbContext.DangKyHocs
                        select new DangKyHocEntity
                        {
                            ID = obj.ID,
                            NAMHOC = obj.NAMHOC,
                            TenHocSinh = obj.HocSinh1.TEN,
                            TenGiaoVien = obj.GiaoVien1.TEN,
                            TenMonHoc = obj.MonHoc1.TEN,
                            NGAYDANGKY = obj.NGAYDANGKY
                        });
            return query.OrderBy(p => p.TenHocSinh).ToList();
        }
        
        public DangKyHoc getByID(int Id)
        {
            return dbContext.DangKyHocs.Where(p => p.ID == Id).FirstOrDefault();
        }
        public int Add(DangKyHoc objDangKyHoc)
        {
            dbContext.DangKyHocs.Add(objDangKyHoc);
            return dbContext.SaveChanges();
        }
        public int Save()
        {
            return dbContext.SaveChanges();
        }
        public int Delete(int Id)
        {
            DangKyHoc objDangKyHoc = getByID(Id);
            dbContext.DangKyHocs.Remove(objDangKyHoc);
            return dbContext.SaveChanges();
        }
    }
}
