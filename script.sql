USE [master]
GO
/****** Object:  Database QLNSTL    Script Date: 12/5/2021 7:22:19 PM ******/
CREATE DATABASE QLNSTL
GO
ALTER DATABASE QLNSTL SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC QLNSTL.[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE QLNSTL SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE QLNSTL SET ANSI_NULLS OFF 
GO
ALTER DATABASE QLNSTL SET ANSI_PADDING OFF 
GO
ALTER DATABASE QLNSTL SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE QLNSTL SET ARITHABORT OFF 
GO
ALTER DATABASE QLNSTL SET AUTO_CLOSE OFF 
GO
ALTER DATABASE QLNSTL SET AUTO_SHRINK OFF 
GO
ALTER DATABASE QLNSTL SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE QLNSTL SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE QLNSTL SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE QLNSTL SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE QLNSTL SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE QLNSTL SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE QLNSTL SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE QLNSTL SET  DISABLE_BROKER 
GO
ALTER DATABASE QLNSTL SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE QLNSTL SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE QLNSTL SET TRUSTWORTHY OFF 
GO
ALTER DATABASE QLNSTL SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE QLNSTL SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE QLNSTL SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE QLNSTL SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE QLNSTL SET RECOVERY SIMPLE 
GO
ALTER DATABASE QLNSTL SET  MULTI_USER 
GO
ALTER DATABASE QLNSTL SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE QLNSTL SET DB_CHAINING OFF 
GO
ALTER DATABASE QLNSTL SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE QLNSTL SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE QLNSTL SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE QLNSTL SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE QLNSTL SET QUERY_STORE = OFF
GO
USE QLNSTL
GO
/****** Object:  Table [dbo].[BangCap]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangCap](
	[BangCapID] [int] IDENTITY(1,1) NOT NULL,
	[TenBangCap] [nvarchar](50) NULL,
 CONSTRAINT [PK_BangCap] PRIMARY KEY CLUSTERED 
(
	[BangCapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoPhan]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoPhan](
	[BoPhanID] [int] IDENTITY(1,1) NOT NULL,
	[TenBoPhan] [nvarchar](50) NULL,
 CONSTRAINT [PK_BoPhan] PRIMARY KEY CLUSTERED 
(
	[BoPhanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChamCong]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCong](
	[ChamCongID] [int] IDENTITY(1,1) NOT NULL,
	[Thang] [char](10) NULL,
	[NgayCongChuan] [int] NULL,
	[BoPhanID] [int] NULL,
	[NhanVienID] [int] NULL,
	[NgayDiLam] [int] NULL,
	[NgayNghiLe] [int] NULL,
	[NgayNghiPhepTinhLuong] [int] NULL,
	[NgayKhongLuong] [int] NULL,
	[NgayTinhLuong] [int] NULL,
	[NgayChamCong] [int] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_ChamCong] PRIMARY KEY CLUSTERED 
(
	[ChamCongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietBanKeLuong]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietBanKeLuong](
	[ChiTietBanKeLuongID] [int] IDENTITY(1,1) NOT NULL,
	[ThangKeLuong] [char](10) NULL,
	[NhanVienID] [int] NULL,
	[TienLuongCung] [float] NULL,
	[HieuSuat] [float] NULL,
	[NgayCongChuan] [int] NULL,
	[NgayTinhLuong] [int] NULL,
	[PhuCap] [float] NULL,
	[TamUng] [float] NULL,
	[ThucLinh] [float] NULL,
	[TongLuong] [float] NULL,
	[ThueThuNhapCaNhan] [float] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_ChiTietBanKeLuong] PRIMARY KEY CLUSTERED 
(
	[ChiTietBanKeLuongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietTamUng]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietTamUng](
	[PhieuTamUngID] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieuTamUng] [nvarchar](10) NULL,
	[ThangTamUng] [char](10) NULL,
	[TamUngID] [int] NULL,
	[NhanVienID] [int] NULL,
	[NgayLap] [date] NULL,
	[TamUng] [float] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[TrangThaiID] [int] NULL,
 CONSTRAINT [PK_ChiTietTamUng] PRIMARY KEY CLUSTERED 
(
	[PhieuTamUngID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaHieuSuat]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaHieuSuat](
	[DanhGiaHieuSuatID] [int] IDENTITY(1,1) NOT NULL,
	[Thang] [char](10) NULL,
	[NhanVienID] [int] NULL,
	[HieuSuat] [float] NULL,
 CONSTRAINT [PK_DanhGiaHieuSuat_1] PRIMARY KEY CLUSTERED 
(
	[DanhGiaHieuSuatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanToc]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanToc](
	[DanTocID] [int] IDENTITY(1,1) NOT NULL,
	[TenDanToc] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanToc] PRIMARY KEY CLUSTERED 
(
	[DanTocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiTinh]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiTinh](
	[GioiTinhID] [bit] NOT NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_GioiTinh] PRIMARY KEY CLUSTERED 
(
	[GioiTinhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[HopDongID] [int] IDENTITY(1,1) NOT NULL,
	[MaHopDong] [nvarchar](10) NULL,
	[LoaiHopDongID] [int] NULL,
	[NgayKy] [date] NULL,
	[NgayHieuLuc] [date] NULL,
	[NgayHetHan] [date] NULL,
	[NhanVienID] [int] NULL,
	[NgayKetThuc] [date] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_HopDong] PRIMARY KEY CLUSTERED 
(
	[HopDongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoSoNhanVien]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoSoNhanVien](
	[NhanVienID] [int] NOT NULL,
	[NgayVaoLam] [date] NULL,
	[DanTocID] [int] NULL,
	[TonGiaoID] [int] NULL,
	[TinhThanhID] [int] NULL,
	[NgoaiNguID] [int] NULL,
	[TinHocID] [int] NULL,
	[BangCapID] [int] NULL,
	[GhiChu] [nvarchar](100) NULL,
	[ImagePath] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhenThuongKyLuat]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhenThuongKyLuat](
	[KhenThuongKyLuatID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienID] [int] NULL,
	[LoaiQuyetDinhID] [int] NULL,
	[NgayQuyetDinh] [datetime] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhenThuongKyLuat_1] PRIMARY KEY CLUSTERED 
(
	[KhenThuongKyLuatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHopDong]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHopDong](
	[LoaiHopDongID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiHopDong] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiHopDong] PRIMARY KEY CLUSTERED 
(
	[LoaiHopDongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiQuyetDinh]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiQuyetDinh](
	[LoaiQuyetDinhID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiQuyetDinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiQuyetDinh] PRIMARY KEY CLUSTERED 
(
	[LoaiQuyetDinhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuongChucDanh]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuongChucDanh](
	[ChucDanhID] [int] IDENTITY(1,1) NOT NULL,
	[TenChucDanh] [nvarchar](50) NULL,
	[TienLuongCung] [float] NULL,
	[PhuCap] [float] NULL,
 CONSTRAINT [PK_ChucDanh] PRIMARY KEY CLUSTERED 
(
	[ChucDanhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoiQuanHe]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoiQuanHe](
	[MoiQuanHeID] [int] IDENTITY(1,1) NOT NULL,
	[TenMoiQuanHe] [nvarchar](50) NULL,
 CONSTRAINT [PK_MoiQuanHe] PRIMARY KEY CLUSTERED 
(
	[MoiQuanHeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NghiepVu]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NghiepVu](
	[NghiepVuID] [int] IDENTITY(1,1) NOT NULL,
	[TenNghiepVu] [nvarchar](50) NULL,
	[URL] [nvarchar](200) NULL,
 CONSTRAINT [PK_NghiepVu] PRIMARY KEY CLUSTERED 
(
	[NghiepVuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgoaiNgu]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NgoaiNgu](
	[NgoaiNguID] [int] IDENTITY(1,1) NOT NULL,
	[TenCCNN] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChungChiNgoaiNgu] PRIMARY KEY CLUSTERED 
(
	[NgoaiNguID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[NguoiDungID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[QuanTri] [bit] NULL,
	[NhanVienID] [int] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[NguoiDungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiThan]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiThan](
	[NguoiThanID] [int] IDENTITY(1,1) NOT NULL,
	[NhanVienID] [int] NULL,
	[MoiQuanHeID] [int] NULL,
	[TenNguoiThan] [nvarchar](50) NULL,
	[NgheNghiep] [nvarchar](50) NULL,
	[SDT] [nchar](20) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiThan] PRIMARY KEY CLUSTERED 
(
	[NguoiThanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[NhanVienID] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](10) NULL,
	[TenNV] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinhID] [bit] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[SoCMND] [nvarchar](15) NULL,
	[TrangThaiID] [bit] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[NhanVienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVienBoPhan]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVienBoPhan](
	[NhanVienID] [int] NOT NULL,
	[BoPhanID] [int] NOT NULL,
 CONSTRAINT [PK_NhanVienBoPhan] PRIMARY KEY CLUSTERED 
(
	[NhanVienID] ASC,
	[BoPhanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVienChucDanh]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVienChucDanh](
	[NhanVienID] [int] NOT NULL,
	[ChucDanhID] [int] NOT NULL,
 CONSTRAINT [PK_NhanVienChucDanh] PRIMARY KEY CLUSTERED 
(
	[NhanVienID] ASC,
	[ChucDanhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenNguoiDung]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenNguoiDung](
	[NguoiDungID] [int] NOT NULL,
	[NghiepVuID] [int] NOT NULL,
 CONSTRAINT [PK_QuyenNguoiDung] PRIMARY KEY CLUSTERED 
(
	[NguoiDungID] ASC,
	[NghiepVuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TamUng]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TamUng](
	[TamUngID] [int] IDENTITY(1,1) NOT NULL,
	[TenTamUng] [nvarchar](50) NULL,
 CONSTRAINT [PK_TamUng] PRIMARY KEY CLUSTERED 
(
	[TamUngID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinHoc]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinHoc](
	[TinHocID] [int] IDENTITY(1,1) NOT NULL,
	[TenCCTH] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChungChiTinHoc] PRIMARY KEY CLUSTERED 
(
	[TinHocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhThanh]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanh](
	[TinhThanhID] [int] IDENTITY(1,1) NOT NULL,
	[TenTinhThanh] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhThanh] PRIMARY KEY CLUSTERED 
(
	[TinhThanhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TonGiao]    Script Date: 12/5/2021 7:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TonGiao](
	[TonGiaoID] [int] IDENTITY(1,1) NOT NULL,
	[TenTonGiao] [nvarchar](50) NULL,
 CONSTRAINT [PK_TonGiao] PRIMARY KEY CLUSTERED 
(
	[TonGiaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BangCap] ON 

INSERT [dbo].[BangCap] ([BangCapID], [TenBangCap]) VALUES (1, N'Đại học chính quy')
INSERT [dbo].[BangCap] ([BangCapID], [TenBangCap]) VALUES (2, N'Cao đẳng')
INSERT [dbo].[BangCap] ([BangCapID], [TenBangCap]) VALUES (3, N'Thạc sĩ')
INSERT [dbo].[BangCap] ([BangCapID], [TenBangCap]) VALUES (4, N'Tiến sĩ')
INSERT [dbo].[BangCap] ([BangCapID], [TenBangCap]) VALUES (13, N'Trung cấp')
INSERT [dbo].[BangCap] ([BangCapID], [TenBangCap]) VALUES (14, N'Tại chức')
SET IDENTITY_INSERT [dbo].[BangCap] OFF
GO
SET IDENTITY_INSERT [dbo].[BoPhan] ON 

INSERT [dbo].[BoPhan] ([BoPhanID], [TenBoPhan]) VALUES (1, N'Tổ tích hợp hệ thống và triển khai 1')
INSERT [dbo].[BoPhan] ([BoPhanID], [TenBoPhan]) VALUES (2, N'Tổ tích hợp hệ thống và triển khai 2')
INSERT [dbo].[BoPhan] ([BoPhanID], [TenBoPhan]) VALUES (3, N'Tổ quản trị')
SET IDENTITY_INSERT [dbo].[BoPhan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChamCong] ON 

INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (19, N'201811    ', 26, 3, 1025, 26, 0, 0, 0, 26, 26, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (20, N'201811    ', 26, 3, 1029, 25, 0, 1, 0, 26, 25, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (21, N'201811    ', 26, 1, 1021, 26, 0, 0, 0, 26, 26, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (22, N'201811    ', 26, 1, 1023, 26, 0, 0, 0, 26, 26, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (23, N'201811    ', 26, 1, 1024, 25, 0, 1, 0, 26, 25, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (24, N'201811    ', 26, 1, 1026, 25, 0, 1, 0, 26, 25, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (25, N'201811    ', 26, 2, 1, 26, 0, 0, 0, 26, 26, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (26, N'201811    ', 26, 2, 2, 26, 0, 0, 0, 26, 26, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (27, N'201811    ', 26, 2, 1022, 25, 0, 1, 0, 26, 25, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (28, N'201811    ', 26, 2, 1027, 25, 0, 0, 0, 25, 25, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (29, N'201811    ', 26, 2, 1028, 25, 0, 1, 0, 26, 25, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (38, N'201811    ', 26, 2, 1031, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (39, N'201811    ', 26, 2, 1032, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (40, N'201811    ', 26, 2, 1033, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (41, N'201811    ', 26, 2, 1034, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (42, N'201811    ', 26, 2, 1035, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (43, N'201811    ', 26, 2, 1036, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (44, N'201811    ', 26, 2, 1037, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (45, N'201811    ', 26, 2, 1038, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (46, N'201811    ', 26, 2, 1039, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (47, N'201811    ', 26, 2, 1040, 26, 0, 0, 0, 26, 26, NULL, 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (54, N'201810    ', 26, 3, 1025, 26, 0, 0, 0, 26, 26, N'', 2)
INSERT [dbo].[ChamCong] ([ChamCongID], [Thang], [NgayCongChuan], [BoPhanID], [NhanVienID], [NgayDiLam], [NgayNghiLe], [NgayNghiPhepTinhLuong], [NgayKhongLuong], [NgayTinhLuong], [NgayChamCong], [GhiChu], [TrangThai]) VALUES (55, N'201810    ', 26, 3, 1029, 26, 0, 0, 0, 26, 26, N'', 2)
SET IDENTITY_INSERT [dbo].[ChamCong] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietBanKeLuong] ON 

INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (10, N'201811    ', 1025, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (11, N'201811    ', 1029, 20000000, 1, 26, 26, 160000, 400000, 13600000, 14000000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (12, N'201811    ', 1021, 15000000, 1, 26, 26, 105000, 200000, 10300000, 10500000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (13, N'201811    ', 1023, 10000000, 1, 26, 26, 60000, 500000, 5500000, 6000000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (14, N'201811    ', 1024, 10000000, 1, 26, 26, 60000, 400000, 5600000, 6000000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (15, N'201811    ', 1026, 6000000, 0, 26, 26, 24000, 1500000, 1500000, 3000000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (16, N'201811    ', 1, 20000000, 1, 26, 26, 1, 500000, 17500000, 18000000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (17, N'201811    ', 2, 25000000, 1, 26, 26, 1, 500000, 24500000, 25000000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (18, N'201811    ', 1022, 6000000, 1, 26, 26, 0, 600000, 4200000, 4800000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (19, N'201811    ', 1027, 8000000, 1, 26, 25, 0, 1000000, 5144000, 6144000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (20, N'201811    ', 1028, 8000000, 1, 26, 26, 0, 500000, 5900000, 6400000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (29, N'201811    ', 1031, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (30, N'201811    ', 1032, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (31, N'201811    ', 1033, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (32, N'201811    ', 1034, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (33, N'201811    ', 1035, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (34, N'201811    ', 1036, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (35, N'201811    ', 1037, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (36, N'201811    ', 1038, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (37, N'201811    ', 1039, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (38, N'201811    ', 1040, 6000000, 1, 26, 26, 24000, 700000, 3500000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (45, N'201810    ', 1025, 6000000, 0.7, 26, 26, 24000, 200000, 4000000, 4200000, 0, 2)
INSERT [dbo].[ChiTietBanKeLuong] ([ChiTietBanKeLuongID], [ThangKeLuong], [NhanVienID], [TienLuongCung], [HieuSuat], [NgayCongChuan], [NgayTinhLuong], [PhuCap], [TamUng], [ThucLinh], [TongLuong], [ThueThuNhapCaNhan], [TrangThai]) VALUES (46, N'201810    ', 1029, 20000000, 0.9, 26, 26, 160000, 300000, 17700000, 18000000, 0, 2)
SET IDENTITY_INSERT [dbo].[ChiTietBanKeLuong] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietTamUng] ON 

INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (13, N'PH002', N'201811    ', 1, 1023, CAST(N'2018-11-10' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (14, N'PH003', N'201811    ', 1, 1024, CAST(N'2018-11-05' AS Date), 400000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (15, N'PH004', N'201811    ', 3, 1026, CAST(N'2018-11-25' AS Date), 1500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (16, N'PH005', N'201811    ', 1, 1, CAST(N'2018-11-30' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (17, N'PH001', N'201811    ', 2, 1021, CAST(N'2018-11-18' AS Date), 200000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (18, N'PH006', N'201811    ', 2, 2, CAST(N'2018-11-18' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (19, N'PH007', N'201811    ', 1, 1022, CAST(N'2018-11-18' AS Date), 600000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (20, N'PH008', N'201811    ', 1, 1028, CAST(N'2018-11-18' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (21, N'PH009', N'201811    ', 3, 1027, CAST(N'2018-11-18' AS Date), 1000000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (22, N'PH010', N'201811    ', 1, 1025, CAST(N'2018-11-18' AS Date), 700000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (23, N'PH011', N'201811    ', 2, 1029, CAST(N'2018-11-18' AS Date), 400000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (26, N'PH012', N'201811    ', 1, 1031, CAST(N'2018-11-10' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (27, N'PH013', N'201811    ', 1, 1032, CAST(N'2018-11-16' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (28, N'PH014', N'201811    ', 1, 1033, CAST(N'2018-11-17' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (29, N'PH015', N'201811    ', 1, 1034, CAST(N'2018-11-18' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (30, N'PH016', N'201811    ', 1, 1035, CAST(N'2018-11-19' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (31, N'PH017', N'201811    ', 1, 1036, CAST(N'2018-11-20' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (32, N'PH018', N'201811    ', 1, 1037, CAST(N'2018-11-21' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (33, N'PH019', N'201811    ', 1, 1038, CAST(N'2018-11-22' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (34, N'PH020', N'201811    ', 1, 1039, CAST(N'2018-11-23' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (35, N'PH021', N'201811    ', 1, 1040, CAST(N'2018-11-24' AS Date), 500000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (39, N'PH022', N'201810    ', 1, 1025, CAST(N'2018-10-05' AS Date), 200000, N'', 2)
INSERT [dbo].[ChiTietTamUng] ([PhieuTamUngID], [MaPhieuTamUng], [ThangTamUng], [TamUngID], [NhanVienID], [NgayLap], [TamUng], [GhiChu], [TrangThaiID]) VALUES (40, N'PH023', N'201810    ', 2, 1029, CAST(N'2018-10-05' AS Date), 300000, N'', 2)
SET IDENTITY_INSERT [dbo].[ChiTietTamUng] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGiaHieuSuat] ON 

INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (14, N'201811    ', 1, 0.9)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (15, N'201811    ', 2, 1)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (16, N'201811    ', 1022, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (17, N'201811    ', 1027, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (18, N'201811    ', 1028, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (19, N'201811    ', 1021, 0.7)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (20, N'201811    ', 1023, 0.6)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (21, N'201811    ', 1024, 0.6)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (22, N'201811    ', 1026, 0.5)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (23, N'201811    ', 1025, 0.7)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (24, N'201811    ', 1029, 0.7)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (26, N'201811    ', 1031, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (27, N'201811    ', 1032, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (28, N'201811    ', 1033, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (29, N'201811    ', 1034, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (30, N'201811    ', 1035, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (31, N'201811    ', 1036, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (32, N'201811    ', 1037, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (33, N'201811    ', 1038, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (34, N'201811    ', 1039, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (35, N'201811    ', 1040, 0.8)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (41, N'201810    ', 1025, 0.7)
INSERT [dbo].[DanhGiaHieuSuat] ([DanhGiaHieuSuatID], [Thang], [NhanVienID], [HieuSuat]) VALUES (42, N'201810    ', 1029, 0.9)
SET IDENTITY_INSERT [dbo].[DanhGiaHieuSuat] OFF
GO
SET IDENTITY_INSERT [dbo].[DanToc] ON 

INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1, N'Kinh')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (3, N'Thái')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (4, N'Ê Đê')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (5, N'Ba Na')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (6, N'Nùng')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1002, N'Tày')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1009, N'Mường')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1010, N'Gia Rai')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1011, N'Khơ me')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1012, N'Dao')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1013, N'Mèo')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1014, N'Hoa')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1015, N'Chăm')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1016, N'Khơ mú')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1017, N'Lào')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1018, N'Hrê')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1019, N'Cơ Ho')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1020, N'Cơ Tu')
INSERT [dbo].[DanToc] ([DanTocID], [TenDanToc]) VALUES (1021, N'Ơ đu')
SET IDENTITY_INSERT [dbo].[DanToc] OFF
GO
INSERT [dbo].[GioiTinh] ([GioiTinhID], [GioiTinh]) VALUES (0, N'Nữ')
INSERT [dbo].[GioiTinh] ([GioiTinhID], [GioiTinh]) VALUES (1, N'Nam')
GO
SET IDENTITY_INSERT [dbo].[HopDong] ON 

INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (5, N'HD01', 11, CAST(N'2001-11-14' AS Date), CAST(N'2018-09-18' AS Date), CAST(N'2018-12-15' AS Date), 1, CAST(N'2018-11-06' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (6, N'HD02', 12, CAST(N'2002-11-14' AS Date), CAST(N'2018-10-18' AS Date), CAST(N'2018-12-15' AS Date), 2, CAST(N'2018-11-05' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (7, N'HD03', 12, CAST(N'2010-11-14' AS Date), CAST(N'2018-08-18' AS Date), CAST(N'2018-12-15' AS Date), 1021, CAST(N'2018-11-06' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (8, N'HD04', 13, CAST(N'2008-11-14' AS Date), CAST(N'2018-09-18' AS Date), CAST(N'2018-12-15' AS Date), 1022, CAST(N'2018-11-10' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (9, N'HD05', 14, CAST(N'2002-11-14' AS Date), CAST(N'2018-09-20' AS Date), CAST(N'2018-12-15' AS Date), 1023, CAST(N'2018-11-11' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (10, N'HD06', 11, CAST(N'2009-11-14' AS Date), CAST(N'2018-09-19' AS Date), CAST(N'2018-12-15' AS Date), 1024, CAST(N'2018-11-21' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (11, N'HD07', 11, CAST(N'2005-11-14' AS Date), CAST(N'2018-09-21' AS Date), CAST(N'2018-12-15' AS Date), 1025, CAST(N'2018-11-12' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (12, N'HD08', 12, CAST(N'2008-11-14' AS Date), CAST(N'2018-09-22' AS Date), CAST(N'2018-12-15' AS Date), 1026, CAST(N'2018-11-13' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (13, N'HD09', 14, CAST(N'2005-11-14' AS Date), CAST(N'2018-09-23' AS Date), CAST(N'2018-12-15' AS Date), 1027, CAST(N'2018-11-14' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (14, N'HD10', 12, CAST(N'2004-11-14' AS Date), CAST(N'2018-09-24' AS Date), CAST(N'2018-12-15' AS Date), 1028, CAST(N'2018-11-15' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (15, N'HD11', 13, CAST(N'2005-11-14' AS Date), CAST(N'2018-09-25' AS Date), CAST(N'2018-12-15' AS Date), 1029, CAST(N'2018-11-17' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (16, N'HD12', 13, CAST(N'2003-11-14' AS Date), CAST(N'2018-09-14' AS Date), CAST(N'2018-12-15' AS Date), 1031, CAST(N'2018-11-20' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (17, N'HD13', 14, CAST(N'2009-11-14' AS Date), CAST(N'2018-09-13' AS Date), CAST(N'2018-12-15' AS Date), 1032, CAST(N'2018-11-21' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (18, N'HD14', 14, CAST(N'2006-11-14' AS Date), CAST(N'2018-09-10' AS Date), CAST(N'2018-12-15' AS Date), 1033, CAST(N'2018-11-08' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (19, N'HD15', 14, CAST(N'2009-11-14' AS Date), CAST(N'2018-09-15' AS Date), CAST(N'2018-12-15' AS Date), 1034, CAST(N'2018-11-05' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (20, N'HD16', 15, CAST(N'2010-11-14' AS Date), CAST(N'2018-09-16' AS Date), CAST(N'2018-12-15' AS Date), 1035, CAST(N'2018-11-07' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (21, N'HD17', 13, CAST(N'2011-11-14' AS Date), CAST(N'2018-09-18' AS Date), CAST(N'2018-12-15' AS Date), 1036, CAST(N'2018-11-08' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (22, N'HD18', 15, CAST(N'2012-11-14' AS Date), CAST(N'2018-09-19' AS Date), CAST(N'2018-12-15' AS Date), 1037, CAST(N'2018-11-09' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (23, N'HD19', 15, CAST(N'2011-11-14' AS Date), CAST(N'2018-09-12' AS Date), CAST(N'2018-12-15' AS Date), 1038, CAST(N'2018-11-01' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (24, N'HD20', 15, CAST(N'2012-11-14' AS Date), CAST(N'2018-09-18' AS Date), CAST(N'2018-12-15' AS Date), 1039, CAST(N'2018-11-05' AS Date), 1)
INSERT [dbo].[HopDong] ([HopDongID], [MaHopDong], [LoaiHopDongID], [NgayKy], [NgayHieuLuc], [NgayHetHan], [NhanVienID], [NgayKetThuc], [TrangThai]) VALUES (25, N'HD21', 15, CAST(N'2011-11-14' AS Date), CAST(N'2018-09-18' AS Date), CAST(N'2018-12-15' AS Date), 1040, CAST(N'2018-11-03' AS Date), 1)
SET IDENTITY_INSERT [dbo].[HopDong] OFF
GO
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1, CAST(N'2004-11-02' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (2, CAST(N'2000-08-22' AS Date), 1, 2, 1, 6, 6, 3, N'', N'\AnhHSNV\Anh2.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1021, CAST(N'2008-09-14' AS Date), 3, 4, 2, 6, 4, 1, N'', N'\AnhHSNV\Anh1021.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1022, CAST(N'2018-07-22' AS Date), 1, 8, 1, 6, 6, 3, N'', N'\AnhHSNV\Anh1022.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1023, CAST(N'2006-07-22' AS Date), 1, 3, 1, 6, 11, 2, N'', N'\AnhHSNV\Anh1023.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1024, CAST(N'2006-07-22' AS Date), 1, 8, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1024.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1025, CAST(N'2006-07-22' AS Date), 1, 8, 1, 4, 6, 1, N'', N'\AnhHSNV\Anh1025.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1026, CAST(N'2006-06-12' AS Date), 1, 2, 1, 6, 6, 13, N'', N'\AnhHSNV\Anh1026.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1027, CAST(N'2017-11-01' AS Date), 1, 2, 1, 1, 6, 1, N'', N'\AnhHSNV\Anh1027.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1028, CAST(N'2018-05-10' AS Date), 1, 13, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1028.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1029, CAST(N'1996-11-20' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1029.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1031, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1031.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1032, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1032.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1033, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1033.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1034, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1034.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1035, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1035.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1036, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1036.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1037, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1037.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1038, CAST(N'2006-07-22' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1038.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1040, CAST(N'2004-11-02' AS Date), 1, 2, 1, 1, 4, 1, N'', N'\AnhHSNV\Anh1040.jpg')
INSERT [dbo].[HoSoNhanVien] ([NhanVienID], [NgayVaoLam], [DanTocID], [TonGiaoID], [TinhThanhID], [NgoaiNguID], [TinHocID], [BangCapID], [GhiChu], [ImagePath]) VALUES (1039, CAST(N'2006-07-22' AS Date), 1, 3, 1, 3, 11, 2, N'', N'\AnhHSNV\Anh1039.jpg')
GO
SET IDENTITY_INSERT [dbo].[KhenThuongKyLuat] ON 

INSERT [dbo].[KhenThuongKyLuat] ([KhenThuongKyLuatID], [NhanVienID], [LoaiQuyetDinhID], [NgayQuyetDinh], [GhiChu]) VALUES (2, 2, 4, CAST(N'2010-05-12T00:00:00.000' AS DateTime), N'Có tiến bộ trong dự án')
INSERT [dbo].[KhenThuongKyLuat] ([KhenThuongKyLuatID], [NhanVienID], [LoaiQuyetDinhID], [NgayQuyetDinh], [GhiChu]) VALUES (3, 1021, 4, CAST(N'2010-04-25T00:00:00.000' AS DateTime), N'Hoàn thành tốt công việc')
INSERT [dbo].[KhenThuongKyLuat] ([KhenThuongKyLuatID], [NhanVienID], [LoaiQuyetDinhID], [NgayQuyetDinh], [GhiChu]) VALUES (7, 1026, 2, CAST(N'2018-12-26T11:30:00.000' AS DateTime), N'Thiếu trách nhiệm trong công việc')
INSERT [dbo].[KhenThuongKyLuat] ([KhenThuongKyLuatID], [NhanVienID], [LoaiQuyetDinhID], [NgayQuyetDinh], [GhiChu]) VALUES (8, 1029, 4, CAST(N'2010-05-12T00:00:00.000' AS DateTime), N'Có nhiều thành tích tốt trong tháng')
INSERT [dbo].[KhenThuongKyLuat] ([KhenThuongKyLuatID], [NhanVienID], [LoaiQuyetDinhID], [NgayQuyetDinh], [GhiChu]) VALUES (9, 1025, 2, CAST(N'2010-07-22T00:00:00.000' AS DateTime), N'Thiếu trách nhiệm trong công việc')
SET IDENTITY_INSERT [dbo].[KhenThuongKyLuat] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiHopDong] ON 

INSERT [dbo].[LoaiHopDong] ([LoaiHopDongID], [TenLoaiHopDong]) VALUES (11, N'Dài hạn 1 năm')
INSERT [dbo].[LoaiHopDong] ([LoaiHopDongID], [TenLoaiHopDong]) VALUES (12, N'Thử việc 3 tháng')
INSERT [dbo].[LoaiHopDong] ([LoaiHopDongID], [TenLoaiHopDong]) VALUES (13, N'Thử việc 6 tháng')
INSERT [dbo].[LoaiHopDong] ([LoaiHopDongID], [TenLoaiHopDong]) VALUES (14, N'Dài hạn 3 năm ')
INSERT [dbo].[LoaiHopDong] ([LoaiHopDongID], [TenLoaiHopDong]) VALUES (15, N'Hợp đồng không xác định thời hạn ')
SET IDENTITY_INSERT [dbo].[LoaiHopDong] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiQuyetDinh] ON 

INSERT [dbo].[LoaiQuyetDinh] ([LoaiQuyetDinhID], [TenLoaiQuyetDinh]) VALUES (2, N'Kỷ luật')
INSERT [dbo].[LoaiQuyetDinh] ([LoaiQuyetDinhID], [TenLoaiQuyetDinh]) VALUES (4, N'Khen thưởng ')
SET IDENTITY_INSERT [dbo].[LoaiQuyetDinh] OFF
GO
SET IDENTITY_INSERT [dbo].[LuongChucDanh] ON 

INSERT [dbo].[LuongChucDanh] ([ChucDanhID], [TenChucDanh], [TienLuongCung], [PhuCap]) VALUES (1, N'Nhân viên', 6000000, 0.4)
INSERT [dbo].[LuongChucDanh] ([ChucDanhID], [TenChucDanh], [TienLuongCung], [PhuCap]) VALUES (2, N'Giám đốc', 25000000, 0.9)
INSERT [dbo].[LuongChucDanh] ([ChucDanhID], [TenChucDanh], [TienLuongCung], [PhuCap]) VALUES (10, N'Trưởng phòng', 15000000, 0.7)
INSERT [dbo].[LuongChucDanh] ([ChucDanhID], [TenChucDanh], [TienLuongCung], [PhuCap]) VALUES (11, N'Phó giám đốc', 20000000, 0.8)
INSERT [dbo].[LuongChucDanh] ([ChucDanhID], [TenChucDanh], [TienLuongCung], [PhuCap]) VALUES (12, N'Phó phòng', 10000000, 0.6)
INSERT [dbo].[LuongChucDanh] ([ChucDanhID], [TenChucDanh], [TienLuongCung], [PhuCap]) VALUES (13, N'Lập trình viên', 8000000, 0.5)
SET IDENTITY_INSERT [dbo].[LuongChucDanh] OFF
GO
SET IDENTITY_INSERT [dbo].[MoiQuanHe] ON 

INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (1, N'Cha')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (3, N'Ông')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (7, N'Chị gái')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (8, N'Em ')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (9, N'Bà ngoại')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (11, N'Mẹ')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (12, N'Chồng')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (13, N'Vợ')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (14, N'Anh trai')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (15, N'Con')
INSERT [dbo].[MoiQuanHe] ([MoiQuanHeID], [TenMoiQuanHe]) VALUES (16, N'Ông ngoại')
SET IDENTITY_INSERT [dbo].[MoiQuanHe] OFF
GO
SET IDENTITY_INSERT [dbo].[NghiepVu] ON 

INSERT [dbo].[NghiepVu] ([NghiepVuID], [TenNghiepVu], [URL]) VALUES (1, N'Quản lý hệ thống', N'rbpHeThong')
INSERT [dbo].[NghiepVu] ([NghiepVuID], [TenNghiepVu], [URL]) VALUES (2, N'Quản lý danh mục', N'rbpDanhMuc')
INSERT [dbo].[NghiepVu] ([NghiepVuID], [TenNghiepVu], [URL]) VALUES (3, N'Quản lý nhân sự', N'tbpNhanSu')
INSERT [dbo].[NghiepVu] ([NghiepVuID], [TenNghiepVu], [URL]) VALUES (4, N'Quản lý tiền lương', N'rbpTienLuong')
INSERT [dbo].[NghiepVu] ([NghiepVuID], [TenNghiepVu], [URL]) VALUES (5, N'Thống kê-Báo cáo', N'rbpThongKeBaoCao')
SET IDENTITY_INSERT [dbo].[NghiepVu] OFF
GO
SET IDENTITY_INSERT [dbo].[NgoaiNgu] ON 

INSERT [dbo].[NgoaiNgu] ([NgoaiNguID], [TenCCNN]) VALUES (1, N'Chứng chỉ tiếng anh A')
INSERT [dbo].[NgoaiNgu] ([NgoaiNguID], [TenCCNN]) VALUES (3, N'Chứng chỉ tiếng nhật N3')
INSERT [dbo].[NgoaiNgu] ([NgoaiNguID], [TenCCNN]) VALUES (4, N'Chứng chỉ tiếng nhật N2')
INSERT [dbo].[NgoaiNgu] ([NgoaiNguID], [TenCCNN]) VALUES (6, N'Chứng chỉ Toeic')
INSERT [dbo].[NgoaiNgu] ([NgoaiNguID], [TenCCNN]) VALUES (1003, N'Chứng chỉ tiếng nhật N1')
INSERT [dbo].[NgoaiNgu] ([NgoaiNguID], [TenCCNN]) VALUES (1004, N'Chứng chỉ tiếng anh B')
INSERT [dbo].[NgoaiNgu] ([NgoaiNguID], [TenCCNN]) VALUES (1005, N'Chứng chỉ tiếng anh C')
SET IDENTITY_INSERT [dbo].[NgoaiNgu] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (7, N'admin', N'Jqw2bN1WzMabj9vWRO7GzQ==', 1, 1)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (11, N'lqvinh', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 2)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (13, N'hoantran', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 1022)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (14, N'phuongthao', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 1027)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (15, N'nhungvo', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 1028)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (16, N'tranthanh', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 1021)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (17, N'quangtrung', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 1023)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (18, N'ducviet', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 1024)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (19, N'quoccuong', N'9VkTZXenK7SsxdktVpDI0A==', 0, 1026)
INSERT [dbo].[NguoiDung] ([NguoiDungID], [TenDangNhap], [MatKhau], [QuanTri], [NhanVienID]) VALUES (20, N'manhhung', N'Jqw2bN1WzMabj9vWRO7GzQ==', 0, 1029)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiThan] ON 

INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (6, 2, 1, N'Lưu Quang Vũ', N'Công an ', N'01634197356         ', N'Lê Lợi')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (7, 1, 13, N'Trần Bích Phương', N'Tester', N'0904209467          ', N'Văn Cao')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (8, 1022, 7, N'Trần Thị Minh Hằng', N'Y tá', N'0976345678          ', N'Hải An')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (9, 1027, 14, N'Nguyễn Đức Hải', N'Thủy thủ', N'0978234568          ', N'Thủy Nguyên')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (10, 1021, 1, N'Trần Văn Tốt ', N'Giáo viên', N'0904209766          ', N'Quán Toan')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (11, 1023, 14, N'Nguyễn Tiến Nhật', N'Hải quan', N'0934278458          ', N'Số 4/256 Lạch Tray, Hải Phòng')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (12, 1024, 11, N'Trần Thị Chiến', N'Nội trợ', N'0988825147          ', N'Quán Toan ')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (13, 1026, 1, N'Đặng Quang Huy', N'Công nhân', N'0988345689          ', N'Hạ Lý ')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (14, 1028, 1, N'Võ Quang Hải', N'Marketing', N'0967367458          ', N'Thượng Lý , Hồng Bàng, HP')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (15, 1025, 1, N'Phạm Ngọc Thạch ', N'Hải quân', N'0977347589          ', N'Lán Bè, Hải Phòng')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (16, 1029, 8, N'Nguyễn Bảo Thy ', N'Ca sĩ', N'0965378479          ', N'Văn Cao ')
INSERT [dbo].[NguoiThan] ([NguoiThanID], [NhanVienID], [MoiQuanHeID], [TenNguoiThan], [NgheNghiep], [SDT], [DiaChi]) VALUES (17, 1, 13, N'Nguyễn Phương', N'Lập trình', N'0125555555          ', N'Hùng Vương')
SET IDENTITY_INSERT [dbo].[NguoiThan] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1, N'NV001', N'Vũ Minh Hiếu', CAST(N'2018-10-10T00:00:00.000' AS DateTime), 1, N'Hải Phòng', N'0241565522          ', N'vmh@gmail.com', N'033456789', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (2, N'NV002', N'Lưu Quang Vinh', CAST(N'2018-09-12T00:00:00.000' AS DateTime), 1, N'Hải Phòng', N'0124156552          ', N'lqv@gmail.com', N'035546546', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1021, N'NV003', N'Trần Văn Thành', CAST(N'2018-10-09T00:00:00.000' AS DateTime), 1, N'số 2/5/142 Lê Lợi', N'0934678945          ', N'tranthanh@gmail.com', N'034598765', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1022, N'NV004', N'Trần Công Hoan', CAST(N'2018-03-14T00:00:00.000' AS DateTime), 1, N'Lô 22 Lê Hồng Phong', N'0936768190          ', N'tranhoan@gmail.com', N'038956222', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1023, N'NV005', N'Nguyễn Quang Trung', CAST(N'2018-03-14T00:00:00.000' AS DateTime), 1, N'Số 45 Quán Toan', N'0334108215          ', N'nguyentrung@gmail.com', N'031245689', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1024, N'NV006', N'Nguyễn Đức Việt', CAST(N'2018-03-14T00:00:00.000' AS DateTime), 1, N'Số 36 Văn Cao, Quận Hải An, Hải Phòng', N'0225108347          ', N'nguyenviet@gmail.com', N'034356896', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1025, N'NV007', N'Phạm Thanh Bình', CAST(N'2018-03-14T00:00:00.000' AS DateTime), 1, N'Số 3/145 Đà Nẵng, Ngô Quyền, Hải Phòng', N'0334567867          ', N'phambinh@gmail.com', N'033210934', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1026, N'NV008', N'Đặng Quang Cường', CAST(N'2018-03-14T00:00:00.000' AS DateTime), 1, N'Số 5/167 Lê Lợi', N'0225167345          ', N'dangcuong@gmail.com', N'032367489', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1027, N'NV009', N'Phạm Phương Thảo', CAST(N'1996-06-05T00:00:00.000' AS DateTime), 0, N'Tòa nhà Vinhomes Imperia', N'0334569999          ', N'phuongthao96@gmail.com', N'033476278', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1028, N'NV010', N'Võ Thị Bích Nhung', CAST(N'1996-03-24T00:00:00.000' AS DateTime), 0, N'Tòa nhà Parkson ', N'0779123456          ', N'vonhung@gmail.com', N'031356765', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1029, N'NV011', N'Nguyễn Mạnh Hùng', CAST(N'2018-11-20T00:00:00.000' AS DateTime), 1, N'Số 3/225 Văn Cao, Hải Phòng', N'0779123568          ', N'manhhung@gmail.com', N'031734579', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1031, N'NV012', N'Trần Anh', CAST(N'2018-11-28T00:00:00.000' AS DateTime), 1, N'Đằng Hải- Hải An- Hải Phòng
', N'0779281224          ', N'anhtran@gmail.com', N'034555557', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1032, N'NV013', N'Đỗ Mạnh Cường', CAST(N'1978-06-10T00:00:00.000' AS DateTime), 1, N'613 Nguyễn Bỉnh Khiêm- Hải Phòng
', N'0947512558          ', N'dmc@gmail.com', N'024585458', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1033, N'NV014', N'Mai Trung Kiên', CAST(N'1975-09-12T00:00:00.000' AS DateTime), 1, N'5/72 Nguyễn Công Trứ/ Hải Phòng

', N'0214585845          ', N'mtk@gmail.com', N'021456788', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1034, N'NV015', N'Hà Đức Nam', CAST(N'1978-10-09T00:00:00.000' AS DateTime), 1, N'số 2/5/142 Lê Lợi', N'0325879658          ', N'ducnam@gmail.com', N'058258257', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1035, N'NV016', N'Lê Thanh Phương', CAST(N'1979-03-14T00:00:00.000' AS DateTime), 1, N'Lô 22 Lê Hồng Phong', N'0123789545          ', N'thanhphuong@gmail.com', N'456789555', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1036, N'NV017', N'Lê Quốc Sơn
', CAST(N'1980-05-16T00:00:00.000' AS DateTime), 1, N'50/280 Trần Nguyên Hãn- Lê Chân- Hải Phòng
', N'2589514558          ', N'quocson@gmail.com', N'568975552', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1037, N'NV018', N'Phạm Văn Chường', CAST(N'1981-06-17T00:00:00.000' AS DateTime), 1, N'Tổ 20 Khu 1-vĩnh Niệm- Lê Chân- Hải Phòng
', N'0147852369          ', N'vanchuong@gmail.com', N'014763254', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1038, N'NV019', N'Đỗ Đăng Minh', CAST(N'1972-03-21T00:00:00.000' AS DateTime), 1, N'Số 3/145 Đà Nẵng, Ngô Quyền, Hải Phòng', N'0123456789          ', N'dangminh@gmail.com', N'091385474', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1039, N'NV020', N'Mạc Như Thông', CAST(N'1971-03-11T00:00:00.000' AS DateTime), 1, N'Số 19 Phường Nam Hải- Q. Hải An- Hải Phòng
', N'8887845455          ', N'macthong@gmail.com', N'025896325', 1)
INSERT [dbo].[NhanVien] ([NhanVienID], [MaNV], [TenNV], [NgaySinh], [GioiTinhID], [DiaChi], [SDT], [Email], [SoCMND], [TrangThaiID]) VALUES (1040, N'NV021', N'Phạm Văn Tùng', CAST(N'1996-06-05T00:00:00.000' AS DateTime), 1, N'Số 18 D41 Đổng Quốc Bình- Hải Phòng
', N'2589255844          ', N'vantung@gmail.com', N'147826555', 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (2, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1021, 1)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1022, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1023, 1)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1024, 1)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1025, 3)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1026, 1)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1027, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1028, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1029, 3)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1031, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1032, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1033, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1034, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1035, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1036, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1037, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1038, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1039, 2)
INSERT [dbo].[NhanVienBoPhan] ([NhanVienID], [BoPhanID]) VALUES (1040, 2)
GO
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1, 11)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (2, 2)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1021, 10)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1022, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1023, 12)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1024, 12)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1025, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1026, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1027, 13)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1028, 13)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1029, 11)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1031, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1032, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1033, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1034, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1035, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1036, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1037, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1038, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1039, 1)
INSERT [dbo].[NhanVienChucDanh] ([NhanVienID], [ChucDanhID]) VALUES (1040, 1)
GO
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (11, 2)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (11, 3)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (11, 4)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (11, 5)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (14, 1)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (14, 2)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (14, 3)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (14, 5)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (15, 1)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (15, 2)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (15, 4)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (15, 5)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (16, 4)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (16, 5)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (20, 2)
INSERT [dbo].[QuyenNguoiDung] ([NguoiDungID], [NghiepVuID]) VALUES (20, 3)
GO
SET IDENTITY_INSERT [dbo].[TamUng] ON 

INSERT [dbo].[TamUng] ([TamUngID], [TenTamUng]) VALUES (1, N'Tiền ăn')
INSERT [dbo].[TamUng] ([TamUngID], [TenTamUng]) VALUES (2, N'Tiền xăng')
INSERT [dbo].[TamUng] ([TamUngID], [TenTamUng]) VALUES (3, N'Lương')
SET IDENTITY_INSERT [dbo].[TamUng] OFF
GO
SET IDENTITY_INSERT [dbo].[TinHoc] ON 

INSERT [dbo].[TinHoc] ([TinHocID], [TenCCTH]) VALUES (4, N'Mos')
INSERT [dbo].[TinHoc] ([TinHocID], [TenCCTH]) VALUES (6, N'CCNA')
INSERT [dbo].[TinHoc] ([TinHocID], [TenCCTH]) VALUES (11, N'IC3')
SET IDENTITY_INSERT [dbo].[TinHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[TinhThanh] ON 

INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (1, N'Hải Phòng')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (2, N'Hà Nội')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (3, N'Đà Nẵng')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (6, N'Hà Tĩnh')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (8, N'Phú Thọ')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (10, N'Hồ Chí Minh')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (11, N'Quảng Ngãi')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (12, N'Quảng Ninh')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (13, N'Huế')
INSERT [dbo].[TinhThanh] ([TinhThanhID], [TenTinhThanh]) VALUES (14, N'Thanh Hóa')
SET IDENTITY_INSERT [dbo].[TinhThanh] OFF
GO
SET IDENTITY_INSERT [dbo].[TonGiao] ON 

INSERT [dbo].[TonGiao] ([TonGiaoID], [TenTonGiao]) VALUES (2, N'Thiên chúa giáo')
INSERT [dbo].[TonGiao] ([TonGiaoID], [TenTonGiao]) VALUES (3, N'Kito giáo')
INSERT [dbo].[TonGiao] ([TonGiaoID], [TenTonGiao]) VALUES (4, N'Tin lành')
INSERT [dbo].[TonGiao] ([TonGiaoID], [TenTonGiao]) VALUES (8, N'Phật giáo')
INSERT [dbo].[TonGiao] ([TonGiaoID], [TenTonGiao]) VALUES (11, N'Hồi giáo')
INSERT [dbo].[TonGiao] ([TonGiaoID], [TenTonGiao]) VALUES (12, N'Đạo giáo')
INSERT [dbo].[TonGiao] ([TonGiaoID], [TenTonGiao]) VALUES (13, N'Không')
SET IDENTITY_INSERT [dbo].[TonGiao] OFF
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_BoPhan] FOREIGN KEY([BoPhanID])
REFERENCES [dbo].[BoPhan] ([BoPhanID])
GO
ALTER TABLE [dbo].[ChamCong] CHECK CONSTRAINT [FK_ChamCong_BoPhan]
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[ChamCong] CHECK CONSTRAINT [FK_ChamCong_NhanVien]
GO
ALTER TABLE [dbo].[ChiTietBanKeLuong]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietBanKeLuong_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[ChiTietBanKeLuong] CHECK CONSTRAINT [FK_ChiTietBanKeLuong_NhanVien]
GO
ALTER TABLE [dbo].[ChiTietTamUng]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTamUng_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[ChiTietTamUng] CHECK CONSTRAINT [FK_ChiTietTamUng_NhanVien]
GO
ALTER TABLE [dbo].[ChiTietTamUng]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietTamUng_TamUng] FOREIGN KEY([TamUngID])
REFERENCES [dbo].[TamUng] ([TamUngID])
GO
ALTER TABLE [dbo].[ChiTietTamUng] CHECK CONSTRAINT [FK_ChiTietTamUng_TamUng]
GO
ALTER TABLE [dbo].[DanhGiaHieuSuat]  WITH CHECK ADD  CONSTRAINT [FK_DanhGiaHieuSuat_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[DanhGiaHieuSuat] CHECK CONSTRAINT [FK_DanhGiaHieuSuat_NhanVien]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_LoaiHopDong] FOREIGN KEY([LoaiHopDongID])
REFERENCES [dbo].[LoaiHopDong] ([LoaiHopDongID])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_LoaiHopDong]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_NhanVien]
GO
ALTER TABLE [dbo].[HoSoNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_HoSoNhanVien_BangCap] FOREIGN KEY([BangCapID])
REFERENCES [dbo].[BangCap] ([BangCapID])
GO
ALTER TABLE [dbo].[HoSoNhanVien] CHECK CONSTRAINT [FK_HoSoNhanVien_BangCap]
GO
ALTER TABLE [dbo].[HoSoNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_HoSoNhanVien_DanToc] FOREIGN KEY([DanTocID])
REFERENCES [dbo].[DanToc] ([DanTocID])
GO
ALTER TABLE [dbo].[HoSoNhanVien] CHECK CONSTRAINT [FK_HoSoNhanVien_DanToc]
GO
ALTER TABLE [dbo].[HoSoNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_HoSoNhanVien_NgoaiNgu] FOREIGN KEY([NgoaiNguID])
REFERENCES [dbo].[NgoaiNgu] ([NgoaiNguID])
GO
ALTER TABLE [dbo].[HoSoNhanVien] CHECK CONSTRAINT [FK_HoSoNhanVien_NgoaiNgu]
GO
ALTER TABLE [dbo].[HoSoNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_HoSoNhanVien_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[HoSoNhanVien] CHECK CONSTRAINT [FK_HoSoNhanVien_NhanVien]
GO
ALTER TABLE [dbo].[HoSoNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_HoSoNhanVien_TinHoc] FOREIGN KEY([TinHocID])
REFERENCES [dbo].[TinHoc] ([TinHocID])
GO
ALTER TABLE [dbo].[HoSoNhanVien] CHECK CONSTRAINT [FK_HoSoNhanVien_TinHoc]
GO
ALTER TABLE [dbo].[HoSoNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_HoSoNhanVien_TinhThanh] FOREIGN KEY([TinhThanhID])
REFERENCES [dbo].[TinhThanh] ([TinhThanhID])
GO
ALTER TABLE [dbo].[HoSoNhanVien] CHECK CONSTRAINT [FK_HoSoNhanVien_TinhThanh]
GO
ALTER TABLE [dbo].[HoSoNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_HoSoNhanVien_TonGiao] FOREIGN KEY([TonGiaoID])
REFERENCES [dbo].[TonGiao] ([TonGiaoID])
GO
ALTER TABLE [dbo].[HoSoNhanVien] CHECK CONSTRAINT [FK_HoSoNhanVien_TonGiao]
GO
ALTER TABLE [dbo].[KhenThuongKyLuat]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuongKyLuat_LoaiQuyetDinh] FOREIGN KEY([LoaiQuyetDinhID])
REFERENCES [dbo].[LoaiQuyetDinh] ([LoaiQuyetDinhID])
GO
ALTER TABLE [dbo].[KhenThuongKyLuat] CHECK CONSTRAINT [FK_KhenThuongKyLuat_LoaiQuyetDinh]
GO
ALTER TABLE [dbo].[KhenThuongKyLuat]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuongKyLuat_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[KhenThuongKyLuat] CHECK CONSTRAINT [FK_KhenThuongKyLuat_NhanVien]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_NhanVien]
GO
ALTER TABLE [dbo].[NguoiThan]  WITH CHECK ADD  CONSTRAINT [FK_NguoiThan_MoiQuanHe] FOREIGN KEY([MoiQuanHeID])
REFERENCES [dbo].[MoiQuanHe] ([MoiQuanHeID])
GO
ALTER TABLE [dbo].[NguoiThan] CHECK CONSTRAINT [FK_NguoiThan_MoiQuanHe]
GO
ALTER TABLE [dbo].[NguoiThan]  WITH CHECK ADD  CONSTRAINT [FK_NguoiThan_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[NguoiThan] CHECK CONSTRAINT [FK_NguoiThan_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_GioiTinh] FOREIGN KEY([GioiTinhID])
REFERENCES [dbo].[GioiTinh] ([GioiTinhID])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_GioiTinh]
GO
ALTER TABLE [dbo].[NhanVienBoPhan]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienBoPhan_BoPhan] FOREIGN KEY([BoPhanID])
REFERENCES [dbo].[BoPhan] ([BoPhanID])
GO
ALTER TABLE [dbo].[NhanVienBoPhan] CHECK CONSTRAINT [FK_NhanVienBoPhan_BoPhan]
GO
ALTER TABLE [dbo].[NhanVienBoPhan]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienBoPhan_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[NhanVienBoPhan] CHECK CONSTRAINT [FK_NhanVienBoPhan_NhanVien]
GO
ALTER TABLE [dbo].[NhanVienChucDanh]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienChucDanh_LuongChucDanh] FOREIGN KEY([ChucDanhID])
REFERENCES [dbo].[LuongChucDanh] ([ChucDanhID])
GO
ALTER TABLE [dbo].[NhanVienChucDanh] CHECK CONSTRAINT [FK_NhanVienChucDanh_LuongChucDanh]
GO
ALTER TABLE [dbo].[NhanVienChucDanh]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienChucDanh_NhanVien] FOREIGN KEY([NhanVienID])
REFERENCES [dbo].[NhanVien] ([NhanVienID])
GO
ALTER TABLE [dbo].[NhanVienChucDanh] CHECK CONSTRAINT [FK_NhanVienChucDanh_NhanVien]
GO
ALTER TABLE [dbo].[QuyenNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_QuyenNguoiDung_NghiepVu] FOREIGN KEY([NghiepVuID])
REFERENCES [dbo].[NghiepVu] ([NghiepVuID])
GO
ALTER TABLE [dbo].[QuyenNguoiDung] CHECK CONSTRAINT [FK_QuyenNguoiDung_NghiepVu]
GO
ALTER TABLE [dbo].[QuyenNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_QuyenNguoiDung_NguoiDung] FOREIGN KEY([NguoiDungID])
REFERENCES [dbo].[NguoiDung] ([NguoiDungID])
GO
ALTER TABLE [dbo].[QuyenNguoiDung] CHECK CONSTRAINT [FK_QuyenNguoiDung_NguoiDung]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1: luu; 2:nop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChamCong', @level2type=N'COLUMN',@level2name=N'TrangThai'
GO
USE [master]
GO
ALTER DATABASE QLNSTL SET  READ_WRITE 
GO
