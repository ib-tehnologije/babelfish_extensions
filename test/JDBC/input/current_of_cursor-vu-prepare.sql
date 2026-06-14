CREATE TABLE current_of_cursor_update_vu_t (
    id int NOT NULL PRIMARY KEY,
    val int NOT NULL
);
GO

INSERT INTO current_of_cursor_update_vu_t VALUES (1, 1), (2, 2), (3, 3);
GO

CREATE TABLE current_of_cursor_nested_vu_log (
    id int NOT NULL
);
GO

CREATE PROCEDURE current_of_cursor_nested_vu_log_p @id int
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO current_of_cursor_nested_vu_log VALUES (@id);
END
GO

CREATE PROCEDURE current_of_cursor_update_vu_p
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id int;

    DECLARE current_of_cursor_update_vu_cur CURSOR LOCAL
    FOR
        SELECT id
        FROM current_of_cursor_update_vu_t
        WHERE id <= 2
        ORDER BY id
    FOR UPDATE OF val;

    OPEN current_of_cursor_update_vu_cur;
    FETCH NEXT FROM current_of_cursor_update_vu_cur INTO @id;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC current_of_cursor_nested_vu_log_p @id;

        UPDATE current_of_cursor_update_vu_t
        SET val = val + 10
        WHERE CURRENT OF current_of_cursor_update_vu_cur;

        FETCH NEXT FROM current_of_cursor_update_vu_cur INTO @id;
    END

    CLOSE current_of_cursor_update_vu_cur;
    DEALLOCATE current_of_cursor_update_vu_cur;
END
GO

CREATE TABLE current_of_cursor_delete_vu_t (
    id int NOT NULL PRIMARY KEY,
    val int NOT NULL
);
GO

INSERT INTO current_of_cursor_delete_vu_t VALUES (1, 10), (2, 20), (3, 30);
GO

CREATE PROCEDURE current_of_cursor_delete_vu_p
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @id int;

    DECLARE current_of_cursor_delete_vu_cur CURSOR LOCAL
    FOR
        SELECT id
        FROM current_of_cursor_delete_vu_t
        WHERE id <= 2
        ORDER BY id
    FOR UPDATE OF val;

    OPEN current_of_cursor_delete_vu_cur;
    FETCH NEXT FROM current_of_cursor_delete_vu_cur INTO @id;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DELETE FROM current_of_cursor_delete_vu_t
        WHERE CURRENT OF current_of_cursor_delete_vu_cur;

        FETCH NEXT FROM current_of_cursor_delete_vu_cur INTO @id;
    END

    CLOSE current_of_cursor_delete_vu_cur;
    DEALLOCATE current_of_cursor_delete_vu_cur;
END
GO
