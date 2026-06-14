CREATE TABLE execute_as_object_option_ignore_t (id int);
GO

CREATE TABLE execute_as_object_option_ignore_log (id int);
GO

CREATE FUNCTION execute_as_object_option_ignore_owner_fn(@v int)
RETURNS int
WITH EXECUTE AS OWNER
AS
BEGIN
    RETURN @v + 1
END
GO

CREATE FUNCTION execute_as_object_option_ignore_self_fn(@v int)
RETURNS int
WITH EXECUTE AS SELF, SCHEMABINDING
AS
BEGIN
    RETURN @v + 2
END
GO

CREATE PROCEDURE execute_as_object_option_ignore_user_p @v int
WITH EXECUTE AS 'dbo'
AS
BEGIN
    SELECT @v + 3;
END
GO

CREATE TRIGGER execute_as_object_option_ignore_owner_trg
ON execute_as_object_option_ignore_t
WITH EXECUTE AS OWNER
AFTER INSERT
AS
BEGIN
    INSERT INTO execute_as_object_option_ignore_log(id)
    SELECT id FROM inserted;
END
GO
