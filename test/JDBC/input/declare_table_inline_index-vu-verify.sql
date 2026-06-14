DECLARE @declare_table_inline_index_vu_t TABLE
(
    id int,
    code varchar(10),
    INDEX ix_declare_table_inline_index_vu CLUSTERED (id, code)
);

INSERT INTO @declare_table_inline_index_vu_t (id, code)
VALUES (2, 'b'), (1, 'a');

SELECT id, code
FROM @declare_table_inline_index_vu_t
ORDER BY id;
GO

DECLARE @declare_table_inline_index_vu_multi TABLE
(
    id int,
    code varchar(10),
    INDEX ix_declare_table_inline_index_vu_1 (id),
    INDEX ix_declare_table_inline_index_vu_2 (code)
);

INSERT INTO @declare_table_inline_index_vu_multi (id, code)
VALUES (3, 'c');

SELECT COUNT(*) AS row_count
FROM @declare_table_inline_index_vu_multi;
GO
