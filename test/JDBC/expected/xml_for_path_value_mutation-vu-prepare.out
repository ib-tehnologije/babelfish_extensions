CREATE FUNCTION xml_for_path_value_mutation_repro()
RETURNS nvarchar(max)
AS
BEGIN
    RETURN (
        SELECT 'abc' [text()]
        FOR XML PATH(''), TYPE
    ).value('(./text())[1]', 'nvarchar(max)');
END
GO

CREATE FUNCTION xml_for_path_value_mutation_nstring_repro()
RETURNS nvarchar(max)
AS
BEGIN
    RETURN (
        SELECT N'abc' [text()]
        FOR XML PATH(N''), TYPE
    ).value(N'.', N'nvarchar(max)');
END
GO

CREATE FUNCTION xml_for_path_value_mutation_itvf_repro(@Delimiter nvarchar(12) = N',')
RETURNS TABLE
AS
RETURN SELECT SUBSTRING((
    SELECT @Delimiter + N'abc' [text()]
    FOR XML PATH(N''), TYPE
).value(N'.', N'nvarchar(max)'), LEN(@Delimiter) + 1, 2147483647) AS acValue;
GO
