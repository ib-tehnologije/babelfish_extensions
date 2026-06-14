DROP VIEW IF EXISTS dbo.dump_restore_itvf_cross_apply_v;
GO

DROP FUNCTION IF EXISTS dbo.dump_restore_itvf_cross_apply_f;
GO

SELECT set_config('babelfishpg_tsql.dump_restore', 'on', false);
GO

CREATE FUNCTION dbo.dump_restore_itvf_cross_apply_f(@p_dDateTime DATETIME)
RETURNS TABLE
AS
RETURN
    SELECT CAST(CAST(@p_dDateTime AS DATE) AS DATETIME) AS adValue;
GO

CREATE VIEW dbo.dump_restore_itvf_cross_apply_v
AS
SELECT R.adValue
FROM (SELECT CAST('20260614' AS DATETIME) AS adDate) S
CROSS APPLY dbo.dump_restore_itvf_cross_apply_f(S.adDate) R;
GO

SELECT adValue
FROM dbo.dump_restore_itvf_cross_apply_v;
GO

SELECT set_config('babelfishpg_tsql.dump_restore', 'off', false);
GO

DROP VIEW dbo.dump_restore_itvf_cross_apply_v;
GO

DROP FUNCTION dbo.dump_restore_itvf_cross_apply_f;
GO
