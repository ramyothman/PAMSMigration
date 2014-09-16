CREATE PROCEDURE [dbo].[DeleteOfferTemplateItem]
    @ID int
AS
Begin
DELETE FROM [dbo].[OffersTemplatesItems]
      WHERE ID = @ID
End
