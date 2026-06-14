SELECT dbo.execute_as_object_option_ignore_owner_fn(10);
GO

SELECT dbo.execute_as_object_option_ignore_self_fn(10);
GO

EXEC execute_as_object_option_ignore_user_p 10;
GO

INSERT INTO execute_as_object_option_ignore_t VALUES (42);
GO

SELECT id FROM execute_as_object_option_ignore_log ORDER BY id;
GO
