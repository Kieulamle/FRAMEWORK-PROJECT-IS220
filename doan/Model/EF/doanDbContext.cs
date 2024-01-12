using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Model.EF
{
    public partial class doanDbContext : DbContext
    {
        public doanDbContext()
            : base("name=doanDbContext")
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<ChienDich> ChienDiches { get; set; }
        public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual DbSet<ChiTietSanPham> ChiTietSanPhams { get; set; }
        public virtual DbSet<CuaHang> CuaHangs { get; set; }
        public virtual DbSet<DatHang> DatHangs { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<KhuyenMai> KhuyenMais { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<QuanLy> QuanLies { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietHoaDon>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietHoaDon>()
                .Property(e => e.GiaKM)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietHoaDon>()
                .Property(e => e.ThanhTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietSanPham>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietSanPham>()
                .Property(e => e.GiaCu)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietSanPham>()
                .Property(e => e.GiaKhuyenMai)
                .HasPrecision(18, 0);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TienKM)
                .HasPrecision(18, 0);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.Luong)
                .HasPrecision(18, 0);
        }
    }
}
