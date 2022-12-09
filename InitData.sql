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
    )
