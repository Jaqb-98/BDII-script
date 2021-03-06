USE [master]
GO
/****** Object:  Database [Ewidencja obiektów mostowych]    Script Date: 5/23/2020 3:23:21 PM ******/
CREATE DATABASE [Ewidencja obiektów mostowych]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ewidencja obiektów mostowych', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ewidencja obiektów mostowych.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ewidencja obiektów mostowych_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ewidencja obiektów mostowych_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ewidencja obiektów mostowych].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET RECOVERY FULL 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET  MULTI_USER 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET QUERY_STORE = OFF
GO
USE [Ewidencja obiektów mostowych]
GO
/****** Object:  Table [dbo].[Inspektorzy]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspektorzy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Imię] [varchar](50) NOT NULL,
	[Nazwisko] [varchar](50) NOT NULL,
	[Tytuł] [varchar](50) NULL,
	[Numer_uprawnień_budowlanych] [nchar](14) NOT NULL,
	[email] [varchar](50) NULL,
	[telefon_kontaktowy] [varchar](50) NULL,
 CONSTRAINT [PK_Inspektorzy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontrole]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontrole](
	[JNI] [numeric](8, 0) NOT NULL,
	[numer_kontroli] [int] IDENTITY(1,1) NOT NULL,
	[id_inspektora] [int] NOT NULL,
	[numer_protokołu] [varchar](50) NOT NULL,
	[data_kontroli] [date] NOT NULL,
	[rodzaj_przeglądu] [varchar](50) NOT NULL,
	[ocena_pomostu] [int] NOT NULL,
	[ocena_dźwigarów] [int] NOT NULL,
	[ocena_podpór] [int] NOT NULL,
	[ocena_całego_obiektu] [decimal](3, 2) NULL,
	[zakres_robót_remontowych] [varchar](500) NULL,
	[data_wykonania_robót] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Niwelacje]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Niwelacje](
	[id_niwelacji] [int] IDENTITY(1,1) NOT NULL,
	[JNI] [numeric](8, 0) NOT NULL,
	[id_wykonawcy] [int] NOT NULL,
	[wnioski] [varchar](500) NULL,
	[miejsce_przechowywania_dokumentacji_niwelacyjnej] [varchar](100) NULL,
 CONSTRAINT [PK_Niwelacje] PRIMARY KEY CLUSTERED 
(
	[id_niwelacji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obiekty_mostowe]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obiekty_mostowe](
	[JNI] [numeric](8, 0) NOT NULL,
	[rodzaj_obiektu] [varchar](50) NOT NULL,
	[funkcja_użytkowa] [varchar](50) NOT NULL,
	[numer_drogi] [varchar](10) NOT NULL,
	[nazwa_własna_obiektu] [varchar](50) NULL,
	[województwo] [varchar](50) NOT NULL,
	[powiat] [varchar](50) NOT NULL,
	[gmina] [varchar](50) NOT NULL,
	[miejscowość] [varchar](50) NOT NULL,
	[rodzaj_przeszkody] [varchar](50) NOT NULL,
	[nazwa_przeszkody] [varchar](50) NULL,
	[data_założenia_książki_obiektu] [date] NOT NULL,
 CONSTRAINT [PK_Obiekty_mostowe] PRIMARY KEY CLUSTERED 
(
	[JNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opracowania_techniczne]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opracowania_techniczne](
	[id_opracowania] [int] IDENTITY(1,1) NOT NULL,
	[JNI] [numeric](8, 0) NOT NULL,
	[nazwa] [varchar](50) NOT NULL,
	[data_opracowania] [date] NOT NULL,
	[id_autora] [int] NOT NULL,
	[przedmiot_i_sposób_wykorzystania] [varchar](200) NULL,
	[data_wykonania_robót] [date] NULL,
 CONSTRAINT [PK_Opracowania_techniczne] PRIMARY KEY CLUSTERED 
(
	[id_opracowania] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametry_techniczne_obiektów_mostowych]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametry_techniczne_obiektów_mostowych](
	[JNI] [numeric](8, 0) NOT NULL,
	[długośc_całkowita_obiektu] [numeric](18, 0) NOT NULL,
	[szerokość_całkowita_obiektu] [numeric](18, 0) NOT NULL,
	[szerokośc_jezdni] [numeric](18, 0) NULL,
	[schemat_statyczny_obiektu] [varchar](50) NULL,
	[liczba_przęseł] [int] NULL,
	[liczba_podpór] [int] NULL,
	[liczba_łożysk] [int] NULL,
	[nośność] [numeric](18, 2) NOT NULL,
	[aktualna_nośność_użytkowa] [numeric](18, 2) NOT NULL,
	[rodzaj_kostrukcji_pomostu] [varchar](50) NULL,
	[charakter_zabytkowy] [bit] NOT NULL,
 CONSTRAINT [PK_Parametry_techniczne_obiektów_mostowych] PRIMARY KEY CLUSTERED 
(
	[JNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protokoły_katastrof]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protokoły_katastrof](
	[id_protokołu] [int] IDENTITY(1,1) NOT NULL,
	[JNI] [numeric](8, 0) NOT NULL,
	[data_katastrofy] [date] NOT NULL,
	[zakres_uszkodzeń] [varchar](500) NOT NULL,
	[przyczyny_uszkodzeń] [varchar](500) NOT NULL,
	[data_usunięcia_uszkodzeń] [date] NULL,
 CONSTRAINT [PK_Protokoły_katastrof] PRIMARY KEY CLUSTERED 
(
	[id_protokołu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wykonawcy]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wykonawcy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazwa_firmy] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telefon_kontaktowy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Wykonawcy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kontrole]  WITH CHECK ADD  CONSTRAINT [id_inspektora = id] FOREIGN KEY([id_inspektora])
REFERENCES [dbo].[Inspektorzy] ([id])
GO
ALTER TABLE [dbo].[Kontrole] CHECK CONSTRAINT [id_inspektora = id]
GO
ALTER TABLE [dbo].[Kontrole]  WITH CHECK ADD  CONSTRAINT [k.JNI = om.JNI] FOREIGN KEY([JNI])
REFERENCES [dbo].[Obiekty_mostowe] ([JNI])
GO
ALTER TABLE [dbo].[Kontrole] CHECK CONSTRAINT [k.JNI = om.JNI]
GO
ALTER TABLE [dbo].[Niwelacje]  WITH CHECK ADD  CONSTRAINT [id_wykonawcy = id] FOREIGN KEY([id_wykonawcy])
REFERENCES [dbo].[Wykonawcy] ([id])
GO
ALTER TABLE [dbo].[Niwelacje] CHECK CONSTRAINT [id_wykonawcy = id]
GO
ALTER TABLE [dbo].[Niwelacje]  WITH CHECK ADD  CONSTRAINT [n.JNI = om.JNI] FOREIGN KEY([JNI])
REFERENCES [dbo].[Obiekty_mostowe] ([JNI])
GO
ALTER TABLE [dbo].[Niwelacje] CHECK CONSTRAINT [n.JNI = om.JNI]
GO
ALTER TABLE [dbo].[Opracowania_techniczne]  WITH CHECK ADD  CONSTRAINT [id_autora = id] FOREIGN KEY([id_autora])
REFERENCES [dbo].[Wykonawcy] ([id])
GO
ALTER TABLE [dbo].[Opracowania_techniczne] CHECK CONSTRAINT [id_autora = id]
GO
ALTER TABLE [dbo].[Opracowania_techniczne]  WITH CHECK ADD  CONSTRAINT [ot.JNI = om.JNI] FOREIGN KEY([JNI])
REFERENCES [dbo].[Obiekty_mostowe] ([JNI])
GO
ALTER TABLE [dbo].[Opracowania_techniczne] CHECK CONSTRAINT [ot.JNI = om.JNI]
GO
ALTER TABLE [dbo].[Parametry_techniczne_obiektów_mostowych]  WITH CHECK ADD  CONSTRAINT [JNI = JNI] FOREIGN KEY([JNI])
REFERENCES [dbo].[Obiekty_mostowe] ([JNI])
GO
ALTER TABLE [dbo].[Parametry_techniczne_obiektów_mostowych] CHECK CONSTRAINT [JNI = JNI]
GO
ALTER TABLE [dbo].[Protokoły_katastrof]  WITH CHECK ADD  CONSTRAINT [pk.JNI = om.JNI] FOREIGN KEY([JNI])
REFERENCES [dbo].[Obiekty_mostowe] ([JNI])
GO
ALTER TABLE [dbo].[Protokoły_katastrof] CHECK CONSTRAINT [pk.JNI = om.JNI]
GO
ALTER TABLE [dbo].[Inspektorzy]  WITH NOCHECK ADD  CONSTRAINT [CK_Inspektorzy] CHECK  ((substring([Numer_uprawnień_budowlanych],(4),(1))='/' AND substring([Numer_uprawnień_budowlanych],(7),(1))='/' AND substring([Numer_uprawnień_budowlanych],(12),(1))='/' AND isnumeric(substring([Numer_uprawnień_budowlanych],(8),(4)))=(1) AND isnumeric(substring([Numer_uprawnień_budowlanych],(13),(2)))=(1) AND [email] like '%_@_%._%'))
GO
ALTER TABLE [dbo].[Inspektorzy] CHECK CONSTRAINT [CK_Inspektorzy]
GO
ALTER TABLE [dbo].[Protokoły_katastrof]  WITH CHECK ADD  CONSTRAINT [CK_Protokoły_katastrof] CHECK  (([data_usunięcia_uszkodzeń]>=[data_katastrofy]))
GO
ALTER TABLE [dbo].[Protokoły_katastrof] CHECK CONSTRAINT [CK_Protokoły_katastrof]
GO
/****** Object:  Trigger [dbo].[trNowaKontrola]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trNowaKontrola] on [dbo].[Kontrole]
after insert
as
begin
update Kontrole
set ocena_całego_obiektu = (cast(inserted.ocena_dźwigarów as decimal)+cast(inserted.ocena_podpór as decimal) + cast(inserted.ocena_pomostu as decimal))/3
from inserted
where Kontrole.numer_kontroli = inserted.numer_kontroli;
end
GO
ALTER TABLE [dbo].[Kontrole] ENABLE TRIGGER [trNowaKontrola]
GO
/****** Object:  Trigger [dbo].[trSprawdzenieUprawnien]    Script Date: 5/23/2020 3:23:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trSprawdzenieUprawnien] on [dbo].[Kontrole]
after insert
not for replication
as
declare @specjalność varchar(2);

select @specjalność = substring(Inspektorzy.Numer_uprawnień_budowlanych,5,6) 
from Inspektorzy join inserted i on Inspektorzy.id = i.id_inspektora 
where Inspektorzy.id= i.id_inspektora

if @specjalność!='BM'
begin
raiserror('Wprowadzony inspektor nie ma wymaganych uprawnień',16,1)
rollback transaction
return
end
GO
ALTER TABLE [dbo].[Kontrole] ENABLE TRIGGER [trSprawdzenieUprawnien]
GO
USE [master]
GO
ALTER DATABASE [Ewidencja obiektów mostowych] SET  READ_WRITE 
GO
