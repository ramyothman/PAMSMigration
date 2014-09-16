CREATE VIEW [dbo].[GetAllOffersTemplates]
AS
SELECT     dbo.OffersTemplates.ID, dbo.OffersTemplates.InquiryNumber, dbo.OffersTemplates.HeaderName, dbo.OffersTemplates.ClientContactPerson, 
                      dbo.OffersTemplates.HeaderDate, dbo.OffersTemplates.ValidUntil, dbo.OffersTemplates.HeaderText, dbo.OffersTemplates.DeliveryTime, 
                      dbo.OffersTemplates.PaymentTerms, dbo.OffersTemplates.DeliveryTerms, dbo.OffersTemplates.Taxes, dbo.OffersTemplates.OfferValidity, 
                      dbo.OffersTemplates.EndTemplate, dbo.OffersTemplates.TotalItemsValue, dbo.OffersTemplates.ItemsCurrencyID, dbo.OffersTemplates.ItemsComments, 
                      dbo.OffersTemplates.ItemsNotes, dbo.OffersTemplates.UserName, dbo.OffersTemplates.ModifiedDate, dbo.Inquiries.CustomerID, dbo.Customers.CompanyName, 
                      dbo.Customers.CompanyCode, dbo.Inquiries.ResponsibleEngineerID, dbo.OffersTemplates.ClientAddress, dbo.OffersTemplates.ClientCity, 
                      dbo.OffersTemplates.ClientPhone, dbo.OffersTemplates.ClientFax, dbo.OffersTemplates.RevisionNumber, dbo.OffersTemplates.HeaderTemplate, 
                      dbo.Inquiries.ShotecNo, dbo.OffersTemplates.IsFirstLanguage, dbo.OffersTemplates.ClientContactPersonTitle, dbo.OffersTemplates.OfferValidityPeriod, 
                      dbo.OffersTemplates.PreparedByEmpID, dbo.OffersTemplates.ApprovedByEmpID, Person.PersonLanguages.DisplayName, Person.PersonExtra.OfferPrepare, 
                      Person.PersonExtra.OfferApprove, PersonLanguages_1.DisplayName AS PreparedByEmployeeName, 
                      PersonLanguages_2.DisplayName AS ApprovedByEmployeeName, dbo.OffersTemplates.OfferValidityText
FROM         dbo.OffersTemplates INNER JOIN
                      dbo.Inquiries ON dbo.OffersTemplates.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                      Person.PersonExtra ON Person.PersonLanguages.PersonId = Person.PersonExtra.PersonID LEFT OUTER JOIN
                      Person.PersonLanguages AS PersonLanguages_2 ON dbo.OffersTemplates.ApprovedByEmpID = PersonLanguages_2.PersonId LEFT OUTER JOIN
                      Person.PersonLanguages AS PersonLanguages_1 ON dbo.OffersTemplates.PreparedByEmpID = PersonLanguages_1.PersonId
