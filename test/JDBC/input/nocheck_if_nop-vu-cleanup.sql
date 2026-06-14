DROP PROCEDURE IF EXISTS nocheck_if_nop_p;
GO

DROP TABLE IF EXISTS nocheck_if_nop_t;
GO

SELECT set_config('babelfishpg_tsql.escape_hatch_nocheck_existing_constraint', 'strict', 'false');
GO
