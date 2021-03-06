using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.LiB
{
   
    public class LopHocDAP
    {
        QLSinhVienEntities dbContext;

        public LopHocDAP(QLSinhVienEntities __dbContext)
        {
            dbContext = __dbContext;
        }
        public List<LopHocEntity> getData()
        {
            var query = (from lh in dbContext.LopHocs
                         select new LopHocEntity
                         {
                             ID = lh.ID,
                             TEN = lh.TEN,
                             CHUNHIEM = lh.CHUNHIEM
                         });
            return query.OrderBy(p => p.TEN).ToList();
        }
        public List<LopHocEntity> getPaged(int pageNum, int pageSize,string strTenLH)
        {
            int excludedRows = (pageNum - 1) * pageSize;
            strTenLH = strTenLH.Trim().ToLower();
            var query = (from lh in dbContext.LopHocs
                         where lh.TEN.Contains(strTenLH)
                         select new LopHocEntity
                         {
                             ID = lh.ID,
                             TEN = lh.TEN,
                             CHUNHIEM = lh.CHUNHIEM
                         });
            return query.OrderBy(p => p.TEN).Take(pageSize).Skip(excludedRows).ToList();
        }
        public List<LopHocEntity> Search(string searchValue)
        {
            var query = (from lh in dbContext.LopHocs
                         select new LopHocEntity
                         {
                             ID = lh.ID,
                             TEN = lh.TEN,
                             CHUNHIEM = lh.CHUNHIEM
                         });
            return query.Where(p => (p.TEN.Contains(searchValue))).ToList();

        }
        public LopHoc getByID(int Id)
        {
            return dbContext.LopHocs.Where(p => p.ID == Id).FirstOrDefault();
        }
        public HocSinh getByIDC(int Id)
        {
            return dbContext.HocSinhs.Where(p => p.LOPID == Id).FirstOrDefault();
        }
        public int Add(LopHoc objLopHoc)
        {
            dbContext.LopHocs.Add(objLopHoc);
            return dbContext.SaveChanges();
        }

        public int Save()
        {
            return dbContext.SaveChanges();
        }       
        public int Delete(int Id)
        {
            LopHoc objLopHoc = getByID(Id);
            HocSinh objHocSinh = getByIDC(Id);

            if (Convert.ToString(objHocSinh) == "")
            {
                dbContext.LopHocs.Remove(objLopHoc);
            }
            else
            {
                
            }           
            return dbContext.SaveChanges();
        }
    }
}
