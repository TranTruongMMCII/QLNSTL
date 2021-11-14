USE [master]
GO
/****** Object:  Database [QLNSTL]    Script Date: 11/14/2021 7:58:58 PM ******/
CREATE DATABASE [QLNSTL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNSTL', FILENAME = N'D:\Data\Data\QLNSTL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNSTL_log', FILENAME = N'D:\Data\Log\QLNSTL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLNSTL] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNSTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNSTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNSTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNSTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNSTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNSTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNSTL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNSTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNSTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNSTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNSTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNSTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNSTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNSTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNSTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNSTL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNSTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNSTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNSTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNSTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNSTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNSTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNSTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNSTL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNSTL] SET  MULTI_USER 
GO
ALTER DATABASE [QLNSTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNSTL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNSTL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNSTL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLNSTL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNSTL] SET QUERY_STORE = OFF
GO
USE [QLNSTL]
GO
/****** Object:  Table [dbo].[BangCap]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoPhan]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChamCong]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietBanKeLuong]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietTamUng]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanToc]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaHieuSuat]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiTinh]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoSoNhanVien]    Script Date: 11/14/2021 7:58:58 PM ******/
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
/****** Object:  Table [dbo].[KhenThuongKyLuat]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHopDong]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiQuyetDinh]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuongChucDanh]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoiQuanHe]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NghiepVu]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NgoaiNgu]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiThan]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVienBoPhan]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVienChucDanh]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenNguoiDung]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TamUng]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinHoc]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhThanh]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TonGiao]    Script Date: 11/14/2021 7:58:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER DATABASE [QLNSTL] SET  READ_WRITE 
GO
