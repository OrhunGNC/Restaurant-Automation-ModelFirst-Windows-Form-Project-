
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/11/2023 20:18:57
-- Generated from EDMX file: C:\Users\pc\Desktop\Restoran\Restoran\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [restoran];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_RestoranSiparis]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiparisSet] DROP CONSTRAINT [FK_RestoranSiparis];
GO
IF OBJECT_ID(N'[dbo].[FK_MusteriSiparis]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SiparisSet] DROP CONSTRAINT [FK_MusteriSiparis];
GO
IF OBJECT_ID(N'[dbo].[FK_RestoranUrun]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UrunSet] DROP CONSTRAINT [FK_RestoranUrun];
GO
IF OBJECT_ID(N'[dbo].[FK_RestoranMusteri_Restoran]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RestoranMusteri] DROP CONSTRAINT [FK_RestoranMusteri_Restoran];
GO
IF OBJECT_ID(N'[dbo].[FK_RestoranMusteri_Musteri]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RestoranMusteri] DROP CONSTRAINT [FK_RestoranMusteri_Musteri];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[RestoranSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RestoranSet];
GO
IF OBJECT_ID(N'[dbo].[MusteriSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MusteriSet];
GO
IF OBJECT_ID(N'[dbo].[UrunSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UrunSet];
GO
IF OBJECT_ID(N'[dbo].[SiparisSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SiparisSet];
GO
IF OBJECT_ID(N'[dbo].[RestoranMusteri]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RestoranMusteri];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'RestoranSet'
CREATE TABLE [dbo].[RestoranSet] (
    [RestoranID] int IDENTITY(1,1) NOT NULL,
    [restoranName] nvarchar(max)  NOT NULL,
    [restoranAdress] nvarchar(max)  NOT NULL,
    [restoranSalary] decimal(18,0)  NOT NULL,
    [restoranPhone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MusteriSet'
CREATE TABLE [dbo].[MusteriSet] (
    [MusteriID] int IDENTITY(1,1) NOT NULL,
    [musteriName] nvarchar(max)  NOT NULL,
    [musteriPhone] nvarchar(max)  NOT NULL,
    [musteriBudget] nvarchar(max)  NOT NULL,
    [musteriAdress] nvarchar(max)  NOT NULL,
    [RestoranID] int  NOT NULL
);
GO

-- Creating table 'UrunSet'
CREATE TABLE [dbo].[UrunSet] (
    [UrunID] int IDENTITY(1,1) NOT NULL,
    [urunName] nvarchar(max)  NOT NULL,
    [urunPrice] decimal(18,0)  NOT NULL,
    [urunType] nvarchar(max)  NOT NULL,
    [RestoranID] int  NOT NULL
);
GO

-- Creating table 'SiparisSet'
CREATE TABLE [dbo].[SiparisSet] (
    [SiparisID] int IDENTITY(1,1) NOT NULL,
    [siparisPrice] nvarchar(max)  NOT NULL,
    [RestoranID] int  NOT NULL,
    [MusteriID] int  NOT NULL,
    [urunCount] int  NOT NULL,
    [urunSecim] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RestoranMusteri'
CREATE TABLE [dbo].[RestoranMusteri] (
    [RestoranMusteri_Musteri_RestoranID] int  NOT NULL,
    [RestoranMusteri_Restoran_MusteriID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [RestoranID] in table 'RestoranSet'
ALTER TABLE [dbo].[RestoranSet]
ADD CONSTRAINT [PK_RestoranSet]
    PRIMARY KEY CLUSTERED ([RestoranID] ASC);
GO

-- Creating primary key on [MusteriID] in table 'MusteriSet'
ALTER TABLE [dbo].[MusteriSet]
ADD CONSTRAINT [PK_MusteriSet]
    PRIMARY KEY CLUSTERED ([MusteriID] ASC);
GO

-- Creating primary key on [UrunID] in table 'UrunSet'
ALTER TABLE [dbo].[UrunSet]
ADD CONSTRAINT [PK_UrunSet]
    PRIMARY KEY CLUSTERED ([UrunID] ASC);
GO

-- Creating primary key on [SiparisID] in table 'SiparisSet'
ALTER TABLE [dbo].[SiparisSet]
ADD CONSTRAINT [PK_SiparisSet]
    PRIMARY KEY CLUSTERED ([SiparisID] ASC);
GO

-- Creating primary key on [RestoranMusteri_Musteri_RestoranID], [RestoranMusteri_Restoran_MusteriID] in table 'RestoranMusteri'
ALTER TABLE [dbo].[RestoranMusteri]
ADD CONSTRAINT [PK_RestoranMusteri]
    PRIMARY KEY CLUSTERED ([RestoranMusteri_Musteri_RestoranID], [RestoranMusteri_Restoran_MusteriID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RestoranID] in table 'SiparisSet'
ALTER TABLE [dbo].[SiparisSet]
ADD CONSTRAINT [FK_RestoranSiparis]
    FOREIGN KEY ([RestoranID])
    REFERENCES [dbo].[RestoranSet]
        ([RestoranID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RestoranSiparis'
CREATE INDEX [IX_FK_RestoranSiparis]
ON [dbo].[SiparisSet]
    ([RestoranID]);
GO

-- Creating foreign key on [MusteriID] in table 'SiparisSet'
ALTER TABLE [dbo].[SiparisSet]
ADD CONSTRAINT [FK_MusteriSiparis]
    FOREIGN KEY ([MusteriID])
    REFERENCES [dbo].[MusteriSet]
        ([MusteriID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MusteriSiparis'
CREATE INDEX [IX_FK_MusteriSiparis]
ON [dbo].[SiparisSet]
    ([MusteriID]);
GO

-- Creating foreign key on [RestoranID] in table 'UrunSet'
ALTER TABLE [dbo].[UrunSet]
ADD CONSTRAINT [FK_RestoranUrun]
    FOREIGN KEY ([RestoranID])
    REFERENCES [dbo].[RestoranSet]
        ([RestoranID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RestoranUrun'
CREATE INDEX [IX_FK_RestoranUrun]
ON [dbo].[UrunSet]
    ([RestoranID]);
GO

-- Creating foreign key on [RestoranMusteri_Musteri_RestoranID] in table 'RestoranMusteri'
ALTER TABLE [dbo].[RestoranMusteri]
ADD CONSTRAINT [FK_RestoranMusteri_Restoran]
    FOREIGN KEY ([RestoranMusteri_Musteri_RestoranID])
    REFERENCES [dbo].[RestoranSet]
        ([RestoranID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RestoranMusteri_Restoran_MusteriID] in table 'RestoranMusteri'
ALTER TABLE [dbo].[RestoranMusteri]
ADD CONSTRAINT [FK_RestoranMusteri_Musteri]
    FOREIGN KEY ([RestoranMusteri_Restoran_MusteriID])
    REFERENCES [dbo].[MusteriSet]
        ([MusteriID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RestoranMusteri_Musteri'
CREATE INDEX [IX_FK_RestoranMusteri_Musteri]
ON [dbo].[RestoranMusteri]
    ([RestoranMusteri_Restoran_MusteriID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------