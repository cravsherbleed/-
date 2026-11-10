SELECT
    T.ID,
    T.Название,
    T.[Срок годности],
    T.Цена,
    COUNT(S.ID) AS КоличествоВЗаказах
FROM [Товар] T
LEFT JOIN [СоставЗаказа] S
    ON T.ID = S.ID_Товар
GROUP BY
    T.ID,
    T.Название,
    T.[Срок годности],
    T.Цена
ORDER BY T.ID;
WITH Дубли AS
(
    SELECT
        ID,
        ROW_NUMBER() OVER (
            PARTITION BY
                Название,
                [Срок годности],
                Цена
            ORDER BY ID
        ) AS Номер
    FROM [Товар]
)
DELETE FROM Дубли
WHERE Номер > 1;
DELETE FROM [Товар]
WHERE [Название] = N'Цитрамон';

SET IDENTITY_INSERT [dbo].[Товар] ON;

INSERT INTO [dbo].[Товар]
    ([ID], [Название], [Срок годности], [Цена])
VALUES
    (4, N'Цитрамон', '2027-11-10', 90);

SET IDENTITY_INSERT [dbo].[Товар] OFF;