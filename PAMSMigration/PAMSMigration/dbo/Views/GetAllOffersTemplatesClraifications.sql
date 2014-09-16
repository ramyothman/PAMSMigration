/****** Object:  View [dbo].[GetAllOffersTemplatesClraifications]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllOffersTemplatesClraifications]
AS
SELECT     dbo.OffersTemplatesClarifications.ID, dbo.OffersTemplatesClarifications.OfferTemplateID, dbo.OffersTemplatesClarifications.TypeOfSubmissionID, 
                      dbo.OffersTemplatesClarifications.SubmissionFrom, dbo.OffersTemplatesClarifications.SubmittedPersone, 
                      dbo.OffersTemplatesClarifications.ClarificationText, dbo.OffersTemplatesClarifications.UserName, dbo.OffersTemplatesClarifications.ModifiedDate, 
                      dbo.OffersTemplatesClarifictaionsSubmittedTypes.OfferTemplateClarificationSubmittedType, dbo.OffersTemplatesClarifications.ClarificationDate, 
                      dbo.OffersTemplatesClarifications.IsResponse, dbo.OffersTemplatesClarifications.OfferTemplateClarificationID
FROM         dbo.OffersTemplatesClarifications INNER JOIN
                      dbo.OffersTemplatesClarifictaionsSubmittedTypes ON 
                      dbo.OffersTemplatesClarifications.TypeOfSubmissionID = dbo.OffersTemplatesClarifictaionsSubmittedTypes.ID
