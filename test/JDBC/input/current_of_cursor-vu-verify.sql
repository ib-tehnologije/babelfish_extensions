EXEC current_of_cursor_update_vu_p;
GO

SELECT id, val
FROM current_of_cursor_update_vu_t
ORDER BY id;
GO

SELECT id
FROM current_of_cursor_nested_vu_log
ORDER BY id;
GO

EXEC current_of_cursor_delete_vu_p;
GO

SELECT id, val
FROM current_of_cursor_delete_vu_t
ORDER BY id;
GO
