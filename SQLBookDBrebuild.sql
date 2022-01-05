USE [master]
GO
/****** Object:  Database [BookDB]    Script Date: 2022-01-05 09:13:27 ******/
CREATE DATABASE [BookDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BookDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookDB', N'ON'
GO
ALTER DATABASE [BookDB] SET QUERY_STORE = OFF
GO
USE [BookDB]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 2022-01-05 09:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[author_first_name] [varchar](50) NULL,
	[author_last_name] [varchar](50) NULL,
	[author_age] [varchar](3) NULL,
	[author_nationality] [varchar](20) NULL,
	[author_alive] [varchar](1) NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 2022-01-05 09:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[book_name] [varchar](50) NULL,
	[book_author_id] [bigint] NULL,
	[book_publisher_id] [bigint] NULL,
	[book_description] [text] NULL,
	[book_genre] [varchar](20) NULL,
	[book_language] [varchar](20) NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 2022-01-05 09:13:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[publisher_name] [varchar](50) NULL,
	[publisher_adress] [varchar](50) NULL,
	[publisher_phone_number] [varchar](30) NULL,
	[publisher_email] [varchar](100) NULL,
 CONSTRAINT [PK_publishers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[authors] ON 
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (1, N'John Ronald Reuel', N'Tolkien', N'81', N'England', N'N')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (2, N'Frank', N'Herbert', N'65', N'USA', N'N')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (3, N'Haruki', N'Murakami', N'72', N'Japan', N'Y')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (4, N'Neil', N'Gaiman', N'61', N'England', N'Y')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (5, N'Terry', N'Pratchett', N'66', N'England', N'N')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (6, N'Douglas', N'Adams', N'49', N'England', N'N')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (7, N'Alexandre', N'Dumas', N'68', N'France', N'N')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (8, N'Jules', N'Verne', N'77', N'France', N'N')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (9, N'Mary', N'Shelley', N'53', N'England', N'N')
GO
INSERT [dbo].[authors] ([id], [author_first_name], [author_last_name], [author_age], [author_nationality], [author_alive]) VALUES (10, N'Tom', N'Clancy', N'66', N'USA', N'N')
GO
SET IDENTITY_INSERT [dbo].[authors] OFF
GO
SET IDENTITY_INSERT [dbo].[books] ON 
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (1, N'Frankenstein; or, The Modern Prometheus', 9, 1, N' Frankenstein tells the story of Victor Frankenstein, a young scientist who creates a sapient creature in an unorthodox scientific experiment.', N'Horror', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (2, N'The Fellowship of the Ring', 1, 2, N'Bilbo celebrates his 111th birthday and leaves the Shire suddenly, leaving the Ring to Frodo Baggins, his cousin and heir. Neither hobbit is aware of the Rings origin, but the wizard Gandalf suspects it is a Ring of Power.', N'Fantasy', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (3, N'The Two Towers', 1, 2, N'The Two Towers is the second volume of J. R. R. Tolkiens high fantasy novel The Lord of the Rings. It is preceded by The Fellowship of the Ring and followed by The Return of the King.', N'Fantasy', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (4, N'The Return of the King', 1, 2, N'The Return of the King is the third and final volume of J. R. R. Tolkiens The Lord of the Rings, following The Fellowship of the Ring and The Two Towers.', N'Fantasy', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (5, N'Dune', 2, 3, N'Dune is set in the distant future amidst a feudal interstellar society in which various noble houses control planetary fiefs. It tells the story of young Paul Atreides, whose family accepts the stewardship of the planet Arrakis.', N'SciFi', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (6, N'Children of Dune', 2, 3, N'At the end of Dune Messiah, Paul Atreides walks into the desert, a blind man, leaving his twin children Leto and Ghanima in the care of the Fremen, while his sister Alia rules the universe as regent.', N'SciFi', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (7, N'Kafka on the Shore', 3, 4, N'Comprising two distinct but interrelated plots, the narrative runs back and forth between both plots, taking up each plotline in alternating chapters.', N'Drama', N'Japanese')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (8, N'The Wind-Up Bird Chronicle', 3, 4, N'The first part, "The Thieving Magpie", begins with the narrator, Toru Okada, a low-key and unemployed lawyers assistant, being tasked by his wife, Kumiko, to find their missing cat. Kumiko suggests looking in the alley, a closed-off strip of land behind their house.', N'Drama', N'Japanese')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (9, N'Neverwhere', 4, 7, N'Neverwhere is the story of Richard Mayhew and his trials and tribulations in London. At the start of the story, he is a young businessman, recently moved from Scotland and with a normal life ahead.', N'Fantasy', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (10, N'Good Omens', 4, 6, N'Aziraphale, an angel (originally a guardian of the gates of Eden), and Crowley, a demon (originally the serpent who tempted Eve) have lived on Earth since its creation. Over the millennia, they have formed an odd friendship and taken a liking to humanity.', N'Fantasy', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (11, N'Soul Music', 5, 6, N'A young harpist, Imp Y Celyn from Llamedos (spelled backwards, "sod em all", a tribute to Llareggub in Welsh poet Dylan Thomas Under Milk Wood), comes to Ankh-Morpork in hopes of becoming famous.', N'Fantasy', N'Enlish')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (12, N'Guards! Guards!', 5, 8, N'The story follows a plot by a secret brotherhood, the Unique and Supreme Lodge of the Elucidated Brethren of the Ebon Night, to overthrow the Patrician of Ankh-Morpork and install a puppet king, under the control of the Supreme Grand Master.', N'Fantasy', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (13, N'The Long Dark Tea-Time of the Soul', 6, 10, N'While trying to purchase an airline ticket to Oslo at Heathrow Airport, American journalist Kate Schechter finds herself in line behind a large blond man who also wants to get on the flight but has no identification or means to pay.', N'Drama', N'English')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (14, N'The Count of Monte Cristo', 7, 11, N'The story takes place in France, Italy, and islands in the Mediterranean during the historical events of 1815–1839: the era of the Bourbon Restoration through the reign of Louis-Philippe of France. It begins on the day that Napoleon left his first island of exile, Elba, beginning the Hundred Days period when Napoleon returned to power. ', N'Drama', N'French')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (15, N'Twenty Thousand Leagues Under the Seas', 8, 12, N'During the year 1866, ships of various nationalities sight a mysterious sea monster, which, it is later suggested, might be a gigantic narwhal. The U.S. government assembles an expedition in New York City to find and destroy the monster.', N'SciFi', N'French')
GO
INSERT [dbo].[books] ([id], [book_name], [book_author_id], [book_publisher_id], [book_description], [book_genre], [book_language]) VALUES (16, N'The Hunt for Red October', 10, 13, N'During the Cold War, Marko Ramius, a Soviet Navy submarine commander, plans to defect to the United States with the Typhoon-class ballistic missile submarine Red October.', N'Thriller', N'English')
GO
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[publishers] ON 
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (1, N'Lackington, Hughes, Harding, Mavor & Jones', NULL, NULL, NULL)
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (2, N'George Allen & Unwin', N'Allen & Unwin, PO Box 8500, St Leonards, NSW 1590', N'61284250100', N'UK@allenandunwin.com')
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (3, N'Chilton Books', N'Boston, Massachusetts, USA', NULL, NULL)
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (4, N'Shinchosha', N'71, Yaraicho, Shinjuku, Tokyo', N'81-3-3266-5220', N't.kimura@shinchosha.co.jp')
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (6, N'Victor Gollancz Ltd', N'Carmelite House, 50 Victoria Embankment, London', N'44203122 6000', NULL)
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (7, N'BBC Books', N'20 Vauxhall Bridge Rd, London,. SW1V 2SA, UK', N'44020 7840 8400', N'open.book@bbc.co.uk')
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (8, N'Doubleday', N'1745 Broadway / New York, NY 10019', N'716 250-5700', N'knopfwebmaster@randomhouse.com')
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (10, N'Heinemann', N'145 Maplewood Avenue, Suite 300 Portsmouth', N'6034317894', N'custserv@heinemann.com')
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (11, N'Chapman & Hall', NULL, NULL, NULL)
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (12, N'Pierre-Jules Hetzel', NULL, NULL, NULL)
GO
INSERT [dbo].[publishers] ([id], [publisher_name], [publisher_adress], [publisher_phone_number], [publisher_email]) VALUES (13, N'Naval Institute Press', N' Beach Hall 291 Wood Road Annapolis, MD', N'18002338764', N'member@usni.org')
GO
SET IDENTITY_INSERT [dbo].[publishers] OFF
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_books_authors] FOREIGN KEY([book_author_id])
REFERENCES [dbo].[authors] ([id])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_books_authors]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [FK_books_publishers] FOREIGN KEY([book_publisher_id])
REFERENCES [dbo].[publishers] ([id])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [FK_books_publishers]
GO
USE [master]
GO
ALTER DATABASE [BookDB] SET  READ_WRITE 
GO
