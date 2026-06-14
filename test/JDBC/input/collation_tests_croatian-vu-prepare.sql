CREATE TABLE collation_tests_croatian_vu_prepare_varchar (
    name varchar(30) COLLATE Croatian_CI_AS
);
GO

INSERT INTO collation_tests_croatian_vu_prepare_varchar VALUES (NCHAR(269) + N'akovec');
INSERT INTO collation_tests_croatian_vu_prepare_varchar VALUES ('Zagreb');
GO
