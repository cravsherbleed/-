USE [аптека];
GO

DELETE FROM [dbo].[Товар];
GO

DBCC CHECKIDENT ('dbo.Товар', RESEED, 0);
GO

INSERT INTO [dbo].[Товар]
    ([Название], [Срок годности], [Цена])
VALUES
    ('Ибупрофен', '2035-10-20', 200);
GO

SELECT * FROM [dbo].[Товар];