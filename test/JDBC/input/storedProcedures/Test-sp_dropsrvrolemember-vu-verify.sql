CREATE LOGIN sp_dropsrvrolemember_login WITH PASSWORD = '123';
GO

ALTER SERVER ROLE sysadmin ADD MEMBER sp_dropsrvrolemember_login;
GO

SELECT is_srvrolemember('sysadmin', 'sp_dropsrvrolemember_login') AS is_sysadmin_before_drop;
GO

DECLARE @sp_dropsrvrolemember_return_code int;
EXEC @sp_dropsrvrolemember_return_code = sp_dropsrvrolemember
    @loginame = 'sp_dropsrvrolemember_login',
    @rolename = 'sysadmin';

SELECT
    @sp_dropsrvrolemember_return_code AS return_code,
    is_srvrolemember('sysadmin', 'sp_dropsrvrolemember_login') AS is_sysadmin_after_drop;
GO

DECLARE @sp_droplogin_return_code int;
EXEC @sp_droplogin_return_code = sp_droplogin
    @loginame = 'sp_dropsrvrolemember_login';

SELECT
    @sp_droplogin_return_code AS return_code,
    CASE WHEN EXISTS (SELECT 1 FROM master.dbo.syslogins WHERE name = 'sp_dropsrvrolemember_login')
        THEN 1 ELSE 0 END AS login_exists_after_drop;
GO
