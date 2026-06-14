DROP VIEW IF EXISTS synonym_restore_syn;
GO

DROP TABLE IF EXISTS synonym_restore_base;
GO

CREATE TABLE synonym_restore_base
(
    id int NOT NULL PRIMARY KEY,
    name varchar(20) NOT NULL
);
GO

INSERT INTO synonym_restore_base VALUES (1, 'base');
GO

CREATE SYNONYM dbo.synonym_restore_syn FOR dbo.synonym_restore_base;
GO

SELECT name FROM dbo.synonym_restore_syn WHERE id = 1;
GO

INSERT INTO dbo.synonym_restore_syn VALUES (2, 'via_syn');
GO

SELECT name FROM dbo.synonym_restore_base WHERE id = 2;
GO

DROP SYNONYM dbo.synonym_restore_syn;
GO

DROP TABLE synonym_restore_base;
GO
