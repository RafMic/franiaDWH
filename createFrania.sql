IF OBJECT_ID('Sprzedaz_hist', 'U') IS NOT NULL 
	drop table Sprzedaz_hist

IF OBJECT_ID('Sprzedaz_plan', 'U') IS NOT NULL 
	drop table Sprzedaz_plan

IF OBJECT_ID('Czas', 'U') IS NOT NULL 
	drop table Czas

IF OBJECT_ID('Regiony', 'U') IS NOT NULL 
	drop table Regiony

IF OBJECT_ID('Towary', 'U') IS NOT NULL 
	drop table Towary

IF OBJECT_ID('Klienci', 'U') IS NOT NULL 
	drop table Klienci

GO

-----------------------------------------

CREATE TABLE [dbo].[Czas](
	[Id] [char](6) COLLATE Polish_CI_AS NOT NULL,
	[Miesiac] [int] NULL,
	[Kwartal] [int] NULL,
	[Rok] [int] NULL,
 CONSTRAINT [Key4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Towary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Towar] [varchar](40) COLLATE Polish_CI_AS NULL,
	[Podgrupa] [varchar](20) COLLATE Polish_CI_AS NULL,
	[Grupa] [char](2) COLLATE Polish_CI_AS NULL,
 CONSTRAINT [Key3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Regiony](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Region] [varchar](20) COLLATE Polish_CI_AS NULL,
 CONSTRAINT [Key2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Klienci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Klient] [varchar](30) COLLATE Polish_CI_AS NULL,
 CONSTRAINT [Key1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Sprzedaz_hist](
	[Klient_Id] [int] NOT NULL,
	[Region_Id] [int] NOT NULL,
	[Towary_Id] [int] NOT NULL,
	[Czas_Id] [char](6) COLLATE Polish_CI_AS NOT NULL,
	[Cena] [money] NULL,
	[Ilosc] [int] NULL,
	[Obrot] [money] NULL,
 CONSTRAINT [Key5] PRIMARY KEY CLUSTERED 
(
	[Klient_Id] ASC,
	[Region_Id] ASC,
	[Towary_Id] ASC,
	[Czas_Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Sprzedaz_hist]  WITH CHECK ADD  CONSTRAINT [Relationship3] FOREIGN KEY([Klient_Id])
REFERENCES [dbo].[Klienci] ([Id])
GO
ALTER TABLE [dbo].[Sprzedaz_hist]  WITH CHECK ADD  CONSTRAINT [Relationship4] FOREIGN KEY([Region_Id])
REFERENCES [dbo].[Regiony] ([Id])
GO
ALTER TABLE [dbo].[Sprzedaz_hist]  WITH CHECK ADD  CONSTRAINT [Relationship5] FOREIGN KEY([Towary_Id])
REFERENCES [dbo].[Towary] ([Id])
GO
ALTER TABLE [dbo].[Sprzedaz_hist]  WITH CHECK ADD  CONSTRAINT [Relationship6] FOREIGN KEY([Czas_Id])
REFERENCES [dbo].[Czas] ([Id])


CREATE TABLE [dbo].[Sprzedaz_plan](
	[Klient_Id] [int] NOT NULL,
	[Region_Id] [int] NOT NULL,
	[Towary_Id] [int] NOT NULL,
	[Czas_Id] [char](6) COLLATE Polish_CI_AS NOT NULL,
	[Cena] [money] NULL,
	[Ilosc] [int] NULL,
	[Obrot] [money] NULL,
 CONSTRAINT [Key11] PRIMARY KEY CLUSTERED 
(
	[Klient_Id] ASC,
	[Region_Id] ASC,
	[Towary_Id] ASC,
	[Czas_Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Sprzedaz_plan]  WITH CHECK ADD  CONSTRAINT [Relationship10] FOREIGN KEY([Czas_Id])
REFERENCES [dbo].[Czas] ([Id])
GO
ALTER TABLE [dbo].[Sprzedaz_plan]  WITH CHECK ADD  CONSTRAINT [Relationship7] FOREIGN KEY([Klient_Id])
REFERENCES [dbo].[Klienci] ([Id])
GO
ALTER TABLE [dbo].[Sprzedaz_plan]  WITH CHECK ADD  CONSTRAINT [Relationship8] FOREIGN KEY([Region_Id])
REFERENCES [dbo].[Regiony] ([Id])
GO
ALTER TABLE [dbo].[Sprzedaz_plan]  WITH CHECK ADD  CONSTRAINT [Relationship9] FOREIGN KEY([Towary_Id])
REFERENCES [dbo].[Towary] ([Id])
GO

-----------------------------------------

INSERT INTO Towary (towar, podgrupa, grupa) VALUES 
('chlodziarki', 'chlodnictwo', 'BI'),
('lodowki dwudrzwiowe', 'chlodnictwo', 'BI'),
('lodowki kombi', 'chlodnictwo', 'BI'),
('zamrazarki', 'chlodnictwo', 'BI'),
('mikrofalowki elektronicznie', 'mikrofalowki', 'BI'),
('mikrofalowki mechanicznie', 'mikrofalowki', 'BI'),
('okapy kominowe', 'okapy', 'BI'),
('okapy meblowe', 'okapy', 'BI'),
('okapy teleskopowe', 'okapy', 'BI'),
('okapy uniwersalne', 'okapy', 'BI'),
('kuchnie do zabudowy', 'sprzet grzejny', 'BI'),
('piekarniki', 'sprzet grzejny', 'BI'),
('plyty grzejne', 'sprzet grzejny', 'BI'),
('zmywarki 45', 'zmywarki', 'BI'),
('zmywarki 60', 'zmywarki', 'BI'),
('chlodziarki', 'chlodnictwo', 'FS'),
('lodowki dwudrzwiowe', 'chlodnictwo', 'FS'),
('lodowki kombi', 'chlodnictwo', 'FS'),
('zamrazarki', 'chlodnictwo', 'FS'),
('mikrofalowki elektronicznie', 'mikrofalowki', 'FS'),
('mikrofalowki mechanicznie', 'mikrofalowki', 'FS'),
('pralki front', 'pralki', 'FS'),
('pralki top', 'pralki', 'FS'),
('kuchnie', 'sprzet grzejny', 'FS'),
('zmywarki 45', 'zmywarki', 'FS'),
('zmywarki 60', 'zmywarki', 'FS');