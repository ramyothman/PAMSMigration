CREATE PROCEDURE [dbo].[DeleteOfferTemplate]
    @ID int
AS
Begin
DELETE FROM [dbo].[OffersTemplatesItems]
      WHERE OfferTemplateID = @ID
      
DELETE FROM [dbo].[OffersTemplates]
      WHERE ID = @ID
End
