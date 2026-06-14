SELECT COUNT(*) AS function_count
FROM sys.objects
WHERE name = 'xml_for_path_value_mutation_repro'
  AND type IN ('FN', 'IF', 'TF');
GO

SELECT COUNT(*) AS function_count
FROM sys.objects
WHERE name = 'xml_for_path_value_mutation_nstring_repro'
  AND type IN ('FN', 'IF', 'TF');
GO

SELECT COUNT(*) AS function_count
FROM sys.objects
WHERE name = 'xml_for_path_value_mutation_itvf_repro'
  AND type IN ('FN', 'IF', 'TF');
GO
