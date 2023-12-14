USE [Store_214364960]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 14/12/2023 09:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[CATEGORY_ID] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORY_NAME] [nchar](20) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CATEGORY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_ITEM]    Script Date: 14/12/2023 09:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_ITEM](
	[ORDER_ITEM_ID] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCT_ID] [int] NULL,
	[ORDER_ID] [int] NULL,
	[QUANTITY] [int] NULL,
 CONSTRAINT [PK_ORDER_ITEM] PRIMARY KEY CLUSTERED 
(
	[ORDER_ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 14/12/2023 09:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDER_ID] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_DATE] [date] NULL,
	[ORDER_SUM] [money] NULL,
	[USER_ID] [int] NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 14/12/2023 09:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[PRODUCT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORY_ID] [int] NULL,
	[CATEGORY_NAME] [nchar](20) NULL,
	[PRICE] [money] NULL,
	[DESCRIPTION] [nchar](100) NULL,
	[IMAGE] [nchar](20) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PRODUCT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RATING]    Script Date: 14/12/2023 09:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RATING](
	[RATING_ID] [int] IDENTITY(1,1) NOT NULL,
	[HOST] [nvarchar](50) NULL,
	[METHOD] [nchar](10) NULL,
	[PATH] [nvarchar](50) NULL,
	[REFERER] [nvarchar](100) NULL,
	[USER_AGENT] [nvarchar](max) NULL,
	[Record_Date] [datetime] NULL,
 CONSTRAINT [PK_RATING] PRIMARY KEY CLUSTERED 
(
	[RATING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 14/12/2023 09:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMAIL] [nchar](30) NULL,
	[FIRST_NAME] [nchar](15) NULL,
	[LAST_NAME] [nchar](15) NULL,
	[PASSWORD] [nchar](15) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIES] ON 

INSERT [dbo].[CATEGORIES] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (1, N'hats                ')
INSERT [dbo].[CATEGORIES] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (2, N'umbrellas           ')
INSERT [dbo].[CATEGORIES] ([CATEGORY_ID], [CATEGORY_NAME]) VALUES (3, N'coats               ')
SET IDENTITY_INSERT [dbo].[CATEGORIES] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDER_ITEM] ON 

INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (1, 11, 1, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (2, 6, 1, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (3, 8, 1, 2)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (4, 19, 1, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (5, 11, 2, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (6, 6, 2, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (7, 8, 2, 2)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (8, 19, 2, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (9, 11, 3, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (10, 6, 3, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (11, 8, 3, 2)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (12, 19, 3, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (13, 11, 4, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (14, 6, 4, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (15, 8, 4, 2)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (16, 19, 4, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (17, 11, 5, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (18, 6, 5, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (19, 8, 5, 2)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (20, 19, 5, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (21, 11, 6, 3)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (22, 6, 6, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (23, 6, 7, 2)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (24, 2, 7, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (25, 6, 8, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (26, 6, 9, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (27, 6, 10, 3)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (28, 2, 10, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (29, 11, 10, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (30, 11, 11, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (31, 6, 11, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (32, 2, 12, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (33, 6, 12, 2)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (34, 11, 13, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (35, 17, 13, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (36, 22, 13, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (37, 11, 15, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (38, 6, 16, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (39, 11, 17, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (40, 6, 17, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (41, 10, 17, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (42, 11, 18, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (43, 10, 18, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (44, 6, 18, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (45, 6, 19, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (46, 2, 19, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (47, 11, 20, 1)
INSERT [dbo].[ORDER_ITEM] ([ORDER_ITEM_ID], [PRODUCT_ID], [ORDER_ID], [QUANTITY]) VALUES (48, 11, 21, 1)
SET IDENTITY_INSERT [dbo].[ORDER_ITEM] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDERS] ON 

INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (1, CAST(N'2023-12-13' AS Date), 175.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (2, CAST(N'2023-12-13' AS Date), 175.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (3, CAST(N'2023-12-13' AS Date), 175.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (4, CAST(N'2023-12-13' AS Date), 175.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (5, CAST(N'2023-12-13' AS Date), 175.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (6, CAST(N'2023-12-13' AS Date), 105.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (7, CAST(N'2023-12-13' AS Date), 90.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (8, CAST(N'2023-12-13' AS Date), 30.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (9, CAST(N'2023-12-13' AS Date), 30.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (10, CAST(N'2023-12-13' AS Date), 145.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (11, CAST(N'2023-12-13' AS Date), 55.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (12, CAST(N'2023-12-13' AS Date), 90.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (13, CAST(N'2023-12-13' AS Date), 145.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (14, CAST(N'2023-12-13' AS Date), 0.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (15, CAST(N'2023-12-13' AS Date), 25.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (16, CAST(N'2023-12-13' AS Date), 30.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (17, CAST(N'2023-12-13' AS Date), 80.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (18, CAST(N'2023-12-13' AS Date), 80.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (19, CAST(N'2023-12-13' AS Date), 60.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (20, CAST(N'2023-12-13' AS Date), 25.0000, 13)
INSERT [dbo].[ORDERS] ([ORDER_ID], [ORDER_DATE], [ORDER_SUM], [USER_ID]) VALUES (21, CAST(N'2023-12-13' AS Date), 25.0000, 13)
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTS] ON 

INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (2, 1, N'baby_hat            ', 30.0000, N'small hat for babies                                                                                ', N'baby_hat.jpg        ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (3, 1, N'baby_hat (2)        ', 25.0000, N'small hat for babies- blue                                                                          ', N'baby_hat (2).jpg    ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (4, 1, N'black_fur_hot       ', 90.0000, N'a hat with black fur                                                                                ', N'black_fur_hot.jpg   ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (5, 1, N'wool_hat            ', 75.0000, N'green wool hat                                                                                      ', N'wool_hat.jpg        ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (6, 1, N'wool_hat (2)        ', 30.0000, N'simple wool hat                                                                                     ', N'wool_hat (2).jpg    ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (7, 1, N'blue_hat            ', 40.0000, N'blue hat for boys                                                                                   ', N'blue_hat.jpg        ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (8, 2, N'boys_umbrella       ', 30.0000, N'umbrella to boys                                                                                    ', N'boys_umbrella.jpg   ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (10, 1, N'butterfly_umbrella  ', 25.0000, N'butterfly umbrella for girls                                                                        ', N'butterfly_umbrel.jpg')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (11, 2, N'girls_umbrella      ', 25.0000, N'pink umbrella to girls                                                                              ', N'girls_umbrella.jpg  ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (12, 2, N'quality_umbrella    ', 100.0000, N'white quality umbrella                                                                              ', N'quality_umbrella.jpg')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (13, 2, N'red_umbrella        ', 30.0000, N'big red umbrella                                                                                    ', N'red_umbrella.jpg    ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (14, 2, N'simple_umbrella     ', 55.0000, N'simple and good umbrella                                                                            ', N'simple_umbrella.jpg ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (15, 3, N'boys_coat           ', 50.0000, N'blue coat for boys                                                                                  ', N'boys_coat.jpg       ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (16, 3, N'easy_coat           ', 105.0000, N'easy coat for girls                                                                                 ', N'easy_coat.jpg       ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (17, 3, N'easy_coat (2)       ', 30.0000, N'easy coat for boys                                                                                  ', N'easy_coat (2).jpg   ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (18, 3, N'easy_coat (3)       ', 40.0000, N'blue easy coat for boys                                                                             ', N'easy_coat (3).jpg   ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (19, 3, N'girls_coat          ', 60.0000, N'coat for girls                                                                                      ', N'girls_coat.jpg      ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (20, 3, N'long_coat           ', 70.0000, N'black long coat                                                                                     ', N'long_coat.jpg       ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (21, 3, N'pink_coat           ', 65.0000, N'pink coat for girls                                                                                 ', N'pink_coat.jpg       ')
INSERT [dbo].[PRODUCTS] ([PRODUCT_ID], [CATEGORY_ID], [CATEGORY_NAME], [PRICE], [DESCRIPTION], [IMAGE]) VALUES (22, 3, N'silver_coat         ', 90.0000, N'silver coat for girls                                                                               ', N'silver_coat.jpg     ')
SET IDENTITY_INSERT [dbo].[PRODUCTS] OFF
GO
SET IDENTITY_INSERT [dbo].[RATING] ON 

INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1001, N'localhost:44344', N'GET       ', N'/Images/simple_umbrella.jpg', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:48.783' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1002, N'localhost:44344', N'GET       ', N'/Images/silver_coat.jpg', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:48.763' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1003, N'localhost:44344', N'GET       ', N'/Images/boys_umbrella.jpg', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:48.793' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1004, N'localhost:44344', N'GET       ', N'/Images/easy_coat.jpg', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:48.840' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1005, N'localhost:44344', N'GET       ', N'/Images/quality_umbrella.jpg', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:48.840' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1006, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:51.390' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1007, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:51.400' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1008, N'localhost:44344', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:44344/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:51.477' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1009, N'localhost:44344', N'GET       ', N'/login.html', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:54.390' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1010, N'localhost:44344', N'GET       ', N'/login.js', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:54.407' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1011, N'localhost:44344', N'GET       ', N'/api/Users/', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:55.947' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1012, N'localhost:44344', N'GET       ', N'/Products.html', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:56.040' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1013, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:56.133' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1014, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:56.143' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1015, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:56.180' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1016, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:57.820' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1017, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:57.830' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1018, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:27:59.353' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1019, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:41.030' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1020, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:41.030' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1021, N'localhost:44344', N'GET       ', N'/api/Users/', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:43.313' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1022, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:43.503' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1023, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:43.550' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1024, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:43.560' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1025, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:49.727' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1026, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:49.743' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1027, N'localhost:44344', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:44344/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:49.820' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1028, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:34:58.710' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1029, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:35.157' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1030, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:35.073' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1031, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:34.630' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1032, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:34.630' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1033, N'localhost:44344', N'GET       ', N'/api/Users/', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:36.803' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1034, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:37.017' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1035, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:37.030' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1036, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:37.063' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1037, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:41.570' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1038, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:41.587' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1039, N'localhost:44344', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:44344/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:41.660' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1040, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T12:37:45.140' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1041, N'localhost:44344', N'GET       ', N'/login.js', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:26.170' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1042, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:26.917' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1043, N'localhost:44344', N'GET       ', N'/api/Users/', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:27.967' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1044, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:28.947' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1045, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:28.993' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1046, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:29.043' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1047, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:44.837' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1048, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:44.853' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1049, N'localhost:44344', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:44344/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:12:44.950' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1050, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:13:28.340' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1051, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:11.213' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1052, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:11.213' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1053, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:11.720' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1054, N'localhost:44344', N'GET       ', N'/api/Users/', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:12.553' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1055, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:12.743' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1056, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:12.793' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1057, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:12.803' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1058, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:16.777' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1059, N'localhost:44344', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:44344/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:16.853' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1060, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:16:33.277' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1061, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:17:31.783' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1062, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:17:31.797' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1063, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:17:31.840' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1064, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:17:36.280' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1065, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:17:36.297' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1066, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:17.933' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1067, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:17.933' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1068, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:19.280' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1069, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:19.297' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1070, N'localhost:44344', N'GET       ', N'/api/Users/', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:30.907' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1071, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:31.107' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1072, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:31.120' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1073, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:31.167' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1074, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:36.420' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1075, N'localhost:44344', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:44344/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:18:36.510' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1076, N'localhost:44344', N'GET       ', N'/favicon.ico', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:27.700' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1077, N'localhost:44344', N'GET       ', N'/api/Users/', N'https://localhost:44344/login.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:28.277' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1078, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:29.187' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1079, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:29.223' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1080, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:29.270' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1081, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:36.130' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1082, N'localhost:44344', N'GET       ', N'/Images/icn-remove.png', N'https://localhost:44344/ShoppingBag.css', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:36.210' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1083, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:19:56.677' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1084, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:21:01.837' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1085, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:21:01.853' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1086, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:21:01.897' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1087, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:21:05.500' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1088, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:21:13.770' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1089, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:21:32.873' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1090, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:21:32.887' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1091, N'localhost:44344', N'GET       ', N'/ShoppingBag.html', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:22:15.683' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1092, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:22:15.697' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1093, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:23:11.563' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1094, N'localhost:44344', N'GET       ', N'/api/Categories', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:23:11.577' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1095, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:23:11.587' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1096, N'localhost:44344', N'GET       ', N'/ShoppingBag.js', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:23:14.890' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1097, N'localhost:44344', N'POST      ', N'/api/Orders', N'https://localhost:44344/ShoppingBag.html', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:23:46.867' AS DateTime))
INSERT [dbo].[RATING] ([RATING_ID], [HOST], [METHOD], [PATH], [REFERER], [USER_AGENT], [Record_Date]) VALUES (1098, N'localhost:44344', N'GET       ', N'/api/Products', N'https://localhost:44344/Products.html?fromShoppingBag=1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.76', CAST(N'2023-12-13T13:24:21.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[RATING] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([USER_ID], [EMAIL], [FIRST_NAME], [LAST_NAME], [PASSWORD]) VALUES (6, N'm3197419@gmail.com            ', N'Miri           ', N'Hano           ', N'm3197419@gmail ')
INSERT [dbo].[USERS] ([USER_ID], [EMAIL], [FIRST_NAME], [LAST_NAME], [PASSWORD]) VALUES (7, NULL, N'miri           ', N'hano           ', N'nirihano13579  ')
INSERT [dbo].[USERS] ([USER_ID], [EMAIL], [FIRST_NAME], [LAST_NAME], [PASSWORD]) VALUES (13, N'mh@gmail.com                  ', N'MIRI           ', N'HANO           ', N'mirihano13579  ')
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[ORDER_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ITEM_ORDERS] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDERS] ([ORDER_ID])
GO
ALTER TABLE [dbo].[ORDER_ITEM] CHECK CONSTRAINT [FK_ORDER_ITEM_ORDERS]
GO
ALTER TABLE [dbo].[ORDER_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ITEM_PRODUCTS] FOREIGN KEY([PRODUCT_ID])
REFERENCES [dbo].[PRODUCTS] ([PRODUCT_ID])
GO
ALTER TABLE [dbo].[ORDER_ITEM] CHECK CONSTRAINT [FK_ORDER_ITEM_PRODUCTS]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_USERS] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[USERS] ([USER_ID])
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_USERS]
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CATEGORY_ID])
REFERENCES [dbo].[CATEGORIES] ([CATEGORY_ID])
GO
ALTER TABLE [dbo].[PRODUCTS] CHECK CONSTRAINT [FK_Products_Categories]
GO
