using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.LiB
{
   public class GiaoVienDAP
    {
        QLSinhVienEntities dbContext;

        public GiaoVienDAP(QLSinhVienEntities __dbContext)
        {
            dbContext = __dbContext;
        }

        public List<GiaoVienEntity> getPaged(int pageNum , int pageSize , string strTenGiaoVien)
        {
            int excludedRows = (pageNum - 1) * pageSize;
            strTenGiaoVien = strTenGiaoVien.Trim().ToLower();
            var query = (from obj in dbContext.GiaoViens
                         where obj.TEN.Contains(strTenGiaoVien)
                         select new GiaoVienEntity
                         {
                             ID = obj.ID,
                             TEN = obj.TEN,
                             HOCHAM_HOCVI = obj.HOCHAM_HOCVI
                         });
            return query.Take(pageSize).Skip(excludedRows).ToList();
        }
        public List<GiaoVienEntity> getData()
        {
            var query = (from obj in dbContext.GiaoViens
                        select new GiaoVienEntity
                        {
                            ID           = obj.ID,
                            TEN          = obj.TEN,
                            HOCHAM_HOCVI = obj.HOCHAM_HOCVI
                        });
            return query.OrderBy(p => p.TEN).ToList();
        }
        public GiaoVien getByID(int Id)
        {
            return dbContext.GiaoViens.Where(p => p.ID == Id).FirstOrDefault();
        }

        public int Add(GiaoVien objGiaoVien)
        {
            dbContext.GiaoViens.Add(objGiaoVien);
            return dbContext.SaveChanges();
        }
        public int Save()
        {
            return dbContext.SaveChanges();
        }
        public int Delete(int Id)
        {
            GiaoVien objGiaoVien = getByID(Id);
            dbContext.GiaoViens.Remove(objGiaoVien);
            return dbContext.SaveChanges();
        }
    }
}
