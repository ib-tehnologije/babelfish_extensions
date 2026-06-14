DROP VIEW IF EXISTS dbo.spatial_varbinary_stastext_v;
GO

DROP TABLE IF EXISTS dbo.spatial_varbinary_stastext_t;
GO

CREATE TABLE dbo.spatial_varbinary_stastext_t
(
    id int,
    g varbinary(max)
);
GO

INSERT INTO dbo.spatial_varbinary_stastext_t (id, g)
VALUES (1, 'POINT (1 2)');
GO

CREATE VIEW dbo.spatial_varbinary_stastext_v
AS
SELECT g.STAsText() AS wkt
FROM dbo.spatial_varbinary_stastext_t;
GO

SELECT wkt
FROM dbo.spatial_varbinary_stastext_v;
GO

DROP VIEW dbo.spatial_varbinary_stastext_v;
GO

DROP TABLE dbo.spatial_varbinary_stastext_t;
GO
