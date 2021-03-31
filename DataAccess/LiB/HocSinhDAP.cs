using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.LiB
{
    public class HocSinhDAP
    {
        QLSinhVienEntities dbContext;

        public HocSinhDAP(QLSinhVienEntities __dbContext)
        {
            dbContext = __dbContext;
        }

        public List<HocSinhEntity> getData()
        {
            var query = (from hs in dbContext.HocSinhs                                           
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             LOPID = hs.LOPID,                           
                         });
            return query.OrderBy(p => p.TEN).ToList();
        }
        public List<HocSinhEntity> getDataLop1()
        {
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 1
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             LOPID = hs.LOPID,
                             TenLop = lh.TEN
                         });
            return query.OrderBy(p => p.TEN).ToList();
        }
        public List<HocSinhEntity> getPagedLop1(int pageNum, int pageSize)
        {
            int excludedRows = (pageNum - 1) * pageSize;            
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID 
                         where hs.LOPID == 1
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,                             
                             TenLop = lh.TEN
                         });
            return query.OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();
        }
        public List<HocSinhEntity> getDataLop2()
        {
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 2
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             LOPID = hs.LOPID,
                             TenLop = lh.TEN
                         });
            return query.OrderBy(p => p.TEN).ToList();
        }
        public List<HocSinhEntity> getPagedLop2(int pageNum, int pageSize)
        {
            int excludedRows = (pageNum - 1) * pageSize;
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 2
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             TenLop = lh.TEN
                         });
            return query.OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();
        }
        public List<HocSinhEntity> getDataLop3()
        {
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 3
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             LOPID = hs.LOPID,
                             TenLop = lh.TEN
                         });
            return query.OrderBy(p => p.TEN).ToList();
        }
        public List<HocSinhEntity> getPagedLop3(int pageNum, int pageSize)
        {
            int excludedRows = (pageNum - 1) * pageSize;
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 3
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             TenLop = lh.TEN
                         }); ;
            return query.OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();
        }

        public List<HocSinhEntity> searchLop1(string searchValue, int pageNum , int pageSize)
        {

            int excludedRows = (pageNum - 1) * pageSize;
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 1
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             TenLop = lh.TEN
                         }); ;
            return query.Where(p => (p.TEN.Contains(searchValue))).OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();
        
     }
        public List<HocSinhEntity> searchLop2(string searchValue, int pageNum, int pageSize)
        {

            int excludedRows = (pageNum - 1) * pageSize;
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 2
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             TenLop = lh.TEN
                         }); ;
            return query.Where(p => (p.TEN.Contains(searchValue))).OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();

        }
        public List<HocSinhEntity> searchLop3(string searchValue, int pageNum, int pageSize)
        {

            int excludedRows = (pageNum - 1) * pageSize;
            var query = (from hs in dbContext.HocSinhs
                         join lh in dbContext.LopHocs on hs.LOPID equals lh.ID
                         where hs.LOPID == 3
                         select new HocSinhEntity
                         {
                             ID = hs.ID,
                             TEN = hs.TEN,
                             NGAYSINH = hs.NGAYSINH,
                             GIOITINH = hs.GIOITINH,
                             QUEQUAN = hs.QUEQUAN,
                             TenLop = lh.TEN
                         }); ;
            return query.Where(p => (p.TEN.Contains(searchValue))).OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();

        }
        public HocSinh getByID(int Id)
        {
            return dbContext.HocSinhs.Where(p => p.ID == Id).FirstOrDefault();
        }
        public int Add(HocSinh objHocSinh)
        {
            dbContext.HocSinhs.Add(objHocSinh);
            return dbContext.SaveChanges();
        }

        public int Save()
        {
            return dbContext.SaveChanges();
        }

        public int Delete(int Id)
        {
            HocSinh objHocSinh = getByID(Id);          
            dbContext.HocSinhs.Remove(objHocSinh);
            return dbContext.SaveChanges();
        }

    }
}
