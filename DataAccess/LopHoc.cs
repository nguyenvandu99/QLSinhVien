//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class LopHoc
    {
        public LopHoc()
        {
            this.HocSinhs = new HashSet<HocSinh>();
        }
    
        public int ID { get; set; }
        public string TEN { get; set; }
        public string CHUNHIEM { get; set; }
    
        public virtual ICollection<HocSinh> HocSinhs { get; set; }
    }
    public partial class LopHocEntity
    {
        public int ID { get; set; }
        public string TEN { get; set; }
        public string CHUNHIEM { get; set; }
    }
}
