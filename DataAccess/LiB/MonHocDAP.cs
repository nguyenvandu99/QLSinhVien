using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.LiB
{
   public class MonHocDAP
    {
        QLSinhVienEntities dbContext;

        public MonHocDAP(QLSinhVienEntities __dbContext)
        {
            dbContext = __dbContext;
        }



        public List<MonHocEntity> getPaged(int pageNum, int pageSize,string strTenMH)
        {
            int excludedRows = (pageNum - 1) * pageSize;
            strTenMH = strTenMH.Trim().ToLower();
            var query = (from mh in dbContext.MonHocs
                         where mh.TEN.Contains(strTenMH)
                         select new MonHocEntity
                         {
                             ID = mh.ID,
                             TEN = mh.TEN,
                             SOTINCHI = mh.SOTINCHI,
                         });
            return query.OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();
        }

        public List<MonHocEntity> getData()
        {
            var query = (from obj in dbContext.MonHocs
                         select new MonHocEntity
                         {
                            ID       = obj.ID,
                            TEN      = obj.TEN,
                            SOTINCHI = obj.SOTINCHI,
                         });
            return query.OrderBy(p => p.TEN).ToList();
        }

        public List<MonHocEntity> Search(string searchValue)
        {
            var query = (from mh in dbContext.MonHocs
                         select new MonHocEntity
                         {
                             ID = mh.ID,
                             TEN = mh.TEN,
                             SOTINCHI = mh.SOTINCHI
                         });
            return query.Where(p => (p.TEN.Contains(searchValue))).ToList();

        }
        public MonHoc getByID(int Id)
        {
            return dbContext.MonHocs.Where(p => p.ID == Id).FirstOrDefault();
        }
        public DangKyHoc getByIDC(int Id)
        {
            return dbContext.DangKyHocs.Where(p => p.MONHOC == Id).FirstOrDefault();
        }

        public int Add(MonHoc objDMonHoc)
        {
            dbContext.MonHocs.Add(objDMonHoc);
            return dbContext.SaveChanges();
        }

        public int Save()
        {
            return dbContext.SaveChanges();
        }

        public int Delete(int Id)
        {
            MonHoc objDMonHoc = getByID(Id);
            DangKyHoc objDangKyHoc = getByIDC(Id);


            dbContext.DangKyHocs.Remove(objDangKyHoc);
            dbContext.MonHocs.Remove(objDMonHoc);
            return dbContext.SaveChanges();
        }
    }
}
