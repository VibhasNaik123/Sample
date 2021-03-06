USE [Movies]
GO
/****** Object:  Table [dbo].[tblActorMovies]    Script Date: 23-06-2018 19:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActorMovies](
	[ActorMovieId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ActorId] [numeric](18, 0) NOT NULL,
	[MovieId] [numeric](18, 0) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[LastModifiedDateTime] [datetimeoffset](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblActorMovies] PRIMARY KEY CLUSTERED 
(
	[ActorMovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblActors]    Script Date: 23-06-2018 19:45:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblActors](
	[ActorId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ActorName] [nvarchar](50) NOT NULL,
	[GenderId] [tinyint] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[LastModifiedDateTime] [datetimeoffset](7) NOT NULL,
	[IsDeleted] [bit] NULL,
	[ImageId] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_ActorId] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGender]    Script Date: 23-06-2018 19:45:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGender](
	[GenderId] [tinyint] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NOT NULL,
	[GenderDescription] [nvarchar](50) NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[LastModifiedDateTime] [datetimeoffset](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSex] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblImages]    Script Date: 23-06-2018 19:45:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblImages](
	[ImageId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](250) NOT NULL,
	[ImageTitle] [nvarchar](50) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[LastModifedDateTime] [datetimeoffset](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMovies]    Script Date: 23-06-2018 19:45:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMovies](
	[MovieName] [nvarchar](50) NOT NULL,
	[MovieId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[YearOfRelease] [int] NOT NULL,
	[Plot] [text] NOT NULL,
	[ProducerId] [numeric](18, 0) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[LastModifiedDateTime] [datetimeoffset](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ImageId] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_tblMovies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducers]    Script Date: 23-06-2018 19:45:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducers](
	[ProducerId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[GenderId] [tinyint] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[ProducerName] [nvarchar](50) NOT NULL,
	[Bio] [text] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
	[LastModfiedDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_tblProducers] PRIMARY KEY CLUSTERED 
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_Actor_ActorMovie] FOREIGN KEY([ActorId])
REFERENCES [dbo].[tblActors] ([ActorId])
GO
ALTER TABLE [dbo].[tblActorMovies] CHECK CONSTRAINT [FK_Actor_ActorMovie]
GO
ALTER TABLE [dbo].[tblActorMovies]  WITH CHECK ADD  CONSTRAINT [FK_tblActorMovies_tblMovies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[tblMovies] ([MovieId])
GO
ALTER TABLE [dbo].[tblActorMovies] CHECK CONSTRAINT [FK_tblActorMovies_tblMovies]
GO
ALTER TABLE [dbo].[tblActors]  WITH CHECK ADD  CONSTRAINT [FK_Gender_Actor] FOREIGN KEY([GenderId])
REFERENCES [dbo].[tblGender] ([GenderId])
GO
ALTER TABLE [dbo].[tblActors] CHECK CONSTRAINT [FK_Gender_Actor]
GO
ALTER TABLE [dbo].[tblActors]  WITH CHECK ADD  CONSTRAINT [FK_Image_Actor] FOREIGN KEY([ImageId])
REFERENCES [dbo].[tblImages] ([ImageId])
GO
ALTER TABLE [dbo].[tblActors] CHECK CONSTRAINT [FK_Image_Actor]
GO
ALTER TABLE [dbo].[tblMovies]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Image] FOREIGN KEY([ImageId])
REFERENCES [dbo].[tblImages] ([ImageId])
GO
ALTER TABLE [dbo].[tblMovies] CHECK CONSTRAINT [FK_Movie_Image]
GO
ALTER TABLE [dbo].[tblMovies]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Producer] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[tblProducers] ([ProducerId])
GO
ALTER TABLE [dbo].[tblMovies] CHECK CONSTRAINT [FK_Movie_Producer]
GO
ALTER TABLE [dbo].[tblProducers]  WITH CHECK ADD  CONSTRAINT [FK_Gender_Producer] FOREIGN KEY([GenderId])
REFERENCES [dbo].[tblGender] ([GenderId])
GO
ALTER TABLE [dbo].[tblProducers] CHECK CONSTRAINT [FK_Gender_Producer]
GO
