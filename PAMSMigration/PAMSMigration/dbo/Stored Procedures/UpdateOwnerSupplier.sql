-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOwnerSupplier]
@SupplierID int
AS
BEGIN
	UPDATE [dbo].[Suppliers]
   SET [CurrentCompany] = 'False'
   UPDATE [dbo].[Suppliers]
   SET [CurrentCompany] = 'True'
   where SupplierID = @SupplierID
END
