-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProductTypes]
@ProductTypeID int
AS
BEGIN
	delete from [dbo].[ProductTypes]           
   where ProductTypeID = @ProductTypeID
END
