CREATE TABLE global_cursor_vu_t (
    id int NOT NULL PRIMARY KEY,
    val int NOT NULL
);
GO

INSERT INTO global_cursor_vu_t VALUES (1, 10), (2, 20), (3, 30);
GO

CREATE TABLE global_cursor_vu_log (
    proc_name varchar(20) NOT NULL,
    id int NOT NULL,
    val int NOT NULL
);
GO

CREATE PROCEDURE global_cursor_static_vu_p @max_id int
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @id int;
    DECLARE @val int;
    DECLARE global_cursor_static_vu_cur CURSOR GLOBAL FAST_FORWARD
    FOR
        SELECT id, val
        FROM global_cursor_vu_t
        WHERE id <= @max_id
        ORDER BY id;
    OPEN global_cursor_static_vu_cur;
    FETCH NEXT FROM global_cursor_static_vu_cur INTO @id, @val;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO global_cursor_vu_log VALUES ('static', @id, @val);
        FETCH NEXT FROM global_cursor_static_vu_cur INTO @id, @val;
    END
    CLOSE global_cursor_static_vu_cur;
    DEALLOCATE global_cursor_static_vu_cur;
END
GO

CREATE PROCEDURE global_cursor_dynamic_vu_p
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @sql nvarchar(max);
    DECLARE @id int;
    DECLARE @val int;
    SET @sql = N'DECLARE global_cursor_dynamic_vu_cur CURSOR GLOBAL FAST_FORWARD
                 FOR SELECT id, val FROM global_cursor_vu_t ORDER BY id';
    EXEC sp_executesql @sql;
    OPEN global_cursor_dynamic_vu_cur;
    FETCH NEXT FROM global_cursor_dynamic_vu_cur INTO @id, @val;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO global_cursor_vu_log VALUES ('dynamic', @id, @val);
        FETCH NEXT FROM global_cursor_dynamic_vu_cur INTO @id, @val;
    END
    CLOSE global_cursor_dynamic_vu_cur;
    DEALLOCATE global_cursor_dynamic_vu_cur;
END
GO
