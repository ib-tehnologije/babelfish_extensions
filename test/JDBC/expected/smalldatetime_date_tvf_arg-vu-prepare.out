DROP FUNCTION IF EXISTS smalldatetime_date_tvf_consumer;
GO
DROP FUNCTION IF EXISTS smalldatetime_date_tvf_source;
GO
DROP FUNCTION IF EXISTS smalldatetime_date_tvf_date_arg;
GO

CREATE FUNCTION smalldatetime_date_tvf_date_arg(@d date)
RETURNS TABLE
AS
RETURN
(
    SELECT @d AS converted_date
);
GO

CREATE FUNCTION smalldatetime_date_tvf_source()
RETURNS TABLE
AS
RETURN
(
    SELECT CAST('2024-03-02T12:34:00' AS smalldatetime) AS dt
);
GO

CREATE FUNCTION smalldatetime_date_tvf_consumer()
RETURNS TABLE
AS
RETURN
(
    SELECT d.converted_date
    FROM dbo.smalldatetime_date_tvf_source() s
    CROSS APPLY dbo.smalldatetime_date_tvf_date_arg(s.dt) d
);
GO
