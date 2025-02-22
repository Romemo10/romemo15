USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 23/07/2020 11:05:37 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hospital.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Hospital_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[cita]    Script Date: 23/07/2020 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cita](
	[Cod_cita] [nvarchar](10) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[id_paciente] [nvarchar](10) NOT NULL,
	[id_medico] [nvarchar](10) NOT NULL,
	[valor] [int] NOT NULL,
	[diagnostico] [nvarchar](max) NOT NULL,
	[Nom_acompanante] [nvarchar](50) NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_cita] PRIMARY KEY CLUSTERED 
(
	[Cod_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[medico]    Script Date: 23/07/2020 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico](
	[Id_medico] [nvarchar](10) NOT NULL,
	[nom_medico] [nvarchar](50) NOT NULL,
	[especialidad] [nvarchar](30) NOT NULL,
	[tel_medico] [nvarchar](10) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_medico] PRIMARY KEY CLUSTERED 
(
	[Id_medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paciente]    Script Date: 23/07/2020 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[Id_paciente] [nvarchar](10) NOT NULL,
	[Tip_doc] [nvarchar](20) NOT NULL,
	[nom_paciente] [nvarchar](50) NOT NULL,
	[dir_paciente] [nvarchar](50) NOT NULL,
	[tel_paciente] [nvarchar](10) NOT NULL,
	[cel_paciente] [nvarchar](10) NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[Id_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[Actualizar_cita]    Script Date: 23/07/2020 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Actualizar_cita]
@Cod_cita nvarchar(10),
@fecha date,
@hora time(7),
@id_paciente nvarchar(10),
@id_medico nvarchar(10),
@valor int,
@diagnostico nvarchar(MAX),
@Nom_acompanante nvarchar(50),
@activo bit
as
insert into cita(Cod_cita, fecha,hora,id_paciente,id_medico,valor,diagnostico,Nom_acompanante,activo ) values(@Cod_cita,@fecha,@hora,@id_paciente, @id_medico, @valor, @diagnostico,@Nom_acompanante, @activo )

GO
/****** Object:  StoredProcedure [dbo].[Actualizar_paciente]    Script Date: 23/07/2020 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Actualizar_paciente]
@Id_paciente nvarchar(10),
@Tip_doc nvarchar(20),
@nom_paciente nvarchar(50),
@dir_paciente nvarchar(50),
@tel_paciente nvarchar(10),
@cel_paciente nvarchar(10),
@activo bit
as
insert into paciente(Id_paciente, Tip_doc,nom_paciente,dir_paciente,tel_paciente,cel_paciente,activo ) values(@Id_paciente, @Tip_doc, @nom_paciente,@dir_paciente,@tel_paciente,@cel_paciente,@activo)

GO
/****** Object:  StoredProcedure [dbo].[anula_cita]    Script Date: 23/07/2020 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[anula_cita]
@pcod_cita nvarchar(10)
as
update cita set activo=0 where Cod_cita=@pcod_cita
GO
/****** Object:  StoredProcedure [dbo].[consultar_citas]    Script Date: 23/07/2020 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[consultar_citas]
@pcod_cita  nvarchar(10)
as 
select * from cita where cod_cita=@pcod_cita
select nom_paciente, tel_paciente from paciente, cita 
where paciente.Id_paciente= cita.id_paciente
and cod_cita= @pcod_cita
select nom_medico, especialidad from medico, cita
where medico.Id_medico= cita.id_medico
and cod_cita= @pcod_cita
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
