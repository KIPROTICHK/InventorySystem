
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/10/2019 17:04:58
-- Generated from EDMX file: C:\Users\Korir\source\repos\InventorySystem\InventorySystem\Models\Inventory.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [InventorySystem];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_subCategory_category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[subCategories] DROP CONSTRAINT [FK_subCategory_category];
GO
IF OBJECT_ID(N'[dbo].[FK_inventoryTransaction_productDetails]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[inventoryTransactions] DROP CONSTRAINT [FK_inventoryTransaction_productDetails];
GO
IF OBJECT_ID(N'[dbo].[FK_product_subCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[products] DROP CONSTRAINT [FK_product_subCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_purchaseOrderLine_productDetails]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[purchaseOrderLines] DROP CONSTRAINT [FK_purchaseOrderLine_productDetails];
GO
IF OBJECT_ID(N'[dbo].[FK_saleOrderLine_productDetails]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[saleOrderLines] DROP CONSTRAINT [FK_saleOrderLine_productDetails];
GO
IF OBJECT_ID(N'[dbo].[FK_purchaseOrderLine_purchaseOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[purchaseOrderLines] DROP CONSTRAINT [FK_purchaseOrderLine_purchaseOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_saleOrderLine_saleOrderLine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[saleOrderLines] DROP CONSTRAINT [FK_saleOrderLine_saleOrderLine];
GO
IF OBJECT_ID(N'[dbo].[FK_productDetails_product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[productDetails] DROP CONSTRAINT [FK_productDetails_product];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[categories];
GO
IF OBJECT_ID(N'[dbo].[inventoryTransactions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[inventoryTransactions];
GO
IF OBJECT_ID(N'[dbo].[products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[products];
GO
IF OBJECT_ID(N'[dbo].[productDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[productDetails];
GO
IF OBJECT_ID(N'[dbo].[purchaseOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[purchaseOrders];
GO
IF OBJECT_ID(N'[dbo].[purchaseOrderLines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[purchaseOrderLines];
GO
IF OBJECT_ID(N'[dbo].[saleOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[saleOrders];
GO
IF OBJECT_ID(N'[dbo].[saleOrderLines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[saleOrderLines];
GO
IF OBJECT_ID(N'[dbo].[subCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[subCategories];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'categories'
CREATE TABLE [dbo].[categories] (
    [cid] int IDENTITY(1,1) NOT NULL,
    [name] varchar(150)  NOT NULL,
    [description] varchar(max)  NOT NULL
);
GO

-- Creating table 'inventoryTransactions'
CREATE TABLE [dbo].[inventoryTransactions] (
    [itID] int IDENTITY(1,1) NOT NULL,
    [productDetailsID] int  NOT NULL,
    [startingQuantity] int  NOT NULL,
    [currentQuantity] int  NOT NULL,
    [minimumQuantity] int  NOT NULL
);
GO

-- Creating table 'products'
CREATE TABLE [dbo].[products] (
    [pid] int IDENTITY(1,1) NOT NULL,
    [subCategoryID] int  NOT NULL,
    [name] varchar(150)  NOT NULL,
    [description] varchar(max)  NOT NULL
);
GO

-- Creating table 'productDetails'
CREATE TABLE [dbo].[productDetails] (
    [pdid] int IDENTITY(1,1) NOT NULL,
    [productID] int  NOT NULL,
    [name] varchar(150)  NOT NULL,
    [description] varchar(max)  NOT NULL,
    [bprice] decimal(18,0)  NULL,
    [sprice] decimal(18,0)  NULL,
    [discountAllowed] decimal(18,0)  NULL,
    [discountReceived] decimal(18,0)  NOT NULL,
    [date] binary(8)  NOT NULL
);
GO

-- Creating table 'purchaseOrders'
CREATE TABLE [dbo].[purchaseOrders] (
    [poID] int IDENTITY(1,1) NOT NULL,
    [supplierNames] varchar(200)  NULL,
    [Telno] nchar(15)  NULL,
    [description] varchar(max)  NULL,
    [date] binary(8)  NOT NULL
);
GO

-- Creating table 'purchaseOrderLines'
CREATE TABLE [dbo].[purchaseOrderLines] (
    [polID] int IDENTITY(1,1) NOT NULL,
    [purchaseOrderID] int  NOT NULL,
    [productDetailsID] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [buyingPrice] decimal(19,4)  NOT NULL
);
GO

-- Creating table 'saleOrders'
CREATE TABLE [dbo].[saleOrders] (
    [soID] int IDENTITY(1,1) NOT NULL,
    [customerNames] varchar(200)  NULL,
    [description] varchar(max)  NULL,
    [date] binary(8)  NOT NULL
);
GO

-- Creating table 'saleOrderLines'
CREATE TABLE [dbo].[saleOrderLines] (
    [solID] int  NOT NULL,
    [saleOrderID] int  NOT NULL,
    [productDetailsID] int  NOT NULL,
    [quantity] int  NOT NULL,
    [sellingPrice] decimal(19,4)  NOT NULL
);
GO

-- Creating table 'subCategories'
CREATE TABLE [dbo].[subCategories] (
    [categoryID] int  NOT NULL,
    [scid] int IDENTITY(1,1) NOT NULL,
    [name] varchar(150)  NOT NULL,
    [description] varchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [cid] in table 'categories'
ALTER TABLE [dbo].[categories]
ADD CONSTRAINT [PK_categories]
    PRIMARY KEY CLUSTERED ([cid] ASC);
GO

-- Creating primary key on [itID] in table 'inventoryTransactions'
ALTER TABLE [dbo].[inventoryTransactions]
ADD CONSTRAINT [PK_inventoryTransactions]
    PRIMARY KEY CLUSTERED ([itID] ASC);
GO

-- Creating primary key on [pid] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [PK_products]
    PRIMARY KEY CLUSTERED ([pid] ASC);
GO

-- Creating primary key on [pdid] in table 'productDetails'
ALTER TABLE [dbo].[productDetails]
ADD CONSTRAINT [PK_productDetails]
    PRIMARY KEY CLUSTERED ([pdid] ASC);
GO

-- Creating primary key on [poID] in table 'purchaseOrders'
ALTER TABLE [dbo].[purchaseOrders]
ADD CONSTRAINT [PK_purchaseOrders]
    PRIMARY KEY CLUSTERED ([poID] ASC);
GO

-- Creating primary key on [polID] in table 'purchaseOrderLines'
ALTER TABLE [dbo].[purchaseOrderLines]
ADD CONSTRAINT [PK_purchaseOrderLines]
    PRIMARY KEY CLUSTERED ([polID] ASC);
GO

-- Creating primary key on [soID] in table 'saleOrders'
ALTER TABLE [dbo].[saleOrders]
ADD CONSTRAINT [PK_saleOrders]
    PRIMARY KEY CLUSTERED ([soID] ASC);
GO

-- Creating primary key on [solID] in table 'saleOrderLines'
ALTER TABLE [dbo].[saleOrderLines]
ADD CONSTRAINT [PK_saleOrderLines]
    PRIMARY KEY CLUSTERED ([solID] ASC);
GO

-- Creating primary key on [scid] in table 'subCategories'
ALTER TABLE [dbo].[subCategories]
ADD CONSTRAINT [PK_subCategories]
    PRIMARY KEY CLUSTERED ([scid] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [categoryID] in table 'subCategories'
ALTER TABLE [dbo].[subCategories]
ADD CONSTRAINT [FK_subCategory_category]
    FOREIGN KEY ([categoryID])
    REFERENCES [dbo].[categories]
        ([cid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_subCategory_category'
CREATE INDEX [IX_FK_subCategory_category]
ON [dbo].[subCategories]
    ([categoryID]);
GO

-- Creating foreign key on [productDetailsID] in table 'inventoryTransactions'
ALTER TABLE [dbo].[inventoryTransactions]
ADD CONSTRAINT [FK_inventoryTransaction_productDetails]
    FOREIGN KEY ([productDetailsID])
    REFERENCES [dbo].[productDetails]
        ([pdid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_inventoryTransaction_productDetails'
CREATE INDEX [IX_FK_inventoryTransaction_productDetails]
ON [dbo].[inventoryTransactions]
    ([productDetailsID]);
GO

-- Creating foreign key on [subCategoryID] in table 'products'
ALTER TABLE [dbo].[products]
ADD CONSTRAINT [FK_product_subCategory]
    FOREIGN KEY ([subCategoryID])
    REFERENCES [dbo].[subCategories]
        ([scid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_product_subCategory'
CREATE INDEX [IX_FK_product_subCategory]
ON [dbo].[products]
    ([subCategoryID]);
GO

-- Creating foreign key on [productDetailsID] in table 'purchaseOrderLines'
ALTER TABLE [dbo].[purchaseOrderLines]
ADD CONSTRAINT [FK_purchaseOrderLine_productDetails]
    FOREIGN KEY ([productDetailsID])
    REFERENCES [dbo].[productDetails]
        ([pdid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_purchaseOrderLine_productDetails'
CREATE INDEX [IX_FK_purchaseOrderLine_productDetails]
ON [dbo].[purchaseOrderLines]
    ([productDetailsID]);
GO

-- Creating foreign key on [productDetailsID] in table 'saleOrderLines'
ALTER TABLE [dbo].[saleOrderLines]
ADD CONSTRAINT [FK_saleOrderLine_productDetails]
    FOREIGN KEY ([productDetailsID])
    REFERENCES [dbo].[productDetails]
        ([pdid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_saleOrderLine_productDetails'
CREATE INDEX [IX_FK_saleOrderLine_productDetails]
ON [dbo].[saleOrderLines]
    ([productDetailsID]);
GO

-- Creating foreign key on [purchaseOrderID] in table 'purchaseOrderLines'
ALTER TABLE [dbo].[purchaseOrderLines]
ADD CONSTRAINT [FK_purchaseOrderLine_purchaseOrder]
    FOREIGN KEY ([purchaseOrderID])
    REFERENCES [dbo].[purchaseOrders]
        ([poID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_purchaseOrderLine_purchaseOrder'
CREATE INDEX [IX_FK_purchaseOrderLine_purchaseOrder]
ON [dbo].[purchaseOrderLines]
    ([purchaseOrderID]);
GO

-- Creating foreign key on [saleOrderID] in table 'saleOrderLines'
ALTER TABLE [dbo].[saleOrderLines]
ADD CONSTRAINT [FK_saleOrderLine_saleOrderLine]
    FOREIGN KEY ([saleOrderID])
    REFERENCES [dbo].[saleOrders]
        ([soID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_saleOrderLine_saleOrderLine'
CREATE INDEX [IX_FK_saleOrderLine_saleOrderLine]
ON [dbo].[saleOrderLines]
    ([saleOrderID]);
GO

-- Creating foreign key on [productID] in table 'productDetails'
ALTER TABLE [dbo].[productDetails]
ADD CONSTRAINT [FK_productDetails_product]
    FOREIGN KEY ([productID])
    REFERENCES [dbo].[products]
        ([pid])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_productDetails_product'
CREATE INDEX [IX_FK_productDetails_product]
ON [dbo].[productDetails]
    ([productID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------