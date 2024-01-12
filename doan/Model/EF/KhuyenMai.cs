namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhuyenMai")]
    public partial class KhuyenMai
    {
        public long ID { get; set; }

        [StringLength(250)]
        public string TenKM { get; set; }

        public int? PhanTramKM { get; set; }

        [StringLength(250)]
        public string MoTa { get; set; }

        public bool? Status { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [Display(Name = "Ngày Bắt Đầu")]
        [DataType(DataType.Date)]
        public DateTime? NgayBatDau { get; set; }

        [Display(Name = "Ngày Kết Thúc")]
        [DataType(DataType.Date)]
        public DateTime? NgayKetThuc { get; set; }

        [NotMapped]
        public List<long> SelectedSanPhams { get; set; }

    }
}
