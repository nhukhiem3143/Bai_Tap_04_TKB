USE [master]
GO
/****** Object:  Database [TKB]    Script Date: 13/04/2025 11:06:03 CH ******/
CREATE DATABASE [TKB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TKB', FILENAME = N'E:\Database\Bai_Tap_04\TKB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TKB_log', FILENAME = N'E:\Database\Bai_Tap_04\TKB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TKB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TKB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TKB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TKB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TKB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TKB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TKB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TKB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TKB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TKB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TKB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TKB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TKB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TKB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TKB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TKB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TKB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TKB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TKB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TKB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TKB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TKB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TKB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TKB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TKB] SET RECOVERY FULL 
GO
ALTER DATABASE [TKB] SET  MULTI_USER 
GO
ALTER DATABASE [TKB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TKB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TKB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TKB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TKB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TKB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TKB', N'ON'
GO
ALTER DATABASE [TKB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TKB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TKB]
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 13/04/2025 11:06:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHocPhan]    Script Date: 13/04/2025 11:06:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHocPhan](
	[MaLHP] [varchar](20) NOT NULL,
	[MaMon] [varchar](10) NOT NULL,
	[MaGV] [varchar](10) NOT NULL,
 CONSTRAINT [PK__LopHocPh] PRIMARY KEY CLUSTERED 
(
	[MaLHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 13/04/2025 11:06:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMon] [varchar](10) NOT NULL,
	[TenMon] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiKhoaBieu]    Script Date: 13/04/2025 11:06:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiKhoaBieu](
	[STT] [int] NOT NULL,
	[MaLHP] [varchar](20) NOT NULL,
	[Thu] [int] NULL,
	[TietBatDau] [int] NULL,
	[SoTiet] [int] NULL,
	[GioVao] [time](0) NOT NULL,
	[GioRa] [time](0) NOT NULL,
	[NgayHoc] [date] NULL,
 CONSTRAINT [PK__ThoiKhoa__3214EC27D723D526] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'1', N'D.V.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'10', N'N.V.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'100', N'D.T.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'101', N'P.T.T.Hà')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'102', N'L.D.Minh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'103', N'N.P.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'104', N'N.T.Hương')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'105', N'N.T.Toàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'106', N'N.N.Trung')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'107', N'L.H.Trang')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'108', N'T.V.Long')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'109', N'D.T.Hải')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'11', N'L.T.T.Nga')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'110', N'N.T.Tùng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'111', N'N.T.Hương')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'112', N'D.Q.Nhật')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'113', N'N.T.H.Ninh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'114', N'N.V.Trang')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'115', N'B.M.Cường')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'116', N'N.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'117', N'P.T.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'118', N'H.B.Dũng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'119', N'V.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'12', N'N.T.Vân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'120', N'N.V.Thuy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'121', N'N.V.Thuy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'122', N'D.V.Tiên')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'123', N'V.T.Khiêm')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'124', N'L.V.Anh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'125', N'N.V.Trinh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'126', N'D.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'127', N'T.M.Tuấn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'128', N'P.M.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'129', N'T.T.Q.Như')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'13', N'N.T.Hương')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'130', N'T.T.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'131', N'V.H.Quân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'132', N'N.V.Chí')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'133', N'N.T.Tùng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'134', N'T.V.Long')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'135', N'T.T.N.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'136', N'T.T.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'137', N'N.T.Toàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'138', N'D.Đ.Cốp')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'139', N'N.N.Hưng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'14', N'N.P.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'140', N'H.H.Ly')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'141', N'B.T.H.Hồng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'142', N'N.V.Thụy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'143', N'D.Q.Nhật')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'144', N'N.T.Hương')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'145', N'L.T.H.Trang')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'146', N'P.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'147', N'N.P.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'148', N'N.Q.Hưng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'149', N'T.T.N.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'15', N'P.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'150', N'N.V.Chí')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'151', N'N.T.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'152', N'N.N.Trung')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'153', N'Đ.T.N.Ánh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'154', N'L.T.H.Trang')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'155', N'P.T.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'156', N'D.V.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'157', N'N.T.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'158', N'L.T.Thùy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'159', N'N.T.Toàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'16', N'P.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'160', N'D.V.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'161', N'N.P.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'162', N'N.T.Tùng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'163', N'T.T.Q.Như')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'164', N'V.T.P.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'165', N'T.T.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'166', N'N.V.Trinh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'167', N'D.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'168', N'T.Đ.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'169', N'Đ.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'17', N'N.T.Hưng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'170', N'D.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'171', N'T.T.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'172', N'N.T.M.Hoàng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'173', N'N.V.Trang')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'174', N'P.T.Cường')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'175', N'N.P.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'176', N'D.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'177', N'D.T.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'178', N'N.T.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'179', N'B.M.Cường')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'18', N'T.T.N.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'180', N'N.T.Toàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'181', N'Đ.T.N.Ánh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'182', N'N.T.Hương')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'183', N'N.V.Thụy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'184', N'L.T.H.Trang')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'185', N'H.B.Dũng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'186', N'L.D.Minh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'187', N'D.V.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'188', N'D.V.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'189', N'N.T.Phảo')
GO
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'19', N'Đ.T.Hải')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'190', N'D.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'191', N'D.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'192', N'N.V.Chí')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'193', N'V.T.Hòa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'2', N'V.T.Khiêm')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'20', N'H.B.Dũng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'21', N'N.T.Hương')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'22', N'T.T.N.Tâm')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'23', N'N.T.H.Nhung')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'24', N'N.V.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'25', N'P.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'26', N'B.V.Nam')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'27', N'L.D.Minh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'28', N'M.T.Thái')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'29', N'N.P.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'3', N'T.V.Long')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'30', N'Đ.D.Yên')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'31', N'Đ.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'32', N'Đ.D.Yên')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'33', N'N.V.Thuy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'34', N'Đ.V.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'35', N'N.N.Hưng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'36', N'T.A.Thắng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'37', N'Đ.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'38', N'N.V.Tình')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'39', N'B.V.Nam')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'4', N'N.T.H.Nhung')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'40', N'N.T.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'41', N'Đ.T.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'42', N'N.T.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'43', N'N.T.T.Hoàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'44', N'V.H.Quân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'45', N'N.T.V.Anh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'46', N'T.T.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'47', N'N.V.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'48', N'T.T.N.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'49', N'P.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'5', N'B.V.Nam')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'50', N'N.N.T.Kiên')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'51', N'P.T.T.Hà')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'52', N'L.D.Minh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'53', N'N.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'54', N'B.M.Cường')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'55', N'N.P.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'56', N'N.T.H.Ninh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'57', N'N.T.P.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'58', N'T.V.Long')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'59', N'H.H.Ly')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'6', N'N.T.P.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'60', N'N.M.Ngọc')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'61', N'N.T.T.Hoàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'62', N'P.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'63', N'N.T.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'64', N'N.V.Thuy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'65', N'N.V.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'66', N'Đ.V.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'67', N'H.B.Dũng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'68', N'B.T.Tiên')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'69', N'B.T.Thị')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'7', N'N.N.Hưng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'70', N'B.Đ.Anh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'71', N'Đ.Q.Nhật')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'72', N'L.T.T.Hiền')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'73', N'L.T.Vân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'74', N'M.H.Toàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'75', N'N.P.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'76', N'N.T.L.Ninh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'77', N'N.T.Khuyên')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'78', N'N.T.Toàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'79', N'T.Á.Thắng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'8', N'N.T.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'80', N'T.T.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'81', N'V.T.Nga')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'82', N'D.T.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'83', N'D.V.Tiên')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'84', N'N.T.T.Hoàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'85', N'N.T.T.Thùy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'86', N'T.T.Q.Như')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'87', N'V.T.P.Thảo')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'88', N'N.P.Huy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'89', N'T.T.Thanh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'9', N'N.T.Toàn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'90', N'T.M.Tuấn')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'91', N'N.V.Mỹ')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'92', N'N.T.Linh')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'93', N'P.M.Tân')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'94', N'N.H.Lý')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'95', N'T.M.Hoàng')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'96', N'N.V.Thụy')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'97', N'N.T.T.Hoa')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'98', N'D.Đ.Cốp')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen]) VALUES (N'99', N'N.N.Kiên')
GO
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'1', N'B103BK1', N'1')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'10', N'TEE0479', N'10')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'100', N'ENG217', N'100')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'101', N'ENG217', N'101')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'102', N'TEE0337', N'102')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'103', N'TEE0428', N'103')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'104', N'TEE0480', N'104')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'105', N'TEE0531', N'105')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'106', N'TEE0568', N'106')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'107', N'TEE314', N'107')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'108', N'BAS305', N'108')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'109', N'TEE513', N'109')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'11', N'BAS118', N'11')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'110', N'BAS112', N'110')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'111', N'TEE0211', N'111')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'112', N'TEE0327', N'112')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'113', N'TEE411', N'113')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'114', N'MEC0302', N'114')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'115', N'TEE0312', N'115')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'116', N'TEE0479', N'116')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'117', N'TEE415', N'117')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'118', N'B103BK1', N'118')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'119', N'B103BK1', N'119')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'12', N'BAS217', N'12')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'120', N'180000', N'120')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'121', N'180000', N'121')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'122', N'B103BK1', N'122')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'123', N'B103BK1', N'123')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'124', N'PED0105', N'124')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'125', N'TEE0211', N'125')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'126', N'TEE0211', N'126')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'127', N'TEE0341', N'127')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'128', N'BAS112', N'128')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'129', N'ELE401', N'129')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'13', N'TEE0211', N'13')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'130', N'TEE0211', N'130')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'131', N'BAS0205', N'131')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'132', N'TEE0112', N'132')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'133', N'BAS112', N'133')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'134', N'BAS305', N'134')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'135', N'TEE0211', N'135')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'136', N'TEE0211', N'136')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'137', N'TEE0312', N'137')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'138', N'TEE560', N'138')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'139', N'BAS305', N'139')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'14', N'TEE0428', N'14')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'141', N'FIM501', N'141')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'142', N'TEE0312', N'142')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'143', N'TEE0327', N'143')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'144', N'TEE0480', N'144')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'145', N'TEE314', N'145')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'147', N'TEE585', N'147')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'148', N'MEC0302', N'148')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'149', N'TEE0211', N'149')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'15', N'TEE0456', N'15')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'150', N'TEE0112', N'150')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'151', N'TEE0311', N'151')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'152', N'TEE0568', N'152')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'153', N'TEE311', N'153')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'154', N'TEE0211', N'154')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'156', N'B103BK1', N'156')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'157', N'TEE0311', N'157')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'158', N'180000', N'158')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'159', N'180000', N'159')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'16', N'TEE415', N'16')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'160', N'B103BK1', N'160')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'161', N'TEE322', N'161')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'162', N'BAS112', N'162')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'163', N'ELE401', N'163')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'165', N'TEE0211', N'165')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'166', N'TEE433', N'166')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'167', N'TEE0211', N'167')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'168', N'BAS306', N'168')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'17', N'ELE0478', N'17')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'170', N'BAS112', N'170')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'171', N'TEE0211', N'171')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'173', N'MEC0302', N'173')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'174', N'PED101', N'174')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'175', N'TEE0584', N'175')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'176', N'BAS112', N'176')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'177', N'ENG217', N'177')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'178', N'TEE0311', N'178')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'179', N'TEE0312', N'179')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'18', N'TEE0211', N'18')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'180', N'TEE0531', N'180')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'181', N'TEE311', N'181')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'182', N'TEE317', N'182')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'183', N'TEE0112', N'183')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'184', N'TEE0211', N'184')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'185', N'B103BK1', N'185')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'186', N'TEE0338', N'186')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'187', N'B103BK1', N'187')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'188', N'B103BK1', N'188')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'189', N'B103CL1', N'189')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'19', N'TEE513', N'19')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'190', N'BAS112', N'190')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'191', N'BAS112', N'191')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'192', N'TEE0112', N'192')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'193', N'B103BK1', N'193')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'2', N'B103BK1', N'2')
GO
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'20', N'B103BK1', N'20')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'21', N'BAS112', N'21')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'22', N'BAS112', N'22')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'23', N'FIM501', N'23')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'24', N'TEE0478', N'24')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'25', N'TEE510', N'25')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'26', N'180000', N'26')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'27', N'180000', N'27')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'28', N'180000', N'28')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'29', N'180000', N'29')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'3', N'BAS305', N'3')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'30', N'180000', N'30')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'31', N'180000', N'31')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'32', N'180000', N'32')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'33', N'TEE0112', N'33')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'34', N'B103BK1', N'34')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'35', N'BAS305', N'35')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'36', N'BAS306', N'36')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'37', N'FIM207', N'37')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'38', N'TEE433', N'38')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'39', N'TEE0341', N'39')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'4', N'FIM501', N'4')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'40', N'TEE0311', N'40')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'41', N'ENG217', N'41')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'42', N'ENG217', N'42')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'43', N'BAS112', N'43')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'44', N'BAS0205', N'44')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'45', N'BAS217', N'45')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'46', N'TEE0211', N'46')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'47', N'TEE0479', N'47')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'48', N'TEE0211', N'48')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'49', N'TEE0408', N'49')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'5', N'TEE0341', N'5')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'50', N'ELE401', N'50')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'51', N'ENG217', N'51')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'52', N'TEE0338', N'52')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'53', N'TEE0479', N'53')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'54', N'TEE0532', N'54')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'55', N'TEE0584', N'55')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'56', N'TEE411', N'56')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'57', N'B103CL1', N'57')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'58', N'BAS305', N'58')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'59', N'ENG217', N'59')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'6', N'B103CL1', N'6')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'60', N'TEE0343', N'60')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'61', N'BAS112', N'61')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'62', N'TEE0412', N'62')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'63', N'TEE0311', N'63')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'64', N'TEE0312', N'64')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'65', N'TEE0478', N'65')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'66', N'B103BK1', N'66')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'67', N'B103BK1', N'67')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'68', N'180000', N'68')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'69', N'180000', N'69')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'7', N'BAS305', N'7')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'70', N'180000', N'70')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'71', N'180000', N'71')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'72', N'180000', N'72')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'73', N'180000', N'73')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'74', N'180000', N'74')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'75', N'180000', N'75')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'76', N'180000', N'76')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'77', N'180000', N'77')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'78', N'180000', N'78')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'79', N'180000', N'79')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'8', N'ENG217', N'8')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'80', N'180000', N'80')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'81', N'180000', N'81')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'82', N'180000', N'82')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'83', N'B103BK1', N'83')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'84', N'BAS112', N'84')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'85', N'BAS215', N'85')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'86', N'ELE401', N'86')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'87', N'ENG217', N'87')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'88', N'TEE322', N'88')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'89', N'TEE567', N'89')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'9', N'TEE0312', N'9')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'91', N'TEE0112', N'91')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'92', N'ENG217', N'92')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'93', N'BAS112', N'93')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'94', N'ENG217', N'94')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'95', N'ENG217', N'95')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'96', N'TEE0112', N'96')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'97', N'TEE0311', N'97')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'98', N'TEE560', N'98')
INSERT [dbo].[LopHocPhan] ([MaLHP], [MaMon], [MaGV]) VALUES (N'99', N'ELE401', N'99')
GO
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'', N'')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'180000', N'Sinh hoạt lớp')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'B103BK1', N'Pickleball 1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'B103CL1', N'Cầu lông 1')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'BAS0205', N'Giải tích 2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'BAS112', N'Vật lý 2')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'BAS118', N'Tư tưởng Hồ Chí Minh')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'BAS215', N'Kinh tế chính trị Mác - Lênin')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'BAS217', N'Lịch sử Đảng cộng sản Việt Nam')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'BAS305', N'Chủ nghĩa xã hội khoa học')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'BAS306', N'Vật lý bán dẫn')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'ELE0478', N'Thực hành cơ sở ngành KTDK&TDH')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'ELE401', N'Cơ sở Truyền động điện')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'ENG217', N'Tiếng Anh 3')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'FIM207', N'Pháp luật đại cương')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'FIM501', N'Quản trị doanh nghiệp CN')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'MEC0302', N'Cơ ứng dụng')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'PED0105', N'Giao tiếp kỹ thuật')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'PED101', N'Logic học')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0112', N'Nhập môn Công nghệ kỹ thuật điều khiển và tự động hóa')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0211', N'Tin học trong kỹ thuật')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0311', N'Mô hình một số hệ thống kỹ thuật')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0312', N'Hệ thống điều khiển lập trình PLC và HMI')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0327', N'Kỹ thuật đo lường điện')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0337', N'Nguồn điện trong hệ thống điện tử - viễn thông')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0338', N'Trường điện từ, truyền sóng và ăng ten')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0341', N'Thực tập cơ sở điện tử - viễn thông')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0343', N'Chuyển đổi số')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0408', N'Vi xử lý – Vi điều khiển')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0412', N'Kỹ thuật truyền dẫn')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0428', N'Thiết kế mạch tích hợp số')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0456', N'Công nghệ IoT')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0478', N'Khoa học dữ liệu')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0479', N'Lập trình Python')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0480', N'Công nghệ phần mềm')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0531', N'Hệ thống điều khiển lập trình')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0532', N'Hệ thống điều khiển phân tán')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0568', N'Điều khiển chuyển động')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE0584', N'Kỹ thuật điện tử nâng cao')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE311', N'Kỹ thuật điện tử số')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE314', N'Xử lý tín hiệu số')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE317', N'Toán rời rạc')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE322', N'Nhập môn Công nghệ điện tử, bán dẫn và vi mạch')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE411', N'Kỹ thuật mạch điện tử')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE415', N'Kiến trúc máy tính')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE433', N'Quản trị mạng')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE510', N'Công nghệ VoIP')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE513', N'Hệ thống viễn thông')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE560', N'Hệ quản trị cơ sở dữ liệu')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE567', N'Phân tích và thiết kế hệ thống')
INSERT [dbo].[MonHoc] ([MaMon], [TenMon]) VALUES (N'TEE585', N'Thiết kế hệ thống trên Chip')
GO
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (1, N'1', 2, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (2, N'2', 2, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (3, N'3', 2, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (4, N'4', 2, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (5, N'5', 2, 1, 3, CAST(N'07:00:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (6, N'6', 2, 2, 1, CAST(N'07:55:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (7, N'7', 2, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (8, N'8', 2, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (9, N'9', 2, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (10, N'10', 2, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (11, N'11', 2, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (12, N'12', 2, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (13, N'13', 2, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (14, N'14', 2, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (15, N'15', 2, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (16, N'16', 2, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (17, N'17', 2, 5, 4, CAST(N'10:50:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (18, N'18', 2, 6, 1, CAST(N'13:00:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (19, N'19', 2, 6, 1, CAST(N'13:00:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (20, N'20', 2, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (21, N'21', 2, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (22, N'22', 2, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (23, N'23', 2, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (24, N'24', 2, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (25, N'25', 2, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (26, N'26', 2, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (27, N'27', 2, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (28, N'28', 2, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (29, N'29', 2, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (30, N'30', 2, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (31, N'31', 2, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (32, N'32', 2, 10, 1, CAST(N'16:50:00' AS Time), CAST(N'17:40:00' AS Time), CAST(N'2025-03-17' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (33, N'33', 3, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'07:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (34, N'34', 3, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (35, N'35', 3, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (36, N'36', 3, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (37, N'37', 3, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (38, N'38', 3, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (39, N'39', 3, 1, 3, CAST(N'07:00:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (40, N'40', 3, 2, 1, CAST(N'07:55:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (41, N'41', 3, 2, 2, CAST(N'07:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (42, N'42', 3, 2, 2, CAST(N'07:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (43, N'43', 3, 3, 1, CAST(N'08:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (44, N'44', 3, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (45, N'45', 3, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (46, N'46', 3, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (47, N'47', 3, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (48, N'48', 3, 4, 1, CAST(N'09:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (49, N'49', 3, 5, 1, CAST(N'10:50:00' AS Time), CAST(N'11:40:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (50, N'50', 3, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (51, N'51', 3, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (52, N'52', 3, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (53, N'53', 3, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (54, N'54', 3, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (55, N'55', 3, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (56, N'56', 3, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (57, N'57', 3, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (58, N'58', 3, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (59, N'59', 3, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (60, N'60', 3, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (61, N'61', 3, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (62, N'62', 3, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (63, N'63', 3, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (64, N'64', 3, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (65, N'65', 3, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (66, N'66', 3, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (67, N'67', 3, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (68, N'68', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (69, N'69', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (70, N'70', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (71, N'71', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (72, N'72', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (73, N'73', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (74, N'74', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (75, N'75', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (76, N'76', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (77, N'77', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (78, N'78', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (79, N'79', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (80, N'80', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (81, N'81', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (82, N'82', 3, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-18' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (83, N'83', 4, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'07:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (84, N'84', 4, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (85, N'85', 4, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (86, N'86', 4, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (87, N'87', 4, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (88, N'88', 4, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (89, N'89', 4, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (91, N'91', 4, 2, 1, CAST(N'07:55:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (92, N'92', 4, 2, 2, CAST(N'07:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (93, N'93', 4, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (94, N'94', 4, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (95, N'95', 4, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (96, N'96', 4, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (97, N'97', 4, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (98, N'98', 4, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (99, N'99', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (100, N'100', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (101, N'101', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
GO
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (102, N'102', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (103, N'103', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (104, N'104', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (105, N'105', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (106, N'106', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (107, N'107', 4, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (108, N'108', 4, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (109, N'109', 4, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (110, N'110', 4, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (111, N'111', 4, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (112, N'112', 4, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (113, N'113', 4, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (114, N'114', 4, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (115, N'115', 4, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (116, N'116', 4, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (117, N'117', 4, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (118, N'118', 4, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (119, N'119', 4, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (120, N'120', 4, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (121, N'121', 4, 10, 1, CAST(N'16:50:00' AS Time), CAST(N'17:40:00' AS Time), CAST(N'2025-03-19' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (122, N'122', 5, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'07:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (123, N'123', 5, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'07:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (124, N'124', 5, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (125, N'125', 5, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (126, N'126', 5, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (127, N'127', 5, 1, 3, CAST(N'07:00:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (128, N'128', 5, 2, 1, CAST(N'07:55:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (129, N'129', 5, 2, 1, CAST(N'07:55:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (130, N'130', 5, 2, 1, CAST(N'07:55:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (131, N'131', 5, 2, 2, CAST(N'07:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (132, N'132', 5, 3, 1, CAST(N'08:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (133, N'133', 5, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (134, N'134', 5, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (135, N'135', 5, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (136, N'136', 5, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (137, N'137', 5, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (138, N'138', 5, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (139, N'139', 5, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (141, N'141', 5, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (142, N'142', 5, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (143, N'143', 5, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (144, N'144', 5, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (145, N'145', 5, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (147, N'147', 5, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (148, N'148', 5, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (149, N'149', 5, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (150, N'150', 5, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (151, N'151', 5, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (152, N'152', 5, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (153, N'153', 5, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (154, N'154', 5, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (156, N'156', 5, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (157, N'157', 5, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (158, N'158', 5, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (159, N'159', 5, 9, 1, CAST(N'15:55:00' AS Time), CAST(N'16:45:00' AS Time), CAST(N'2025-03-20' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (160, N'160', 6, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'07:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (161, N'161', 6, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'07:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (162, N'162', 6, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (163, N'163', 6, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (165, N'165', 6, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (166, N'166', 6, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (167, N'167', 6, 2, 1, CAST(N'07:55:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (168, N'168', 6, 2, 2, CAST(N'07:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (170, N'170', 6, 3, 1, CAST(N'08:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (171, N'171', 6, 3, 1, CAST(N'08:55:00' AS Time), CAST(N'09:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (173, N'173', 6, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (174, N'174', 6, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (175, N'175', 6, 5, 1, CAST(N'10:50:00' AS Time), CAST(N'11:40:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (176, N'176', 6, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (177, N'177', 6, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (178, N'178', 6, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (179, N'179', 6, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (180, N'180', 6, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (181, N'181', 6, 5, 2, CAST(N'10:50:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (182, N'182', 6, 6, 2, CAST(N'13:00:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (183, N'183', 6, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (184, N'184', 6, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (185, N'185', 6, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (186, N'186', 6, 7, 2, CAST(N'13:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (187, N'187', 6, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-21' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (188, N'188', 7, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (189, N'189', 7, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'08:45:00' AS Time), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (190, N'190', 7, 3, 2, CAST(N'08:55:00' AS Time), CAST(N'10:45:00' AS Time), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (191, N'191', 7, 6, 1, CAST(N'13:00:00' AS Time), CAST(N'13:50:00' AS Time), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (192, N'192', 7, 7, 1, CAST(N'13:55:00' AS Time), CAST(N'14:45:00' AS Time), CAST(N'2025-03-22' AS Date))
INSERT [dbo].[ThoiKhoaBieu] ([STT], [MaLHP], [Thu], [TietBatDau], [SoTiet], [GioVao], [GioRa], [NgayHoc]) VALUES (193, N'193', 7, 8, 1, CAST(N'14:55:00' AS Time), CAST(N'15:45:00' AS Time), CAST(N'2025-03-22' AS Date))
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD  CONSTRAINT [FK__LopHocPhan__MaGV] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LopHocPhan] CHECK CONSTRAINT [FK__LopHocPhan__MaGV]
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD  CONSTRAINT [FK__LopHocPhan__MaMH] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonHoc] ([MaMon])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LopHocPhan] CHECK CONSTRAINT [FK__LopHocPhan__MaMH]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [FK__ThoiKhoaB__MaLHP] FOREIGN KEY([MaLHP])
REFERENCES [dbo].[LopHocPhan] ([MaLHP])
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [FK__ThoiKhoaB__MaLHP]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [CK__ThoiKhoaB__NgayHoc] CHECK  (([NgayHoc]>='2000-01-01' AND [NgayHoc]<=getdate()))
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [CK__ThoiKhoaB__NgayHoc]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [CK__ThoiKhoaB__SoTiet] CHECK  (([SoTiet]>=(1) AND [SoTiet]<=(4)))
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [CK__ThoiKhoaB__SoTiet]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [CK__ThoiKhoaB__TietBD] CHECK  (([TietBatDau]>=(1) AND [TietBatDau]<=(10)))
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [CK__ThoiKhoaB__TietBD]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [CK__ThoiKhoaB__Thu] CHECK  (([Thu]>=(2) AND [Thu]<=(8)))
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [CK__ThoiKhoaB__Thu]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [CK_ThoiKhoaBieu_GioRa] CHECK  (([GioRa]>='06:30' AND [GioRa]<='19:00'))
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [CK_ThoiKhoaBieu_GioRa]
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD  CONSTRAINT [CK_ThoiKhoaBieu_GioVao] CHECK  (([GioVao]>='06:30' AND [GioVao]<='19:00'))
GO
ALTER TABLE [dbo].[ThoiKhoaBieu] CHECK CONSTRAINT [CK_ThoiKhoaBieu_GioVao]
GO
USE [master]
GO
ALTER DATABASE [TKB] SET  READ_WRITE 
GO
