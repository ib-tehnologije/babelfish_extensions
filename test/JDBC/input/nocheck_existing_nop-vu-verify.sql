ALTER TABLE nocheck_existing_nop_vu_t NOCHECK CONSTRAINT nocheck_existing_nop_vu_ck;
GO

ALTER TABLE nocheck_existing_nop_vu_t WITH CHECK CHECK CONSTRAINT nocheck_existing_nop_vu_ck;
GO

SELECT COUNT(*) AS row_count
FROM nocheck_existing_nop_vu_t;
GO

