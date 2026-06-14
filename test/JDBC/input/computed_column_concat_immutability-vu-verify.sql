SELECT acKey, acKeyView
FROM computed_column_concat_immutability_vu_prepare;
GO

SELECT c.name, c.is_computed
FROM sys.computed_columns c
WHERE c.object_id = object_id('computed_column_concat_immutability_vu_prepare')
ORDER BY c.column_id;
GO
