USE eCommerceWebsite
GO

INSERT INTO dbo.Category
(
    createdAt,
    image,
    isDeleted,
    name,
    slug,
    updatedAt
)
VALUES
(   SYSDATETIME(), -- createdAt - datetime2(7)
    NULL,            -- image - varchar(255)
    0,          -- isDeleted - bit
    N'Điện thoại',            -- name - varchar(255)
    '',            -- slug - varchar(255)
    SYSDATETIME()  -- updatedAt - datetime2(7)
    )
GO

-- Active products
INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/267212/Samsung-Galaxy-S21-FE-vang-600x600.jpg', N'1', NULL, N'Samsung Galaxy S21 FE 5G', N'12990000', NULL, N'5000', N'5', NULL, N'10', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-bac-thumb-600x600.jpg', N'1', NULL, N'Iphone 14 Pro Max', N'33590000', NULL, N'4000', N'5', NULL, N'100', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/285696/samsung-galaxy-z-flip4-5g-512gb-thumb-xanh-600x600.jpg', N'1', NULL, N'Samsung Galaxy Z Flip4', N'25000000', NULL, N'3000', N'5', NULL, N'50', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274360/samsung-galaxy-a13-xanh-thumb-1-600x600.jpg', N'1', NULL, N'Samsung Galaxy A13', N'4390000', NULL, N'2000', N'5', NULL, N'1000', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274359/samsung-galaxy-a23-den-thumb-600x600.jpg', N'1', NULL, N'Samsung Galaxy A23', N'5890000', NULL, N'1000', N'5', NULL, N'30', NULL, NULL, 1, NULL)
GO

--Inactive products
INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/267212/Samsung-Galaxy-S21-FE-vang-600x600.jpg', N'0', NULL, N'Samsung Galaxy S21 FE 5G', N'12990000', NULL, N'5000', N'5', NULL, N'10', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-bac-thumb-600x600.jpg', N'0', NULL, N'Iphone 14 Pro Max', N'33590000', NULL, N'4000', N'5', NULL, N'100', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/285696/samsung-galaxy-z-flip4-5g-512gb-thumb-xanh-600x600.jpg', N'0', NULL, N'Samsung Galaxy Z Flip4', N'25000000', NULL, N'3000', N'5', NULL, N'50', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274360/samsung-galaxy-a13-xanh-thumb-1-600x600.jpg', N'0', NULL, N'Samsung Galaxy A13', N'4390000', NULL, N'2000', N'5', NULL, N'1000', NULL, NULL, 1, NULL)
GO

INSERT INTO [dbo].[Product] ([createdAt], [description], [image], [isActive], [isSelling], [name], [price], [prmotionalPrice], [quantity], [rating], [slug], [sold], [updatedAt], [video], [category_categoryId], [store_storeId]) VALUES ( NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam vero.', N'https://cdn.tgdd.vn/Products/Images/42/274359/samsung-galaxy-a23-den-thumb-600x600.jpg', N'0', NULL, N'Samsung Galaxy A23', N'5890000', NULL, N'1000', N'5', NULL, N'30', NULL, NULL, 1, NULL)
GO

INSERT INTO dbo.Account
(
    address,
    avatar,
    createdAt,
    e_wallet,
    email,
    firstName,
    hashed_password,
    id_card,
    isActived,
    isEmailActive,
    isPhoneActive,
    lastName,
    password,
    phone,
    point,
    role,
    salt,
    slug,
    updatedAt,
    userLevelId
)
VALUES
(   N'HCM',           -- address - nvarchar(255)
    NULL,            -- avatar - varchar(255)
    SYSDATETIME(), -- createdAt - datetime2(7)
    0.0,           -- e_wallet - float
    'user@email.com',            -- email - varchar(255)
    N'Nguyễn',           -- firstName - nvarchar(255)
    '',            -- hashed_password - varchar(255)
    '',            -- id_card - varchar(255)
    1,          -- isActived - bit
    NULL,          -- isEmailActive - bit
    NULL,          -- isPhoneActive - bit
    N'Tú',           -- lastName - nvarchar(255)
    '123',            -- password - varchar(255)
    '0987654321',            -- phone - varchar(255)
    0,             -- point - int
    2,             -- role - int
    '',            -- salt - varchar(255)
    '',            -- slug - varchar(255)
    SYSDATETIME(), -- updatedAt - datetime2(7)
    NULL              -- userLevelId - int
    ),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'admin@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'Bảo', '123', '0987654321', 0, 0, '', '', SYSDATETIME(), NULL),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'nguyenvana@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'A', '123', '0987654321', 0, 2, '', '', SYSDATETIME(), NULL),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'nguyenvanb@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'B', '123', '0987654321', 0, 2, '', '', SYSDATETIME(), NULL),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'nguyenvanc@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'C', '123', '0987654321', 0, 2, '', '', SYSDATETIME(), NULL),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'nguyenvand@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'D', '123', '0987654321', 0, 2, '', '', SYSDATETIME(), NULL),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'nguyenvane@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'E', '123', '0987654321', 0, 2, '', '', SYSDATETIME(), NULL),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'nguyenvanf@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'F', '123', '0987654321', 0, 2, '', '', SYSDATETIME(), NULL),
	(N'HCM', NULL, SYSDATETIME(), 0.0, 'nguyenvang@email.com', N'Nguyễn', '', '', 1, NULL, NULL, N'G', '123', '0987654321', 0, 2, '', '', SYSDATETIME(), NULL)
GO

INSERT INTO dbo.UserOrder
(
    address,
    amountFromStore,
    amountFromUser,
    amountToGD,
    amountToStore,
    createdAt,
    isPaidBefore,
    phone,
    status,
    updatedAt,
    deliveryId,
    store_storeId,
    user_userId
)
VALUES
(   'HCM',            -- address - varchar(255)
    10,           -- amountFromStore - float
    100,           -- amountFromUser - float
    10,           -- amountToGD - float
    90,           -- amountToStore - float
    SYSDATETIME(), -- createdAt - datetime2(7)
    1,          -- isPaidBefore - bit
    '0987654321',            -- phone - varchar(255)
    0,             -- status - int
    SYSDATETIME(), -- updatedAt - datetime2(7)
    NULL,             -- deliveryId - int
    NULL,             -- store_storeId - bigint
    1              -- user_userId - int
    ),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 1, SYSDATETIME(), NULL, NULL, 2),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 2, SYSDATETIME(), NULL, NULL, 2),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 3, SYSDATETIME(), NULL, NULL, 3),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 4, SYSDATETIME(), NULL, NULL, 4),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 0, SYSDATETIME(), NULL, NULL, 5),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 1, SYSDATETIME(), NULL, NULL, 6),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 2, SYSDATETIME(), NULL, NULL, 7),
	('HCM', 20, 100, 20, 80, SYSDATETIME(), 1, '0987654321', 3, SYSDATETIME(), NULL, NULL, 8)