CREATE OR REPLACE FUNCTION sys.STDistance(sys.bbf_varbinary, sys.bbf_varbinary)
RETURNS float8
AS $$
    SELECT NULL::float8;
$$
LANGUAGE SQL IMMUTABLE PARALLEL SAFE;
