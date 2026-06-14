IF EXISTS (SELECT 1 FROM master.dbo.syslogins WHERE name = 'sp_dropsrvrolemember_login')
BEGIN
    IF is_srvrolemember('sysadmin', 'sp_dropsrvrolemember_login') = 1
        ALTER SERVER ROLE sysadmin DROP MEMBER sp_dropsrvrolemember_login;

    DROP LOGIN sp_dropsrvrolemember_login;
END
GO
