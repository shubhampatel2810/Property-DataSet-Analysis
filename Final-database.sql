USE [Property]
GO
/****** Object:  Table [dbo].[Auctions]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auctions](
	[AuctionID] [int] IDENTITY(1,1) NOT NULL,
	[AuctioneerName] [varchar](255) NOT NULL,
	[AuctionDate] [date] NOT NULL,
	[Location] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Auctions_AuctionID] PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Properties]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Properties](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyType] [varchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Postcode] [varchar](20) NOT NULL,
	[AuctionID] [int] NOT NULL,
	[ListedPrice] [decimal](18, 2) NOT NULL,
	[PurchasePrice] [decimal](18, 2) NOT NULL,
	[ResaleValue] [decimal](18, 2) NULL,
	[CompletionCertificateIssued] [bit] NOT NULL,
	[PurchaseDate] [date] NULL,
	[LastInspectionDate] [date] NULL,
 CONSTRAINT [PK_Properties_PropertyID] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyRepairs]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyRepairs](
	[PropertyRepairID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[RepairID] [int] NOT NULL,
	[ActualCost] [decimal](18, 2) NULL,
	[ActualTime] [int] NULL,
	[CompletionStatus] [bit] NOT NULL,
	[WorkerID] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_PropertyRepairs_PropertyRepairID] PRIMARY KEY CLUSTERED 
(
	[PropertyRepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyScouts]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyScouts](
	[PropertyScoutID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PropertyScouts_ScoutID] PRIMARY KEY CLUSTERED 
(
	[PropertyScoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyWorkers]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyWorkers](
	[PropertyWorkerID] [int] IDENTITY(1,1) NOT NULL,
	[WorkerID] [int] NOT NULL,
	[PropertyRepairID] [int] NOT NULL,
 CONSTRAINT [PK_PropertyWorkers_PropertyWorkerID] PRIMARY KEY CLUSTERED 
(
	[PropertyWorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repairs]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repairs](
	[RepairID] [int] IDENTITY(1,1) NOT NULL,
	[ShortDesc] [nvarchar](255) NOT NULL,
	[LongDesc] [nvarchar](max) NULL,
	[EstimatedCost] [decimal](18, 2) NULL,
	[EstimatedTime] [int] NULL,
 CONSTRAINT [PK_Repairs_RepairID] PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleContracts]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleContracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[BuyerName] [nvarchar](100) NOT NULL,
	[ContactDetails] [nvarchar](255) NULL,
	[DepositAmount] [decimal](18, 2) NULL,
	[CompletionDate] [date] NULL,
	[CompletionStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_SaleContracts_ContractID] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[WorkerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Skill] [nvarchar](100) NOT NULL,
	[ContactDetails] [nvarchar](255) NULL,
	[satisfactoryrepairs] [int] NULL,
	[IsWorking] [bit] NOT NULL,
 CONSTRAINT [PK_Workers_WorkerID] PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Auctions] ON 
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (1, N'John Smith', CAST(N'2024-03-22' AS Date), N'London')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (2, N'Emma Johnson', CAST(N'2024-03-13' AS Date), N'Manchester')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (3, N'James Brown', CAST(N'2024-03-07' AS Date), N'Birmingham')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (4, N'Sophie Taylor', CAST(N'2024-03-25' AS Date), N'Glasgow')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (5, N'Daniel Wilson', CAST(N'2024-03-26' AS Date), N'Edinburgh')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (6, N'Charlotte Clark', CAST(N'2024-03-19' AS Date), N'Liverpool')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (7, N'William White', CAST(N'2024-03-17' AS Date), N'Bristol')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (8, N'Olivia Jones', CAST(N'2024-03-04' AS Date), N'Leeds')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (9, N'Thomas Evans', CAST(N'2024-03-07' AS Date), N'Sheffield')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (10, N'Amelia Hughes', CAST(N'2024-03-25' AS Date), N'Newcastle')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (11, N'Jacob Roberts', CAST(N'2024-03-12' AS Date), N'Cardiff')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (12, N'Emily Davis', CAST(N'2024-03-13' AS Date), N'Nottingham')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (13, N'Joshua Patel', CAST(N'2024-03-27' AS Date), N'Oxford')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (14, N'Mia Brown', CAST(N'2024-03-30' AS Date), N'Cambridge')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (15, N'Ava Wilson', CAST(N'2024-03-30' AS Date), N'Reading')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (16, N'Lucas Taylor', CAST(N'2024-03-23' AS Date), N'Brighton')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (17, N'Ella Wright', CAST(N'2024-03-27' AS Date), N'Belfast')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (18, N'Noah Thomas', CAST(N'2024-03-22' AS Date), N'Dublin')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (19, N'Lily Harris', CAST(N'2024-03-23' AS Date), N'Manchester')
GO
INSERT [dbo].[Auctions] ([AuctionID], [AuctioneerName], [AuctionDate], [Location]) VALUES (20, N'Jack Campbell', CAST(N'2024-03-08' AS Date), N'London')
GO
SET IDENTITY_INSERT [dbo].[Auctions] OFF
GO
SET IDENTITY_INSERT [dbo].[Properties] ON 
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (1, N'House', N'123 Main Street', N'SW1A 1AA', 1, CAST(500000.00 AS Decimal(18, 2)), CAST(45000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2021-01-02' AS Date), CAST(N'2021-01-02' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (2, N'Flat', N'456 High Road', N'SE1 2BB', 2, CAST(300000.00 AS Decimal(18, 2)), CAST(280000.00 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), 0, CAST(N'2021-10-03' AS Date), CAST(N'2024-01-03' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (3, N'Bungalow', N'789 Elm Avenue', N'NW1 3CC', 3, CAST(400000.00 AS Decimal(18, 2)), CAST(380000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2022-01-07' AS Date), CAST(N'2024-01-07' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (4, N'Maisonette', N'10 Oak Street', N'E1 4DD', 4, CAST(350000.00 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), CAST(360000.00 AS Decimal(18, 2)), 0, CAST(N'2022-09-09' AS Date), CAST(N'2024-01-09' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (5, N'House', N'24 Maple Avenue', N'SW5 5EE', 5, CAST(550000.00 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2022-10-08' AS Date), CAST(N'2024-01-08' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (6, N'Flat', N'7 Elm Court', N'N1 6FF', 6, CAST(280000.00 AS Decimal(18, 2)), CAST(250000.00 AS Decimal(18, 2)), CAST(290000.00 AS Decimal(18, 2)), 0, CAST(N'2022-10-20' AS Date), CAST(N'2024-01-20' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (7, N'Bungalow', N'15 Pine Road', N'W2 7GG', 5, CAST(420000.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2022-11-22' AS Date), CAST(N'2024-01-22' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (8, N'House', N'18 Cedar Lane', N'SW7 9HH', 8, CAST(600000.00 AS Decimal(18, 2)), CAST(550000.00 AS Decimal(18, 2)), CAST(620000.00 AS Decimal(18, 2)), 0, CAST(N'2022-12-31' AS Date), CAST(N'2024-01-31' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (9, N'Flat', N'3 Birch Close', N'E2 3LL', 9, CAST(320000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2022-01-31' AS Date), CAST(N'2024-01-31' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (10, N'Maisonette', N'9 Oak Lane', N'SE3 8TT', 10, CAST(380000.00 AS Decimal(18, 2)), CAST(350000.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), 0, CAST(N'2023-01-02' AS Date), CAST(N'2024-02-02' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (11, N'House', N'27 Maple Drive', N'NW3 4PP', 11, CAST(480000.00 AS Decimal(18, 2)), CAST(450000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2023-02-10' AS Date), CAST(N'2024-02-10' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (12, N'Flat', N'5 Elm Street', N'SW6 6RR', 7, CAST(270000.00 AS Decimal(18, 2)), CAST(240000.00 AS Decimal(18, 2)), CAST(280000.00 AS Decimal(18, 2)), 0, CAST(N'2023-05-10' AS Date), CAST(N'2024-02-10' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (13, N'Bungalow', N'12 Pine Lane', N'W1 2SS', 13, CAST(410000.00 AS Decimal(18, 2)), CAST(380000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2023-06-10' AS Date), CAST(N'2024-03-10' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (14, N'Maisonette', N'8 Oak Avenue', N'E3 5UU', 14, CAST(360000.00 AS Decimal(18, 2)), CAST(330000.00 AS Decimal(18, 2)), CAST(370000.00 AS Decimal(18, 2)), 0, CAST(N'2023-11-15' AS Date), CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (15, N'House', N'31 Cedar Close', N'SE5 7NN', 15, CAST(570000.00 AS Decimal(18, 2)), CAST(520000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2023-12-20' AS Date), CAST(N'2024-03-20' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (16, N'Flat', N'2 Birch Road', N'W4 8YY', 16, CAST(310000.00 AS Decimal(18, 2)), CAST(280000.00 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), 0, CAST(N'2023-12-25' AS Date), CAST(N'2024-03-25' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (17, N'Bungalow', N'19 Pine Avenue', N'SW8 3QQ', 20, CAST(430000.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2023-12-25' AS Date), CAST(N'2024-03-25' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (18, N'Maisonette', N'6 Oak Street', N'N2 9RR', 18, CAST(370000.00 AS Decimal(18, 2)), CAST(340000.00 AS Decimal(18, 2)), CAST(380000.00 AS Decimal(18, 2)), 0, CAST(N'2023-01-27' AS Date), CAST(N'2024-03-27' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (19, N'House', N'22 Maple Road', N'E4 6AA', 19, CAST(510000.00 AS Decimal(18, 2)), CAST(470000.00 AS Decimal(18, 2)), NULL, 0, CAST(N'2024-02-28' AS Date), CAST(N'2024-03-28' AS Date))
GO
INSERT [dbo].[Properties] ([PropertyID], [PropertyType], [Address], [Postcode], [AuctionID], [ListedPrice], [PurchasePrice], [ResaleValue], [CompletionCertificateIssued], [PurchaseDate], [LastInspectionDate]) VALUES (20, N'Flat', N'4 Elm Lane', N'SW9 1BB', 20, CAST(290000.00 AS Decimal(18, 2)), CAST(260000.00 AS Decimal(18, 2)), CAST(300000.00 AS Decimal(18, 2)), 0, CAST(N'2024-03-28' AS Date), CAST(N'2024-03-28' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Properties] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyRepairs] ON 
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (2, 1, 1, CAST(9748.95 AS Decimal(18, 2)), 2, 1, 9, CAST(N'2024-01-02' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (3, 2, 3, CAST(3309.11 AS Decimal(18, 2)), 6, 1, 10, CAST(N'2024-01-02' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (4, 3, 5, CAST(1885.19 AS Decimal(18, 2)), 4, 0, 11, CAST(N'2024-01-03' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (5, 4, 7, CAST(5520.83 AS Decimal(18, 2)), 3, 1, 15, CAST(N'2024-01-07' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (6, 5, 9, CAST(9600.48 AS Decimal(18, 2)), 5, 1, 28, CAST(N'2024-01-09' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (7, 6, 2, CAST(4450.64 AS Decimal(18, 2)), 4, 0, 16, CAST(N'2024-01-08' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (8, 7, 4, CAST(3381.95 AS Decimal(18, 2)), 3, 1, 12, CAST(N'2024-01-20' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (9, 8, 6, CAST(9766.86 AS Decimal(18, 2)), 2, 1, 16, CAST(N'2024-01-22' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (10, 9, 8, CAST(4154.59 AS Decimal(18, 2)), 4, 0, 18, CAST(N'2024-01-31' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (11, 10, 10, CAST(7476.19 AS Decimal(18, 2)), 5, 1, 22, CAST(N'2024-01-31' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (12, 11, 1, CAST(3144.75 AS Decimal(18, 2)), 2, 1, 25, CAST(N'2024-02-02' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (13, 12, 3, CAST(4342.10 AS Decimal(18, 2)), 7, 1, 25, CAST(N'2024-02-10' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (14, 13, 5, CAST(1273.36 AS Decimal(18, 2)), 5, 0, 10, CAST(N'2024-02-10' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (15, 14, 7, CAST(1852.84 AS Decimal(18, 2)), 3, 1, 8, CAST(N'2024-03-10' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (16, 15, 9, CAST(9148.70 AS Decimal(18, 2)), 6, 1, 17, CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (17, 16, 2, CAST(244.12 AS Decimal(18, 2)), 4, 0, 20, CAST(N'2024-03-20' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (18, 17, 4, CAST(5903.20 AS Decimal(18, 2)), 3, 1, 21, CAST(N'2024-03-25' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (19, 18, 6, CAST(2285.35 AS Decimal(18, 2)), 2, 1, 21, CAST(N'2024-03-25' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (20, 19, 8, CAST(3304.29 AS Decimal(18, 2)), 4, 0, 21, CAST(N'2024-03-27' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (21, 20, 10, CAST(4137.48 AS Decimal(18, 2)), 5, 1, 21, CAST(N'2024-03-28' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (43, 11, 1, CAST(5004.61 AS Decimal(18, 2)), 3, 1, 9, CAST(N'2024-03-01' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (44, 12, 2, CAST(7627.60 AS Decimal(18, 2)), 4, 1, 10, CAST(N'2024-03-02' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (45, 3, 1, CAST(5325.69 AS Decimal(18, 2)), 2, 1, 13, CAST(N'2024-03-03' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (46, 4, 3, CAST(1584.03 AS Decimal(18, 2)), 5, 1, 14, CAST(N'2024-03-04' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (47, 5, 2, CAST(7289.76 AS Decimal(18, 2)), 3, 1, 15, CAST(N'2024-03-05' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (48, 6, 1, CAST(5828.33 AS Decimal(18, 2)), 2, 1, 16, CAST(N'2024-03-06' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (49, 7, 3, CAST(1226.18 AS Decimal(18, 2)), 4, 1, 17, CAST(N'2024-03-07' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (50, 8, 1, CAST(9770.07 AS Decimal(18, 2)), 3, 1, 18, CAST(N'2024-03-08' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (51, 9, 2, CAST(6609.74 AS Decimal(18, 2)), 2, 1, 19, CAST(N'2024-03-09' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (52, 3, 3, CAST(5443.42 AS Decimal(18, 2)), 5, 1, 10, CAST(N'2024-03-10' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (53, 11, 1, CAST(5747.93 AS Decimal(18, 2)), 3, 1, 11, CAST(N'2024-03-11' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (54, 12, 2, CAST(5447.12 AS Decimal(18, 2)), 4, 1, 21, CAST(N'2024-03-12' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (55, 5, 3, CAST(9033.09 AS Decimal(18, 2)), 2, 1, 22, CAST(N'2024-03-13' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (56, 4, 1, CAST(8008.93 AS Decimal(18, 2)), 3, 1, 23, CAST(N'2024-03-14' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (57, 15, 2, CAST(9409.74 AS Decimal(18, 2)), 2, 1, 25, CAST(N'2024-03-15' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (58, 4, 3, CAST(2914.23 AS Decimal(18, 2)), 4, 1, 9, CAST(N'2024-03-16' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (59, 2, 1, CAST(3174.60 AS Decimal(18, 2)), 3, 1, 11, CAST(N'2024-03-17' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (60, 5, 2, CAST(9206.99 AS Decimal(18, 2)), 4, 1, 10, CAST(N'2024-03-18' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (61, 8, 3, CAST(625.78 AS Decimal(18, 2)), 2, 1, 22, CAST(N'2024-03-19' AS Date))
GO
INSERT [dbo].[PropertyRepairs] ([PropertyRepairID], [PropertyID], [RepairID], [ActualCost], [ActualTime], [CompletionStatus], [WorkerID], [Date]) VALUES (62, 8, 1, CAST(6489.58 AS Decimal(18, 2)), 3, 1, 22, CAST(N'2024-03-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[PropertyRepairs] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyScouts] ON 
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (1, N'John Smith', N'Property Scout specializing in house auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (2, N'Emma Johnson', N'Property Scout specializing in flat auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (3, N'James Brown', N'Property Scout specializing in bungalow auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (4, N'Sophie Taylor', N'Property Scout specializing in maisonette auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (5, N'Daniel Wilson', N'Property Scout specializing in house auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (6, N'Charlotte Clark', N'Property Scout specializing in flat auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (7, N'William White', N'Property Scout specializing in bungalow auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (8, N'Olivia Jones', N'Property Scout specializing in maisonette auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (9, N'Thomas Evans', N'Property Scout specializing in house auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (10, N'Amelia Hughes', N'Property Scout specializing in flat auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (11, N'Jacob Roberts', N'Property Scout specializing in bungalow auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (12, N'Emily Davis', N'Property Scout specializing in maisonette auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (13, N'Joshua Patel', N'Property Scout specializing in house auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (14, N'Mia Brown', N'Property Scout specializing in flat auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (15, N'Ava Wilson', N'Property Scout specializing in bungalow auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (16, N'Lucas Taylor', N'Property Scout specializing in maisonette auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (17, N'Ella Wright', N'Property Scout specializing in house auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (18, N'Noah Thomas', N'Property Scout specializing in flat auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (19, N'Lily Harris', N'Property Scout specializing in bungalow auctions')
GO
INSERT [dbo].[PropertyScouts] ([PropertyScoutID], [Name], [Role]) VALUES (20, N'Jack Campbell', N'Property Scout specializing in maisonette auctions')
GO
SET IDENTITY_INSERT [dbo].[PropertyScouts] OFF
GO
SET IDENTITY_INSERT [dbo].[PropertyWorkers] ON 
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (2, 11, 11)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (3, 12, 12)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (4, 13, 13)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (5, 14, 14)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (6, 15, 15)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (7, 16, 16)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (8, 17, 17)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (9, 18, 18)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (10, 19, 19)
GO
INSERT [dbo].[PropertyWorkers] ([PropertyWorkerID], [WorkerID], [PropertyRepairID]) VALUES (11, 20, 20)
GO
SET IDENTITY_INSERT [dbo].[PropertyWorkers] OFF
GO
SET IDENTITY_INSERT [dbo].[Repairs] ON 
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (1, N'PAINT', N'Painting', CAST(500.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (2, N'PLUMB', N'Plumbing repair', CAST(1000.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (3, N'ROOF', N'Roof repair', CAST(2000.00 AS Decimal(18, 2)), 7)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (4, N'ELEC', N'Electrical repair', CAST(800.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (5, N'FLOOR', N'Flooring replacement', CAST(1200.00 AS Decimal(18, 2)), 6)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (6, N'PLAST', N'Plastering', CAST(600.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (7, N'CARP', N'Carpentry work', CAST(900.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (8, N'WALL', N'Wall repair', CAST(700.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (9, N'TILE', N'Tiling', CAST(1000.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (10, N'DOOR', N'Door replacement', CAST(800.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (11, N'PAINT', N'Painting', CAST(500.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (12, N'PLUMB', N'Plumbing repair', CAST(1000.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (13, N'ROOF', N'Roof repair', CAST(2000.00 AS Decimal(18, 2)), 7)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (14, N'ELEC', N'Electrical repair', CAST(800.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (15, N'FLOOR', N'Flooring replacement', CAST(1200.00 AS Decimal(18, 2)), 6)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (16, N'PLAST', N'Plastering', CAST(600.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (17, N'CARP', N'Carpentry work', CAST(900.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (18, N'WALL', N'Wall repair', CAST(700.00 AS Decimal(18, 2)), 4)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (19, N'TILE', N'Tiling', CAST(1000.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[Repairs] ([RepairID], [ShortDesc], [LongDesc], [EstimatedCost], [EstimatedTime]) VALUES (20, N'DOOR', N'Door replacement', CAST(800.00 AS Decimal(18, 2)), 4)
GO
SET IDENTITY_INSERT [dbo].[Repairs] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleContracts] ON 
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (1, 1, N'John Doe', N'john@example.com', CAST(50000.00 AS Decimal(18, 2)), CAST(N'2024-01-10' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (2, 2, N'Emma Smith', N'emma@example.com', CAST(60000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (3, 3, N'James Johnson', N'james@example.com', CAST(55000.00 AS Decimal(18, 2)), CAST(N'2024-04-20' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (4, 4, N'Sophie Brown', N'sophie@example.com', CAST(52000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (5, 5, N'Daniel Taylor', N'daniel@example.com', CAST(62000.00 AS Decimal(18, 2)), CAST(N'2024-02-11' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (6, 6, N'Charlotte Wilson', N'charlotte@example.com', CAST(53000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (7, 7, N'William Evans', N'william@example.com', CAST(54000.00 AS Decimal(18, 2)), CAST(N'2024-01-31' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (8, 8, N'Olivia Hughes', N'olivia@example.com', CAST(58000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (9, 9, N'Thomas Roberts', N'thomas@example.com', CAST(57000.00 AS Decimal(18, 2)), CAST(N'2024-03-21' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (10, 10, N'Amelia Davis', N'amelia@example.com', CAST(55000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (11, 11, N'Jacob Patel', N'jacob@example.com', CAST(53000.00 AS Decimal(18, 2)), CAST(N'2024-03-18' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (12, 12, N'Emily Brown', N'emily@example.com', CAST(54000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (13, 13, N'Joshua Wilson', N'joshua@example.com', CAST(56000.00 AS Decimal(18, 2)), CAST(N'2024-03-20' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (14, 14, N'Mia Taylor', N'mia@example.com', CAST(59000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (15, 15, N'Ava Harris', N'ava@example.com', CAST(57000.00 AS Decimal(18, 2)), CAST(N'2024-03-21' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (16, 16, N'Lucas Campbell', N'lucas@example.com', CAST(54000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (17, 17, N'Ella Patel', N'ella@example.com', CAST(56000.00 AS Decimal(18, 2)), CAST(N'2024-01-20' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (18, 18, N'Noah Wilson', N'noah@example.com', CAST(61000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (19, 19, N'Lily Taylor', N'lily@example.com', CAST(62000.00 AS Decimal(18, 2)), CAST(N'2024-01-20' AS Date), N'Completed')
GO
INSERT [dbo].[SaleContracts] ([ContractID], [PropertyID], [BuyerName], [ContactDetails], [DepositAmount], [CompletionDate], [CompletionStatus]) VALUES (20, 20, N'Jack Brown', N'jack@example.com', CAST(57000.00 AS Decimal(18, 2)), NULL, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[SaleContracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (1, N'Emily', N'Davis', N'Plumbing', N'emily@example.com', 7, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (2, N'Joshua', N'Patel', N'Painting', NULL, 5, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (3, N'Mia', N'Brown', N'Electrical', N'mia@example.com', 10, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (4, N'Ava', N'Wilson', N'Tiling', NULL, 5, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (5, N'Lucas', N'Taylor', N'Roofing', N'lucas@example.com', 3, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (6, N'Ella', N'Wright', N'Carpentry', NULL, 1, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (7, N'Noah', N'Thomas', N'Plumbing', N'noah@example.com', 8, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (8, N'Lily', N'Harris', N'Electrical', NULL, 6, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (9, N'John', N'Smith', N'Carpentry', N'john@example.com', 5, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (10, N'Emma', N'Johnson', N'Plumbing', NULL, 3, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (11, N'James', N'Brown', N'Electrical', N'james@example.com', 2, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (12, N'Sophie', N'Taylor', N'Painting', NULL, 10, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (13, N'Daniel', N'Wilson', N'Roofing', N'daniel@example.com', 6, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (14, N'Charlotte', NULL, N'Tiling', N'charlotte@example.com', 6, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (15, N'William', N'White', N'Carpentry', NULL, 5, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (16, N'Olivia', N'Jones', N'Plumbing', N'olivia@example.com', 7, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (17, N'Thomas', N'Evans', N'Plumbing', N'thomas@example.com', 10, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (18, N'Amelia', N'Hughes', N'Electrical', NULL, 7, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (19, N'Jacob', N'Roberts', N'Carpentry', NULL, 5, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (20, N'Emily', N'Davis', N'Plumbing', N'emily@example.com', 7, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (21, N'Joshua', N'Patel', N'Painting', NULL, 5, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (22, N'Mia', N'Brown', N'Electrical', N'mia@example.com', 10, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (23, N'Ava', N'Wilson', N'Tiling', NULL, 5, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (24, N'Lucas', N'Taylor', N'Roofing', N'lucas@example.com', 2, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (25, N'Ella', N'Wright', N'Carpentry', NULL, 10, 1)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (26, N'Noah', N'Thomas', N'Plumbing', N'noah@example.com', 8, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (27, N'Lily', N'Harris', N'Electrical', NULL, 9, 0)
GO
INSERT [dbo].[Workers] ([WorkerID], [FirstName], [LastName], [Skill], [ContactDetails], [satisfactoryrepairs], [IsWorking]) VALUES (28, N'Jack', N'Campbell', N'Painting', N'jack@example.com', 10, 1)
GO
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
ALTER TABLE [dbo].[Properties] ADD  CONSTRAINT [DF_Properties_CompletionCertificateIssued]  DEFAULT ((0)) FOR [CompletionCertificateIssued]
GO
ALTER TABLE [dbo].[PropertyRepairs] ADD  CONSTRAINT [DF_PropertyRepairs_CompletionStatus]  DEFAULT ((0)) FOR [CompletionStatus]
GO
ALTER TABLE [dbo].[Workers] ADD  DEFAULT ((0)) FOR [satisfactoryrepairs]
GO
ALTER TABLE [dbo].[Workers] ADD  DEFAULT ((0)) FOR [IsWorking]
GO
ALTER TABLE [dbo].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_AuctionID] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Properties] CHECK CONSTRAINT [FK_Properties_AuctionID]
GO
ALTER TABLE [dbo].[PropertyRepairs]  WITH CHECK ADD  CONSTRAINT [FK_PropertyRepairs_PropertyID] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[PropertyRepairs] CHECK CONSTRAINT [FK_PropertyRepairs_PropertyID]
GO
ALTER TABLE [dbo].[PropertyRepairs]  WITH CHECK ADD  CONSTRAINT [FK_PropertyRepairs_RepairID] FOREIGN KEY([RepairID])
REFERENCES [dbo].[Repairs] ([RepairID])
GO
ALTER TABLE [dbo].[PropertyRepairs] CHECK CONSTRAINT [FK_PropertyRepairs_RepairID]
GO
ALTER TABLE [dbo].[PropertyWorkers]  WITH CHECK ADD  CONSTRAINT [FK_PropertyWorkers_PropertyRepairID] FOREIGN KEY([PropertyRepairID])
REFERENCES [dbo].[PropertyRepairs] ([PropertyRepairID])
GO
ALTER TABLE [dbo].[PropertyWorkers] CHECK CONSTRAINT [FK_PropertyWorkers_PropertyRepairID]
GO
ALTER TABLE [dbo].[PropertyWorkers]  WITH CHECK ADD  CONSTRAINT [FK_PropertyWorkers_WorkerID] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[Workers] ([WorkerID])
GO
ALTER TABLE [dbo].[PropertyWorkers] CHECK CONSTRAINT [FK_PropertyWorkers_WorkerID]
GO
ALTER TABLE [dbo].[SaleContracts]  WITH CHECK ADD  CONSTRAINT [FK_SaleContracts_PropertyID] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Properties] ([PropertyID])
GO
ALTER TABLE [dbo].[SaleContracts] CHECK CONSTRAINT [FK_SaleContracts_PropertyID]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_PropertyRepairs_WorkerID] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[Workers] ([WorkerID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_PropertyRepairs_WorkerID]
GO
/****** Object:  StoredProcedure [dbo].[GetCompletedSalesLastMonth]    Script Date: 4/20/2024 12:11:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCompletedSalesLastMonth]

AS
	BEGIN
	DECLARE @StartDate DATE = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0);
	DECLARE @EndDate DATE = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0);

		SELECT P.PropertyID,P.PropertyType, p.[Address],p.Postcode,sc.BuyerName,
				sc.ContactDetails,sc.ContactDetails,Sc.DepositAmount,sc.CompletionDate
		FROM  Properties p  inner join SaleContracts sc 
		ON p.PropertyID = sc.PropertyID 
		WHERE CompletionStatus = 'Completed' and 
			CompletionDate >= @StartDate and
			CompletionDate <= @EndDate

END
GO
/****** Object:  StoredProcedure [dbo].[MonthlyReinspectionReport]    Script Date: 4/20/2024 12:11:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MonthlyReinspectionReport]
AS
BEGIN
    DECLARE @StartDate DATE = DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0);
	
	select distinct p.PropertyID,p.PropertyType,p.Address,p.PurchasePrice,p.lastinspectiondate,
		p.ResaleValue,ps.ActualCost,x.ActualCost as TotalRepairCost,x.RepairTimes
	from (
		select 	sum(ActualCost) as ActualCost,COUNT(ActualCost) as RepairTimes,p.PropertyID  as PropertyID
		from Properties p  
		inner join PropertyRepairs ps on p.PropertyID = ps.PropertyID 
		where [LastInspectionDate] < @StartDate group by p.PropertyID
	)as x 
	inner join PropertyRepairs ps on ps.PropertyID = x.PropertyID
	inner join  Properties p on  p.PropertyID = x.PropertyID order by PropertyID
END
GO
