USE [master]
GO
/****** Object:  Database [Pudelek]    Script Date: 5/16/2019 11:03:17 PM ******/
CREATE DATABASE [Pudelek]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pudelek', FILENAME = N'/var/opt/mssql/data/Pudelek.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pudelek_log', FILENAME = N'/var/opt/mssql/data/Pudelek_log.ldf' , SIZE = 466944KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pudelek] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pudelek].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pudelek] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pudelek] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pudelek] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pudelek] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pudelek] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pudelek] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pudelek] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pudelek] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pudelek] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pudelek] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pudelek] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pudelek] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pudelek] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pudelek] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pudelek] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pudelek] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pudelek] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pudelek] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pudelek] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pudelek] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pudelek] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pudelek] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pudelek] SET RECOVERY FULL 
GO
ALTER DATABASE [Pudelek] SET  MULTI_USER 
GO
ALTER DATABASE [Pudelek] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pudelek] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pudelek] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pudelek] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pudelek] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pudelek] SET QUERY_STORE = OFF
GO
USE [Pudelek]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Pudelek]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 5/16/2019 11:03:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[article_url] [nvarchar](255) NULL,
	[article_type] [nvarchar](255) NULL,
	[article_title] [nvarchar](500) NULL,
	[article_created_at] [datetime] NULL,
	[article_author] [nvarchar](255) NULL,
	[article_content] [nvarchar](max) NULL,
	[article_number_of_comments] [int] NULL,
	[article_number_of_bolded_text] [int] NULL,
	[article_has_slideshow] [bit] NULL,
	[article_has_video] [bit] NULL,
	[article_number_of_images] [int] NULL,
	[article_number_of_likes] [int] NULL,
	[article_is_downloaded] [bit] NULL,
	[article_inserted_at] [datetime] NULL,
	[article_updated_at] [datetime] NULL,
 CONSTRAINT [PK_dbo.Articles] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vArticles]    Script Date: 5/16/2019 11:03:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vArticles] 

AS

select 
a.article_id
,a.article_url
,a.article_type
,a.article_title
,a.article_created_at
,article_author = coalesce(nullif(a.article_author, ''),'n/a')
,a.article_content
,a.article_number_of_comments
,a.article_number_of_bolded_text
,a.article_has_slideshow
,a.article_has_video
,a.article_number_of_images
,a.article_number_of_likes
,a.article_is_downloaded
,a.article_inserted_at
,a.article_updated_at
from dbo.Articles a (nolock)
where 1 = 1
and article_is_downloaded = 1
and convert(date,article_created_at) >= '20160101'
and article_id is not null
and article_url is not null
and article_type is not null
and article_title is not null --x
and article_created_at is not null
and article_author is not null --x
and article_content is not null --x
and article_number_of_comments is not null
and article_number_of_bolded_text is not null
and article_has_slideshow is not null
and article_has_video is not null
and article_number_of_images is not null
and article_number_of_likes is not null
and article_is_downloaded is not null
and article_inserted_at is not null
and article_updated_at is not null
and article_url <> ''
and article_type <> ''
and article_title <> '' --x
and article_author <> '' -- x
and article_content <> '' --x

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/16/2019 11:03:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[comment_author] [nvarchar](255) NULL,
	[comment_created_at] [datetime] NULL,
	[comment_message] [nvarchar](max) NULL,
	[comment_thumbs_up] [int] NULL,
	[comment_thumbs_down] [int] NULL,
	[comment_is_highlited] [bit] NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vComments]    Script Date: 5/16/2019 11:03:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vComments]

as

select 
c.comment_id
,c.article_id
,c.comment_author
,c.comment_created_at
,c.comment_message
,c.comment_thumbs_up
,c.comment_thumbs_down
,c.comment_is_highlited
from [dbo].[Comments] c (nolock)
where c.article_id IN
(
	select article_id
	from dbo.varticles 
)
GO
/****** Object:  Table [dbo].[RelatedArticles]    Script Date: 5/16/2019 11:03:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelatedArticles](
	[related_article_id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[related_article_text] [nvarchar](2500) NULL,
	[related_article_url] [nvarchar](2500) NULL,
 CONSTRAINT [PK_dbo.RelatedArticles] PRIMARY KEY CLUSTERED 
(
	[related_article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vRelatedArticles]    Script Date: 5/16/2019 11:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vRelatedArticles]

as

select 
ra.related_article_id,
ra.article_id,
ra.related_article_text,
ra.related_article_url
from [dbo].[RelatedArticles] ra (nolock)
where article_id in
(
	select article_id
	from dbo.varticles
)
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 5/16/2019 11:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[tag_text] [nvarchar](255) NULL,
	[tag_url] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.Tags] PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vTags]    Script Date: 5/16/2019 11:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vTags]

as

select 
t.tag_id,
t.article_id,
t.tag_text,
t.tag_url
from [dbo].[Tags] t (nolock)
where article_id in
(
	select article_id
	from dbo.varticles
)
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/16/2019 11:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Pudelek] SET  READ_WRITE 
GO
