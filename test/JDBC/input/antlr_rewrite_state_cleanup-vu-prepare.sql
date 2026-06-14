DROP PROCEDURE IF EXISTS antlr_rewrite_state_cleanup_p;
GO

DECLARE @x xml;
SELECT TRIM(' x ') AS trimmed_value,
       @x.value('(/a/text())[1]', 'xml') AS invalid_value_type;
GO

CREATE PROCEDURE antlr_rewrite_state_cleanup_p
AS
BEGIN
    DECLARE @s nvarchar(max);
    SELECT @s = N'ok';
    SELECT @s AS result;
END
GO
