
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/24/2017 17:55:36
-- Generated from EDMX file: C:\Users\nemesis\Desktop\test\DAS\FridgeServer\FridgeServer\Database\DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SampleDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ReceiptProduct_Receipt]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReceiptProduct] DROP CONSTRAINT [FK_ReceiptProduct_Receipt];
GO
IF OBJECT_ID(N'[dbo].[FK_ReceiptProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReceiptProduct] DROP CONSTRAINT [FK_ReceiptProduct_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_FridgeProduct_Fridge]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FridgeProduct] DROP CONSTRAINT [FK_FridgeProduct_Fridge];
GO
IF OBJECT_ID(N'[dbo].[FK_FridgeProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FridgeProduct] DROP CONSTRAINT [FK_FridgeProduct_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_FridgeLocation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fridges] DROP CONSTRAINT [FK_FridgeLocation];
GO
IF OBJECT_ID(N'[dbo].[FK_MarketProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Markets] DROP CONSTRAINT [FK_MarketProduct];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[Markets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Markets];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Receipts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Receipts];
GO
IF OBJECT_ID(N'[dbo].[Fridges]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Fridges];
GO
IF OBJECT_ID(N'[dbo].[ReceiptProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReceiptProduct];
GO
IF OBJECT_ID(N'[dbo].[FridgeProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FridgeProduct];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Longitude] float  NOT NULL,
    [Latitude] float  NOT NULL
);
GO

-- Creating table 'Markets'
CREATE TABLE [dbo].[Markets] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Location_Id] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Quantity] float  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Receipts'
CREATE TABLE [dbo].[Receipts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Fridges'
CREATE TABLE [dbo].[Fridges] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Location_Id] int  NOT NULL
);
GO

-- Creating table 'ReceiptProduct'
CREATE TABLE [dbo].[ReceiptProduct] (
    [Receipts_Id] int  NOT NULL,
    [Products_Id] int  NOT NULL
);
GO

-- Creating table 'FridgeProduct'
CREATE TABLE [dbo].[FridgeProduct] (
    [Fridges_Id] int  NOT NULL,
    [Products_Id] int  NOT NULL
);
GO

-- Creating table 'MarketProduct'
CREATE TABLE [dbo].[MarketProduct] (
    [Markets_Id] int  NOT NULL,
    [Products_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Markets'
ALTER TABLE [dbo].[Markets]
ADD CONSTRAINT [PK_Markets]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [PK_Receipts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Fridges'
ALTER TABLE [dbo].[Fridges]
ADD CONSTRAINT [PK_Fridges]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Receipts_Id], [Products_Id] in table 'ReceiptProduct'
ALTER TABLE [dbo].[ReceiptProduct]
ADD CONSTRAINT [PK_ReceiptProduct]
    PRIMARY KEY CLUSTERED ([Receipts_Id], [Products_Id] ASC);
GO

-- Creating primary key on [Fridges_Id], [Products_Id] in table 'FridgeProduct'
ALTER TABLE [dbo].[FridgeProduct]
ADD CONSTRAINT [PK_FridgeProduct]
    PRIMARY KEY CLUSTERED ([Fridges_Id], [Products_Id] ASC);
GO

-- Creating primary key on [Markets_Id], [Products_Id] in table 'MarketProduct'
ALTER TABLE [dbo].[MarketProduct]
ADD CONSTRAINT [PK_MarketProduct]
    PRIMARY KEY CLUSTERED ([Markets_Id], [Products_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Receipts_Id] in table 'ReceiptProduct'
ALTER TABLE [dbo].[ReceiptProduct]
ADD CONSTRAINT [FK_ReceiptProduct_Receipt]
    FOREIGN KEY ([Receipts_Id])
    REFERENCES [dbo].[Receipts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_Id] in table 'ReceiptProduct'
ALTER TABLE [dbo].[ReceiptProduct]
ADD CONSTRAINT [FK_ReceiptProduct_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReceiptProduct_Product'
CREATE INDEX [IX_FK_ReceiptProduct_Product]
ON [dbo].[ReceiptProduct]
    ([Products_Id]);
GO

-- Creating foreign key on [Fridges_Id] in table 'FridgeProduct'
ALTER TABLE [dbo].[FridgeProduct]
ADD CONSTRAINT [FK_FridgeProduct_Fridge]
    FOREIGN KEY ([Fridges_Id])
    REFERENCES [dbo].[Fridges]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_Id] in table 'FridgeProduct'
ALTER TABLE [dbo].[FridgeProduct]
ADD CONSTRAINT [FK_FridgeProduct_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FridgeProduct_Product'
CREATE INDEX [IX_FK_FridgeProduct_Product]
ON [dbo].[FridgeProduct]
    ([Products_Id]);
GO

-- Creating foreign key on [Location_Id] in table 'Fridges'
ALTER TABLE [dbo].[Fridges]
ADD CONSTRAINT [FK_FridgeLocation]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FridgeLocation'
CREATE INDEX [IX_FK_FridgeLocation]
ON [dbo].[Fridges]
    ([Location_Id]);
GO

-- Creating foreign key on [Location_Id] in table 'Markets'
ALTER TABLE [dbo].[Markets]
ADD CONSTRAINT [FK_MarketLocation]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MarketLocation'
CREATE INDEX [IX_FK_MarketLocation]
ON [dbo].[Markets]
    ([Location_Id]);
GO

-- Creating foreign key on [Markets_Id] in table 'MarketProduct'
ALTER TABLE [dbo].[MarketProduct]
ADD CONSTRAINT [FK_MarketProduct_Market]
    FOREIGN KEY ([Markets_Id])
    REFERENCES [dbo].[Markets]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_Id] in table 'MarketProduct'
ALTER TABLE [dbo].[MarketProduct]
ADD CONSTRAINT [FK_MarketProduct_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MarketProduct_Product'
CREATE INDEX [IX_FK_MarketProduct_Product]
ON [dbo].[MarketProduct]
    ([Products_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------