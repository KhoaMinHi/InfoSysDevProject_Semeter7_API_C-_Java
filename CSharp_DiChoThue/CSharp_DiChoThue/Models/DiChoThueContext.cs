using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CSharp_DiChoThue.Models
{
    public partial class DiChoThueContext : DbContext
    {
        public DiChoThueContext()
        {
        }

        public DiChoThueContext(DbContextOptions<DiChoThueContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ChiTietDanhSachSanPham> ChiTietDanhSachSanPham { get; set; }
        public virtual DbSet<ChiTietDonHang> ChiTietDonHang { get; set; }
        public virtual DbSet<DanhMuc> DanhMuc { get; set; }
        public virtual DbSet<DanhSachChuanBiSanPham> DanhSachChuanBiSanPham { get; set; }
        public virtual DbSet<DiaChiDoitac> DiaChiDoitac { get; set; }
        public virtual DbSet<DiaChiKhachHang> DiaChiKhachHang { get; set; }
        public virtual DbSet<DoiTacBanHang> DoiTacBanHang { get; set; }
        public virtual DbSet<DonHang> DonHang { get; set; }
        public virtual DbSet<KhachHang> KhachHang { get; set; }
        public virtual DbSet<KhuVuc> KhuVuc { get; set; }
        public virtual DbSet<KhuVucHoatDong> KhuVucHoatDong { get; set; }
        public virtual DbSet<LichSuThanhToan> LichSuThanhToan { get; set; }
        public virtual DbSet<NhanVien> NhanVien { get; set; }
        public virtual DbSet<SanPham> SanPham { get; set; }
        public virtual DbSet<Shipper> Shipper { get; set; }
        public virtual DbSet<ThongTinThanhToan> ThongTinThanhToan { get; set; }
        public virtual DbSet<TinhTrangSucKhoe> TinhTrangSucKhoe { get; set; }
        public virtual DbSet<TrangThaiDonHang> TrangThaiDonHang { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                //optionsBuilder.UseSqlServer("Server=.;Database=DiChoThue;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietDanhSachSanPham>(entity =>
            {
                entity.HasKey(e => new { e.MaDanhSachChuanBi, e.MaSanPham });

                entity.HasOne(d => d.MaDanhSachChuanBiNavigation)
                    .WithMany(p => p.ChiTietDanhSachSanPham)
                    .HasForeignKey(d => d.MaDanhSachChuanBi)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ctdssp_dscb");

                entity.HasOne(d => d.MaSanPhamNavigation)
                    .WithMany(p => p.ChiTietDanhSachSanPham)
                    .HasForeignKey(d => d.MaSanPham)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ctdssp_sp");
            });

            modelBuilder.Entity<ChiTietDonHang>(entity =>
            {
                entity.HasKey(e => new { e.MaDonHang, e.MaSanPham });

                entity.HasOne(d => d.MaDonHangNavigation)
                    .WithMany(p => p.ChiTietDonHang)
                    .HasForeignKey(d => d.MaDonHang)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ctdh_dh");

                entity.HasOne(d => d.MaSanPhamNavigation)
                    .WithMany(p => p.ChiTietDonHang)
                    .HasForeignKey(d => d.MaSanPham)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ctdh_sp");
            });

            modelBuilder.Entity<DanhMuc>(entity =>
            {
                entity.HasKey(e => e.MaDanhMuc);

                entity.Property(e => e.TenDanhMuc).HasMaxLength(50);
            });

            modelBuilder.Entity<DanhSachChuanBiSanPham>(entity =>
            {
                entity.HasKey(e => e.MaDanhSachChuanBi);

                entity.Property(e => e.NgayBan).HasColumnType("date");

                entity.Property(e => e.NgayLap).HasColumnType("date");

                entity.HasOne(d => d.MaDoitacNavigation)
                    .WithMany(p => p.DanhSachChuanBiSanPham)
                    .HasForeignKey(d => d.MaDoitac)
                    .HasConstraintName("fk_dscbsp_dtbh");
            });

            modelBuilder.Entity<DiaChiDoitac>(entity =>
            {
                entity.HasKey(e => e.MaDiaChi);

                entity.Property(e => e.DiaChi).HasMaxLength(50);

                entity.HasOne(d => d.KhuVucNavigation)
                    .WithMany(p => p.DiaChiDoitac)
                    .HasForeignKey(d => d.KhuVuc)
                    .HasConstraintName("fk_dcdt_kv");

                entity.HasOne(d => d.MaDoiTacBanHangNavigation)
                    .WithMany(p => p.DiaChiDoitac)
                    .HasForeignKey(d => d.MaDoiTacBanHang)
                    .HasConstraintName("fk_dcdt_dt");
            });

            modelBuilder.Entity<DiaChiKhachHang>(entity =>
            {
                entity.HasKey(e => e.MaDiaChi);

                entity.Property(e => e.DiaChiGiaoHang).HasMaxLength(50);

                entity.Property(e => e.Sdt)
                    .HasColumnName("SDT")
                    .HasMaxLength(10);

                entity.HasOne(d => d.MaKhachHangNavigation)
                    .WithMany(p => p.DiaChiKhachHang)
                    .HasForeignKey(d => d.MaKhachHang)
                    .HasConstraintName("fk_dckh_kh");

                entity.HasOne(d => d.MaKhuVucNavigation)
                    .WithMany(p => p.DiaChiKhachHang)
                    .HasForeignKey(d => d.MaKhuVuc)
                    .HasConstraintName("fk_dckh_kv");
            });

            modelBuilder.Entity<DoiTacBanHang>(entity =>
            {
                entity.HasKey(e => e.MaDoiTacBanHang);

                entity.Property(e => e.EmailDoiTacBh)
                    .HasColumnName("emailDoiTacBH")
                    .HasMaxLength(50);

                entity.Property(e => e.MaSoThue).HasMaxLength(50);

                entity.Property(e => e.NgayBatDauBan)
                    .HasColumnName("ngayBatDauBan")
                    .HasColumnType("date");

                entity.Property(e => e.SdtdoiTacBh)
                    .HasColumnName("SDTDoiTacBH")
                    .HasMaxLength(10);

                entity.Property(e => e.TenDoiTacBh)
                    .HasColumnName("TenDoiTacBH")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<DonHang>(entity =>
            {
                entity.HasKey(e => e.MaDonHang);

                entity.Property(e => e.NgayDatHang).HasColumnType("date");

                entity.HasOne(d => d.MaDiaChiNavigation)
                    .WithMany(p => p.DonHang)
                    .HasForeignKey(d => d.MaDiaChi)
                    .HasConstraintName("fk_dh_dc");

                entity.HasOne(d => d.MaKhachHangNavigation)
                    .WithMany(p => p.DonHang)
                    .HasForeignKey(d => d.MaKhachHang)
                    .HasConstraintName("fk_dh_kh");

                entity.HasOne(d => d.MaNhanVienQuanLyNavigation)
                    .WithMany(p => p.DonHang)
                    .HasForeignKey(d => d.MaNhanVienQuanLy)
                    .HasConstraintName("fk_dh_nv");

                entity.HasOne(d => d.MaShipperNavigation)
                    .WithMany(p => p.DonHang)
                    .HasForeignKey(d => d.MaShipper)
                    .HasConstraintName("fk_dh_shp");

                entity.HasOne(d => d.TrangThaiDonHangNavigation)
                    .WithMany(p => p.DonHang)
                    .HasForeignKey(d => d.TrangThaiDonHang)
                    .HasConstraintName("fk_dh_tt");
            });

            modelBuilder.Entity<KhachHang>(entity =>
            {
                entity.HasKey(e => e.MaKhachHang);

                entity.Property(e => e.Cmnd)
                    .HasColumnName("CMND")
                    .HasMaxLength(10);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Sdt)
                    .HasColumnName("SDT")
                    .HasMaxLength(10);

                entity.Property(e => e.TenKhachHang).HasMaxLength(50);
            });

            modelBuilder.Entity<KhuVuc>(entity =>
            {
                entity.HasKey(e => e.MaKhuVuc);

                entity.Property(e => e.LoaiKhuVuc).HasMaxLength(50);

                entity.Property(e => e.QuanHuyen)
                    .HasColumnName("Quan_Huyen")
                    .HasMaxLength(50);

                entity.Property(e => e.ThanhPho).HasMaxLength(50);
            });

            modelBuilder.Entity<KhuVucHoatDong>(entity =>
            {
                entity.HasKey(e => e.MaKhuVucHoatDong);

                entity.HasOne(d => d.KhuVucNavigation)
                    .WithMany(p => p.KhuVucHoatDong)
                    .HasForeignKey(d => d.KhuVuc)
                    .HasConstraintName("fk_kvhd_kv");

                entity.HasOne(d => d.MaShipperNavigation)
                    .WithMany(p => p.KhuVucHoatDong)
                    .HasForeignKey(d => d.MaShipper)
                    .HasConstraintName("fk_kvhd_shp");
            });

            modelBuilder.Entity<LichSuThanhToan>(entity =>
            {
                entity.HasKey(e => e.MaLichSuThanhToan);

                entity.Property(e => e.HinhThucThanhToan).HasMaxLength(50);

                entity.HasOne(d => d.MaThongTinThanhToanNavigation)
                    .WithMany(p => p.LichSuThanhToan)
                    .HasForeignKey(d => d.MaThongTinThanhToan)
                    .HasConstraintName("fk_lstt_ttth");
            });

            modelBuilder.Entity<NhanVien>(entity =>
            {
                entity.HasKey(e => e.MaNhanVien);

                entity.Property(e => e.Cmnd)
                    .HasColumnName("CMND")
                    .HasMaxLength(10);

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasMaxLength(50);

                entity.Property(e => e.HoTen).HasMaxLength(50);

                entity.Property(e => e.Sdt)
                    .HasColumnName("SDT")
                    .HasMaxLength(10);
            });

            modelBuilder.Entity<SanPham>(entity =>
            {
                entity.HasKey(e => e.MaSanPham);

                entity.Property(e => e.TenSanPham).HasMaxLength(50);

                entity.HasOne(d => d.MaDanhMucNavigation)
                    .WithMany(p => p.SanPham)
                    .HasForeignKey(d => d.MaDanhMuc)
                    .HasConstraintName("fk_sp_dm");

                entity.HasOne(d => d.MaDoiTacBanHangNavigation)
                    .WithMany(p => p.SanPham)
                    .HasForeignKey(d => d.MaDoiTacBanHang)
                    .HasConstraintName("fk_sp_dtbh");
            });

            modelBuilder.Entity<Shipper>(entity =>
            {
                entity.HasKey(e => e.MaShipper);

                entity.Property(e => e.Cmnd)
                    .HasColumnName("CMND")
                    .HasMaxLength(10);

                entity.Property(e => e.HoTen).HasMaxLength(50);

                entity.Property(e => e.NgaySinh).HasColumnType("date");

                entity.Property(e => e.SoDienThoai).HasMaxLength(10);

                entity.HasOne(d => d.TinhTrangSucKhoeNavigation)
                    .WithMany(p => p.Shipper)
                    .HasForeignKey(d => d.TinhTrangSucKhoe)
                    .HasConstraintName("fk_shipper_ttsk");
            });

            modelBuilder.Entity<ThongTinThanhToan>(entity =>
            {
                entity.HasKey(e => e.MaThongTinThanhToan);

                entity.Property(e => e.LoaiThe).HasMaxLength(50);

                entity.Property(e => e.NgayHetHan).HasColumnType("date");

                entity.Property(e => e.SoThe).HasMaxLength(50);

                entity.HasOne(d => d.MaKhachHangNavigation)
                    .WithMany(p => p.ThongTinThanhToan)
                    .HasForeignKey(d => d.MaKhachHang)
                    .HasConstraintName("fk_ttth_kh");
            });

            modelBuilder.Entity<TinhTrangSucKhoe>(entity =>
            {
                entity.HasKey(e => e.MaTtsk);

                entity.Property(e => e.MaTtsk).HasColumnName("MaTTSK");

                entity.Property(e => e.TenTtsk)
                    .HasColumnName("TenTTSK")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<TrangThaiDonHang>(entity =>
            {
                entity.HasKey(e => e.MaTrangThai);

                entity.Property(e => e.TenTrangThai).HasMaxLength(50);
            });
        }
    }
}
