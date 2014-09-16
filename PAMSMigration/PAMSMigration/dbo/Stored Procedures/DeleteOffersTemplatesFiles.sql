CREATE PROCEDURE [dbo].[DeleteOffersTemplatesFiles]
    @ID int
AS
Begin
     
DELETE FROM [dbo].[OffersTemplatesFiles]
      WHERE ID = @ID
End
