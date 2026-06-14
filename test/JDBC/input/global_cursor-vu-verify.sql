EXEC global_cursor_static_vu_p 2;
GO

EXEC global_cursor_dynamic_vu_p;
GO

SELECT proc_name, id, val
FROM global_cursor_vu_log
ORDER BY proc_name, id;
GO
