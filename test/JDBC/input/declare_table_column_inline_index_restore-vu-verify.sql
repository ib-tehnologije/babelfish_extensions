SELECT set_config('babelfishpg_tsql.dump_restore', 'on', false);
GO

DECLARE @declare_table_column_inline_index_restore_t TABLE
(
    adDate DATE INDEX CI_adDate CLUSTERED,
    anQty DECIMAL(19,6)
);

INSERT INTO @declare_table_column_inline_index_restore_t (adDate, anQty)
VALUES ('20260614', 12.5);

SELECT adDate, anQty
FROM @declare_table_column_inline_index_restore_t;
GO

SELECT set_config('babelfishpg_tsql.dump_restore', 'off', false);
GO
