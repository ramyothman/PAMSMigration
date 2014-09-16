CREATE PROCEDURE [dbo].[DeleteOffersTemplatesClarificationsResponses]
    @ID int
AS
Begin
     
DELETE FROM [dbo].[OffersTemplatesClarificationsResponses]
      WHERE ID = @ID
End
