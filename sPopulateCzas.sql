CREATE OR ALTER PROCEDURE [dbo].[sPopulateCzas]
@FromDate DATE = '2004-01-01',
@ToDate DATE = '2020-12-31'
AS
BEGIN

WHILE @FromDate <= @ToDate
	BEGIN
		INSERT INTO Czas(
			[Id],
			[Miesiac],
			[Kwartal],
			[Rok]
            )
            SELECT
				FORMAT(@FromDate, 'MMyyyy') as [Id],
				MONTH(@FromDate) AS [Miesiac],
				DATENAME(QUARTER,@FromDate) AS [Kwartal],
                YEAR(@FromDate) AS [Rok]
                
      SET @FromDate = DATEADD(MONTH, 1, @FromDate)
	END
END
GO

EXEC sPopulateCzas