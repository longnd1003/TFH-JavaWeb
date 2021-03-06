USE [tfh]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 8/18/2020 5:08:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](30) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[AddedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/18/2020 5:08:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[Image] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodItems]    Script Date: 8/18/2020 5:08:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItems](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[Image] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/18/2020 5:08:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[DeliveryAddress] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 8/18/2020 5:08:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 8/18/2020 5:08:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[RestaurantID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[OpenTime] [varchar](30) NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RestaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserData]    Script Date: 8/18/2020 5:08:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](30) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[Phone] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [LoginName], [Password], [Email], [AddedDate]) VALUES (1, N'longnd', N'longnd', N'hello@gmail.com', CAST(N'1901-05-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [AddedDate], [Image]) VALUES (1, N'Burger', CAST(N'2020-04-01T21:42:37.133' AS DateTime), N'img/bg-img/bg-cat1.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [AddedDate], [Image]) VALUES (2, N'Combo', CAST(N'2020-04-01T21:42:37.133' AS DateTime), N'img/bg-img/bg-cat2.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [AddedDate], [Image]) VALUES (3, N'Gà', CAST(N'2020-04-01T21:42:37.133' AS DateTime), N'img/bg-img/bg-cat3.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [AddedDate], [Image]) VALUES (4, N'Tráng miệng', CAST(N'2020-04-01T21:42:37.133' AS DateTime), N'img/bg-img/bg-cat5.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [AddedDate], [Image]) VALUES (5, N'Đồ uống', CAST(N'2020-04-01T21:42:37.133' AS DateTime), N'img/bg-img/bg-cat6.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[FoodItems] ON 

INSERT [dbo].[FoodItems] ([FoodID], [FoodName], [Price], [CategoryID], [AddedDate], [Image]) VALUES (1, N'Big Star Combo', 140000, 2, CAST(N'2020-08-18T04:22:41.753' AS DateTime), N'img/item-img/big-star-combo.png')
INSERT [dbo].[FoodItems] ([FoodID], [FoodName], [Price], [CategoryID], [AddedDate], [Image]) VALUES (2, N'Bulgogi Combo', 120000, 2, CAST(N'2020-08-18T04:23:20.290' AS DateTime), N'img/item-img/bulgogi-combo.png')
INSERT [dbo].[FoodItems] ([FoodID], [FoodName], [Price], [CategoryID], [AddedDate], [Image]) VALUES (3, N'Burger Cá', 80000, 1, CAST(N'2020-08-18T04:45:26.090' AS DateTime), N'img/item-img/burger-ca-combo.png')
SET IDENTITY_INSERT [dbo].[FoodItems] OFF
GO
INSERT [dbo].[OrderList] ([OrderID], [CustomerID], [OrderDate]) VALUES (0, 1, CAST(N'2020-04-02T00:44:23.180' AS DateTime))
INSERT [dbo].[OrderList] ([OrderID], [CustomerID], [OrderDate]) VALUES (1, 1, CAST(N'2020-04-02T01:43:45.030' AS DateTime))
INSERT [dbo].[OrderList] ([OrderID], [CustomerID], [OrderDate]) VALUES (2, 1, CAST(N'2020-04-02T02:27:41.550' AS DateTime))
INSERT [dbo].[OrderList] ([OrderID], [CustomerID], [OrderDate]) VALUES (3, 1, CAST(N'2020-04-02T02:28:22.593' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([RestaurantID], [RestaurantName], [Address], [OpenTime], [Phone], [Status]) VALUES (2, N'Luong Lich', N'Quang Yen', N'9h', N'123456', 1)
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[UserData] ON 

INSERT [dbo].[UserData] ([UserID], [LoginName], [Password], [Email], [FirstName], [LastName], [JoinDate], [Phone]) VALUES (1, N'anhdeptrai', N'03092112', N'hello@gmail.com', N'ANH', N'DUONG', CAST(N'2020-04-01T21:10:10.257' AS DateTime), N'0886691396')
INSERT [dbo].[UserData] ([UserID], [LoginName], [Password], [Email], [FirstName], [LastName], [JoinDate], [Phone]) VALUES (2, N'bla', N'123456', N'anhdep@gmsil.vom', N'ANH', N'DUONG', CAST(N'2020-04-02T13:37:50.643' AS DateTime), N'0886691396')
INSERT [dbo].[UserData] ([UserID], [LoginName], [Password], [Email], [FirstName], [LastName], [JoinDate], [Phone]) VALUES (3, N'abcdef', N'123456', N'longnd@longnd.com', N'long', N'dep trai', CAST(N'2020-08-18T04:52:12.930' AS DateTime), N'0954123211')
INSERT [dbo].[UserData] ([UserID], [LoginName], [Password], [Email], [FirstName], [LastName], [JoinDate], [Phone]) VALUES (4, N'abcdef', N'123456', N'abc@abc.com', N'long xinh', N'gai', CAST(N'2020-08-18T04:54:47.787' AS DateTime), N'09432412321')
INSERT [dbo].[UserData] ([UserID], [LoginName], [Password], [Email], [FirstName], [LastName], [JoinDate], [Phone]) VALUES (5, N'longnd', N'longnd', N'dsadsa@dsadsa.com', N'dasdsa', N'dsadas', CAST(N'2020-08-18T05:03:30.030' AS DateTime), N'0321321312')
INSERT [dbo].[UserData] ([UserID], [LoginName], [Password], [Email], [FirstName], [LastName], [JoinDate], [Phone]) VALUES (6, N'longnd', N'longnd', N'dsad!@dsadsa.com', N'ldsada', N'dasdas', CAST(N'2020-08-18T05:05:00.610' AS DateTime), N'0321312312')
INSERT [dbo].[UserData] ([UserID], [LoginName], [Password], [Email], [FirstName], [LastName], [JoinDate], [Phone]) VALUES (7, N'mmmm', N'321321', N'abc@abc', N'eqweqw', N'eweqw', CAST(N'2020-08-18T05:08:02.870' AS DateTime), N'1232321321')
SET IDENTITY_INSERT [dbo].[UserData] OFF
GO
ALTER TABLE [dbo].[FoodItems]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([FoodID])
REFERENCES [dbo].[FoodItems] ([FoodID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderList] ([OrderID])
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[UserData] ([UserID])
GO
