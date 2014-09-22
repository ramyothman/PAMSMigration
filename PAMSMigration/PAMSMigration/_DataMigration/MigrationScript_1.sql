-- Migrating Category and Products

SET IDENTITY_INSERT [dbo].[Category] ON
Insert Into dbo.Category(CategoryID, Category2ID, Name, EgyptID, RPEID, QatarID)
select CategoryID, 0, CategoryName, CategoryID,0 , 0 From ShotecEgypt.dbo.Categories
SET IDENTITY_INSERT [dbo].[Category] Off


Insert Into dbo.Category(Category2ID, Name, EgyptProductID, RPEProductID, QatarProductID)
select Migration.fn_GetNewCategoryID(CategoryID, 0, 0), ProductName, ProductID,0 , 0 From ShotecEgypt.dbo.Products

