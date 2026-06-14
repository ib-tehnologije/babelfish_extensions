INSERT INTO spatial_restore_shim_src VALUES (1, 0x0102);
GO

EXEC spatial_restore_shim_proc;
GO

INSERT INTO spatial_restore_shim_wkt_default(id) VALUES (1);
GO

SELECT DATALENGTH(g) AS wkt_bytes
FROM spatial_restore_shim_wkt_default
WHERE id = 1;
GO
