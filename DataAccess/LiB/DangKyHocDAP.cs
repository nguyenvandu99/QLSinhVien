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

        public List<DangKyHocEntity> getPaged(int pageNum, int pageSize)
        {
            int excludedRows = (pageNum - 1) * pageSize;            
            var query = (from dkh in dbContext.DangKyHocs
                         join hs in dbContext.HocSinhs on  dkh.HOCSINH equals hs.ID 
                         join mh in dbContext.MonHocs on  dkh.MONHOC equals mh.ID 
                         join gv in dbContext.GiaoViens on dkh.GIAOVIEN equals gv.ID 
                         select new DangKyHocEntity
                         {
                             ID = dkh.ID,
                             NAMHOC = dkh.NAMHOC,
                             TenHocSinh = hs.TEN,
                             TenGiaoVien = gv.TEN,
                             TenMonHoc = mh.TEN,
                             NGAYDANGKY = dkh.NGAYDANGKY
                         });
            return query.OrderBy(p => p.NAMHOC).Take(pageSize).Skip(excludedRows).ToList();
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
