DECLARE @i int = 0, @j int = 99;
SELECT @i = 1, @j = @i, @i = @i + 10;
SELECT @i AS i_after, @j AS j_after;
GO

DECLARE @i int = 0;
SELECT @i += 1, @i += 2;
SELECT @i AS compound_after;
GO

DECLARE @s varchar(20) = '';
SELECT @s = @s + 'a', @s = @s + 'b';
SELECT @s AS str_after;
GO

DECLARE @x int = 0, @y int = 0;
SELECT @x = v, @y = @x, @x = @x + 10
FROM (VALUES (5)) q(v);
SELECT @x AS x_after, @y AS y_after;
GO
