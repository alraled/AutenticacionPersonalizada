
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/25/2015 10:57:15
-- Generated from EDMX file: C:\Users\Alumno\Documents\Visual Studio 2015\Projects\MVC\AutenticacionPersonalizada\AutenticacionPersonalizada\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [autenticacion];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Roles_Menu_Menu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Roles_Menu] DROP CONSTRAINT [FK_Roles_Menu_Menu];
GO
IF OBJECT_ID(N'[dbo].[FK_Roles_Menu_Rol]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Roles_Menu] DROP CONSTRAINT [FK_Roles_Menu_Rol];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_Rol]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Rol];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Menu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Menu];
GO
IF OBJECT_ID(N'[dbo].[Rol]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rol];
GO
IF OBJECT_ID(N'[dbo].[Roles_Menu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles_Menu];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Menu'
CREATE TABLE [dbo].[Menu] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(50)  NOT NULL,
    [url] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Rol'
CREATE TABLE [dbo].[Rol] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Roles_Menu'
CREATE TABLE [dbo].[Roles_Menu] (
    [idRol] int  NOT NULL,
    [idMenu] int  NOT NULL,
    [orden] int  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [id] int  NOT NULL,
    [login] nvarchar(250)  NOT NULL,
    [password] nvarchar(50)  NOT NULL,
    [nombre] nvarchar(500)  NULL,
    [apellidos] nvarchar(500)  NULL,
    [imagen] nvarchar(500)  NULL,
    [idRol] int  NULL,
    [email] nvarchar(150)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Menu'
ALTER TABLE [dbo].[Menu]
ADD CONSTRAINT [PK_Menu]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Rol'
ALTER TABLE [dbo].[Rol]
ADD CONSTRAINT [PK_Rol]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [idRol], [idMenu] in table 'Roles_Menu'
ALTER TABLE [dbo].[Roles_Menu]
ADD CONSTRAINT [PK_Roles_Menu]
    PRIMARY KEY CLUSTERED ([idRol], [idMenu] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [id] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [idMenu] in table 'Roles_Menu'
ALTER TABLE [dbo].[Roles_Menu]
ADD CONSTRAINT [FK_Roles_Menu_Menu]
    FOREIGN KEY ([idMenu])
    REFERENCES [dbo].[Menu]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Roles_Menu_Menu'
CREATE INDEX [IX_FK_Roles_Menu_Menu]
ON [dbo].[Roles_Menu]
    ([idMenu]);
GO

-- Creating foreign key on [idRol] in table 'Roles_Menu'
ALTER TABLE [dbo].[Roles_Menu]
ADD CONSTRAINT [FK_Roles_Menu_Rol]
    FOREIGN KEY ([idRol])
    REFERENCES [dbo].[Rol]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [idRol] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [FK_Usuario_Rol]
    FOREIGN KEY ([idRol])
    REFERENCES [dbo].[Rol]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuario_Rol'
CREATE INDEX [IX_FK_Usuario_Rol]
ON [dbo].[Usuario]
    ([idRol]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------