namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChienDich")]
    public partial class ChienDich
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long IDKM { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long IDSP { get; set; }

        [ForeignKey("IDKM")]
        public virtual KhuyenMai KhuyenMai { get; set; }

        [ForeignKey("IDSP")]
        public virtual ChiTietSanPham ChiTietSanPham { get; set; }
    }
}
