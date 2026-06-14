SELECT COUNT(*) AS matched_rows
FROM collation_tests_croatian_vu_prepare_varchar
WHERE name = NCHAR(268) + N'AKOVEC';
GO

SELECT name, collation_name
FROM sys.columns
WHERE object_id = object_id('collation_tests_croatian_vu_prepare_varchar')
ORDER BY name;
GO

SELECT CAST(COLLATIONPROPERTY('Croatian_CI_AS', 'LCID') AS int) AS lcid,
       CAST(COLLATIONPROPERTY('Croatian_CI_AS', 'CodePage') AS int) AS code_page,
       CAST(COLLATIONPROPERTY('Croatian_CI_AS', 'ComparisonStyle') AS int) AS comparison_style;
GO

SELECT CAST(COLLATIONPROPERTY('Croatian_CI_AI', 'ComparisonStyle') AS int) AS ci_ai_style,
       CAST(COLLATIONPROPERTY('Croatian_CI_AS', 'ComparisonStyle') AS int) AS ci_as_style,
       CAST(COLLATIONPROPERTY('Croatian_CS_AI', 'ComparisonStyle') AS int) AS cs_ai_style,
       CAST(COLLATIONPROPERTY('Croatian_CS_AS', 'ComparisonStyle') AS int) AS cs_as_style;
GO
