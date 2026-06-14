DROP TABLE IF EXISTS bracket_escaped_identifier_t;
GO

CREATE TABLE bracket_escaped_identifier_t
(
    id int NOT NULL
);
GO

ALTER TABLE bracket_escaped_identifier_t
ADD CONSTRAINT [kdbo]].[bracket_escaped_identifier_t]]_0] PRIMARY KEY CLUSTERED (id ASC);
GO

SELECT name
FROM sys.key_constraints
WHERE parent_object_id = OBJECT_ID('bracket_escaped_identifier_t')
  AND name = 'kdbo].[bracket_escaped_identifier_t]_0';
GO

DROP TABLE bracket_escaped_identifier_t;
GO
