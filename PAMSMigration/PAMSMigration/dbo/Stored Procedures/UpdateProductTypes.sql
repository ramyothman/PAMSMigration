-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProductTypes]
@ProductType nvarchar(50),
@OldProductTypeID int
AS
BEGIN
	Update [dbo].[ProductTypes]
           set [ProductType] = @ProductType
   where ProductTypeID = @OldProductTypeID
END
