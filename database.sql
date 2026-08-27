

IF DB_ID(N'BT02_CRUD_JPA') IS NULL
BEGIN
    CREATE DATABASE BT02_CRUD_JPA;
END;
GO

USE BT02_CRUD_JPA;
GO

IF OBJECT_ID(N'dbo.Category', N'U') IS NULL
BEGIN
CREATE TABLE dbo.Category
(
    cate_id INT IDENTITY(1,1) CONSTRAINT PK_Category PRIMARY KEY,
    cate_name NVARCHAR(255) NOT NULL,
    icons NVARCHAR(255) NULL,
    CONSTRAINT UQ_Category_Name UNIQUE (cate_name)
);
END;
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Category)
BEGIN
INSERT INTO dbo.Category(cate_name, icons)
VALUES
    (N'Quần Áo Nam', NULL),
    (N'Quần Áo Nữ', NULL),
    (N'Giày Dép', NULL);
END;
GO

SELECT cate_id, cate_name, icons
FROM dbo.Category
ORDER BY cate_id;
GO


UPDATE Category
SET icons = N'category/1787683944677.png'
WHERE cate_name = N'Quần Áo Nam';

UPDATE Category
SET icons = N'category/1787683956441.png'
WHERE cate_name = N'Quần Áo Nữ';

UPDATE Category
SET icons = N'category/1787683972354.png'
WHERE cate_name = N'Giày Dép';

SELECT * FROM Category;