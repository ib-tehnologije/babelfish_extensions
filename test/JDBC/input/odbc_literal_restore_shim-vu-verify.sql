CREATE FUNCTION dbo.odbc_literal_restore_seconds(@d datetime)
RETURNS integer
AS
BEGIN
    DECLARE @seconds integer;
    SELECT @seconds = DATEDIFF(second, {d '1970-01-01'}, @d);
    RETURN @seconds;
END;
GO

SELECT dbo.odbc_literal_restore_seconds('1970-01-02');
GO

DROP FUNCTION dbo.odbc_literal_restore_seconds;
GO
