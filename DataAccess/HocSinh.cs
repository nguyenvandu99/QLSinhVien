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
    
    public partial class HocSinh
    {
        public HocSinh()
        {
            this.DangKyHocs = new HashSet<DangKyHoc>();
        }
    
        public int ID { get; set; }
        public string TEN { get; set; }
        public Nullable<System.DateTime> NGAYSINH { get; set; }
        public bool GIOITINH { get; set; }
        public string QUEQUAN { get; set; }
        public Nullable<int> LOPID { get; set; }
    
        public virtual ICollection<DangKyHoc> DangKyHocs { get; set; }
        public virtual LopHoc LopHoc { get; set; }
    }
    public partial class HocSinhEntity
    {
        public int ID { get; set; }
        public string TEN { get; set; }
        public Nullable<System.DateTime> NGAYSINH { get; set; }
        public bool GIOITINH { get; set; }
        public string QUEQUAN { get; set; }
        public Nullable<int> LOPID { get; set; }

        public string TenLop { get; set; }
    }
}
