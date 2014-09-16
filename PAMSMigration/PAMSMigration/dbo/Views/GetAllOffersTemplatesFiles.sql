/****** Object:  View [dbo].[GetAllOffersTemplatesFiles]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllOffersTemplatesFiles]
AS
SELECT     ID, ResponseID, OfferTemplateClarificationID, Comment, UserName, ModifiedDate, AttachedFileName
FROM         dbo.OffersTemplatesFiles
