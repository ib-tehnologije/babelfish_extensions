DROP TABLE IF EXISTS join_omitted_schema_left;
GO
DROP TABLE IF EXISTS join_omitted_schema_right;
GO

CREATE TABLE join_omitted_schema_left
(
    id int NOT NULL
);
GO

CREATE TABLE join_omitted_schema_right
(
    id int NOT NULL
);
GO

INSERT INTO join_omitted_schema_left VALUES (1);
GO
INSERT INTO join_omitted_schema_right VALUES (1);
GO
