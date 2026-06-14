DECLARE @x xml;
SET @x = CAST('<x><r>a</r></x>' AS xml);
SET @x.modify('delete /x/r');
SELECT @x.value('(/x/r/text())[1]', 'varchar(10)') AS val
GO

CREATE TABLE #xml_modify_noop(id int, x xml);
INSERT INTO #xml_modify_noop VALUES (1, CAST('<x><r>a</r></x>' AS xml));
UPDATE #xml_modify_noop SET x.modify('delete /x/r') WHERE id = 1;
SELECT x.value('(/x/r/text())[1]', 'varchar(10)') AS val
FROM #xml_modify_noop
WHERE id = 1
GO

DROP TABLE #xml_modify_noop
GO
