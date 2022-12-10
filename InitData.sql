USE [eCommerceWebsite]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([userId], [address], [avatar], [createdAt], [e_wallet], [email], [firstName], [hashed_password], [id_card], [isActived], [isEmailActive], [isPhoneActive], [lastName], [password], [phone], [point], [role], [salt], [slug], [updatedAt], [userLevelId]) VALUES (1, N'HCM', NULL, CAST(N'2022-12-09T10:08:17.0974024' AS DateTime2), 0, N'user@email.com', N'Nguyễn', N'', N'', 1, NULL, NULL, N'Tú', N'123', N'0987654321', 0, 2, N'', N'', CAST(N'2022-12-09T10:08:17.0974024' AS DateTime2), NULL)
GO
INSERT [dbo].[Account] ([userId], [address], [avatar], [createdAt], [e_wallet], [email], [firstName], [hashed_password], [id_card], [isActived], [isEmailActive], [isPhoneActive], [lastName], [password], [phone], [point], [role], [salt], [slug], [updatedAt], [userLevelId]) VALUES (2, N'HCM', NULL, CAST(N'2022-12-09T14:58:46.0000000' AS DateTime2), NULL, N'tuyetvi@gmail.com', N'Tuyết', NULL, NULL, 1, NULL, NULL, N'Vi', N'123', N'0372913432', 0, 2, NULL, NULL, CAST(N'2022-12-09T14:58:40.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Account] ([userId], [address], [avatar], [createdAt], [e_wallet], [email], [firstName], [hashed_password], [id_card], [isActived], [isEmailActive], [isPhoneActive], [lastName], [password], [phone], [point], [role], [salt], [slug], [updatedAt], [userLevelId]) VALUES (3, N'HCM', NULL, CAST(N'2022-12-10T07:11:19.0000000' AS DateTime2), NULL, N'samsung@gmail.com', N'Samsung', NULL, NULL, 1, NULL, NULL, N'Store', N'123', N'0998989898', 0, 1, NULL, NULL, CAST(N'2022-12-10T07:11:42.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Account] ([userId], [address], [avatar], [createdAt], [e_wallet], [email], [firstName], [hashed_password], [id_card], [isActived], [isEmailActive], [isPhoneActive], [lastName], [password], [phone], [point], [role], [salt], [slug], [updatedAt], [userLevelId]) VALUES (4, N'HCM', NULL, CAST(N'2022-12-10T07:11:28.0000000' AS DateTime2), NULL, N'apple@gmail.com', N'Apple', NULL, NULL, 1, NULL, NULL, N'Store', N'123', N'0989898989', 0, 1, NULL, NULL, CAST(N'2022-12-10T07:11:45.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Account] ([userId], [address], [avatar], [createdAt], [e_wallet], [email], [firstName], [hashed_password], [id_card], [isActived], [isEmailActive], [isPhoneActive], [lastName], [password], [phone], [point], [role], [salt], [slug], [updatedAt], [userLevelId]) VALUES (5, N'HCM', NULL, CAST(N'2022-12-10T07:11:35.0000000' AS DateTime2), NULL, N'xiaomi@gmail.com', N'Xiaomi', NULL, NULL, 1, NULL, NULL, N'Store', N'123', N'0978787878', 0, 1, NULL, NULL, CAST(N'2022-12-10T07:11:50.0000000' AS DateTime2), NULL)
GO
INSERT [dbo].[Account] ([userId], [address], [avatar], [createdAt], [e_wallet], [email], [firstName], [hashed_password], [id_card], [isActived], [isEmailActive], [isPhoneActive], [lastName], [password], [phone], [point], [role], [salt], [slug], [updatedAt], [userLevelId]) VALUES (6, N'HCM', NULL, CAST(N'2022-12-09T23:38:36.0643487' AS DateTime2), 0, N'admin@email.com', N'Nguyễn', N'', N'', 1, NULL, NULL, N'Bảo', N'123', N'0987654321', 0, 0, N'', N'', CAST(N'2022-12-09T23:38:36.0643487' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([categoryId], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (1, CAST(N'2022-12-09T10:08:16.9743247' AS DateTime2), NULL, 0, N'Điện thoại', N'', CAST(N'2022-12-09T10:08:16.9743247' AS DateTime2))
GO
INSERT [dbo].[Category] ([categoryId], [createdAt], [image], [isDeleted], [name], [slug], [updatedAt]) VALUES (2, NULL, NULL, 0, N'Đồng hồ thông minh', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 
GO
INSERT [dbo].[Store] ([storeId], [avatar], [bio], [cover], [createdAt], [e_wallet], [isActive], [isOpen], [name], [point], [rating], [slug], [updatedAt], [commissionId], [storeLevel_storeLevelId], [userId]) VALUES (1, 'https://www.elleman.vn/wp-content/uploads/2019/10/02/logo-thu%CC%9Bo%CC%9Bng-hie%CC%A3%CC%82u-samsung-hi%CC%80nh-elip.png', NULL, NULL, CAST(N'2022-12-10T07:16:55.0000000' AS DateTime2), 0, 1, 1, N'Samsung Store', 1000, 5, NULL, NULL, NULL, NULL, 3)
GO
INSERT [dbo].[Store] ([storeId], [avatar], [bio], [cover], [createdAt], [e_wallet], [isActive], [isOpen], [name], [point], [rating], [slug], [updatedAt], [commissionId], [storeLevel_storeLevelId], [userId]) VALUES (2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Apple-logo.png/640px-Apple-logo.png', NULL, NULL, CAST(N'2022-12-10T07:17:51.0000000' AS DateTime2), 0, 1, 1, N'Apple Store', 1000, 5, NULL, NULL, NULL, NULL, 4)
GO
INSERT [dbo].[Store] ([storeId], [avatar], [bio], [cover], [createdAt], [e_wallet], [isActive], [isOpen], [name], [point], [rating], [slug], [updatedAt], [commissionId], [storeLevel_storeLevelId], [userId]) VALUES (3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Xiaomi_logo_%282021-%29.svg/1200px-Xiaomi_logo_%282021-%29.svg.png', NULL, NULL, CAST(N'2022-12-10T07:18:16.0000000' AS DateTime2), 0, 1, 1, N'Xiaomi Store', 1000, 5, NULL, NULL, NULL, NULL, 5)
GO
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO

-- Active products
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (1, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/267212/Samsung-Galaxy-S21-FE-vang-600x600.jpg', 1, NULL, N'Samsung Galaxy S21 FE 5G', 12990000, NULL, 5000, 5, NULL, 10, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (2, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-bac-thumb-600x600.jpg', 1, NULL, N'Iphone 14 Pro Max', 33590000, NULL, 4000, 5, NULL, 100, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (3, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/285696/samsung-galaxy-z-flip4-5g-512gb-thumb-xanh-600x600.jpg', 1, NULL, N'Samsung Galaxy Z Flip4', 25000000, NULL, 3000, 5, NULL, 50, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (4, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274360/samsung-galaxy-a13-xanh-thumb-1-600x600.jpg', 1, NULL, N'Samsung Galaxy A13', 4390000, NULL, 2000, 5, NULL, 1000, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (5, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274359/samsung-galaxy-a23-den-thumb-600x600.jpg', 1, NULL, N'Samsung Galaxy A23', 5890000, NULL, 1000, 5, NULL, 30, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (6, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/262620/redmi-watch-2-lite-den-600x600.jpg', 1, NULL, N'Xiaomi Redmi Watch 2 Lite', 1190000, NULL, 5000, 5, NULL, 90, NULL, NULL, 2, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (7, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/284932/samsung-galaxy-watch-5-40-mm-tim-tn-600x600.jpg', 1, NULL, N'Samsung Galaxy Watch5 40mm', 5990000, NULL, 9000, 5, NULL, 800, NULL, NULL, 2, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (8, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/286034/samsung-galaxy-watch-5-44-mm-tnew-600x600.jpg', 1, NULL, N'Samsung Galaxy Watch5 44mm', 6490000, NULL, 1000, 5, NULL, 50, NULL, NULL, 2, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (9, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/289804/apple-watch-s8-41mm-trang-kem-thumb-600x600.jpeg', 1, NULL, N'Apple Watch S8 GPS 41mm', 11990000, NULL, 5000, 5, NULL, 1, NULL, NULL, 2, NULL)
GO

-- Inactive products
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (10, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/267212/Samsung-Galaxy-S21-FE-vang-600x600.jpg', 0, NULL, N'Samsung Galaxy S21 FE 5G', 12990000, NULL, 5000, 5, NULL, 10, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (11, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-bac-thumb-600x600.jpg', 0, NULL, N'Iphone 14 Pro Max', 33590000, NULL, 4000, 5, NULL, 100, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (12, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/285696/samsung-galaxy-z-flip4-5g-512gb-thumb-xanh-600x600.jpg', 0, NULL, N'Samsung Galaxy Z Flip4', 25000000, NULL, 3000, 5, NULL, 50, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (13, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274360/samsung-galaxy-a13-xanh-thumb-1-600x600.jpg', 0, NULL, N'Samsung Galaxy A13', 4390000, NULL, 2000, 5, NULL, 1000, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (14, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274359/samsung-galaxy-a23-den-thumb-600x600.jpg', 0, NULL, N'Samsung Galaxy A23', 5890000, NULL, 1000, 5, NULL, 30, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (15, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/262620/redmi-watch-2-lite-den-600x600.jpg', 0, NULL, N'Xiaomi Redmi Watch 2 Lite', 1190000, NULL, 5000, 5, NULL, 90, NULL, NULL, 2, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (16, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/284932/samsung-galaxy-watch-5-40-mm-tim-tn-600x600.jpg', 0, NULL, N'Samsung Galaxy Watch5 40mm', 5990000, NULL, 9000, 5, NULL, 800, NULL, NULL, 2, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (17, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/286034/samsung-galaxy-watch-5-44-mm-tnew-600x600.jpg', 0, NULL, N'Samsung Galaxy Watch5 44mm', 6490000, NULL, 1000, 5, NULL, 50, NULL, NULL, 2, NULL)
GO
INSERT [dbo].[Product] ([productId], [createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES (18, NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/7077/289804/apple-watch-s8-41mm-trang-kem-thumb-600x600.jpeg', 0, NULL, N'Apple Watch S8 GPS 41mm', 11990000, NULL, 5000, 5, NULL, 1, NULL, NULL, 2, NULL)
GO

SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([cartId], [createdAt], [isDeleted], [updatedAt], [store_storeId], [user_userId]) VALUES (1, NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Cart] ([cartId], [createdAt], [isDeleted], [updatedAt], [store_storeId], [user_userId]) VALUES (2, NULL, NULL, NULL, NULL, 2)
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItem] ON 
GO

INSERT [dbo].[CartItem] ([cartItemId], [count], [createdAt], [updatedAt], [cart_cartId], [product_productId]) VALUES (1, 20, NULL, NULL, 1, 1)
GO
INSERT [dbo].[CartItem] ([cartItemId], [count], [createdAt], [updatedAt], [cart_cartId], [product_productId]) VALUES (2, 4, NULL, NULL, 1, 3)
GO
INSERT [dbo].[CartItem] ([cartItemId], [count], [createdAt], [updatedAt], [cart_cartId], [product_productId]) VALUES (3, 7, NULL, NULL, 1, 2)
GO
INSERT [dbo].[CartItem] ([cartItemId], [count], [createdAt], [updatedAt], [cart_cartId], [product_productId]) VALUES (4, 1, NULL, NULL, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[CartItem] OFF
GO

SET IDENTITY_INSERT [dbo].[UserOrder] ON 
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (1, N'HCM', 10, 100, 10, 90, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 0, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 1)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (2, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 1, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 2)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (3, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 2, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 2)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (4, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 3, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 3)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (5, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 4, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 4)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (6, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 0, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 5)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (7, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 1, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 6)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (8, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 2, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 3)
GO
INSERT [dbo].[UserOrder] ([orderId], [address], [amountFromStore], [amountFromUser], [amountToGD], [amountToStore], [createdAt], [isPaidBefore], [phone], [status], [updatedAt], [deliveryId], [store_storeId], [user_userId]) VALUES (9, N'HCM', 20, 100, 20, 80, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), 1, N'0987654321', 3, CAST(N'2022-12-09T23:38:36.0803062' AS DateTime2), NULL, NULL, 5)
GO
SET IDENTITY_INSERT [dbo].[UserOrder] OFF
GO

SET IDENTITY_INSERT [dbo].[Exchange] ON 
GO
INSERT [dbo].[Exchange] ([transactionId], [amount], [createdAt], [isUp], [updatedAt], [store_storeId], [user_userId]) VALUES (1, 1000000, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 1, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 1, 1)
GO
INSERT [dbo].[Exchange] ([transactionId], [amount], [createdAt], [isUp], [updatedAt], [store_storeId], [user_userId]) VALUES (2, 2000000, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 0, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 2, 3)
GO
INSERT [dbo].[Exchange] ([transactionId], [amount], [createdAt], [isUp], [updatedAt], [store_storeId], [user_userId]) VALUES (3, 2200000, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 1, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 3, 4)
GO
INSERT [dbo].[Exchange] ([transactionId], [amount], [createdAt], [isUp], [updatedAt], [store_storeId], [user_userId]) VALUES (4, 2000000, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 0, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Exchange] ([transactionId], [amount], [createdAt], [isUp], [updatedAt], [store_storeId], [user_userId]) VALUES (5, 2000000, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 1, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 2, 4)
GO
INSERT [dbo].[Exchange] ([transactionId], [amount], [createdAt], [isUp], [updatedAt], [store_storeId], [user_userId]) VALUES (6, 2000000, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 1, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Exchange] ([transactionId], [amount], [createdAt], [isUp], [updatedAt], [store_storeId], [user_userId]) VALUES (7, 2000000, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 0, CAST(N'2022-12-11T01:50:20.7898532' AS DateTime2), 1, 3)
GO
SET IDENTITY_INSERT [dbo].[Exchange] OFF
GO