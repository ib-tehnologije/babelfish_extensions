DROP TRIGGER IF EXISTS dbo.trigger_schema_unqualified_target_tr
GO
DROP TABLE IF EXISTS dbo.trigger_schema_unqualified_target_t
GO

CREATE TABLE dbo.trigger_schema_unqualified_target_t(id int)
GO

CREATE TRIGGER [dbo].[trigger_schema_unqualified_target_tr]
ON trigger_schema_unqualified_target_t
FOR INSERT
AS
BEGIN
    SET NOCOUNT ON
END
GO

INSERT INTO dbo.trigger_schema_unqualified_target_t VALUES (1)
GO

DROP TRIGGER dbo.trigger_schema_unqualified_target_tr
GO
DROP TABLE dbo.trigger_schema_unqualified_target_t
GO
