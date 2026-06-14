DROP FUNCTION IF EXISTS dbo.create_function_nbsp_itvf;
GO

DECLARE @sql nvarchar(max);
SET @sql = N'CREATE FUNCTION dbo.create_function_nbsp_itvf' + NCHAR(160) + N'(@dDate DATETIME)' + NCHAR(160) + NCHAR(160) + N'
RETURNS TABLE
RETURN
SELECT @dDate AS d';
EXEC(@sql);
GO

SELECT d FROM dbo.create_function_nbsp_itvf('20260614');
GO

DROP FUNCTION dbo.create_function_nbsp_itvf;
GO
