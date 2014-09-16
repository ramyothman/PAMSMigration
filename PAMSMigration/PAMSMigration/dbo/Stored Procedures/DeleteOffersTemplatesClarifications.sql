CREATE PROCEDURE [dbo].[DeleteOffersTemplatesClarifications]
    @ID int
AS
Begin
     
DELETE FROM [dbo].[OffersTemplatesFiles]
      WHERE OfferTemplateClarificationID = @ID
      
DELETE FROM [dbo].[OffersTemplatesClarifications]
      WHERE ID = @ID
End
