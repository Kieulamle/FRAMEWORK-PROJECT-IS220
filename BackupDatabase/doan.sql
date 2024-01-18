USE [master]
GO
/****** Object:  Database [doan]    Script Date: 1/18/2024 11:27:18 PM ******/
CREATE DATABASE [doan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'doan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\doan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'doan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\doan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [doan] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [doan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [doan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [doan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [doan] SET ARITHABORT OFF 
GO
ALTER DATABASE [doan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [doan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [doan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [doan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [doan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [doan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [doan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [doan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [doan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [doan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [doan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [doan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [doan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [doan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [doan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [doan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [doan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [doan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [doan] SET  MULTI_USER 
GO
ALTER DATABASE [doan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [doan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [doan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [doan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [doan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [doan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [doan] SET QUERY_STORE = OFF
GO
USE [doan]
GO
/****** Object:  User [DOANPC]    Script Date: 1/18/2024 11:27:18 PM ******/
CREATE USER [DOANPC] FOR LOGIN [DOANPC] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DOANPC]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [ntext] NULL,
	[MoTa] [ntext] NULL,
	[NoiDung] [ntext] NULL,
	[MaND] [bigint] NULL,
	[UrlImage] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChienDich]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChienDich](
	[IDKM] [bigint] NOT NULL,
	[IDSP] [bigint] NOT NULL,
 CONSTRAINT [PK_ChienDich] PRIMARY KEY CLUSTERED 
(
	[IDKM] ASC,
	[IDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaSP] [bigint] NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaKM] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
	[IDHoaDon] [bigint] NULL,
	[Status] [bit] NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](250) NULL,
	[Gia] [decimal](18, 0) NULL,
	[GiaCu] [decimal](18, 0) NULL,
	[GiaKhuyenMai] [decimal](18, 0) NULL,
	[Status] [bit] NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[UrlImage] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[MoTaSanPham] [ntext] NULL,
	[ChiTietSanPham1] [ntext] NULL,
	[MaPhanLoai] [bigint] NULL,
	[IDKhuyenMai] [bigint] NULL,
 CONSTRAINT [PK_ChiTietSanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuaHang]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHang](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenCuaHang] [nvarchar](250) NULL,
	[SDT] [nvarchar](50) NULL,
	[MaQuanLy] [bigint] NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[UrlImage] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [bigint] NULL,
	[MaKH] [bigint] NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChiNhanHang] [nvarchar](250) NULL,
	[Tinh] [nvarchar](50) NULL,
	[Quan] [nvarchar](50) NULL,
	[Phuong] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](250) NULL,
	[PTTT] [nvarchar](50) NULL,
	[TTDH] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[UrlImage] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNV] [bigint] NULL,
	[MaKH] [bigint] NULL,
	[MaCH] [bigint] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[IsOnline] [bit] NULL,
	[MaKM] [bigint] NULL,
	[TienKM] [decimal](18, 0) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [bigint] NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKM] [nvarchar](250) NULL,
	[PhanTramKM] [int] NULL,
	[MoTa] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Password] [nvarchar](32) NULL,
	[Role] [nvarchar](250) NULL,
	[SDT] [nvarchar](50) NULL,
	[NgSinh] [date] NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[GioiTinh] [bit] NULL,
	[UrlImage] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Luong] [decimal](18, 0) NULL,
	[IDNguoiDung] [bigint] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanLy]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLy](
	[ID] [bigint] NOT NULL,
 CONSTRAINT [PK_QuanLy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/18/2024 11:27:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PhanLoai] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([ID], [TieuDe], [MoTa], [NoiDung], [MaND], [UrlImage], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Hoa hồng trắng có ý nghĩa gì?', N'Hoa hồng trắng là một loại hoa đặc biệt, được ưa chuộng bởi đằng sau những cánh hoa ẩn giấu nhiều ý nghĩa sâu sắc. Vậy cụ thể hoa hồng trắng có ý nghĩa gì? Hoa hồng – một loài hoa xuất hiện rất nhiều trong cuộc sống hàng ngày của chúng ta kết hợp với màu trắng – một màu sắc quen thuộc, mang nhiều ý nghĩa. Hãy cùng nhau tìm hiểu những ý nghĩa sâu sắc ẩn sau trong sự kết hợp này nhé!', N'<p dir="ltr"><strong>Giới thiệu chung về hoa hồng trắng</strong></p>

<p dir="ltr">Hoa hồng trắng c&ograve;n c&oacute; một số t&ecirc;n gọi kh&aacute;c như: hoa nhược t&acirc;m, hoa hồng lai. Lo&agrave;i hoa n&agrave;y c&oacute; nguồn gốc xuất xứ từ Ch&acirc;u &Acirc;u.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Hồng trắng thuộc nh&oacute;m c&acirc;y hoa th&acirc;n gỗ, c&acirc;y bụi thấp. V&igrave; thế, hoa c&oacute; nhiều c&agrave;nh v&agrave; gai, gai thường l&agrave; gai cong. Tuỳ thuộc v&agrave;o giống, l&aacute; của hoa hồng trắng c&oacute; thể l&agrave; m&agrave;u xanh đậm hoặc nhạt, c&oacute; răng cưa s&acirc;u hoặc n&ocirc;ng. Ngo&agrave;i ra, l&agrave; hoa cũng rất đa dạng h&igrave;nh d&aacute;ng. Tuy nhi&ecirc;n, hầu hết l&aacute; hồng trắng l&agrave; l&aacute; k&eacute;p l&ocirc;ng chim.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Giống như những lo&agrave;i hồng kh&aacute;c, hồng trắng thuộc lo&agrave;i hoa lưỡng t&iacute;nh. M&ugrave;i hoa kh&ocirc;ng nồng n&agrave;n nhưng thơm nhẹ, dễ chịu. C&aacute;nh hoa hồng trắng mềm mại.</p>

<p dir="ltr"><strong>Hoa hồng trắng c&oacute; &yacute; nghĩa g&igrave;?</strong></p>

<p dir="ltr"><strong>&Yacute; nghĩa m&agrave;u sắc</strong></p>

<p dir="ltr">Hoa hồng trắng c&oacute; &yacute; nghĩa g&igrave;? M&agrave;u trắng chủ đạo của hoa l&agrave; m&agrave;u sắc s&aacute;ng nhất. N&oacute; tượng trưng cho sự tinh khiết, ng&acirc;y thơ v&agrave; nhẹ nh&agrave;ng. Từ thời xa xưa, m&agrave;u sắc n&agrave;y đều được lựa chọn, ch&uacute; trọng trong c&aacute;c ng&agrave;y lễ quan trọng. N&oacute; l&agrave; m&agrave;u sắc bắt buộc, xuất hiện trong h&ocirc;n lễ, nhằm gợi tả sự thuần khiết của người con g&aacute;i.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Trong cuộc sống hiện đại ng&agrave;y nay, m&agrave;u trắng l&agrave; hiện th&acirc;n của sự tinh khiết, ch&acirc;n th&agrave;nh, thậm ch&iacute; nhiều người cho rằng đ&acirc;y l&agrave; đại diện của sự to&agrave;n diện, ho&agrave;n hảo. Đ&acirc;y ch&iacute;nh l&agrave; m&agrave;u sắc của sự tươi s&aacute;ng, thể hiện một t&acirc;m hồn trong s&aacute;ng, vẹn nguy&ecirc;n, c&ograve;n trong sạch.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>&Yacute; nghĩa t&igrave;nh y&ecirc;u</strong></p>

<p dir="ltr">Trong t&igrave;nh y&ecirc;u, hoa hồng trắng c&oacute; &yacute; nghĩa g&igrave; đặc biệt?</p>

<p>&nbsp;</p>

<p dir="ltr">Như đ&atilde; đề cập ở tr&ecirc;n, hoa hồng trắng thể hiện sự trong trẻo, thuần khiết, đại diện cho những cảm x&uacute;c ch&acirc;n th&agrave;nh, thi&ecirc;ng li&ecirc;ng nhất. Trong t&igrave;nh y&ecirc;u, hoa hồng trắng tượng trưng cho t&igrave;nh y&ecirc;u trong s&aacute;ng, thi&ecirc;ng li&ecirc;ng, kh&ocirc;ng hề vụ lợi. T&igrave;nh y&ecirc;u n&agrave;y được tạo n&ecirc;n từ sự đồng điệu giữa 2 t&acirc;m hồn, t&igrave;nh y&ecirc;u vĩnh cửu, bất diệt.</p>

<p>&nbsp;</p>

<p dir="ltr">Hoa hồng trắng thường được sử dụng trong đ&aacute;m cưới để thể hiện t&igrave;nh y&ecirc;u thuần khiết v&agrave; sự tin tưởng trong t&igrave;nh y&ecirc;u giữa 2 người.&nbsp;</p>

<p dir="ltr"><strong>&Yacute; nghĩa kh&aacute;c</strong></p>

<p dir="ltr">B&ecirc;n cạnh đ&oacute;, hoa hồng trắng c&ograve;n dược xem l&agrave; đại diện cho ho&agrave; b&igrave;nh, thể hiện tinh thần đo&agrave;n kết, gắn b&oacute; giữa con người. Bởi thế m&agrave; nhiều người lựa chọn hoa hồng trắng để gửi tặng bạn b&egrave;, người th&acirc;n như muốn nhắn gửi th&ocirc;ng điệp gắn kết, y&ecirc;u thương.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Ngo&agrave;i ra, hoa hồng trắng c&ograve;n được gọi l&agrave; &ldquo;lo&agrave;i hoa của &aacute;nh s&aacute;ng&rdquo; bởi n&oacute; tượng trưng cho một mối quan hệ, t&igrave;nh cảm bất diệt, vĩnh cửu, sống m&atilde;i c&ugrave;ng năm th&aacute;ng. V&igrave; thế, người ta thường sử dụng hoa hồng trắng trong tang lễ để tưởng nhớ những người đ&atilde; khuất.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Ở một số nước phương T&acirc;y, hoa hồng trắng c&ograve;n mang &yacute; nghĩa tượng trưng cho sự t&ocirc;n k&iacute;nh, coi trọng, đề cao gi&aacute; trị. Bởi vậy, người ta thường tặng hoa hồng trắng để thể hiện sự t&ocirc;n vinh, biết ơn của m&igrave;nh đối với những g&igrave; người kh&aacute;c đ&atilde; l&agrave;m, đ&atilde; cống hiến.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Những lưu &yacute; về hoa hồng trắng</strong></p>

<p dir="ltr"><strong>C&aacute;ch chọn hoa hồng trắng</strong></p>

<p dir="ltr">Để c&oacute; thể chọn mua được hoa hồng trắng đẹp, tươi, kh&ocirc;ng bị dập n&aacute;t hay kh&ocirc;. Bạn cần quan s&aacute;t kỹ c&aacute;c chi tiết như: m&agrave;u sắc, ch&acirc;n l&aacute;, độ bung của c&aacute;nh hoa. M&agrave;u sắc hoa c&agrave;ng s&aacute;ng th&igrave; chứng tỏ hoa c&agrave;ng tươi. B&ecirc;n cạnh đ&oacute;, bạn n&ecirc;n ưu ti&ecirc;n lựa chọn hoa m&agrave; c&aacute;nh hoa chỉ mớ bung he h&eacute; nụ, ch&acirc;n l&aacute; hoa th&igrave; c&oacute; m&agrave;u xanh chứ kh&ocirc;ng phải &uacute;a v&agrave;ng.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Ngo&agrave;i ra, khi mua hoa, bạn cũng cần c&acirc;n nhắc số lượng hoa cần mua sao cho ph&ugrave; hợp với mục đ&iacute;ch sử dụng của m&igrave;nh. Kh&ocirc;ng n&ecirc;n t&ugrave;y tiện mua hoa hồng trắng khi chưa x&aacute;c định được r&otilde; đối tượng sử dụng v&agrave; mục đ&iacute;ch ch&iacute;nh.</p>

<p dir="ltr"><strong>C&aacute;ch bảo quản hoa hồng trắng</strong></p>

<p dir="ltr">Để c&oacute; thể bảo quản hoa hồng trắng tươi l&acirc;u, hiệu quả bạn cần ch&uacute; &yacute; những điều sau:</p>

<p>&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr">&Aacute;p dụng c&aacute;ch chọn hoa ở tr&ecirc;n.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Cắt tỉa c&agrave;nh hoa đ&uacute;ng c&aacute;ch, cắt tỉa bớt l&aacute; nhằm đưa chất dinh dưỡng tập trung nu&ocirc;i hoa.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Sử dụng một số chất pha c&ugrave;ng nước cắm hoa nhằm dưỡng hoa như: vitamin B1, nước cốt chanh,&hellip;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Ngay sau khi mua hoa về, ng&acirc;m hoa v&agrave;o nước v&agrave; phun sương.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Đặt b&igrave;nh hoa ở chỗ th&ocirc;ng tho&aacute;ng.&nbsp;</p>
	</li>
</ul>

<p dir="ltr"><strong>Kết luận</strong></p>

<p dir="ltr">B&agrave;i viết tr&ecirc;n đ&acirc;y, ch&uacute;ng t&ocirc;i đ&atilde; cung cấp cho bạn những th&ocirc;ng tin hữu &iacute;ch về lo&agrave;i hoa hồng trắng. Hy vọng rằng qua đ&acirc;y, bạn kh&ocirc;ng chỉ c&oacute; thể biết được nguồn gốc, c&aacute;ch chăm s&oacute;c m&agrave; c&ograve;n c&oacute; thể biết được hoa hồng trắng c&oacute; &yacute; nghĩa g&igrave;.</p>
', NULL, N'/Data/Images/MoriiBlog1.jpg', NULL, CAST(N'2023-12-25T13:39:18.127' AS DateTime), NULL, CAST(N'2023-12-26T16:03:03.520' AS DateTime), NULL, NULL)
INSERT [dbo].[Blog] ([ID], [TieuDe], [MoTa], [NoiDung], [MaND], [UrlImage], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Tất tần tật thông tin về cây sen đá mà bạn nên lưu ý', N'Sen đá là một loại cây đẹp mắt, dễ chăm sóc và có ý nghĩa phong thủy tốt. Dù bạn là người mới bắt đầu trồng cây hay đã có kinh nghiệm, đều là một lựa chọn tuyệt vời. Đọc thêm thông tin đã chia sẻ, bạn sẽ có thêm kiến thức để chăm sóc cây sen đá của mình một cách tốt nhất nhé.', N'<p dir="ltr"><strong>Giới thiệu về c&acirc;y sen đ&aacute;</strong></p>

<p dir="ltr">C&acirc;y sen đ&aacute; hay c&ograve;n gọi l&agrave; hoa đ&aacute; hoặc li&ecirc;n đ&agrave;i. Đ&acirc;y l&agrave; một loại c&acirc;y sống l&acirc;u v&agrave; kh&ocirc;ng cần chăm s&oacute;c thường xuy&ecirc;n. Loại c&acirc;y nhỏ n&agrave;y gần như kh&ocirc;ng c&oacute; th&acirc;n m&agrave; chỉ c&oacute; l&aacute; mọng nước. B&ecirc;n cạnh đ&oacute;, sen đ&aacute; c&oacute; thể th&iacute;ch nghi với nhiều loại kh&iacute; hậu, địa h&igrave;nh v&agrave; sống quanh năm. Phần l&aacute; rụng cũng c&oacute; thể mọc rễ h&igrave;nh th&agrave;nh c&acirc;y mới n&ecirc;n rất dễ sống.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>&Yacute; nghĩa phong thủy của sen đ&aacute;</strong></p>

<p dir="ltr">Trong phong thủy, sen đ&aacute; được cho l&agrave; biểu tượng của sự bền bỉ, ki&ecirc;n tr&igrave; v&agrave; khả năng vượt qua kh&oacute; khăn. N&oacute; cũng thường được li&ecirc;n kết với sự may mắn v&agrave; t&agrave;i lộc. Đặt c&acirc;y sen ở những nơi như b&agrave;n l&agrave;m việc, ph&ograve;ng kh&aacute;ch hay cửa sổ c&oacute; thể gi&uacute;p tạo ra một kh&ocirc;ng gian sống v&agrave; l&agrave;m việc th&acirc;n thiện, thoải m&aacute;i. Đặc biệt, c&acirc;y mang &yacute; nghĩa t&igrave;nh bạn, v&igrave; n&oacute; c&oacute; khả năng sinh s&ocirc;i v&agrave; ph&aacute;t triển dễ d&agrave;ng từ những mảnh vụn nhỏ.</p>

<p><br />
&nbsp;</p>

<p dir="ltr">Nhờ vỏ ngo&agrave;i mọng nước, cứng v&agrave; c&oacute; m&agrave;u như những phiến đ&aacute; khiến người ta li&ecirc;n tưởng tới sự cứng rắn v&agrave; bền bỉ trước c&aacute;c yếu tố ngoại cảnh. Những c&acirc;y sen đ&aacute; sống dai dẳng, điều kiện sống n&agrave;o cũng c&oacute; thể vượt qua được. Tr&ocirc;ng cũng giống như những tảng đ&aacute; vững chắc v&agrave; trường tồn qua h&agrave;ng ng&agrave;n năm. V&igrave; vậy được cho l&agrave; mang lại may mắn v&agrave; thịnh vượng.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Lợi &iacute;ch khi trồng sen đ&aacute;</strong></p>

<p dir="ltr">Sen đ&aacute; kh&ocirc;ng chỉ l&agrave; một loại c&acirc;y trang tr&iacute; đẹp mắt, m&agrave; c&ograve;n c&oacute; nhiều lợi &iacute;ch kh&aacute;c. C&acirc;y c&oacute; khả năng lọc kh&ocirc;ng kh&iacute;, gi&uacute;p loại bỏ c&aacute;c chất độc hại trong kh&ocirc;ng kh&iacute;, cải thiện chất lượng kh&ocirc;ng kh&iacute; trong nh&agrave;. Ngo&agrave;i ra, đ&acirc;y c&ograve;n l&agrave; một loại c&acirc;y dễ chăm s&oacute;c, ph&ugrave; hợp với những người mới bắt đầu trồng c&acirc;y hoặc những người bận rộn.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Khi mua sen đ&aacute;, h&atilde;y ch&uacute; &yacute; đến sức khỏe của c&acirc;y. C&acirc;y n&ecirc;n c&oacute; m&agrave;u sắc tươi s&aacute;ng, kh&ocirc;ng c&oacute; dấu hiệu của bệnh tật hoặc s&acirc;u bệnh. Ngo&agrave;i ra, n&ecirc;n chọn c&acirc;y c&oacute; rễ v&agrave; l&aacute; chắc khỏe, kh&ocirc;ng c&oacute; dấu hiệu mục hoặc thối.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Ph&acirc;n loại c&aacute;c giống sen đ&aacute;</strong></p>

<p dir="ltr">Hiện nay tr&ecirc;n to&agrave;n thế giới ghi nhận chi sen đ&aacute; c&oacute; tới hơn 170 lo&agrave;i kh&aacute;c nhau. Tại Việt Nam, một số loại sen đ&aacute; phổ biến v&agrave; đẹp mắt mới được nhập về v&agrave; b&agrave;y b&aacute;n. Sau đ&acirc;y l&agrave; một số loại hoa sen đ&aacute; phổ biến nhất hiện nay tại thị trường trong nước : Sen kim cương, Sen đ&ocirc; la, Sen phật b&agrave;, Sen tai thỏ, Sen chuỗi ngọc,&hellip;</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>C&aacute;ch chăm s&oacute;c sen đ&aacute;</strong></p>

<p dir="ltr">Chăm s&oacute;c sen đ&aacute; kh&aacute; đơn giản. C&acirc;y cần được tưới nước khi đất trong chậu ho&agrave;n to&agrave;n kh&ocirc;. C&acirc;y cần &aacute;nh s&aacute;ng mặt trời đầy đủ, n&ecirc;n đặt c&acirc;y ở những nơi c&oacute; &aacute;nh s&aacute;ng tự nhi&ecirc;n, nhưng tr&aacute;nh &aacute;nh nắng gắt giữa trưa. C&acirc;y n&ecirc;n được đặt ở nơi c&oacute; &aacute;nh s&aacute;ng mặt trời rải r&aacute;c hoặc &aacute;nh s&aacute;ng mặt trời sớm hoặc muộn trong ng&agrave;y.</p>

<p>&nbsp;</p>

<p dir="ltr">Nếu kh&ocirc;ng c&oacute; đủ &aacute;nh s&aacute;ng, c&acirc;y c&oacute; thể bị &lsquo;k&eacute;o d&agrave;i&rsquo;, tức l&agrave; ph&aacute;t triển d&agrave;i v&agrave; mảnh khảnh, thay v&igrave; mọc rậm rạp v&agrave; đồ sộ. H&atilde;y nhớ rằng sen đ&aacute; kh&ocirc;ng th&iacute;ch m&ocirc;i trường ẩm ướt, v&igrave; vậy h&atilde;y chắc chắn rằng đất trồng của bạn c&oacute; khả năng tho&aacute;t nước tốt. Đặc biệt, nếu trồng trong nh&agrave;, cần ch&uacute; &yacute; tới độ ẩm trong kh&ocirc;ng kh&iacute;. Bạn c&oacute; thể cần sử dụng m&aacute;y h&uacute;t ẩm để gi&uacute;p cải thiện điều kiện m&ocirc;i trường cho c&acirc;y.</p>

<p>&nbsp;</p>

<p dir="ltr">Nh&acirc;n giống sen đ&aacute; cũng kh&aacute; đơn giản. Bạn c&oacute; thể nh&acirc;n giống bằng c&aacute;ch cắt ngọn hoặc lấy l&aacute;. Đối với c&aacute;ch cắt ngọn, chỉ cần cắt một phần ngọn c&acirc;y, để phần cắt kh&ocirc; v&agrave; sau đ&oacute; gắn v&agrave;o đất. Đối với c&aacute;ch lấy l&aacute;, chỉ cần nhẹ nh&agrave;ng gỡ một chiếc l&aacute; khỏi th&acirc;n c&acirc;y, để l&aacute; kh&ocirc; v&agrave; sau đ&oacute; đặt n&oacute; l&ecirc;n mặt đất. Trong cả hai trường hợp, c&acirc;y mới sẽ mọc từ phần đ&atilde; cắt.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Một số bệnh thường gặp khi trồng sen đ&aacute;</strong></p>

<p dir="ltr">C&oacute; một số bệnh thường gặp ảnh hưởng đến sức khỏe của sen đ&aacute;:</p>

<p>&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr">Bị thối rễ: L&agrave; một trong những bệnh phổ biến nhất, thường xảy ra do tưới qu&aacute; nhiều nước. Khi c&acirc;y bị bệnh n&agrave;y, rễ c&acirc;y sẽ bị mục v&agrave; sen đ&aacute; sẽ bị chết nếu kh&ocirc;ng được xử l&yacute; kịp thời. Nếu ph&aacute;t hiện bệnh n&agrave;y, cần cắt bỏ phần rễ mục v&agrave; chuyển c&acirc;y v&agrave;o đất mới.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Bị ch&aacute;y nắng, thiếu nước: L&aacute; c&acirc;y sẽ bị h&eacute;o, quắt lại do t&igrave;nh trạng ch&aacute;y nắng, thiếu nước k&eacute;o d&agrave;i. Ngo&agrave;i ra l&aacute; sen đ&aacute; cũng bị v&agrave;ng, nhợt nhạt. Mặc d&ugrave; sen cần tắm đủ nắng nhưng kh&ocirc;ng n&ecirc;n để l&uacute;c nắng gắt buổi trưa kh&ocirc;ng c&oacute; lợi cho c&acirc;y. C&acirc;y cũng cần được tưới đủ nước.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Bị nấm, rệp s&aacute;p tấn c&ocirc;ng: C&acirc;y cũng c&oacute; thể bị tấn c&ocirc;ng bởi c&aacute;c loại c&ocirc;n tr&ugrave;ng như rệp s&aacute;p. Rệp s&aacute;p sẽ ăn phần nước trong l&aacute; c&acirc;y, l&agrave;m c&acirc;y bị mất nước v&agrave; chết. Để xử l&yacute;, bạn c&oacute; thể sử dụng c&aacute;c loại thuốc trừ s&acirc;u chuy&ecirc;n dụng.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Bị kiến l&agrave;m tổ ở gốc: Cần xử l&yacute; ngay khi c&acirc;y sen đ&aacute; c&oacute; hiện tượng kiến chuyển nh&agrave; sống trong chậu c&acirc;y. Đ&acirc;y l&agrave; việc gi&aacute;n tiếp khiến sen đ&aacute; bị rệp, ngo&agrave;i ra, kiến sẽ khiến rễ c&acirc;y bị ảnh hưởng kh&ocirc;ng ph&aacute;t triển.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Bị nấm: Nếu bạn thấy l&aacute; h&eacute;o, bị rụng bất thường li&ecirc;n tục, cần kiểm tra ngay xem c&acirc;y sen đ&aacute; của bạn c&oacute; bị nấm kh&ocirc;ng nh&eacute;. Do đất qu&aacute; ẩm cộng th&ecirc;m kh&ocirc;ng kh&iacute; kh&ocirc;ng được lưu th&ocirc;ng c&oacute; thể sẽ khiến c&acirc;y của bạn bị nấm mốc. H&atilde;y sử dụng thuốc diệt nấm, cho c&acirc;y tắm nắng. Trong trường hợp nấm qu&aacute; nặng bạn n&ecirc;n vứt nh&aacute;nh bị nấm để tr&aacute;nh ảnh hưởng nh&aacute;nh kh&aacute;c.</p>
	</li>
</ul>

<p>&nbsp;</p>

<p dir="ltr"><strong>Tổng kết</strong></p>

<p dir="ltr">Tr&ecirc;n đ&acirc;y l&agrave; tất cả những th&ocirc;ng tin cơ bản về c&acirc;y sen đ&aacute; m&agrave; bạn cần lưu &yacute;. Như vậy, th&ocirc;ng qua b&agrave;i viết, ch&uacute;ng ta đ&atilde; hiểu r&otilde; hơn từ &yacute; nghĩa phong thủy, lợi &iacute;ch đến c&aacute;ch chăm s&oacute;c, cũng như những bệnh thường gặp ở c&acirc;y. Với những người y&ecirc;u th&iacute;ch c&acirc;y cảnh, sen đ&aacute; l&agrave; một lựa chọn kh&ocirc;ng thể bỏ qua bởi vẻ đẹp độc đ&aacute;o, dễ chăm s&oacute;c v&agrave; &yacute; nghĩa phong thủy đặc biệt m&agrave; lo&agrave;i c&acirc;y n&agrave;y mang lại.</p>
', NULL, N'/Data/Images/MoriiBlog2.jpeg', NULL, CAST(N'2023-12-26T12:58:49.157' AS DateTime), NULL, CAST(N'2023-12-26T16:05:50.090' AS DateTime), NULL, NULL)
INSERT [dbo].[Blog] ([ID], [TieuDe], [MoTa], [NoiDung], [MaND], [UrlImage], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Hoa sống đời – Đâu đơn thuần chỉ là một loài hoa!', N'Hoa sống đời là một loại hoa đặc biệt có ý nghĩa đặc biệt và được sử dụng trong nhiều hoàn cảnh khác nhau. Hôm nay hãy cùng Bloomsy tìm hiểu kĩ hơn cũng như toàn bộ các ý nghĩa nằm sâu trong cái tên “sống đời” này nhé! ', N'<p dir="ltr"><strong>Giới thiệu về hoa sống đời</strong></p>

<p dir="ltr"><strong>Đặc điểm của hoa sống đời</strong></p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">Điểm nổi bật đầu ti&ecirc;n của lo&agrave;i hoa n&agrave;y l&agrave; khả năng &ldquo;sống đời&rdquo;. Thật vậy, ch&uacute;ng c&oacute; khả năng t&aacute;i sinh v&agrave; ph&aacute;t triển lại từ rễ hoặc củ của c&acirc;y sau m&ugrave;a đ&ocirc;ng hoặc khi bị cắt tỉa. Th&acirc;n của hoa thường c&oacute; độ cứng c&aacute;p v&agrave; chắc chắn, gi&uacute;p cho c&acirc;y c&oacute; thể sống l&acirc;u v&agrave; đứng vững trước những thay đổi của thời tiết.</p>

<p dir="ltr">&nbsp;</p>

<p dir="ltr">L&aacute; của sống đời thường d&agrave;y hơn so với những loại hoa kh&aacute;c, gi&uacute;p cho c&acirc;y chịu được nhiệt độ thấp hơn trong m&ugrave;a đ&ocirc;ng. Hoa của ch&uacute;ng thường c&oacute; k&iacute;ch thước lớn hơn so với những loại hoa kh&aacute;c, tạo n&ecirc;n vẻ đẹp nổi bật v&agrave; thu h&uacute;t sự ch&uacute; &yacute; của người ta.</p>

<p dir="ltr"><strong>C&aacute;c loại hoa sống đời phổ biến</strong></p>

<p dir="ltr">Nh&igrave;n chung, hoa sống đời được chia l&agrave;m một số loại sau đ&acirc;y:</p>

<p>&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr">Sống đời ta (b&ocirc;ng lồng đ&egrave;n):&nbsp;</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Sống đời Đ&agrave; Lạt.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Sống đời đỏ.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Sống đời 5 m&agrave;u.</p>
	</li>
</ul>

<p>&nbsp;</p>

<p dir="ltr"><strong>&Yacute; nghĩa của hoa sống đời</strong></p>

<p dir="ltr">Từ l&acirc;u, ch&uacute;ng đ&atilde; được con người biết đến v&agrave; trồng trọt để t&ocirc; điểm khu vườn, s&acirc;n vườn v&agrave; cả kh&ocirc;ng gian nội thất. Tuy nhi&ecirc;n, hoa sống đời kh&ocirc;ng chỉ đơn thuần l&agrave; vật trang tr&iacute; m&agrave; c&ograve;n mang lại những &yacute; nghĩa tinh thần s&acirc;u sắc cho con người.</p>

<p><br />
&nbsp;</p>

<p dir="ltr"><strong>Tượng trưng cho sự bền bỉ v&agrave; sức mạnh</strong></p>

<p dir="ltr">Lo&agrave;i hoa n&agrave;y được xem như một biểu tượng cho sự bền bỉ v&agrave; sức mạnh, bởi ch&uacute;ng c&oacute; khả năng sống v&agrave; ph&aacute;t triển trong thời gian d&agrave;i m&agrave; kh&ocirc;ng bị t&agrave;n lụi như c&aacute;c lo&agrave;i hoa kh&aacute;c. Ngo&agrave;i ra việc trồng hoa cũng gi&uacute;p ch&uacute;ng ta t&ocirc;n trọng v&agrave; kh&iacute;ch lệ sự ki&ecirc;n tr&igrave; v&agrave; sức mạnh của bản th&acirc;n.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Mang lại sự may mắn v&agrave; t&agrave;i lộc</strong></p>

<p dir="ltr">Theo một số quan niệm d&acirc;n gian, trồng ch&uacute;ng trong khu vườn hoặc nh&agrave; cửa c&oacute; thể mang lại sự may mắn v&agrave; t&agrave;i lộc cho gia chủ. Nhiều người tin rằng, ch&uacute;ng gi&uacute;p thu h&uacute;t t&agrave;i lộc v&agrave; cải thiện t&agrave;i vận cho gia đ&igrave;nh.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Biểu tượng của t&igrave;nh y&ecirc;u v&agrave; l&ograve;ng trung th&agrave;nh</strong></p>

<p dir="ltr">Ngo&agrave;i hiện diện cho sự bền bỉ v&agrave; sức mạnh, được xem như một biểu tượng của t&igrave;nh y&ecirc;u v&agrave; l&ograve;ng trung th&agrave;nh, bởi ch&uacute;ng c&oacute; khả năng sống v&agrave; nở hoa suốt qu&atilde;ng đời của ch&uacute;ng. Trồng hoa cũng c&oacute; thể gi&uacute;p ch&uacute;ng ta thể hiện t&igrave;nh cảm y&ecirc;u thương v&agrave; sự trung th&agrave;nh với người th&acirc;n y&ecirc;u.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Gi&uacute;p giảm stress v&agrave; cải thiện t&acirc;m trạng</strong></p>

<p dir="ltr">C&aacute;c nghi&ecirc;n cứu khoa học đ&atilde; chứng minh rằng việc trồng v&agrave; chăm s&oacute;c c&acirc;y cối, c&oacute; thể gi&uacute;p giảm stress v&agrave; cải thiện t&acirc;m trạng. Việc ngắm nh&igrave;n v&agrave; tiếp x&uacute;c với thi&ecirc;n nhi&ecirc;n cũng c&oacute; thể gi&uacute;p ch&uacute;ng ta thư gi&atilde;n v&agrave; tăng cường sức khỏe tinh thần.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>C&aacute;c lưu &yacute; khi trồng v&agrave; chăm s&oacute;c hoa sống đời</strong></p>

<p dir="ltr"><strong>Trồng hoa sống đời</strong></p>

<p dir="ltr">Nếu bạn muốn trồng loại c&acirc;y n&agrave;y, bạn c&oacute; thể thực hiện một số c&aacute;ch đơn giản sau đ&acirc;y:</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>C&aacute;ch 1: Trồng c&acirc;y sống đời bằng l&aacute;</strong></p>

<p dir="ltr">Bạn chỉ cần chọn 2-3 l&aacute; gi&agrave; từ c&acirc;y mẹ, sau đ&oacute; đem gieo xuống đất, b&oacute;n ph&acirc;n v&agrave; tưới nước đều. Sau v&agrave;i ng&agrave;y, c&aacute;c c&acirc;y con sẽ bắt đầu nảy mầm v&agrave; ph&aacute;t triển từ m&eacute;p l&aacute;. Khi c&acirc;y con mọc được 2 l&aacute;, bạn c&oacute; thể t&aacute;ch ch&uacute;ng ra v&agrave; trồng v&agrave;o c&aacute;c chậu mới để c&oacute; th&ecirc;m nhiều c&acirc;y sống đời.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>C&aacute;ch 2: Trồng c&acirc;y sống đời bằng c&agrave;nh</strong></p>

<p dir="ltr">Trước ti&ecirc;n, bạn cần chuẩn bị một m&ocirc;i trường trồng th&iacute;ch hợp, đất cần đủ dinh dưỡng, ph&igrave; nhi&ecirc;u cao v&agrave; dễ tho&aacute;t nước. Sau đ&oacute;, bạn chọn một c&agrave;nh từ c&acirc;y mẹ c&oacute; từ 4 đến 5 cặp l&aacute; trở l&ecirc;n, cắt tỉa c&agrave;nh đ&oacute; với g&oacute;c cắt 45 độ, sau đ&oacute; gi&acirc;m c&agrave;nh v&agrave;o đất.</p>

<p>&nbsp;</p>

<p dir="ltr">Khi đặt c&acirc;y v&agrave;o đất, h&atilde;y đảm bảo rằng n&oacute; được đặt trong b&oacute;ng r&acirc;m để tr&aacute;nh &aacute;nh nắng trực tiếp, v&igrave; trong thời gian n&agrave;y c&acirc;y c&ograve;n yếu v&agrave; kh&ocirc;ng thể chịu được &aacute;nh s&aacute;ng mạnh. Sau khoảng 1 đến 1,5 th&aacute;ng, nếu thấy rễ c&acirc;y đ&atilde; mọc ra đầy đủ, bạn c&oacute; thể đưa c&acirc;y v&agrave;o chậu mới để c&oacute; th&ecirc;m c&acirc;y sống đời.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Chăm s&oacute;c hoa sống đời thế n&agrave;o?</strong></p>

<ul>
	<li dir="ltr">
	<p dir="ltr">Tưới nước cho hoa: Bạn kh&ocirc;ng cần phải tưới nước li&ecirc;n tục mỗi ng&agrave;y, v&igrave; điều đ&oacute; l&agrave; kh&ocirc;ng cần thiết v&agrave; thậm ch&iacute; c&ograve;n l&agrave;m cho c&acirc;y bị &uacute;ng nước.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Ph&acirc;n b&oacute;n cho hoa phải d&ugrave;ng loại ph&ugrave; hợp v&agrave; kh&ocirc;ng c&oacute; t&aacute;c dụng phụ cho c&acirc;y.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Ngo&agrave;i ra khi chăm s&oacute;c c&ograve;n cần phải tỉa l&aacute; cho c&acirc;y thường xuy&ecirc;n để c&acirc;y ph&aacute;t triển khỏe mạnh v&agrave; giảm s&acirc;u bệnh</p>
	</li>
</ul>

<p dir="ltr"><strong>Kết luận</strong></p>

<p dir="ltr">Qua những đặc t&iacute;nh nổi trội v&agrave; khả năng sinh trưởng cực k&igrave; tốt như vậy, hoa sống đời hẳn phải c&oacute; trong ng&ocirc;i nh&agrave; của ch&iacute;nh bạn rồi đ&uacute;ng kh&ocirc;ng n&agrave;o. Cảm ơn bạn đ&atilde; theo d&otilde;i hết b&agrave;i viết của Bloomsy, hẹn gặp lại bạn v&agrave;o c&aacute;c b&agrave;i viết tiếp theo!</p>

<p>&nbsp;</p>
', NULL, N'/Data/Images/MoriiBlog3.jpg', NULL, CAST(N'2023-12-26T15:57:46.010' AS DateTime), NULL, CAST(N'2023-12-26T16:08:27.110' AS DateTime), NULL, NULL)
INSERT [dbo].[Blog] ([ID], [TieuDe], [MoTa], [NoiDung], [MaND], [UrlImage], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Ý nghĩa hoa hồng xanh – Tình yêu và đời sống', N'Đằng sau những cánh hoa xanh ngát ấy, ý nghĩa hoa hồng xanh luôn mang lại những câu chuyện riêng về tình cảm và cuộc sống. Hôm nay hãy cùng với Bloomsy tìm hiểu về ý nghĩa hoa hồng xanh ngay trong bài viết dưới đây nhé!', N'<p dir="ltr"><strong>Giới thiệu về hoa hồng xanh</strong></p>

<p dir="ltr"><strong>Nguồn gốc của hoa hồng xanh</strong></p>

<p dir="ltr">Hoa hồng xanh thực chất l&agrave; một lo&agrave;i hoa nh&acirc;n tạo. Thực tế, hoa hồng xanh tr&ecirc;n thị trường hiện nay l&agrave; loại hoa được tạo ra th&ocirc;ng qua kỹ thuật nhuộm m&agrave;u hoa hoặc lai tạo gen.</p>

<p dir="ltr">C&aacute;ch đơn giản nhất để c&oacute; hoa hồng xanh l&agrave; d&ugrave;ng kỹ thuật nhuộm m&agrave;u l&ecirc;n hoa hồng trắng. Qu&aacute; tr&igrave;nh nhuộm m&agrave;u n&agrave;y thường được thực hiện bằng c&aacute;ch ch&egrave;n một chất m&agrave;u xanh v&agrave;o th&acirc;n c&acirc;y hoa hồng, để tạo ra m&agrave;u sắc xanh trong hoa. Hoặc bạn cũng c&oacute; thể d&ugrave;ng m&agrave;u nhuộm xanh phun trực tiếp l&ecirc;n những c&aacute;nh hoa trắng.</p>

<p>&nbsp;</p>

<p dir="ltr">B&ecirc;n cạnh việc nhuộm m&agrave;u, sau nhiều năm nghi&ecirc;n cứu c&aacute;c nh&agrave; khoa học th&ocirc;ng quan việc cải tạo, biến đổi gen cũng đ&atilde; ph&aacute;t triển được giống hoa hồng xanh dương nh&acirc;n tạo đầu ti&ecirc;n tại Nhật Bản v&agrave;o năm 2004. Do sự phức tạp của qu&aacute; tr&igrave;nh cải tạo n&ecirc;n hiện nay hoa hồng xanh dương kh&ocirc;ng được trồng phổ biến. Vậy n&ecirc;n nếu muốn sở hữu những mẫu hoa hồng xanh thực thụ bạn cần phải chi một số tiến kh&aacute; cao cho những b&ocirc;ng hoa nhập khẩu.</p>

<p dir="ltr"><strong>Đặc điểm của hoa hồng xanh</strong></p>

<p dir="ltr">Điểm nổi bật nhất l&agrave; m&agrave;u sắc xanh đặc trưng, từ sắc xanh nhẹ đến xanh đậm, tuỳ thuộc v&agrave;o quy tr&igrave;nh nhuộm m&agrave;u v&agrave; lai tạo. Đ&acirc;y l&agrave; điểm l&agrave;m nổi bật v&agrave; thu h&uacute;t sự ch&uacute; &yacute; cho hoa hồng xanh, v&igrave; n&oacute; kh&ocirc;ng phổ biến như hoa hồng truyền thống.</p>

<p>&nbsp;</p>

<p dir="ltr">M&agrave;u sắc độc đ&aacute;o v&agrave; hiếm c&oacute; của hoa hồng xanh tạo n&ecirc;n một sự ấn tượng đặc biệt v&agrave; mang &yacute; nghĩa đặc trưng kh&aacute;c so với hoa hồng truyền thống. Trong trang tr&iacute;, hoa hồng xanh tạo điểm nhấn v&agrave; sự đối lập th&uacute; vị. Ch&uacute;ng c&oacute; thể được kết hợp với c&aacute;c loại hoa kh&aacute;c để tạo ra c&aacute;c mẫu hoa độc đ&aacute;o v&agrave; &yacute; nghĩa.</p>

<p dir="ltr"><strong>&Yacute; nghĩa hoa hồng xanh</strong></p>

<p dir="ltr"><strong>&Yacute; nghĩa hoa hồng xanh trong chuyện t&igrave;nh cảm</strong></p>

<p dir="ltr">Hoa hồng xanh kh&ocirc;ng chỉ đơn thuần l&agrave; một lo&agrave;i hoa đẹp mắt, m&agrave; c&ograve;n chứa đựng trong m&igrave;nh những &yacute; nghĩa s&acirc;u sắc trong t&igrave;nh y&ecirc;u, đ&acirc;y c&oacute; thể được xem l&agrave; &yacute; nghĩa hoa hồng xanh đặc biệt nhất. Sắc xanh tươi m&aacute;t của hoa hồng xanh tượng trưng cho sự tươi mới v&agrave; sự ph&aacute;t triển trong mối quan hệ t&igrave;nh y&ecirc;u, mang đến hy vọng cho một tương lai hạnh ph&uacute;c v&agrave; chung thủy.</p>

<p>&nbsp;</p>

<p dir="ltr">M&agrave;u xanh của hoa hồng xanh c&ograve;n mang trong m&igrave;nh một cảm gi&aacute;c kỳ diệu, n&oacute; tạo ra kh&ocirc;ng gian của những điều ước mong, mở ra những khả năng mới v&agrave; tiềm năng trong mối quan hệ t&igrave;nh cảm. Đồng thời, m&agrave;u sắc độc đ&aacute;o của n&oacute; c&ograve;n biểu thị sự lịch thiệp v&agrave; qu&yacute; ph&aacute;i trong t&igrave;nh y&ecirc;u.</p>

<p dir="ltr">Khi tặng hoa hồng xanh cho người y&ecirc;u, bạn kh&ocirc;ng chỉ tặng một m&oacute;n qu&agrave; đẹp mắt, m&agrave; &yacute; nghĩa hoa hồng xanh c&ograve;n truyền đạt những &yacute; nghĩa s&acirc;u sắc kh&aacute;c:</p>

<p>&nbsp;</p>

<ul>
	<li dir="ltr">
	<p dir="ltr">Đ&oacute; l&agrave; sự tươi mới, ph&aacute;t triển v&agrave; hy vọng trong t&igrave;nh y&ecirc;u.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Đ&oacute; l&agrave; sự độc đ&aacute;o, kh&aacute;c biệt v&agrave; kỳ diệu của mối quan hệ.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Đ&oacute; l&agrave; sự thanh lịch v&agrave; tinh tế của t&igrave;nh y&ecirc;u&nbsp;</p>
	</li>
</ul>

<p dir="ltr">Hoa hồng xanh tạo th&ecirc;m sự đặc biệt v&agrave; kỳ diệu trong mối quan hệ của hai người, l&agrave; biểu tượng tuyệt vời cho t&igrave;nh y&ecirc;u đầy &yacute; nghĩa v&agrave; đậm chất ri&ecirc;ng.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>&Yacute; nghĩa hoa hồng xanh trong cuộc sống</strong></p>

<p dir="ltr">&Yacute; nghĩa hoa hồng xanh cũng được thể hiện trong cuộc sống của mỗi người. M&agrave;u xanh của hoa thể hiện cho sự tươi mới, phục hồi v&agrave; kh&aacute;m ph&aacute;. N&oacute; đại diện cho sự độc đ&aacute;o v&agrave; kh&aacute;c biệt, l&agrave;m nổi bật kh&ocirc;ng gian sống của bạn.</p>

<p>&nbsp;</p>

<p dir="ltr">Ngo&agrave;i ra, n&oacute; c&ograve;n kết nối với &yacute; nghĩa về m&ocirc;i trường v&agrave; bảo vệ m&ocirc;i trường. Hoa hồng xanh l&agrave; biểu tượng cho sự qu&yacute; gi&aacute; của mọi sự sống, khuyến kh&iacute;ch ch&uacute;ng ta tận hưởng những khoảnh khắc mới mẻ, độc đ&aacute;o v&agrave; bảo vệ vẻ đẹp tự nhi&ecirc;n.</p>

<p dir="ltr"><strong>&Yacute; nghĩa hoa hồng xanh trong kinh doanh</strong></p>

<p dir="ltr">Trong kinh doanh, sự ph&aacute;t triển l&agrave; mục ti&ecirc;u quan trọng. Sử dụng hoa hồng xanh c&oacute; thể thể hiện tầm nh&igrave;n c&ugrave;ng cam kết của doanh nghiệp trong việc mang đến những sản phẩm, dịch vụ mới mẻ v&agrave; tiến bộ.</p>

<p dir="ltr">Hoa hồng xanh thể hiện sự s&aacute;ng tạo v&agrave; đổi mới. Trong một thị trường cạnh tranh, sự s&aacute;ng tạo l&agrave; yếu tố quan trọng để nổi bật v&agrave; tạo ra lợi thế cạnh tranh. Hoa hồng xanh c&oacute; thể th&uacute;c đẩy &yacute; tưởng s&aacute;ng tạo v&agrave; khả năng tư duy mới mẻ trong kinh doanh.</p>

<p dir="ltr"><strong>Kết luận</strong></p>

<p dir="ltr">Cảm ơn bạn đ&atilde; theo d&otilde;i hết to&agrave;n bộ &yacute; nghĩa của hoa hồng xanh. Hy vọng qua b&agrave;i viết n&agrave;y bạn đ&atilde; hiểu r&otilde; hơn về &yacute; nghĩa của lo&agrave;i hoa đặc biệt n&agrave;y nh&eacute;. V&agrave; nếu muốn sở hữu những mẫu hoa hồng xanh chất lượng, xinh đẹp, độc đ&aacute;o th&igrave; bạn h&atilde;y gh&eacute; Bloomsy nh&eacute;.</p>
', NULL, N'/Data/Images/MoriiBlog4.jpg', NULL, CAST(N'2023-12-26T16:08:31.187' AS DateTime), NULL, CAST(N'2023-12-26T16:09:46.940' AS DateTime), NULL, NULL)
INSERT [dbo].[Blog] ([ID], [TieuDe], [MoTa], [NoiDung], [MaND], [UrlImage], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Chọn hoa cưới đẹp lung linh như cổ tích', N'Lựa chọn hoa tươi để trang trí sân khấu ngày cưới đang là xu hướng “làm mưa làm gió” trong thời gian gần đây. Vẻ đẹp của hoa tươi luôn có một sức hút lạ kỳ, tựa như vẻ đẹp của các cô gái. Bất kỳ cô gái nào được sinh ra trên đời này luôn là những đóa hoa xinh đẹp, rạng rỡ và yêu kiều nhất. Chính vì vậy, trong ngày trọng đại của cuộc đời, những đóa hoa xinh xuất hiện trên sân khấu sẽ là linh hồn, tô điểm cho khung cảnh đám cưới thêm phần lung linh vải tráng lệ.', N'<p dir="ltr"><strong>Chọn hoa tươi trang tr&iacute; s&acirc;n khấu cho ng&agrave;y cưới đẹp lung linh</strong></p>

<p dir="ltr">S&acirc;n khấu l&agrave; một khu vực v&ocirc; c&ugrave;ng quan trọng trong lễ cưới. Đ&oacute; l&agrave; nơi c&ocirc; d&acirc;u ch&uacute; rể sẽ trao cho nhau nụ h&ocirc;n nồng thắm v&agrave; đeo v&agrave;o tay đối phương chiếc nhẫn định t&igrave;nh. Một h&agrave;nh tr&igrave;nh mới, từ t&igrave;nh nh&acirc;n sang những người bạn đời được chuyển giao tr&ecirc;n s&acirc;n khấu ấy. C&oacute; lẽ cũng ch&iacute;nh v&igrave; vậy m&agrave; ai cũng muốn những khoảnh khắc ấy đẹp nhất. V&agrave; c&oacute; lẽ đ&oacute; cũng l&yacute; do hoa tươi được lựa chọn để trang tr&iacute; s&acirc;n khấu ng&agrave;y cưới nhiều đến thế.</p>

<p>&nbsp;</p>

<p dir="ltr">Trang tr&iacute; s&acirc;n khấu bằng hoa tươi kh&ocirc;ng chỉ tạo n&ecirc;n khung cảnh đẹp lung linh m&agrave; c&ograve;n mang &yacute; nghĩa đặc biệt tốt l&agrave;nh. Mỗi lo&agrave;i hoa th&igrave; thầm một ng&ocirc;n ngữ ri&ecirc;ng về t&igrave;nh y&ecirc;u, về hạnh ph&uacute;c lứa đ&ocirc;i, gi&uacute;p cho ng&agrave;y cưới th&ecirc;m trọn vẹn.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Giữa những tr&agrave;ng ph&aacute;o tay, những lời ch&uacute;c ph&uacute;c của người th&acirc;n, bạn b&egrave;, giữa h&agrave;ng ng&agrave;n đ&oacute;a hoa khoe sắc tạo n&ecirc;n khung cảnh l&atilde;ng mạn như cổ t&iacute;ch, c&ocirc; d&acirc;u tựa như n&agrave;ng c&ocirc;ng ch&uacute;a từ từ tiến v&agrave;o với ch&agrave;ng ho&agrave;ng tử của m&igrave;nh. Kh&ocirc;ng gian ngọt ng&agrave;o v&agrave; n&ecirc;n thơ xiết bao! Những đ&oacute;a hoa cưới trang tr&iacute; s&acirc;n khấu đ&atilde; ho&agrave;n th&agrave;nh xuất sắc nhiệm vụ l&agrave;m nền cho thời khắc đặc biệt &yacute; nghĩa của đ&ocirc;i lứa.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Gợi &yacute; c&aacute;c loại hoa trang tr&iacute; s&acirc;n khấu ng&agrave;y cưới đẹp lung linh như cổ t&iacute;ch</strong></p>

<p dir="ltr">C&oacute; rất nhiều lo&agrave;i hoa đẹp ph&ugrave; hợp để trang tr&iacute; s&acirc;n khấu lễ cưới. Mỗi lo&agrave;i hoa đều mang một &yacute; nghĩa ri&ecirc;ng. Đ&oacute; c&oacute; thể l&agrave; c&aacute;i t&ecirc;n gắn liền với c&acirc;u chuyện t&igrave;nh y&ecirc;u đ&ocirc;i lứa hay lo&agrave;i hoa m&agrave; c&ocirc; d&acirc;u y&ecirc;u th&iacute;ch,&hellip; Bạn c&oacute; thể lựa chọn một hoặc kết hợp nhiều loại hoa t&ugrave;y theo sở th&iacute;ch v&agrave; phong c&aacute;ch chung của lễ cưới. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i điểm qua một số lo&agrave;i hoa &yacute; nghĩa thường được d&ugrave;ng để trang tr&iacute; s&acirc;n khấu ng&agrave;y cưới nh&eacute;.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa hồng m&agrave;u hồng</strong></p>

<p dir="ltr">Hoa hồng m&agrave;u hồng l&agrave; một trong những gợi &yacute; h&agrave;ng đầu khi bạn lựa chọn hoa cưới trang tr&iacute; s&acirc;n khấu. Lo&agrave;i hoa n&agrave;y thể hiện t&igrave;nh y&ecirc;u v&ocirc; bờ bến của đ&ocirc;i lứa d&agrave;nh cho nhau. Tuy kh&ocirc;ng sở hữu vẻ đẹp ki&ecirc;u sa v&agrave; quyến rũ như hoa hồng đỏ nhưng hoa hồng phấn lại mang đến vẻ đẹp nhẹ nh&agrave;ng, l&atilde;ng mạn v&agrave; ngọt ng&agrave;o.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa hồng trắng</strong></p>

<p dir="ltr">Hoa hồng trắng &ndash; biểu tượng của t&igrave;nh y&ecirc;u thơ ng&acirc;y v&agrave; thuần khiết. Đằng sau vẻ đẹp mong manh l&agrave; th&ocirc;ng điệp m&atilde;nh liệt về t&igrave;nh y&ecirc;u. Với th&ocirc;ng điệp &ldquo;Hy vọng rằng t&igrave;nh y&ecirc;u của anh v&agrave; em sẽ k&eacute;o d&agrave;i m&atilde;i m&atilde;i&rdquo;, hoa hồng trắng l&agrave; một lựa chọn tuyệt vời cho hoa cưới trang tr&iacute; s&acirc;n khấu. Kh&ocirc;ng những vậy, lo&agrave;i hoa n&agrave;y c&ograve;n khiến kh&ocirc;ng gian lễ cưới th&ecirc;m phần tươi s&aacute;ng v&agrave; sang trọng hơn.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa mao lương trắng</strong></p>

<p dir="ltr">Th&ecirc;m một gợi &yacute; d&agrave;nh cho bạn khi lựa chọn hoa cưới trang tr&iacute; s&acirc;n khấu &ndash; hoa mao lương trắng. Nhẹ nh&agrave;ng v&agrave; thanh khiết, mao lương trắng l&agrave; hiện th&acirc;n của một chuyện t&igrave;nh đẹp, của lời hứa b&ecirc;n nhau m&atilde;i m&atilde;i. Tặng hoa mao lương cho người con g&aacute;i m&igrave;nh y&ecirc;u thay cho lời b&agrave;y tỏ &ldquo;Đối với anh, em l&agrave; người phụ nữ hấp dẫn v&agrave; quyến rũ nhất&rdquo;. Ch&iacute;nh v&igrave; vậy, sự hiện diện của lo&agrave;i hoa n&agrave;y l&agrave; một điều v&ocirc; c&ugrave;ng đặc biệt v&agrave; &yacute; nghĩa trong đ&aacute;m cưới.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa hải quỳ</strong></p>

<p dir="ltr">Hoa hải quỳ gắn liền với th&ocirc;ng điệp về sự b&igrave;nh an v&agrave; may mắn. Lo&agrave;i hoa n&agrave;y xuất hiện trong đ&aacute;m cưới tựa như lời cầu ch&uacute;c đ&ocirc;i trai t&agrave;i g&aacute;i sắc gặp nhiều điều tốt đẹp trong cuộc sống. Nếu bạn l&agrave; người y&ecirc;u th&iacute;ch khung cảnh sống động, nhiều m&agrave;u sắc th&igrave; kh&ocirc;ng thể bỏ qua hoa hải quỳ khi trang tr&iacute; s&acirc;n khấu lễ cưới. Với những m&agrave;u sắc đa dạng v&agrave; nổi bật, lo&agrave;i hoa n&agrave;y sẽ khiến đ&aacute;m cưới của bạn trở n&ecirc;n cực kỳ ấn tượng.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa cẩm t&uacute; cầu xanh</strong></p>

<p dir="ltr">Sẽ thật tuyệt vời nếu hai bạn trao cho nhau nụ h&ocirc;n hạnh ph&uacute;c giữa những đ&oacute;a cẩm t&uacute; cầu xanh &ndash; sứ giả của t&igrave;nh y&ecirc;u. Khung cảnh thật l&atilde;ng mạn biết bao! M&agrave;u xanh &ndash; m&agrave;u của sự hi vọng v&agrave; lạc quan. Hoa cẩm t&uacute; cầu &ndash; lo&agrave;i hoa tượng trưng cho t&igrave;nh y&ecirc;u ch&acirc;n th&agrave;nh, từ tr&aacute;i tim chạm đến tr&aacute;i tim. Ch&iacute;nh v&igrave; vậy, hoa cẩm t&uacute; cầu l&agrave; một lựa chọn tuyệt vời để trang tr&iacute; s&acirc;n khấu ng&agrave;y cưới.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Lựa chọn hoa tươi trang tr&iacute; s&acirc;n khấu ng&agrave;y cưới l&agrave; một phương &aacute;n tuyệt vời. Hi vọng những th&ocirc;ng tin ph&iacute;a tr&ecirc;n đ&atilde; gi&uacute;p bạn c&oacute; th&ecirc;m &yacute; tưởng cho khung cảnh lễ cưới th&ecirc;m phần lung linh v&agrave; đẹp đẽ. Nếu cần được tư vấn th&ecirc;m hoặc c&oacute; nhu cầu đặt hoa cưới trang tr&iacute; s&acirc;n khấu, bạn ho&agrave;n to&agrave;n c&oacute; thể li&ecirc;n hệ với Bloomsy qua số hotline.</p>
', NULL, N'/Data/Images/MoriiBlog6.jpg', NULL, CAST(N'2023-12-26T16:09:50.870' AS DateTime), NULL, CAST(N'2023-12-26T16:11:16.560' AS DateTime), NULL, NULL)
INSERT [dbo].[Blog] ([ID], [TieuDe], [MoTa], [NoiDung], [MaND], [UrlImage], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Top 5 Loài Hoa Dành Tặng Mẹ Giàu Ý Nghĩa', N'Có lẽ hoa tặng mẹ món quà thay cho bao lời nói “mẹ ơi, con yêu mẹ”, “mẹ ơi, thanh xuân của mẹ là con”. Niềm vui của mẹ chính là nhìn thấy đứa con của mình khôn lớn, khỏe mạnh. Dù có trải qua bao nhiêu khó khăn, vất vả nhưng vì con mẹ vẫn đương đầu. Dẫu biết rằng như thế nhưng mấy ai trong chúng ta nói ra được tiếng lòng của mình. Và hoa chính là sứ giả thay cho ngàn lời yêu thương của những đứa con đã khôn lớn, đã trưởng thành giãi bày nỗi lòng mình.', N'<p dir="ltr"><strong>5 lo&agrave;i hoa d&agrave;nh tặng mẹ gi&agrave;u &yacute; nghĩa</strong></p>

<p dir="ltr"><strong>Hoa ly</strong></p>

<p dir="ltr">Chắc hẳn nhiều người trong ch&uacute;ng ta thường chọn hoa ly để d&agrave;nh tặng cho người m&igrave;nh thương. Bởi hoa ly l&agrave; lo&agrave;i hoa đại diện cho t&igrave;nh y&ecirc;u v&agrave; n&eacute;t đẹp ki&ecirc;u sa, quyến rũ. Tuy nhi&ecirc;n, mấy ai biết đến hoa ly c&ograve;n l&agrave; biểu tượng cho t&igrave;nh mẫu tử thi&ecirc;ng li&ecirc;ng.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">Đặc biệt, ở mỗi m&agrave;u sắc hoa tặng mẹ cũng l&agrave; biểu trưng cho những th&ocirc;ng điệp kh&aacute;c nhau. Bạn c&oacute; thể d&agrave;nh tặng cho người mẹ đ&atilde; vất vả, lo toan g&aacute;nh v&aacute;c cho gia đ&igrave;nh những b&oacute; hoa ly hồng để tỏ l&ograve;ng biết ơn. Hay b&agrave;y tỏ tấm l&ograve;ng th&agrave;nh k&iacute;nh d&agrave;nh cho mẹ th&ocirc;ng qua đo&aacute; ly trắng. Hoa ly v&agrave;ng mang &yacute; nghĩa của sự tận t&acirc;m v&agrave; lời cảm ơn s&acirc;u sắc cũng l&agrave; hoa tặng mẹ l&yacute; tưởng thể hiện r&otilde; nhất t&igrave;nh cảm k&iacute;nh y&ecirc;u v&ocirc; bờ m&agrave; bạn d&agrave;nh cho mẹ.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa cẩm chướng tặng mẹ</strong></p>

<p dir="ltr">Hoa cẩm chướng với m&ugrave;i thơm nồng n&agrave;n, sắc hồng đầy ki&ecirc;u sa l&agrave; m&oacute;n qu&agrave; l&yacute; tưởng những người con n&ecirc;n gửi tới mẹ y&ecirc;u. Hơn hết, đ&acirc;y c&ograve;n l&agrave; lo&agrave;i hoa d&agrave;nh cho &ldquo;ng&agrave;y của mẹ&rdquo;. C&ograve;n một sự lựa chọn n&agrave;o tuyệt vời hơn ch&iacute;nh lo&agrave;i hoa đại diện cho l&ograve;ng biết ơn v&agrave; t&igrave;nh y&ecirc;u gửi đến người mẹ của m&igrave;nh nh&acirc;n dịp đặc biệt. Để m&oacute;n qu&agrave; trở n&ecirc;n &yacute; nghĩa v&agrave; đong đầy x&uacute;c cảm nhất, bạn c&oacute; thể tặng mẹ giỏ hoa cẩm chướng với tấm thiệp n&oacute;i những lời y&ecirc;u thương.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa c&aacute;t tường tặng mẹ</strong></p>

<p dir="ltr">Tại sao bạn kh&ocirc;ng thử mua hoa c&aacute;t tường l&agrave;m hoa tặng mẹ để kh&eacute;o l&eacute;o thể hiện t&igrave;nh cảm của m&igrave;nh với người đấng sinh th&agrave;nh. Mặc d&ugrave; ở hoa c&aacute;t tường kh&ocirc;ng sở hữu n&eacute;t đẹp rực rỡ như hoa hướng dương hay m&atilde;nh liệt nồng ch&aacute;y như hoa hồng đỏ. Nhưng ch&uacute;ng lại c&oacute; thể khiến người mẹ m&agrave; ta y&ecirc;u thương cảm động trước vẻ đẹp đằm thắm, qu&yacute; ph&aacute;i, duy&ecirc;n d&aacute;ng ở n&oacute;.</p>

<p>&nbsp;</p>

<p dir="ltr">Tặng hoa c&aacute;t tượng cho mẹ kh&ocirc;ng chỉ l&agrave; ước mong cho mẹ lu&ocirc;n gặp được may mắn, hạnh ph&uacute;c m&agrave; c&ograve;n rất hợp để b&agrave;y tỏ tấm l&ograve;ng ch&acirc;n th&agrave;nh với mẹ. Đồng thời, lo&agrave;i hoa tặng mẹ nhỏ b&eacute;, đơn sơ n&agrave;y c&oacute; thể gi&uacute;p bạn thể hiện sự t&ocirc;n trọng, lời ch&uacute;c sức khoẻ cho người c&oacute; c&ocirc;ng sinh th&agrave;nh, dưỡng dục m&igrave;nh.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa đồng tiền</strong></p>

<p dir="ltr">&Yacute; tưởng tặng hoa đồng tiền cho mẹ bạn thấy sao? Từng c&aacute;nh hoa mỏng manh n&agrave;y sẽ gi&uacute;p bạn nhắn gửi lời y&ecirc;u thương ch&acirc;n th&agrave;nh v&agrave; tốt đẹp nhất tới người nhận. Hơn hết, hoa đồng tiền c&ograve;n l&agrave; tượng trưng của t&igrave;nh y&ecirc;u nồng thắm, ch&acirc;n th&agrave;nh v&agrave; sự hạnh ph&uacute;c. Gửi đi giỏ hoa n&agrave;y chẳng phải l&agrave; c&aacute;ch ch&uacute;ng ta gửi lời nhắn y&ecirc;u thương v&agrave; biết ơn cả cuộc đời với mẹ sao.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>Hoa lan hồ điệp</strong></p>

<p dir="ltr">Một chậu hoa lan hồ điệp đẹp sẽ l&agrave; m&oacute;n qu&agrave; &yacute; nghĩa để bạn d&agrave;nh tặng cho mẹ, tựa như lời ch&uacute;c cho mẹ lu&ocirc;n mạnh khoẻ, thể hiện sự t&ocirc;n k&iacute;nh v&agrave; tr&acirc;n qu&yacute;. C&ugrave;ng với đ&oacute;, vẻ đẹp mang thi&ecirc;n t&iacute;nh nữ, l&agrave; biểu tượng của n&eacute;t đẹp ngọt ng&agrave;o sẽ như một lời t&ocirc;n vinh cho vẻ đẹp của mẹ.&nbsp;</p>

<p>&nbsp;</p>

<p dir="ltr">B&ecirc;n cạnh đ&oacute;, hoa lan hồ điệp c&ograve;n l&agrave; biểu tượng cho sự no ấm v&agrave; đủ đầy về một gia đ&igrave;nh ấm &ecirc;m v&agrave; gắn kết. Đ&acirc;y ch&iacute;nh l&agrave; ước mơ m&agrave; cả đời mẹ lu&ocirc;n vun v&eacute;n, nỗ lực. Tặng mẹ hoa lan sẽ gi&uacute;p bạn b&agrave;y tỏ l&ograve;ng biết ơn s&acirc;u sắc cho c&ocirc;ng ơn dưỡng dục một c&aacute;ch ch&acirc;n th&agrave;nh nhất với người phụ nữ ta y&ecirc;u thương, k&iacute;nh trọng.</p>

<p>&nbsp;</p>

<p dir="ltr"><strong>3 lưu &yacute; khi lựa chọn hoa d&agrave;nh tặng mẹ</strong></p>

<ul>
	<li dir="ltr">
	<p dir="ltr">Chọn hoa tặng mẹ vừa đẹp vừa thể hiện trọn tấm l&ograve;ng: những b&oacute; hoa xinh đẹp, được b&oacute; một c&aacute;ch xinh xắn v&agrave; đong đầy những &yacute; nghĩa thi&ecirc;ng li&ecirc;ng sẽ gi&uacute;p bạn thể hiện được tấm l&ograve;ng của m&igrave;nh một c&aacute;ch ch&acirc;n th&agrave;nh nhất</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">Kết hợp tặng m&oacute;n qu&agrave; d&agrave;nh cho phụ nữ: Một b&oacute; hoa tặng mẹ sẽ trở l&ecirc;n ho&agrave;n thiện hơn khi đi k&egrave;m c&ugrave;ng c&aacute;c m&oacute;n qu&agrave; như một tấm vải với họa tiết mẹ y&ecirc;u th&iacute;ch, chiếc t&uacute;i x&aacute;ch sang trọng, thỏi son đ&uacute;ng gu của mẹ,.. C&ugrave;ng với đ&oacute; chuẩn bị những tấm thiệp đặc biệt v&agrave; xinh xắn. Những d&ograve;ng chữ viết tay nắn n&oacute;t, cẩn thận ắt hẳn sẽ l&agrave;m mẹ bạn hạnh ph&uacute;c, ấm l&ograve;ng v&agrave; tan chảy trước t&igrave;nh cảm của người con.</p>
	</li>
	<li dir="ltr">
	<p dir="ltr">N&ecirc;n tr&aacute;nh: tặng hoa theo sở th&iacute;ch của bạn. Thay v&igrave; bạn chọn theo &yacute; m&igrave;nh, c&oacute; thể t&igrave;m hiểu về t&iacute;ch c&aacute;ch, sở th&iacute;ch của mẹ. Điều n&agrave;y sẽ gi&uacute;p m&oacute;n qu&agrave; của bạn ghi điểm tuyệt đối trong mắt mẹ y&ecirc;u.</p>
	</li>
</ul>

<p dir="ltr">Hy vọng với những th&ocirc;ng tin tr&ecirc;n c&oacute; thể gi&uacute;p bạn đưa ra sự lựa chọn hoa tặng mẹ ph&ugrave; hợp nhất để d&agrave;nh tặng cho mẹ y&ecirc;u của m&igrave;nh. Nếu bạn muốn đặt hoa tặng mẹ online với thiết kế tinh tế, nghệ thuật một c&aacute;ch nhanh ch&oacute;ng h&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i. Bởi đơn vị l&agrave; s&agrave;n giao dịch hoa tươi uy t&iacute;n hiện nay</p>
', NULL, N'/Data/Images/MoriiChuyen4.jpeg', NULL, CAST(N'2023-12-26T16:11:22.767' AS DateTime), NULL, CAST(N'2023-12-26T16:16:59.520' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 4, CAST(100000 AS Decimal(18, 0)), NULL, 1, CAST(100000 AS Decimal(18, 0)), 1, NULL, NULL, CAST(N'2023-12-25T17:49:27.587' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 5, CAST(330022 AS Decimal(18, 0)), NULL, 1, CAST(330022 AS Decimal(18, 0)), 2, NULL, NULL, CAST(N'2023-12-25T23:47:15.573' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 4, CAST(320000 AS Decimal(18, 0)), NULL, 1, CAST(320000 AS Decimal(18, 0)), 3, NULL, NULL, CAST(N'2023-12-26T22:56:12.017' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 12, CAST(540000 AS Decimal(18, 0)), NULL, 1, CAST(540000 AS Decimal(18, 0)), 4, NULL, NULL, CAST(N'2023-12-26T23:02:04.867' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 5, CAST(260000 AS Decimal(18, 0)), NULL, 1, CAST(260000 AS Decimal(18, 0)), 4, NULL, NULL, CAST(N'2023-12-26T23:02:04.887' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 4, CAST(320000 AS Decimal(18, 0)), NULL, 2, CAST(640000 AS Decimal(18, 0)), 5, NULL, NULL, CAST(N'2023-12-27T08:51:51.733' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 5, CAST(260000 AS Decimal(18, 0)), NULL, 2, CAST(520000 AS Decimal(18, 0)), 5, NULL, NULL, CAST(N'2023-12-27T08:51:51.750' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 5, CAST(260000 AS Decimal(18, 0)), NULL, 3, CAST(780000 AS Decimal(18, 0)), 6, NULL, NULL, CAST(N'2023-12-27T08:54:07.450' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (9, 5, CAST(260000 AS Decimal(18, 0)), NULL, 2, CAST(520000 AS Decimal(18, 0)), 7, NULL, NULL, CAST(N'2023-12-27T08:58:14.970' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (10, 4, CAST(320000 AS Decimal(18, 0)), NULL, 1, CAST(320000 AS Decimal(18, 0)), 8, NULL, NULL, CAST(N'2024-01-02T14:01:20.577' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (11, 4, CAST(320000 AS Decimal(18, 0)), NULL, 1, CAST(320000 AS Decimal(18, 0)), 9, NULL, NULL, CAST(N'2024-01-02T14:12:03.137' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (12, 4, CAST(320000 AS Decimal(18, 0)), NULL, 3, CAST(960000 AS Decimal(18, 0)), 10, NULL, NULL, CAST(N'2024-01-11T12:15:47.270' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (13, 5, CAST(260000 AS Decimal(18, 0)), NULL, 1, CAST(260000 AS Decimal(18, 0)), 11, NULL, NULL, CAST(N'2024-01-11T12:32:21.140' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (14, 5, CAST(260000 AS Decimal(18, 0)), NULL, 1, CAST(260000 AS Decimal(18, 0)), 12, NULL, NULL, CAST(N'2024-01-14T14:31:22.097' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ChiTietHoaDon] ([ID], [MaSP], [Gia], [GiaKM], [SoLuong], [ThanhTien], [IDHoaDon], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (15, 10, CAST(340000 AS Decimal(18, 0)), NULL, 2, CAST(680000 AS Decimal(18, 0)), 12, NULL, NULL, CAST(N'2024-01-14T14:31:22.123' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([ID], [TenSanPham], [Gia], [GiaCu], [GiaKhuyenMai], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MoTaSanPham], [ChiTietSanPham1], [MaPhanLoai], [IDKhuyenMai]) VALUES (4, N'Lan Hồ Điệp', CAST(320000 AS Decimal(18, 0)), NULL, NULL, 1, NULL, N'/Data/Images/menu-1.png', CAST(N'2023-12-25T16:11:22.253' AS DateTime), NULL, CAST(N'2023-12-26T16:36:58.270' AS DateTime), NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[ChiTietSanPham] ([ID], [TenSanPham], [Gia], [GiaCu], [GiaKhuyenMai], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MoTaSanPham], [ChiTietSanPham1], [MaPhanLoai], [IDKhuyenMai]) VALUES (5, N'Rực rỡ', CAST(260000 AS Decimal(18, 0)), NULL, NULL, 1, NULL, N'/Data/Images/menu-2.png', CAST(N'2023-12-25T16:11:48.347' AS DateTime), NULL, CAST(N'2023-12-26T16:37:41.337' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ChiTietSanPham] ([ID], [TenSanPham], [Gia], [GiaCu], [GiaKhuyenMai], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MoTaSanPham], [ChiTietSanPham1], [MaPhanLoai], [IDKhuyenMai]) VALUES (10, N'Ngọt Ngào', CAST(340000 AS Decimal(18, 0)), NULL, NULL, 1, NULL, N'/Data/Images/menu-4.png', CAST(N'2023-12-26T15:56:05.767' AS DateTime), NULL, CAST(N'2023-12-26T16:38:08.023' AS DateTime), NULL, N'hoa đẹp lắm, mua đi!!!', NULL, 1, NULL)
INSERT [dbo].[ChiTietSanPham] ([ID], [TenSanPham], [Gia], [GiaCu], [GiaKhuyenMai], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MoTaSanPham], [ChiTietSanPham1], [MaPhanLoai], [IDKhuyenMai]) VALUES (11, N'Trọn Đời', CAST(250000 AS Decimal(18, 0)), NULL, NULL, 1, NULL, N'/Data/Images/menu-3.png', CAST(N'2023-12-26T16:38:17.113' AS DateTime), NULL, CAST(N'2023-12-26T16:39:08.563' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ChiTietSanPham] ([ID], [TenSanPham], [Gia], [GiaCu], [GiaKhuyenMai], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MoTaSanPham], [ChiTietSanPham1], [MaPhanLoai], [IDKhuyenMai]) VALUES (12, N'Thất Tình', CAST(540000 AS Decimal(18, 0)), NULL, NULL, 1, NULL, N'/Data/Images/menu-5.png', CAST(N'2023-12-26T16:39:14.387' AS DateTime), NULL, CAST(N'2023-12-26T16:39:44.057' AS DateTime), NULL, N'đắt lắm, đừng mua', NULL, 1, NULL)
INSERT [dbo].[ChiTietSanPham] ([ID], [TenSanPham], [Gia], [GiaCu], [GiaKhuyenMai], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MoTaSanPham], [ChiTietSanPham1], [MaPhanLoai], [IDKhuyenMai]) VALUES (13, N'Yêu Em Lần Nữa', CAST(360000 AS Decimal(18, 0)), NULL, NULL, 1, NULL, N'/Data/Images/menu-6.png', CAST(N'2023-12-26T16:39:49.277' AS DateTime), NULL, CAST(N'2023-12-26T16:40:24.317' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ChiTietSanPham] ([ID], [TenSanPham], [Gia], [GiaCu], [GiaKhuyenMai], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MoTaSanPham], [ChiTietSanPham1], [MaPhanLoai], [IDKhuyenMai]) VALUES (14, NULL, NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2023-12-26T16:47:34.713' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 4, N'Trần Phan Thanh Thảo', N'0398502967', N'thanhthao2003@gmail.com', N'Trường đại học Công nghệ thông tin', NULL, NULL, NULL, N'Giao trễ boom hàng', N'COD', N'Đã Giao', NULL, NULL, NULL, CAST(N'2023-12-25T17:49:27.607' AS DateTime), NULL, CAST(N'2023-12-25T23:47:37.053' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, 2, 4, N'Trần Phan Thanh Thảo', N'0398502967', N'thanhthao2003@gmail.com', N'Thành phố Hồ Chí Minh', NULL, NULL, NULL, N'Giao trước 2h', N'Momo', N'Đã Giao', NULL, NULL, NULL, CAST(N'2023-12-25T23:47:15.597' AS DateTime), NULL, CAST(N'2024-01-11T12:16:09.203' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, 5, 4, N'Trần Phan Thanh Thảo', N'0398502967', N'thanhthao2003@gmail.com', N'UIT', NULL, NULL, NULL, N'Giao 11h', N'COD', N'Đã Hủy', NULL, NULL, NULL, CAST(N'2023-12-27T08:51:51.760' AS DateTime), NULL, CAST(N'2023-12-27T08:52:45.263' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (4, 6, 4, N'Trần Phan Thanh Thảo', N'0398502967', N'thanhthao2003@gmail.com', N'UIT', NULL, NULL, NULL, N'Giao 11h', N'COD', N'Đã Giao', NULL, NULL, NULL, CAST(N'2023-12-27T08:54:07.467' AS DateTime), NULL, CAST(N'2024-01-02T13:53:07.590' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (5, 9, 4, N'Trần Phan Thanh Thảo', N'0398502967', N'thanhthao2003@gmail.com', N'UIT', NULL, NULL, NULL, N'Giao sớm', N'COD', N'Đã Hủy', NULL, NULL, NULL, CAST(N'2024-01-02T14:12:03.147' AS DateTime), NULL, CAST(N'2024-01-11T12:16:23.420' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (6, 10, 4, N'Trần Phan Thanh Thảo', N'0398502967', N'thanhthao2003@gmail.com', N'bến tre', NULL, NULL, NULL, N'giao', N'Momo', N'Đã Hủy', NULL, NULL, NULL, CAST(N'2024-01-11T12:15:47.307' AS DateTime), NULL, CAST(N'2024-01-11T12:46:12.960' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (7, 11, 4, N'Trần Phan Thanh Thảo', N'0398502967', N'thanhthao2003@gmail.com', N'UIT', NULL, NULL, NULL, N'Giao sớm', N'COD', N'Đã Giao', NULL, NULL, NULL, CAST(N'2024-01-11T12:32:21.153' AS DateTime), NULL, CAST(N'2024-01-11T12:48:08.240' AS DateTime), NULL)
INSERT [dbo].[DatHang] ([ID], [MaHoaDon], [MaKH], [HoTen], [SDT], [Email], [DiaChiNhanHang], [Tinh], [Quan], [Phuong], [GhiChu], [PTTT], [TTDH], [Status], [MetaTitle], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (8, 12, 4, N'Trần Phan Thanh Thảo', N'02394403967', N'thanhthao2003@gmail.com', N'uit', NULL, NULL, NULL, N'giao', N'Paypal', N'Đang Giao', NULL, NULL, NULL, CAST(N'2024-01-14T14:31:22.167' AS DateTime), NULL, CAST(N'2024-01-14T14:34:50.343' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[DatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, NULL, 4, NULL, CAST(130000 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2023-12-25T17:49:27.290' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, NULL, 4, NULL, CAST(360022 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2023-12-25T23:47:15.343' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, 2, NULL, NULL, CAST(320000 AS Decimal(18, 0)), 0, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2023-12-26T22:56:11.747' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, 2, NULL, NULL, CAST(800000 AS Decimal(18, 0)), 0, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2023-12-26T23:02:04.623' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, NULL, 4, NULL, CAST(1190000 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2023-12-27T08:51:51.717' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, NULL, 4, NULL, CAST(810000 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2023-12-27T08:54:07.443' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, 2, NULL, NULL, CAST(520000 AS Decimal(18, 0)), 0, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2023-12-27T08:58:14.960' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, 2, NULL, NULL, CAST(320000 AS Decimal(18, 0)), 0, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2024-01-02T14:01:20.563' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, NULL, 4, NULL, CAST(350000 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2024-01-02T14:12:03.130' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, NULL, 4, NULL, CAST(990000 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2024-01-11T12:15:47.243' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, NULL, 4, NULL, CAST(290000 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2024-01-11T12:32:21.130' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[HoaDon] ([ID], [MaNV], [MaKH], [MaCH], [TongTien], [IsOnline], [MaKM], [TienKM], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, NULL, 4, NULL, CAST(970000 AS Decimal(18, 0)), 1, 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2024-01-14T14:31:21.583' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([ID], [TenKM], [PhanTramKM], [MoTa], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [NgayBatDau], [NgayKetThuc]) VALUES (1, N'Noel', 10, N'Mừng lễ Noel', 0, CAST(N'2023-12-26T13:42:55.633' AS DateTime), NULL, CAST(N'2023-12-26T13:42:55.633' AS DateTime), NULL, CAST(N'2023-12-20T00:00:00.000' AS DateTime), CAST(N'2023-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[KhuyenMai] ([ID], [TenKM], [PhanTramKM], [MoTa], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [NgayBatDau], [NgayKetThuc]) VALUES (11, N'cuối năm', 30, N'khuyến mãi cuối năm', NULL, CAST(N'2023-12-27T08:35:55.063' AS DateTime), NULL, NULL, NULL, CAST(N'2023-12-29T00:00:00.000' AS DateTime), CAST(N'2023-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[KhuyenMai] ([ID], [TenKM], [PhanTramKM], [MoTa], [Status], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [NgayBatDau], [NgayKetThuc]) VALUES (12, NULL, NULL, NULL, 1, CAST(N'2024-01-02T14:01:37.590' AS DateTime), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([ID], [HoTen], [Email], [Password], [Role], [SDT], [NgSinh], [MetaTitle], [GioiTinh], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Lê Thị Kiều Lam', N'kieulam2003@gmail.com', N'462a2f073afcd3d5fd4ef9ad9dc8c49c', N'ADMIN', NULL, NULL, NULL, 0, NULL, CAST(N'2023-12-25T13:10:08.187' AS DateTime), NULL, CAST(N'2023-12-25T15:03:38.153' AS DateTime), NULL, NULL)
INSERT [dbo].[NguoiDung] ([ID], [HoTen], [Email], [Password], [Role], [SDT], [NgSinh], [MetaTitle], [GioiTinh], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Dương Trúc Uyên', N'trucuyen2003@gmail.com', N'4d0e377c68363ee512a5adedefbcda30', N'Nhân viên', N'0967715461', CAST(N'2003-10-02' AS Date), NULL, 0, NULL, CAST(N'2023-12-25T13:15:00.320' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[NguoiDung] ([ID], [HoTen], [Email], [Password], [Role], [SDT], [NgSinh], [MetaTitle], [GioiTinh], [UrlImage], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Trần Phan Thanh Thảo', N'thanhthao2003@gmail.com', N'c5a4c9c11d3cad8130b7ba1152c0fe9b', N'Khách hàng', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-12-25T13:30:19.513' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([ID], [Luong], [IDNguoiDung]) VALUES (1, CAST(3000000 AS Decimal(18, 0)), 3)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ID], [PhanLoai], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Bó hoa', 1, NULL, CAST(N'2023-12-25T16:20:42.237' AS DateTime), NULL, CAST(N'2023-12-25T16:20:42.237' AS DateTime), NULL)
INSERT [dbo].[SanPham] ([ID], [PhanLoai], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Lẵng hoa', 1, NULL, CAST(N'2023-12-25T16:20:52.210' AS DateTime), NULL, CAST(N'2023-12-25T16:20:52.210' AS DateTime), NULL)
INSERT [dbo].[SanPham] ([ID], [PhanLoai], [Status], [MetaTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Khác', 1, NULL, CAST(N'2023-12-27T08:31:44.567' AS DateTime), NULL, CAST(N'2023-12-27T08:31:44.567' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [DF_ChiTietHoaDon_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [DF_ChiTietHoaDon_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [DF_ChiTietHoaDon_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ChiTietSanPham] ADD  CONSTRAINT [DF_ChiTietSanPham_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ChiTietSanPham] ADD  CONSTRAINT [DF_ChiTietSanPham_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ChiTietSanPham] ADD  CONSTRAINT [DF_ChiTietSanPham_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CuaHang] ADD  CONSTRAINT [DF_CuaHang_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CuaHang] ADD  CONSTRAINT [DF_CuaHang_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CuaHang] ADD  CONSTRAINT [DF_CuaHang_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DatHang] ADD  CONSTRAINT [DF_DatHang_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KhuyenMai] ADD  CONSTRAINT [DF_KhuyenMai_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[KhuyenMai] ADD  CONSTRAINT [DF_KhuyenMai_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[KhuyenMai] ADD  CONSTRAINT [DF_KhuyenMai_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
USE [master]
GO
ALTER DATABASE [doan] SET  READ_WRITE 
GO
