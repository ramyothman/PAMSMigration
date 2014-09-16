CREATE VIEW [dbo].[GetAllProjectsGuarantees]
AS
SELECT     dbo.ProjectsGuarantee.ID, dbo.ProjectsGuarantee.GuaranteeNumber, dbo.ProjectsGuarantee.InquiryNumber, dbo.ProjectsGuarantee.GuaranteeTypeID, 
                      dbo.ProjectsGuarantee.PercentageFromOffer, dbo.ProjectsGuarantee.Amount, dbo.ProjectsGuarantee.CurrencyID, dbo.ProjectsGuarantee.IssuingDate, 
                      dbo.ProjectsGuarantee.BankID, dbo.ProjectsGuarantee.BankBranch, dbo.ProjectsGuarantee.Remarks, dbo.ProjectsGuarantee.GuaranteeCopy, 
                      dbo.ProjectsGuarantee.NextStepID, dbo.ProjectsGuarantee.GuaranteeCurrentLocationID, dbo.ProjectsGuarantee.UserName, dbo.ProjectsGuarantee.ModifiedDate, 
                      dbo.GuaranteeDistinations.GuarnteeDistination, dbo.GuaranteeTypes.GuaranteeType, GuaranteeTypes_1.GuaranteeType AS NextStepType, 
                      dbo.ProjectsGuarantee.IssuingBy, dbo.ProjectsGuarantee.ExpiryDate, dbo.Suppliers.SupplierName AS IssuingByName, Person.PersonLanguages.DisplayName, 
                      dbo.Inquiries.ResponsibleEngineerID, dbo.Inquiries.CustomerID, dbo.Customers.CompanyName, dbo.Customers.CompanyCode, dbo.Inquiries.SupplierID, 
                      Suppliers_1.SupplierName, dbo.Inquiries.ShotecNo, dbo.ProjectsGuarantee.IsActive, dbo.GetMaxProjectGuranteeRenew(dbo.ProjectsGuarantee.ID) 
                      AS LastRenewDate, dbo.ProjectsGuarantee.CalculationMethod, dbo.ProjectsGuarantee.InActiveDate, dbo.Banks.BankCode, dbo.Currencies.CurrencyCode, 
                      dbo.Inquiries.ProjectTypeID, dbo.ProjectTypes.ProjectType, Person.PersonLanguages.LanguageId, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.ProjectsGuarantee.GuaranteeStatusID, 
                      dbo.ProjectsGuarantee.Validity, dbo.ProjectsGuarantee.TimePeriodID
FROM         dbo.ProjectsGuarantee INNER JOIN
                      dbo.GuaranteeTypes ON dbo.ProjectsGuarantee.GuaranteeTypeID = dbo.GuaranteeTypes.ID INNER JOIN
                      dbo.Inquiries ON dbo.ProjectsGuarantee.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                      Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      dbo.Suppliers AS Suppliers_1 ON dbo.Inquiries.SupplierID = Suppliers_1.SupplierID INNER JOIN
                      dbo.ProjectTypes ON dbo.Inquiries.ProjectTypeID = dbo.ProjectTypes.ID INNER JOIN
                      dbo.CompanyBranches INNER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND 
                      dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID AND dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID ON 
                      dbo.Inquiries.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                      dbo.Currencies ON dbo.ProjectsGuarantee.CurrencyID = dbo.Currencies.ID LEFT OUTER JOIN
                      dbo.Banks ON dbo.ProjectsGuarantee.BankID = dbo.Banks.ID LEFT OUTER JOIN
                      dbo.Suppliers ON dbo.ProjectsGuarantee.IssuingBy = dbo.Suppliers.SupplierID LEFT OUTER JOIN
                      dbo.GuaranteeDistinations ON dbo.ProjectsGuarantee.GuaranteeCurrentLocationID = dbo.GuaranteeDistinations.ID LEFT OUTER JOIN
                      dbo.GuaranteeTypes AS GuaranteeTypes_1 ON dbo.ProjectsGuarantee.NextStepID = GuaranteeTypes_1.ID
WHERE     (Person.PersonLanguages.LanguageId = 1)
