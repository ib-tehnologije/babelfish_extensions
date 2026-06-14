DROP FUNCTION IF EXISTS union_orderby_branch_itvf;
GO
DROP TABLE IF EXISTS union_orderby_branch_src;
GO

CREATE TABLE union_orderby_branch_src
(
    id int NOT NULL
);
GO

INSERT INTO union_orderby_branch_src VALUES (1);
GO
INSERT INTO union_orderby_branch_src VALUES (2);
GO

CREATE FUNCTION union_orderby_branch_itvf()
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 1 q.id
    FROM
    (
        SELECT TOP 1 s.id
        FROM union_orderby_branch_src s
        ORDER BY s.id DESC
        UNION ALL
        SELECT CAST(NULL AS int) AS id
    ) q
    ORDER BY q.id DESC
);
GO
