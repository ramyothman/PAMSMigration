CREATE PROCEDURE [dbo].[DeleteProductType]
    @ProductTypeID int
AS
Begin
 Delete [dbo].[ProductType] where     [ProductTypeID] = @ProductTypeID
End
