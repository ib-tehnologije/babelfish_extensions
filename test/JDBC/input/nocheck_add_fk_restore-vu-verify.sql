DROP TABLE IF EXISTS nocheck_add_fk_restore_child;
GO

DROP TABLE IF EXISTS nocheck_add_fk_restore_parent;
GO

CREATE TABLE nocheck_add_fk_restore_parent
(
    id int NOT NULL PRIMARY KEY
);
GO

CREATE TABLE nocheck_add_fk_restore_child
(
    id int NOT NULL PRIMARY KEY,
    parent_id int NULL
);
GO

INSERT INTO nocheck_add_fk_restore_parent VALUES (1);
GO

INSERT INTO nocheck_add_fk_restore_child VALUES (1, 1);
GO

ALTER TABLE nocheck_add_fk_restore_child WITH NOCHECK
ADD CONSTRAINT nocheck_add_fk_restore_fk
FOREIGN KEY (parent_id) REFERENCES nocheck_add_fk_restore_parent(id);
GO

SELECT name
FROM sys.foreign_keys
WHERE parent_object_id = OBJECT_ID('nocheck_add_fk_restore_child')
  AND name = 'nocheck_add_fk_restore_fk';
GO

DROP TABLE nocheck_add_fk_restore_child;
GO

DROP TABLE nocheck_add_fk_restore_parent;
GO
