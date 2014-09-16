-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewProductTypes]
@ProductType nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[ProductTypes]
           ([ProductType])
     VALUES
           (@ProductType)
	IF @@ROWCOUNT > 0
Select * from ProductTypes
Where [ProductTypeID] = @@identity
END
