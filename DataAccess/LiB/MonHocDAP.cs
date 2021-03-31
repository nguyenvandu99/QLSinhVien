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

        public List<MonHocEntity> getPaged(int pageNum, int pageSize , string strTenMonHoc)
        {
            int excludedRows = (pageNum - 1) * pageSize;
            strTenMonHoc = strTenMonHoc.Trim().ToLower();
            var query = (from obj in dbContext.MonHocs
                         where obj.TEN.Contains(strTenMonHoc)
                         select new MonHocEntity
                         {
                             ID = obj.ID,
                             TEN = obj.TEN,
                             SOTINCHI = obj.SOTINCHI,
                         });
            return query.Take(pageSize).Skip(excludedRows).ToList();
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
        public MonHoc getByID(int Id)
        {
            return dbContext.MonHocs.Where(p => p.ID == Id).FirstOrDefault();
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
            dbContext.MonHocs.Remove(objDMonHoc);
            return dbContext.SaveChanges();
        }
    }
}
