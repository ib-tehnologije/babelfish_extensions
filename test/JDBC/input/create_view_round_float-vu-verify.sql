DROP VIEW IF EXISTS dbo.create_view_round_float_v;
GO

SELECT set_config('babelfishpg_tsql.dump_restore', 'on', false);
GO

CREATE VIEW dbo.create_view_round_float_v
AS
SELECT ROUND(
    (CAST(CAST('2020-01-02T00:00:00' AS DATETIME) AS FLOAT)
     - CAST(CAST('2020-01-01T00:00:00' AS DATETIME) AS FLOAT))
    * 1440 + 1.0000000000/1440./60., 0) AS rounded_minutes;
GO

SELECT rounded_minutes
FROM dbo.create_view_round_float_v;
GO

SELECT set_config('babelfishpg_tsql.dump_restore', 'off', false);
GO

DROP VIEW dbo.create_view_round_float_v;
GO
