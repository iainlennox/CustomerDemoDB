USE [CustomerDemoDB]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 08/12/2024 22:24:10 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [SQLArcExtensionUserRole] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
