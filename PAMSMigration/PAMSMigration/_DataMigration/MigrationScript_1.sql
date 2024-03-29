﻿
----------------------------------------------------------------------
----------------------------------------------------------------------
-- General --
----------------------------------------------------------------------
----------------------------------------------------------------------

-- Company Branches --
SET IDENTITY_INSERT [dbo].[CompanyBranches] ON;
INSERT INTO [dbo].[CompanyBranches]
           ([ID]
		   ,[BranchNameFL]
           ,[BranchNameSL]
           ,[StreetFL]
           ,[StateFL]
           ,[CityFL]
           ,[CountryFL]
           ,[StreetSL]
           ,[StateSL]
           ,[CitySL]
           ,[CountrySL]
           ,[ZipCode]
           ,[PostalCode]
           ,[Email]
           ,[CommercialRecord]
           ,[TaxCard]
           ,[TaxFile]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[WebSite]
           ,[Slogen]
           ,[BranchStatment]
           ,[Logo]
           ,[UserName]
           ,[ModifiedDate]
           ,[CurrencyExchangeLink]
           ,[FinancialYearStart]
           ,[FinancialYearEnd]
           ,[DueDateNumOfDays]
           ,[DeliveryTimeNumOfDays]
           ,[ExpiredGuaranteesNumOfDays]
           ,[PastProjectsNumOfDays]
           ,[BaseCurrencyID]
           ,[ConvertToCompletedProcess]
           ,[NumOfMinutesPerDay]
           ,[CountryID]
			)
     
Select [ID]
		   ,[BranchNameFL]
           ,[BranchNameSL]
           ,[StreetFL]
           ,[StateFL]
           ,[CityFL]
           ,[CountryFL]
           ,[StreetSL]
           ,[StateSL]
           ,[CitySL]
           ,[CountrySL]
           ,[ZipCode]
           ,[PostalCode]
           ,[Email]
           ,[CommercialRecord]
           ,[TaxCard]
           ,[TaxFile]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[WebSite]
           ,[Slogen]
           ,[BranchStatment]
           ,[Logo]
           ,[UserName]
           ,[ModifiedDate]
           ,[CurrencyExchangeLink]
           ,[FinancialYearStart]
           ,[FinancialYearEnd]
           ,[DueDateNumOfDays]
           ,[DeliveryTimeNumOfDays]
           ,[ExpiredGuaranteesNumOfDays]
           ,[PastProjectsNumOfDays]
           ,[BaseCurrencyID]
           ,[ConvertToCompletedProcess]
           ,[NumOfMinutesPerDay]
           ,[CountryID]
           
From [ShotecEgypt].[dbo].[CompanyBranches]

SET IDENTITY_INSERT [dbo].[CompanyBranches] OFF;
GO

update dbo.CompanyBranches set CountryID = 64 where CountryID = 1                      
update dbo.CompanyBranches set CountryID = 178 where CountryID = 2

GO
-- Data Migration for Table dbo.IDS --

SET IDENTITY_INSERT [dbo].[IDS] ON;

insert into [dbo].[IDS] (ID,InquiryNumber,OrderNumber,TransactionID)
select ID,InquiryNumber,OrderNumber,TransactionID from [ShotecEgypt].[dbo].[IDS] 

SET IDENTITY_INSERT [dbo].[IDS] OFF;

GO


-- Data Migration for Table dbo.Cities --

SET IDENTITY_INSERT [dbo].[Cities] ON;

insert into [dbo].[Cities] (ID,CountryRegionCode,City,UserName,ModifiedDate,EgyptID)
select ID,CountryRegionCode,City,UserName,ModifiedDate,ID from [ShotecEgypt].[dbo].[Cities] 

SET IDENTITY_INSERT [dbo].[Cities] OFF;

GO

-- Data Migration for Table dbo.Banks --

SET IDENTITY_INSERT [dbo].[Banks] ON;

insert into [dbo].[Banks] (BankCode,BankName,ID,EgyptID)
select BankCode,BankName,ID,ID from [ShotecEgypt].[dbo].[Banks] 

SET IDENTITY_INSERT [dbo].[Banks] OFF;

GO

insert into [dbo].BankBranches(BankID,BankAccountNumber,BranchID)
select ID,'',1 from ShotecEgypt.dbo.Banks
-- Migrating Category and Products

SET IDENTITY_INSERT [dbo].[Category] ON
Insert Into dbo.Category(CategoryID, Category2ID, Name, EgyptID, RPEID, QatarID)
select CategoryID, 0, CategoryName, CategoryID,0 , 0 From ShotecEgypt.dbo.Categories
SET IDENTITY_INSERT [dbo].[Category] Off


Insert Into dbo.Category(Category2ID, Name, EgyptProductID, RPEProductID, QatarProductID)
select Migration.fn_GetNewCategoryID(CategoryID, 0, 0), ProductName, ProductID,0 , 0 From ShotecEgypt.dbo.Products


-- Data Migration for Table dbo.ReportsStructures --

SET IDENTITY_INSERT [dbo].[ReportsStructures] ON;

insert into [dbo].[ReportsStructures] (ID,ReportName,ItemName,Path,Structure,DisplayName,IsGeneral,BranchID)
select ID,ReportName,ItemName,Path,Structure,DisplayName,IsGeneral,1 from [ShotecEgypt].[dbo].[ReportsStructures] 

SET IDENTITY_INSERT [dbo].[ReportsStructures] OFF;

GO


-- Data Migration for Table dbo.ReportConfiguration --

SET IDENTITY_INSERT [dbo].[ReportConfiguration] ON;

insert into [dbo].[ReportConfiguration] (ID,PrintCoverPage,PrintCoverPageLogo,PrintCoverPageSlogen,PrintCoverPageCompanyStatement,PrintFooterReportName,PrintFooterPageNumber,PrintFooterTodayDate,PrintDetailsLogo,PrintStartReportComment,PrintEndReportComment,ReportLeftMargin,ReportRightMargin,ReportTopMargin,ReportBottomMargin,UserName,ModifiedDate,StartCommentTemplate,EndCommentTemplate,BranchID)
select ID,PrintCoverPage,PrintCoverPageLogo,PrintCoverPageSlogen,PrintCoverPageCompanyStatement,PrintFooterReportName,PrintFooterPageNumber,PrintFooterTodayDate,PrintDetailsLogo,PrintStartReportComment,PrintEndReportComment,ReportLeftMargin,ReportRightMargin,ReportTopMargin,ReportBottomMargin,UserName,ModifiedDate,StartCommentTemplate,EndCommentTemplate,1 from [ShotecEgypt].[dbo].[ReportConfiguration] 

SET IDENTITY_INSERT [dbo].[ReportConfiguration] OFF;

GO

-- Data Migration for Table dbo.CompanySettings --

SET IDENTITY_INSERT [dbo].[CompanySettings] ON;

insert into [dbo].[CompanySettings] (ID,CompanyNameFL,CompanyNameSL,StreetFL,StateFL,CityFL,CountryFL,StreetSL,StateSL,CitySL,CountrySL,ZipCode,PostalCode,Email,CommercialRecord,TaxCard,TaxFile,Phone,Mobile,Fax,WebSite,Slogen,CompanyStatment,Logo,UserName,ModifiedDate,CurrencyExchangeLink,FinancialYearStart,FinancialYearEnd,DueDateNumOfDays,DeliveryTimeNumOfDays,ExpiredGuaranteesNumOfDays,PastProjectsNumOfDays,BaseCurrencyID,ConvertToCompletedProcess,NumOfMinutesPerDay,BranchID)
select ID,CompanyNameFL,CompanyNameSL,StreetFL,StateFL,CityFL,CountryFL,StreetSL,StateSL,CitySL,CountrySL,ZipCode,PostalCode,Email,CommercialRecord,TaxCard,TaxFile,Phone,Mobile,Fax,WebSite,Slogen,CompanyStatment,Logo,UserName,ModifiedDate,CurrencyExchangeLink,FinancialYearStart,FinancialYearEnd,DueDateNumOfDays,DeliveryTimeNumOfDays,ExpiredGuaranteesNumOfDays,PastProjectsNumOfDays,Migration.fn_GetNewCurrencyID(BaseCurrencyID, 0, 0),ConvertToCompletedProcess,NumOfMinutesPerDay,1 from [ShotecEgypt].[dbo].[CompanySettings] 

SET IDENTITY_INSERT [dbo].[CompanySettings] OFF;

GO
update dbo.CompanyBranches set Logo = (select Logo from CompanySettings)
GO
----------------------------------------------------
----------------------------------------------------
-- Security --
----------------------------------------------------
----------------------------------------------------

-- Data Migration for Table dbo.Roles --
insert into [dbo].[Roles] (Name,IsActive,LimitedSuppliers,BranchID,EgyptID)
select Name,IsActive,LimitedSuppliers,1,ID from [ShotecEgypt].[dbo].[Roles] 
GO


SELECT     ID, Migration.fn_GetNewRoleID(RoleId, 0, 0), PageID, SystemFunctionID
FROM         [ShotecEgypt].[dbo].[RolePrivileges]

-- Data Migration for Table dbo.RoleSuppliers --

--SET IDENTITY_INSERT [dbo].[RoleSuppliers] ON;
 
--insert into [dbo].[RoleSuppliers] (RoleSupplierId,RoleId,SupplierId)
--select RoleSupplierId,Migration.fn_GetNewRoleID(RoleId, 0, 0),Migration.fn_GetNewSupplierID(SupplierId, 0, 0) from [ShotecEgypt].[dbo].[RoleSuppliers] 

--SET IDENTITY_INSERT [dbo].[RoleSuppliers] OFF;

--GO



----------------------------------------------------------------------
----------------------------------------------------------------------
-- Persons --
----------------------------------------------------------------------
----------------------------------------------------------------------

-- Data Migration for Table Person.BusinessEntity --

insert into [Person].[BusinessEntity] (RowGuid,ModifiedDate,EgyptBusinessEntityID)
select RowGuid,ModifiedDate,BusinessEntityId from [ShotecEgypt].[Person].[BusinessEntity] 

GO

-- Data Migration for Table Person.Person --
insert into [Person].[Person] (BusinessEntityId,NameStyle,EmailPromotion,RowGuid,ModifiedDate,CreatedDate,PersonImage,IsActive)
select Migration.[fn_GetNewPersonID](BusinessEntityId, 0, 0),NameStyle,EmailPromotion,RowGuid,ModifiedDate,CreatedDate,PersonImage,IsActive from [ShotecEgypt].[Person].[Person] 
GO


-- Data Migration for Table Person.Address --

SET IDENTITY_INSERT [Person].[Address] ON;

insert into [Person].[Address] (AddressId,CountryRegionCode,StateProvinceId,PostalCode,ZipCode,SpatialLocation,RowGuid,ModifiedDate,EgyptID)
select AddressId,CountryRegionCode,StateProvinceId,PostalCode,ZipCode,SpatialLocation,RowGuid,ModifiedDate,AddressId from [ShotecEgypt].[Person].[Address] 

SET IDENTITY_INSERT [Person].[Address] OFF;

GO

-- Data Migration for Table Person.BusinessEntityAddress --

SET IDENTITY_INSERT [Person].[BusinessEntityAddress] ON;

insert into [Person].[BusinessEntityAddress] (BusinessEntityAddressId,BusinessEntityId,AddressId,AddressTypeId,RowGuid,ModifiedDate,MainAddress)
select BusinessEntityAddressId,Migration.[fn_GetNewPersonID](BusinessEntityId, 0, 0),Migration.fn_GetNewAddressID(AddressId, 0, 0),AddressTypeId,RowGuid,ModifiedDate,MainAddress from [ShotecEgypt].[Person].[BusinessEntityAddress] 

SET IDENTITY_INSERT [Person].[BusinessEntityAddress] OFF;

GO

-- Data Migration for Table Person.Credential --
insert into [Person].[Credential] (BusinessEntityId,Username,PasswordHash,PasswordSalt,ActivationCode,IsActivated,IsActive,RowGuid,ModifiedDate)
select Migration.[fn_GetNewPersonID](BusinessEntityId, 0, 0),Username,PasswordHash,PasswordSalt,ActivationCode,IsActivated,IsActive,RowGuid,ModifiedDate from [ShotecEgypt].[Person].[Credential] 
GO


-- Data Migration for Table Person.EmailAddress --

SET IDENTITY_INSERT [Person].[EmailAddress] ON;

insert into [Person].[EmailAddress] (EmailAddressId,BusinessEntityId,EmailAddressTypeId,Email,EmailVerified,EmailVerificationHash,RowGuid,ModifiedDate,MainEmailAddress)
select EmailAddressId,Migration.[fn_GetNewPersonID](BusinessEntityId, 0, 0),EmailAddressTypeId,Email,EmailVerified,EmailVerificationHash,RowGuid,ModifiedDate,MainEmailAddress from [ShotecEgypt].[Person].[EmailAddress] 

SET IDENTITY_INSERT [Person].[EmailAddress] OFF;

GO

-- Data Migration for Table Person.PersonEducation --

SET IDENTITY_INSERT [Person].[PersonEducation] ON;

insert into [Person].[PersonEducation] (PersonEducationId,PersonId,InstitutionName,Degree,StartDate,GraduationDate,FinalGrade,EducationTypeID)
select PersonEducationId,Migration.[fn_GetNewPersonID](PersonId, 0, 0),InstitutionName,Degree,StartDate,GraduationDate,FinalGrade,EducationTypeID from [ShotecEgypt].[Person].[PersonEducation] 

SET IDENTITY_INSERT [Person].[PersonEducation] OFF;

GO

-- Data Migration for Table dbo.ConcurrentUsers --

SET IDENTITY_INSERT [dbo].[ConcurrentUsers] ON;

insert into [dbo].[ConcurrentUsers] (ID,UserID,IPAddress,LoginDate,IsIn,LogoutDate,IsSuspended,SuspensionDate,PulseDate,UserName,ModifiedDate,BranchID)
select ID,Migration.[fn_GetNewPersonID](UserID, 0, 0),IPAddress,LoginDate,IsIn,LogoutDate,IsSuspended,SuspensionDate,PulseDate,UserName,ModifiedDate,1 from [ShotecEgypt].[dbo].[ConcurrentUsers] 

SET IDENTITY_INSERT [dbo].[ConcurrentUsers] OFF;

GO

-- Data Migration for Table Person.PersonExtra --
insert into [Person].[PersonExtra] (PersonID,NationalityCode,Gender,Religion,BirthDate,BirthPlace,MaritalStatus,SpauseName,EmergencyContactName,EmergencyContactAddress,EmergencyContactNumber,EmergencyContactEmail,HireDate,LeaveDate,IsResponsibleEngineer,Position,Salary,SalaryCurrencyID,ManagerId,OfferApprove,OfferPrepare,OtherInformation,NumOfVacation,EmployeeTypeID,BranchID)
select Migration.[fn_GetNewPersonID](PersonID, 0, 0),NationalityCode,Gender,Religion,BirthDate,BirthPlace,MaritalStatus,SpauseName,EmergencyContactName,EmergencyContactAddress,EmergencyContactNumber,EmergencyContactEmail,HireDate,LeaveDate,IsResponsibleEngineer,Position,Salary,SalaryCurrencyID,ManagerId,OfferApprove,OfferPrepare,OtherInformation,NumOfVacation,EmployeeTypeID,1 from [ShotecEgypt].[Person].[PersonExtra] 
GO

-- Data Migration for Table Person.PersonPhone --

SET IDENTITY_INSERT [Person].[PersonPhone] ON;

insert into [Person].[PersonPhone] (PersonPhoneId,BusinessEntityId,PhoneNumber,PhoneNumberTypeId,ModifiedDate,PhoneVerified,PhoneVerificationCode,MainPhone)
select PersonPhoneId,Migration.[fn_GetNewPersonID](BusinessEntityId, 0, 0),PhoneNumber,PhoneNumberTypeId,ModifiedDate,PhoneVerified,PhoneVerificationCode,MainPhone from [ShotecEgypt].[Person].[PersonPhone] 

SET IDENTITY_INSERT [Person].[PersonPhone] OFF;

GO

-- Data Migration for Table dbo.PersonsBranches --

SET IDENTITY_INSERT [dbo].[PersonsBranches] ON;

insert into [dbo].[PersonsBranches] (ID,PersonID,BranchID,DefaultBranch,UserName,ModifiedDate)
select ID,Migration.[fn_GetNewPersonID](PersonID, 0, 0),1,DefaultBranch,UserName,ModifiedDate from [ShotecEgypt].[dbo].[PersonsBranches] 

SET IDENTITY_INSERT [dbo].[PersonsBranches] OFF;

GO

insert into [Person].[PersonLanguages] (PersonId,LanguageId,Title,FirstName,MiddleName,LastName,Suffix,DisplayName)
select Migration.[fn_GetNewPersonID](PersonID, 0, 0),LanguageId,Title,FirstName,MiddleName,LastName,Suffix,DisplayName from [ShotecEgypt].[Person].[PersonLanguages] 

GO

-- Data Migration for Table Person.PersonPersonTypes --



insert into [Person].[PersonType] (BusinessEntityId,PersonPersonTypesId,ModifiedDate)
select Migration.[fn_GetNewPersonID](BusinessEntityId, 0, 0),PersonPersonTypesId,ModifiedDate from [ShotecEgypt].[Person].[PersonType] 

GO

-- Data Migration for Table dbo.UserRoles --
insert into [dbo].[UserRoles] (RoleID,UserID)
select Migration.fn_GetNewRoleID(RoleID, 0, 0),Migration.fn_GetNewPersonID(UserID, 0, 0) from [ShotecEgypt].[dbo].[UserRoles] 
where Migration.fn_GetNewPersonID(UserID, 0, 0) IN (select BusinessEntityID From Person.[Credential])
GO


update Person.PersonLanguages set AcronymName  = SUBSTRING(firstname,1,1)  + SUBSTRING(MiddleName,1,1)+ SUBSTRING(LastName,1,1)
where AcronymName is null
GO

----------------------------------------------------------------------
----------------------------------------------------------------------
-- Customers --
----------------------------------------------------------------------
----------------------------------------------------------------------

-- Data Migration for Table dbo.Customers --

SET IDENTITY_INSERT [dbo].[Customers] ON;

insert into [dbo].[Customers] (CustomerID,CompanyName,CompanyWebSite,ContactTitle,ContactName,ContactDisplayName,ContactHomePhone,ContactWorkPhone,ContactMobile,ContactEmail,ContactAddress,ContactCountry,ContactCity,ContactZip,ContactFax,UserName,ModifiedDate,CompanyCode,CustomerTypeID,CustomerMarketID,EgyptID)
select CustomerID,CompanyName,CompanyWebSite,ContactTitle,ContactName,ContactDisplayName,ContactHomePhone,ContactWorkPhone,ContactMobile,ContactEmail,ContactAddress,ContactCountry,ContactCity,ContactZip,ContactFax,UserName,ModifiedDate,CompanyCode,CustomerTypeID,(case when CustomerMarketID = 16 then 14 else CustomerMarketID end) as CustomerMarketID,CustomerID from [ShotecEgypt].[dbo].[Customers] 

SET IDENTITY_INSERT [dbo].[Customers] OFF;

GO


-- Data Migration for Table dbo.CustomerAddress --

SET IDENTITY_INSERT [dbo].[CustomerAddress] ON;

insert into [dbo].[CustomerAddress] (CustomerAddressID,CustomerID,AddressTypeID,Address,CountryRegionCode,CityID,PostalCode,ZipCode,UserName,ModifiedDate,MainAddress)
select CustomerAddressID,Migration.fn_GetNewCustomerID(CustomerID, 0, 0),AddressTypeID,Address,CountryRegionCode,CityID,PostalCode,ZipCode,UserName,ModifiedDate,MainAddress from [ShotecEgypt].[dbo].[CustomerAddress] 

SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF;

GO



-- Data Migration for Table dbo.CustomersEmailAddress --

SET IDENTITY_INSERT [dbo].[CustomersEmailAddress] ON;

insert into [dbo].[CustomersEmailAddress] (CustomerEmailAddressID,CustomerID,EmailAddressTypeId,Email,ModifiedDate,MainEmailAddress)
select CustomerEmailAddressID,Migration.fn_GetNewCustomerID(CustomerID, 0, 0),EmailAddressTypeId,Email,ModifiedDate,MainEmailAddress from [ShotecEgypt].[dbo].[CustomersEmailAddress] 

SET IDENTITY_INSERT [dbo].[CustomersEmailAddress] OFF;

GO


-- Data Migration for Table dbo.CustomersPhones --

SET IDENTITY_INSERT [dbo].[CustomersPhones] ON;

insert into [dbo].[CustomersPhones] (CustomerPhoneID,CustomerID,PhoneNumber,PhoneNumberTypeId,ModifiedDate,MainPhone,UserName)
select CustomerPhoneID,Migration.fn_GetNewCustomerID(CustomerID, 0, 0),PhoneNumber,PhoneNumberTypeId,ModifiedDate,MainPhone,UserName from [ShotecEgypt].[dbo].[CustomersPhones] 

SET IDENTITY_INSERT [dbo].[CustomersPhones] OFF;

GO

-- Data Migration for Table dbo.CustomerBranches --

SET IDENTITY_INSERT [dbo].[CustomerBranches] ON;

insert into [dbo].[CustomerBranches] (CustomerBranchID,CustomerID,BranchID)
select CustomerBranchID,Migration.fn_GetNewCustomerID(CustomerID, 0, 0),1 from [ShotecEgypt].[dbo].[CustomerBranches] 

SET IDENTITY_INSERT [dbo].[CustomerBranches] OFF;

GO

----------------------------------------------------------------------
----------------------------------------------------------------------
-- Suppliers--
----------------------------------------------------------------------
----------------------------------------------------------------------
insert into Person.BusinessEntity (SupplierEgyptID)
select SupplierID From [ShotecEgypt].[dbo].[Suppliers] 
-- Data Migration for Table dbo.Suppliers --

insert into [dbo].[Suppliers] (SupplierID,SupplierName,SupplierWebSite,ContactTitle,ContactName,ContactDisplayName,ContactHomePhone,ContactWorkPhone,ContactMobile,ContactEmail,ContactAddress,ContactCountry,ContactCity,ContactZip,ContactFax,UserName,ModifiedDate,HasSubSuppliers,Logo,IsPrincipale,CurrentCompany,SupplierTypeID,IsGeneral,EgyptID)
select [Migration].[fn_GetNewSupplierID](SupplierID, 0, 0),SupplierName,SupplierWebSite,ContactTitle,ContactName,ContactDisplayName,ContactHomePhone,ContactWorkPhone,ContactMobile,ContactEmail,ContactAddress,ContactCountry,ContactCity,ContactZip,ContactFax,UserName,ModifiedDate,HasSubSuppliers,Logo,IsPrincipale,CurrentCompany,SupplierTypeID,IsGeneral,SupplierID from [ShotecEgypt].[dbo].[Suppliers] 

GO
update CompanyBranches Set SupplierID = (Select SupplierID from Suppliers where Suppliers.CurrentCompany = 1)
GO
-- Data Migration for Table dbo.SupplierBranch --



insert into [dbo].[SupplierBranch] (SupplierID,BranchID)
select Migration.fn_GetNewSupplierID(SupplierID, 0, 0),1 from [ShotecEgypt].[dbo].[Suppliers] 


GO

-- Data Migration for Table dbo.SupplierAddress --

SET IDENTITY_INSERT [dbo].[SupplierAddress] ON;

insert into [dbo].[SupplierAddress] (SupplierAddressID,SupplierID,AddressTypeID,Address,CountryRegionCode,CityID,PostalCode,ZipCode,UserName,ModifiedDate,MainAddress)
select SupplierAddressID,Migration.fn_GetNewSupplierID(SupplierID, 0, 0),AddressTypeID,Address,CountryRegionCode,CityID,PostalCode,ZipCode,UserName,ModifiedDate,MainAddress from [ShotecEgypt].[dbo].[SupplierAddress] 

SET IDENTITY_INSERT [dbo].[SupplierAddress] OFF;

GO


-- Data Migration for Table dbo.SuppliersTargets --

SET IDENTITY_INSERT [dbo].[SuppliersTargets] ON;

insert into [dbo].[SuppliersTargets] (ID,SupplierID,Year,Value,UserName,ModifiedDate,BranchID)
select ID,Migration.fn_GetNewSupplierID(SupplierID, 0, 0),Year,Value,UserName,ModifiedDate,1 from [ShotecEgypt].[dbo].[SuppliersTargets] 

SET IDENTITY_INSERT [dbo].[SuppliersTargets] OFF;

GO

-- Data Migration for Table dbo.SuppliersEmailAddress --

SET IDENTITY_INSERT [dbo].[SuppliersEmailAddress] ON;

insert into [dbo].[SuppliersEmailAddress] (SupplierEmailAddressID,SupplierID,EmailAddressTypeId,Email,ModifiedDate,UserName,MainEmailAddress)
select SupplierEmailAddressID,Migration.fn_GetNewSupplierID(SupplierID, 0, 0),EmailAddressTypeId,Email,ModifiedDate,UserName,MainEmailAddress from [ShotecEgypt].[dbo].[SuppliersEmailAddress] 

SET IDENTITY_INSERT [dbo].[SuppliersEmailAddress] OFF;

GO

-- Data Migration for Table dbo.SuppliersPhones --

SET IDENTITY_INSERT [dbo].[SuppliersPhones] ON;

insert into [dbo].[SuppliersPhones] (SupplierPhoneID,SupplierID,PhoneNumber,PhoneNumberTypeId,ModifiedDate,MainPhone,UserName)
select SupplierPhoneID,Migration.fn_GetNewSupplierID(SupplierID, 0, 0),PhoneNumber,PhoneNumberTypeId,ModifiedDate,MainPhone,UserName from [ShotecEgypt].[dbo].[SuppliersPhones] 

SET IDENTITY_INSERT [dbo].[SuppliersPhones] OFF;

GO


-- Data Migration for Table dbo.CustomerSupplierRegistration --

SET IDENTITY_INSERT [dbo].[CustomerSupplierRegistration] ON;

insert into [dbo].[CustomerSupplierRegistration] (ID,CustomerID,SupplierID,RegistrationDate,IsRegistered,DeRegistrationDate,UserName,ModifiedDate,RegistrationStatusID,BranchID,EgyptID)
select ID,Migration.fn_GetNewCustomerID(CustomerID, 0, 0),Migration.fn_GetNewSupplierID(SupplierID, 0, 0),RegistrationDate,IsRegistered,DeRegistrationDate,UserName,ModifiedDate,RegistrationStatusID,1,ID from [ShotecEgypt].[dbo].[CustomerSupplierRegistration] 

SET IDENTITY_INSERT [dbo].[CustomerSupplierRegistration] OFF;

GO

----------------------------------------------------------------------
----------------------------------------------------------------------
-- Projects --
----------------------------------------------------------------------
----------------------------------------------------------------------

-- Data Migration for Table dbo.Projects --

SET IDENTITY_INSERT [dbo].[Projects] ON;

insert into [dbo].[Projects] (ProjectCode,ProjectName,ProjectLocation,ProjectDescription,ContactTitle,ContactName,ContactHomePhone,ContactWorkPhone,ContactMobile,ContactEmail,ContactAddress,ContactCountry,ContactCity,ContactZip,ContactFax,UserName,ModifiedDate,ID,FinalProduct,StartDate,EstimatedCost,EstimatedCostCurrencyID,Shareholders,LicenseBy,EngineeringBy,ProcurementBy,Contractor,EPC,VendorlistBy,ProjectStatusID,ContactCompany,ContactPosition,OwnerID,EngineeringByID,ProcurementByID,ContractorID,BranchID,EgyptID)
select                        ProjectCode,ProjectName,ProjectLocation,ProjectDescription,ContactTitle,ContactName,ContactHomePhone,ContactWorkPhone,ContactMobile,ContactEmail,ContactAddress,ContactCountry,ContactCity,ContactZip,ContactFax,UserName,ModifiedDate,ID,FinalProduct,StartDate,EstimatedCost,EstimatedCostCurrencyID,Shareholders,LicenseBy,EngineeringBy,ProcurementBy,Contractor,EPC,VendorlistBy,ProjectStatusID,ContactCompany,ContactPosition,Migration.fn_GetNewSupplierID(OwnerID, 0, 0),Migration.fn_GetNewSupplierID(EngineeringByID, 0, 0),Migration.fn_GetNewSupplierID(ProcurementByID, 0, 0),Migration.fn_GetNewSupplierID(ContractorID, 0, 0),1,ID from [ShotecEgypt].[dbo].[Projects] 

SET IDENTITY_INSERT [dbo].[Projects] OFF;

GO

-- Data Migration for Table dbo.ProjectsLog --

SET IDENTITY_INSERT [dbo].[ProjectsLog] ON;

insert into [dbo].[ProjectsLog] (ID,ProjectID,SerializeObject,VersionNumber,UserName,ModifiedDate,EgyptID)
select ID,Migration.fn_GetNewProjectID(ProjectID, 0, 0),SerializeObject,VersionNumber,UserName,ModifiedDate,ID from [ShotecEgypt].[dbo].[ProjectsLog] 

SET IDENTITY_INSERT [dbo].[ProjectsLog] OFF;

GO


-- Data Migration for Table dbo.UsersProjectsLog --
insert into [dbo].[UsersProjectsLog] (UserID,ProjectLogID,IsViewed,ViewedDate)
select Migration.[fn_GetNewPersonID](UserID, 0, 0),Migration.fn_GetProjectLogID(ProjectLogID, 0, 0),IsViewed,ViewedDate from [ShotecEgypt].[dbo].[UsersProjectsLog] 
GO


-- Data Migration for Table dbo.PrincipalProjectsComments --

SET IDENTITY_INSERT [dbo].[PrincipalProjectsComments] ON;

insert into [dbo].[PrincipalProjectsComments] (ID,CommentedByID,InquiryNumber,Comment,UserName,ModifiedDate)
select ID,Migration.[fn_GetNewPersonID](CommentedByID, 0, 0),InquiryNumber,Comment,UserName,ModifiedDate from [ShotecEgypt].[dbo].[PrincipalProjectsComments] 

SET IDENTITY_INSERT [dbo].[PrincipalProjectsComments] OFF;

GO

-- Data Migration for Table dbo.ProjectsComments --

SET IDENTITY_INSERT [dbo].[ProjectsComments] ON;

insert into [dbo].[ProjectsComments] (ProjectCommentID,ProjectID,Comment,UserName,ModifiedDate,EgyptID)
select ProjectCommentID,Migration.fn_GetNewProjectID(ProjectID, 0, 0),Comment,UserName,ModifiedDate,ProjectCommentID from [ShotecEgypt].[dbo].[ProjectsComments] 

SET IDENTITY_INSERT [dbo].[ProjectsComments] OFF;

GO


 
----------------------------------------------------------------------
----------------------------------------------------------------------
-- Jobs     --
----------------------------------------------------------------------
----------------------------------------------------------------------
-- Data Migration for Table dbo.Inquiries --
insert into [dbo].[Inquiries] (InquiryNumber,ResponsibleEngineerID ,CustomerID,CustomerInquiryNumber,ProductID,InquiryDate,BidDueDate,SupplierID,SupplierQuotationNumber,QuotationPrice,RateToEuro,ONDate,QuotationPriceInEuro,Comment,UserName,ModifiedDate,ProductDescription,ShotecNo,OnHold,InquiryStatusID,OrderPercentage,ProjectTypeID,IsSubOffer,ParentInquiryNumber,OfferDate,ProductTypeID,LostPercentage,CancelledPercentage,LateResponsePercentage,OrderChanceID,HasGuarantee,ProjectID,InquiryTypeID,CurrencyID,FileNo,BranchID,EgyptID)
select InquiryNumber,Migration.[fn_GetNewPersonID](ResponsibleEngineerID,0,0),Migration.fn_GetNewCustomerID(CustomerID, 0, 0),CustomerInquiryNumber,Migration.fn_GetNewProductID(ProductID,0,0),InquiryDate,BidDueDate,Migration.fn_GetNewSupplierID(SupplierID, 0, 0),SupplierQuotationNumber,QuotationPrice,RateToEuro,ONDate,QuotationPriceInEuro,Comment,UserName,ModifiedDate,ProductDescription,ShotecNo,OnHold,InquiryStatusID,OrderPercentage,
(case when ProjectTypeID = 9 OR ProjectTypeID = 10 then 5 else case when ProjectTypeID = 8 then 4 else ProjectTypeID end end) as ProjectTypeID
,IsSubOffer,ParentInquiryNumber,OfferDate,
(case when ProductTypeID = 4 then 1 else ProductTypeID end) as ProductTypeID,
LostPercentage,CancelledPercentage,LateResponsePercentage,OrderChanceID,HasGuarantee,Migration.fn_GetNewProjectID(ProjectID,0,0),(case when InquiryTypeID = 3 then 1 else InquiryTypeID end) as InquiryTypeID,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),FileNo,1,InquiryNumber from [ShotecEgypt].[dbo].[Inquiries] 
GO


-- Data Migration for Table dbo.InquiriesComments --

SET IDENTITY_INSERT [dbo].[InquiriesComments] ON;

insert into [dbo].[InquiriesComments] (ID,InquiryNumber,Comment,UserName,ModifiedDate,ProjectTypeID)
select ID,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),Comment,UserName,ModifiedDate,(case when ProjectTypeID = 9 OR ProjectTypeID = 10 then 5 else case when ProjectTypeID = 8 then 4 else ProjectTypeID end end) as ProjectTypeID from [ShotecEgypt].[dbo].[InquiriesComments] 

SET IDENTITY_INSERT [dbo].[InquiriesComments] OFF;

GO

-- Data Migration for Table dbo.DocumentsJobs --

SET IDENTITY_INSERT [dbo].[DocumentsJobs] ON;

insert into [dbo].[DocumentsJobs] (ID,InquiryNumber,DocName,DocTypeID,EgyptID)
select ID,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),DocName,DocTypeID,ID from [ShotecEgypt].[dbo].[DocumentsJobs] 

SET IDENTITY_INSERT [dbo].[DocumentsJobs] OFF;

GO

-- Data Migration for Table dbo.DocumentsJobsVersions --

SET IDENTITY_INSERT [dbo].[DocumentsJobsVersions] ON;

insert into [dbo].[DocumentsJobsVersions] (ID,DocID,[FileName],DocumentData,VersionNo,UserName,ModifiedDate)
select ID,Migration.fn_GetNewDocID(DocID,0,0),[FileName],DocumentData,VersionNo,UserName,ModifiedDate from [ShotecEgypt].[dbo].[DocumentsJobsVersions] 

SET IDENTITY_INSERT [dbo].[DocumentsJobsVersions] OFF;

GO


-- Data Migration for Table dbo.Orders --
insert into [dbo].[Orders] (InquiryNumber,OrderNumber,CustomerOrderNumber,SupplierOrderNumber,OrderDate,DeliveryTime,ExpansionDeliveryDate,Price,RateToEuro,ONDate,PriceInEuro,DeliveredON,Delivered,Comment,UserName,ModifiedDate,PriceCommissionBase,PercentPriceCommissionBase,OrderStatusID,IsSubOrder,ParentOrderNumber,BackLog,CompletedGoodsPaidON,IsCompletedGoodsPaid,HasGuarantee,PriceBaseID,CurrencyID,PaymentTypeID,EgyptID)
select Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),OrderNumber,CustomerOrderNumber,SupplierOrderNumber,OrderDate,DeliveryTime,ExpansionDeliveryDate,Price,RateToEuro,ONDate,PriceInEuro,DeliveredON,Delivered,Comment,UserName,ModifiedDate,PriceCommissionBase,PercentPriceCommissionBase,OrderStatusID,IsSubOrder,ParentOrderNumber,BackLog,CompletedGoodsPaidON,IsCompletedGoodsPaid,HasGuarantee,PriceBaseID,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),PaymentTypeID,InquiryNumber from [ShotecEgypt].[dbo].[Orders] 
GO


-- Data Migration for Table dbo.Losts --
Update [dbo].[Inquiries] set ProjectTypeID = 6 
where Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0') IN (select InquiryNumber from ShotecEgypt.dbo.Losts where LostReasonID = 2)

Update [dbo].[Inquiries] set ProjectTypeID = 7
where Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0') IN (select InquiryNumber from ShotecEgypt.dbo.Losts where LostReasonID = 6)

update Inquiries Set PriceBaseID = o.PriceBaseID, PaymentBaseID = o.PaymentTypeID 
From Inquiries inner join Orders as o on Inquiries.InquiryNumber = o.InquiryNumber

GO
SET IDENTITY_INSERT [dbo].[Losts] ON;

insert into [dbo].[Losts] (LostID,InquiryNumber,Comment,UserName,ModifiedDate,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,IsSubLost,ParentInquiryNumber,LostComment,LostPrice,LostPriceRateToEuro,LostPriceRateDate,LostPriceInEuro,WinnerPriceCurrencyID,LostPriceCurrencyID,LostReasonID,EgyptID)
select LostID,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),Comment,UserName,ModifiedDate,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,IsSubLost,ParentInquiryNumber,LostComment,LostPrice,LostPriceRateToEuro,LostPriceRateDate,LostPriceInEuro,Migration.fn_GetNewCurrencyID(WinnerPriceCurrencyID, 0, 0),Migration.fn_GetNewCurrencyID(LostPriceCurrencyID, 0, 0),(case when LostReasonID = 2 or LostReasonID = 6 then null else case when LostReasonID = 1 then 3 else [Migration].[fn_GetNewLostReasonID](LostReasonID,0,0) end end ) as LostReasonID,LostID from [ShotecEgypt].[dbo].[Losts] 

SET IDENTITY_INSERT [dbo].[Losts] OFF;

GO

-- Data Migration for Table dbo.Transactions --
insert into [dbo].[Transactions] (TransactionID,SupplierID,InquiryCode,Amount,TransactionDate,Reason,Reference,RateToEuro,AmountInEuro,CurrencyID,BankID,BranchID,EgyptID)
select TransactionID,SupplierID,InquiryCode,Amount,TransactionDate,Reason,Reference,RateToEuro,AmountInEuro,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),Migration.fn_GetNewBankID(BankID, 0, 0),1,TransactionID from [ShotecEgypt].[dbo].[Transactions] 
GO

-- Data Migration for Table dbo.CommissionPayments --
insert into [dbo].[CommissionPayments] (InquiryNumber,TransactionID,CommissionPaymentNumber,PaidCommissionAmount,ONDate,RateToEuro,PaidCommissionAmountInEuro,SumPaidCommissionAmountInEuro,DueCommissionAmountInEuro,Comment,UserName,ModifiedDate,CurrencyID,BankID)
select InquiryNumber,Migration.fn_GetNewTransactionID( TransactionID, '0', '0'),CommissionPaymentNumber,PaidCommissionAmount,ONDate,RateToEuro,PaidCommissionAmountInEuro,SumPaidCommissionAmountInEuro,DueCommissionAmountInEuro,Comment,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),Migration.fn_GetNewBankID(BankID,0,0) from [ShotecEgypt].[dbo].[CommissionPayments] 
GO


-- Data Migration for Table dbo.CompletedProjects --
insert into [dbo].[CompletedProjects] (InquiryNumber,HasCommission,IsAllGuranteesClosed,GuaranteesClosedDate,IsAllCommissionPaid,AllCommssionPaidDate,UserName,ModifiedDate)
select Migration.fn_GetNewInquiryNumber(InquiryNumber, 0, 0),HasCommission,IsAllGuranteesClosed,GuaranteesClosedDate,IsAllCommissionPaid,AllCommssionPaidDate,UserName,ModifiedDate from [ShotecEgypt].[dbo].[CompletedProjects] 
GO

-- Data Migration for Table dbo.ProjectsGuarantee --

SET IDENTITY_INSERT [dbo].[ProjectsGuarantee] ON;

insert into [dbo].[ProjectsGuarantee] (ID,GuaranteeNumber,InquiryNumber,GuaranteeTypeID,PercentageFromOffer,Amount,IssuingDate,BankBranch,Remarks,GuaranteeCopy,NextStepID,GuaranteeCurrentLocationID,UserName,ModifiedDate,ExpiryDate,IsActive,IssuingBy,CalculationMethod,CurrencyID,BankID,InActiveDate,EgyptID)
select ID,GuaranteeNumber,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),GuaranteeTypeID,PercentageFromOffer,Amount,IssuingDate,BankBranch,Remarks,GuaranteeCopy,NextStepID,GuaranteeCurrentLocationID,UserName,ModifiedDate,ExpiryDate,IsActive,Migration.fn_GetNewSupplierID(IssuingBy,0,0),CalculationMethod,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),Migration.fn_GetNewBankID(BankID, 0, 0),InActiveDate,ID from [ShotecEgypt].[dbo].[ProjectsGuarantee] 

SET IDENTITY_INSERT [dbo].[ProjectsGuarantee] OFF;

GO

update ProjectsGuarantee set GuaranteeStatusID = 3 where isactive = 0
 GO

 update ProjectsGuarantee set GuaranteeStatusID = 1 where IssuingDate is null
 GO

 update ProjectsGuarantee set GuaranteeStatusID = 2 where GuaranteeStatusID is null
 GO

SET IDENTITY_INSERT [dbo].[ProjectsGuaranteeRenews] ON;

insert into [dbo].[ProjectsGuaranteeRenews] (ID,GuaranteeID,RenewDate,UserName,ModifiedDate)
select ID,Migration.fn_GetNewGuranteeID(GuaranteeID, 0, 0),RenewDate,UserName,ModifiedDate from [ShotecEgypt].[dbo].[ProjectsGuaranteeRenews] 

SET IDENTITY_INSERT [dbo].[ProjectsGuaranteeRenews] OFF;

GO

-- Data Migration for Table dbo.CustomerPayments --

SET IDENTITY_INSERT [dbo].[CustomerPayments] ON;

insert into [dbo].[CustomerPayments] (CustomerPaymentID,InquiryNumber,PaymentNumber,PaidAmount,ONDate,SumPaid,Deduction,DeductionNumber,DeductionAmount,Reason,SumDeduction,RestPayment,Comment,UserName,ModifiedDate,PaidAmountRateToEuro,PaidAmountInEuro,PaidAmountRateDate,DeductionAmountRateToEuro,DeductionAmountInEuro,DeductionAmountRateDate,PaidAmountCurrencyID,DeductionAmountCurrencyID,InvoiceNumber)
select CustomerPaymentID,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),PaymentNumber,PaidAmount,ONDate,SumPaid,Deduction,DeductionNumber,DeductionAmount,Reason,SumDeduction,RestPayment,Comment,UserName,ModifiedDate,PaidAmountRateToEuro,PaidAmountInEuro,PaidAmountRateDate,DeductionAmountRateToEuro,DeductionAmountInEuro,DeductionAmountRateDate,Migration.fn_GetNewCurrencyID(PaidAmountCurrencyID, 0, 0),Migration.fn_GetNewCurrencyID(DeductionAmountCurrencyID, 0, 0),InvoiceNumber from [ShotecEgypt].[dbo].[CustomerPayments] 
where Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0') in (select InquiryNumber from dbo.Inquiries)

SET IDENTITY_INSERT [dbo].[CustomerPayments] OFF;

GO
update CustomerPayments set currencyid = PaidAmountCurrencyID 
Go

-- Data Migration for Table dbo.Commissions --


insert into [dbo].[CustomerPayments] (InquiryNumber,PaymentNumber,PaidAmount,ONDate,SumPaid,Deduction,DeductionNumber,DeductionAmount,Reason,SumDeduction,RestPayment,Comment,UserName,ModifiedDate,PaidAmountRateToEuro,PaidAmountInEuro,PaidAmountRateDate,DeductionAmountRateToEuro,DeductionAmountInEuro,DeductionAmountRateDate,PaidAmountCurrencyID,DeductionAmountCurrencyID,InvoiceNumber)
select InquiryNumber,0,0,ONDate,0,0,0,0,'',0,CommissionAmountInEuro,'',UserName,ModifiedDate,RateToEuro,0,ONDate,0,0,OnDate,CurrencyID,CurrencyID,'' from 
(select c.CustomerPaymentID,Migration.fn_GetNewInquiryNumber(com.InquiryNumber, 0, 0) as InquiryNumber,com.PriceCommissionBase,com.PercentPriceCommissionBase,com.CommissionPercent,com.CommissionAmount,com.RateToEuro,com.ONDate,com.CommissionAmountInEuro,com.Comment,com.Paid,com.UserName,com.ModifiedDate,com.MinPriceCommissionBase,com.MinPercentPriceCommissionBase,com.MinCommissionAmount,com.MinPercentCommissionAmount,Migration.fn_GetNewBankID(com.BankID, 0, 0) as BankID,Migration.fn_GetNewCurrencyID(com.CurrencyID, 0, 0) as CurrencyID from [ShotecEgypt].[dbo].[Commissions]  as com
left join dbo.CustomerPayments as c on com.InquiryNumber COLLATE SQL_Latin1_General_CP1_CI_AS = c.InquiryNumber
where c.CustomerPaymentID is null) as s

GO

delete from dbo.CustomerPayments where InquiryNumber not in (select InquiryNumber from dbo.Inquiries)
GO

insert into [dbo].[CustomerPayments] (InquiryNumber,PaymentNumber,PaidAmount,ONDate,SumPaid,Deduction,DeductionNumber,DeductionAmount,Reason,SumDeduction,RestPayment,Comment,UserName,ModifiedDate,PaidAmountRateToEuro,PaidAmountInEuro,PaidAmountRateDate,DeductionAmountRateToEuro,DeductionAmountInEuro,DeductionAmountRateDate,PaidAmountCurrencyID,DeductionAmountCurrencyID,InvoiceNumber)
select Migration.fn_GetNewInquiryNumber(InquiryNumber,'0','0'), 0,0,null, 0, 0, 0, 0, 'Migration', 0, 0,'Migration', 'admin', GETDATE(), RateToEuro , 0, ONDate, 0, 0, null, Migration.fn_GetNewCurrencyID(CurrencyID,0,0), null, null
From 
ShotecEgypt.dbo.Orders Where InquiryNumber 
IN (select InquiryNumber from
ShotecEgypt.dbo.Commissions where InquiryNumber Not In
 (select InquiryNumber from ShotecEgypt.dbo.CustomerPayments))
 
 GO

insert into [dbo].[Commissions] (CustomerPaymentID,InquiryNumber,PriceCommissionBase,PercentPriceCommissionBase,CommissionPercent,CommissionAmount,RateToEuro,ONDate,CommissionAmountInEuro,Comment,Paid,UserName,ModifiedDate,BankID,CurrencyID,BranchID)
select CustomerPaymentID, Migration.fn_GetNewInquiryNumber(InquiryNumber, 0, 0),PriceCommissionBase,PercentPriceCommissionBase,CommissionPercent, PaidAmount * PercentPriceCommissionBase * CommissionPercent as CommissionAmount,PaidAmountRateToEuro,PaidAmountRateDate,PaidAmount * PercentPriceCommissionBase *  CommissionPercent * PaidAmountRateToEuro as CommissionAmountInEuro,Comment,Paid,UserName,ModifiedDate,Migration.fn_GetNewBankID(BankID, 0, 0),Migration.fn_GetNewCurrencyID(PaidAmountCurrencyID, 0, 0),1 from (
select cp.*,c.PriceCommissionBase, c.PercentPriceCommissionBase,c.CommissionPercent,c.Comment as CommissionComment, c.Paid, c.MinPriceCommissionBase, c.MinPercentPriceCommissionBase, c.BankID 
From dbo.CustomerPayments as cp
inner Join dbo.Inquiries as i on i.InquiryNumber = cp.InquiryNumber
left Join ShotecEgypt.dbo.Commissions as c on cp.InquiryNumber collate SQL_Latin1_General_CP1_CI_AS = c.InquiryNumber
where i.SupplierID <> 14
) as s

GO

Update dbo.Orders set dbo.Orders.CommissionPercent =  ShotecEgypt.dbo.Commissions.CommissionPercent, CommissionCurrencyID = ShotecEgypt.dbo.commissions.CurrencyID, CommissionRateToEuro = ShotecEgypt.dbo.commissions.RateToEuro, CommissionRateDate = ShotecEgypt.dbo.commissions.ONDate, dbo.Orders.CommissionAmount = ShotecEgypt.dbo.commissions.CommissionAmount, dbo.Orders.CommissionAmountInEuro = ShotecEgypt.dbo.commissions.CommissionAmountInEuro
From dbo.Orders Inner Join
ShotecEgypt.dbo.Commissions on dbo.Orders.InquiryNumber collate SQL_Latin1_General_CP1_CI_AS =
ShotecEgypt.dbo.Commissions.InquiryNumber 

----------------------------------------------------------------------
----------------------------------------------------------------------
-- Partial Jobs       --
----------------------------------------------------------------------
----------------------------------------------------------------------

-- Data Migration for Table dbo.PartialOrder --

SET IDENTITY_INSERT [dbo].[PartialOrder] ON;

insert into [dbo].[PartialOrder] (PartialOrderID,ItemTagNumber,ItemModelSize,InquiryNumber,Quantity,ProductTypeID,ProductID,SupplierID,ItemOfferPrice,ItemOfferRateToEuro,ItemOfferRateDate,TotalItemOfferPrice,TotalItemOfferPriceInEuro,ItemOrderPrice,ItemOrderPriceRateToEuro,TotalItemOrderPrice,TotalItemOrderPriceInEuro,OrderPriceRateDate,IsOrdered,Remarks,ParialDeliveryStatusID,UserName,ModifiedDate,ItemOfferCurrencyID,ItemOrderPriceCurrencyID,EgyptID)
select PartialOrderID,ItemTagNumber,ItemModelSize,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),Quantity,(case when ProductTypeID = 4 then 1 else ProductTypeID end) as ProductTypeID,Migration.fn_GetNewProductID(ProductID,0,0),Migration.fn_GetNewSupplierID(SupplierID, 0, 0),ItemOfferPrice,ItemOfferRateToEuro,ItemOfferRateDate,TotalItemOfferPrice,TotalItemOfferPriceInEuro,ItemOrderPrice,ItemOrderPriceRateToEuro,TotalItemOrderPrice,TotalItemOrderPriceInEuro,OrderPriceRateDate,IsOrdered,Remarks,ParialDeliveryStatusID,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(ItemOfferCurrencyID, 0, 0),Migration.fn_GetNewCurrencyID(ItemOrderPriceCurrencyID, 0, 0),PartialOrderID from [ShotecEgypt].[dbo].[PartialOrder] 

SET IDENTITY_INSERT [dbo].[PartialOrder] OFF;

GO

-- Data Migration for Table dbo.PartialShipment --

SET IDENTITY_INSERT [dbo].[PartialShipment] ON;

insert into [dbo].[PartialShipment] (PartialShipmentID,ShipmentNumber,InvoiceNumber,InquiryNumber,ShipmentDate,ItemDescription,Price,RateToEuro,RateDate,PriceInEuro,Remarks,UserName,ModifiedDate,CurrencyID,ShotecNoTemp,EgyptID)
select PartialShipmentID,ShipmentNumber,InvoiceNumber,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),ShipmentDate,ItemDescription,Price,RateToEuro,RateDate,PriceInEuro,Remarks,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),ShotecNoTemp,PartialShipmentID from [ShotecEgypt].[dbo].[PartialShipment] 

SET IDENTITY_INSERT [dbo].[PartialShipment] OFF;

update dbo.PartialShipment set InvoiceValue = Price, InvoiceValueinEuro = PriceInEuro
GO

-- Data Migration for Table dbo.PartialShipmentDetails --

SET IDENTITY_INSERT [dbo].[PartialShipmentDetails] ON;

insert into [dbo].[PartialShipmentDetails] (PartialShipmentDetailsID,PartialDeliveryID,PartialShipmentID,PartialShipmentTypeID,PartialShipmentDescription,Quantity,PriceInEuro,UserName,ModifiedDate)
select PartialShipmentDetailsID,Migration.fn_GetNewPartialOrderID(PartialDeliveryID, 0, 0),Migration.fn_GetNewPartialShipmentID(PartialShipmentID, 0, 0),PartialShipmentTypeID,PartialShipmentDescription,Quantity,PriceInEuro,UserName,ModifiedDate from [ShotecEgypt].[dbo].[PartialShipmentDetails] 

SET IDENTITY_INSERT [dbo].[PartialShipmentDetails] OFF;

GO

-- Data Migration for Table dbo.PartialLost --
insert into [dbo].[PartialLost] (PartialOrderID,LostComment,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,Comment,UserName,ModifiedDate,WinnerPriceCurrencyID,LostReasonID)
select Migration.fn_GetNewPartialOrderID(PartialOrderID, 0, 0),LostComment,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,Comment,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(WinnerPriceCurrencyID, 0, 0),(case when LostReasonID = 2 or LostReasonID = 6 then null else case when LostReasonID = 1 then 3 else [Migration].[fn_GetNewLostReasonID](LostReasonID,0,0) end end ) as LostReasonID  from [ShotecEgypt].[dbo].[PartialLost] 
GO

----------------------------------------------------------------------
----------------------------------------------------------------------
-- Job History       --
----------------------------------------------------------------------
----------------------------------------------------------------------



-- Data Migration for Table dbo.ProjectsHistory --

SET IDENTITY_INSERT [dbo].[ProjectsHistory] ON;

insert into [dbo].[ProjectsHistory] (ID,InquiryNumber,ProjectTypeID,ModifiedDate,UserName,Percentage,EgyptID)
select ID,Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),(case when ProjectTypeID = 9 OR ProjectTypeID = 10 then 5 else case when ProjectTypeID = 8 then 4 else ProjectTypeID end end) as ProjectTypeID,ModifiedDate,UserName,Percentage,ID from [ShotecEgypt].[dbo].[ProjectsHistory] 

SET IDENTITY_INSERT [dbo].[ProjectsHistory] OFF;

GO

-- Data Migration for Table dbo.ProjectsHistoryDetails --

SET IDENTITY_INSERT [dbo].[ProjectsHistoryDetails] ON;

insert into [dbo].[ProjectsHistoryDetails] (ID,ProjectHistoryID,OrderStatusID,InquiryStatusID,UserName,ModifiedDate)
select ID,Migration.fn_GetNewProjectHistoryID(ProjectHistoryID, 0, 0),OrderStatusID,InquiryStatusID,UserName,ModifiedDate from [ShotecEgypt].[dbo].[ProjectsHistoryDetails] 

SET IDENTITY_INSERT [dbo].[ProjectsHistoryDetails] OFF;


GO



-- Data Migration for Table dbo.InquiriesYearlyHistory --
insert into [dbo].[InquiriesYearlyHistory] (InquiryNumber,ResponsibleEngineerID,CustomerID,CustomerInquiryNumber,ProductID,InquiryDate,BidDueDate,SupplierID,SupplierQuotationNumber,QuotationPrice,RateToEuro,ONDate,QuotationPriceInEuro,Comment,UserName,ModifiedDate,ProductDescription,ShotecNo,OnHold,InquiryStatusID,OrderPercentage,ProjectTypeID,IsSubOffer,ParentInquiryNumber,OfferDate,ProductTypeID,LostPercentage,CancelledPercentage,LateResponsePercentage,OrderChanceID,HasGuarantee,ProjectID,InquiryTypeID,CurrencyID,Year,BranchID)
select Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),Migration.fn_GetNewPersonID(ResponsibleEngineerID,0,0) as  ResponsibleEngineerID,Migration.fn_GetNewCustomerID(CustomerID, 0, 0),CustomerInquiryNumber,Migration.fn_GetNewProductID(ProductID,0,0) as ProductID,InquiryDate,BidDueDate,Migration.fn_GetNewSupplierID(SupplierID, 0, 0),SupplierQuotationNumber,QuotationPrice,RateToEuro,ONDate,QuotationPriceInEuro,Comment,UserName,ModifiedDate,ProductDescription,ShotecNo,OnHold,InquiryStatusID,OrderPercentage,(case when ProjectTypeID = 9 OR ProjectTypeID = 10 then 5 else case when ProjectTypeID = 8 then 4 else ProjectTypeID end end) as ProjectTypeID,IsSubOffer,ParentInquiryNumber,OfferDate,(case when ProductTypeID = 4 then 1 else ProductTypeID end) as ProductTypeID,LostPercentage,CancelledPercentage,LateResponsePercentage,OrderChanceID,HasGuarantee,Migration.fn_GetNewProjectID(ProjectID,0,0),InquiryTypeID,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),[Year],1 from [ShotecEgypt].[dbo].[InquiriesYearlyHistory] 
GO

-- Data Migration for Table dbo.ProjectsHistoryYearlyHistory --
insert into [dbo].[ProjectsHistoryYearlyHistory] (ID,InquiryNumber,ProjectTypeID,ModifiedDate,UserName,Percentage)
select ID,Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),(case when ProjectTypeID = 9 OR ProjectTypeID = 10 then 5 else case when ProjectTypeID = 8 then 4 else ProjectTypeID end end) as ProjectTypeID,ModifiedDate,UserName,Percentage from [ShotecEgypt].[dbo].[ProjectsHistoryYearlyHistory] 
GO


-- Data Migration for Table dbo.ProjectsGuaranteeYearlyHistory --
insert into [dbo].[ProjectsGuaranteeYearlyHistory] (ID,GuaranteeNumber,InquiryNumber,GuaranteeTypeID,PercentageFromOffer,Amount,IssuingDate,BankBranch,Remarks,GuaranteeCopy,NextStepID,GuaranteeCurrentLocationID,UserName,ModifiedDate,ExpiryDate,IsActive,IssuingBy,CalculationMethod,CurrencyID,BankID,InActiveDate)
select ID,GuaranteeNumber,Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),GuaranteeTypeID,PercentageFromOffer,Amount,IssuingDate,BankBranch,Remarks,GuaranteeCopy,NextStepID,GuaranteeCurrentLocationID,UserName,ModifiedDate,ExpiryDate,IsActive,Migration.fn_GetNewPersonID(IssuingBy,0,0),CalculationMethod,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),Migration.fn_GetNewBankID(BankID, 0, 0),InActiveDate from [ShotecEgypt].[dbo].[ProjectsGuaranteeYearlyHistory] 
GO

-- Data Migration for Table dbo.LostsYearlyHistory --
insert into [dbo].[LostsYearlyHistory] (LostID,InquiryNumber,Comment,UserName,ModifiedDate,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,IsSubLost,ParentInquiryNumber,LostComment,LostPrice,LostPriceRateToEuro,LostPriceRateDate,LostPriceInEuro,WinnerPriceCurrencyID,LostPriceCurrencyID,LostReasonID)
select [Migration].[fn_GetNewLostID](LostID,0,0),Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),Comment,UserName,ModifiedDate,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,IsSubLost,ParentInquiryNumber,LostComment,LostPrice,LostPriceRateToEuro,LostPriceRateDate,LostPriceInEuro,Migration.fn_GetNewCurrencyID(WinnerPriceCurrencyID, 0, 0),Migration.fn_GetNewCurrencyID(LostPriceCurrencyID, 0, 0),(case when LostReasonID = 2 or LostReasonID = 6 then null else case when LostReasonID = 1 then 3 else [Migration].[fn_GetNewLostReasonID](LostReasonID,0,0) end end ) as LostReasonID from [ShotecEgypt].[dbo].[LostsYearlyHistory] 

GO


-- Data Migration for Table dbo.CompletedProjectsYearlyHistory --
insert into [dbo].[CompletedProjectsYearlyHistory] (InquiryNumber,HasCommission,IsAllGuranteesClosed,GuaranteesClosedDate,IsAllCommissionPaid,AllCommssionPaidDate,UserName,ModifiedDate)
select Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),HasCommission,IsAllGuranteesClosed,GuaranteesClosedDate,IsAllCommissionPaid,AllCommssionPaidDate,UserName,ModifiedDate from [ShotecEgypt].[dbo].[CompletedProjectsYearlyHistory] 
GO

-- Data Migration for Table dbo.CommissionsYearlyHistory --
insert into [dbo].[CommissionsYearlyHistory] (InquiryNumber,PriceCommissionBase,PercentPriceCommissionBase,CommissionPercent,CommissionAmount,RateToEuro,ONDate,CommissionAmountInEuro,Comment,Paid,UserName,ModifiedDate,MinPriceCommissionBase,MinPercentPriceCommissionBase,MinCommissionAmount,MinPercentCommissionAmount,BankID,CurrencyID)
select Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),PriceCommissionBase,PercentPriceCommissionBase,CommissionPercent,CommissionAmount,RateToEuro,ONDate,CommissionAmountInEuro,Comment,Paid,UserName,ModifiedDate,MinPriceCommissionBase,MinPercentPriceCommissionBase,MinCommissionAmount,MinPercentCommissionAmount,Migration.fn_GetNewBankID(BankID, 0, 0),Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0) from [ShotecEgypt].[dbo].[CommissionsYearlyHistory] 
GO

-- Data Migration for Table dbo.OrdersYearlyHistory --
insert into [dbo].[OrdersYearlyHistory] (InquiryNumber,OrderNumber,CustomerOrderNumber,SupplierOrderNumber,OrderDate,DeliveryTime,ExpansionDeliveryDate,Price,RateToEuro,ONDate,PriceInEuro,DeliveredON,Delivered,Comment,UserName,ModifiedDate,PriceCommissionBase,PercentPriceCommissionBase,OrderStatusID,IsSubOrder,ParentOrderNumber,BackLog,CompletedGoodsPaidON,IsCompletedGoodsPaid,HasGuarantee,PriceBaseID,CurrencyID,PaymentTypeID)
select Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),OrderNumber,CustomerOrderNumber,SupplierOrderNumber,OrderDate,DeliveryTime,ExpansionDeliveryDate,Price,RateToEuro,ONDate,PriceInEuro,DeliveredON,Delivered,Comment,UserName,ModifiedDate,PriceCommissionBase,PercentPriceCommissionBase,OrderStatusID,IsSubOrder,ParentOrderNumber,BackLog,CompletedGoodsPaidON,IsCompletedGoodsPaid,HasGuarantee,PriceBaseID,CurrencyID,PaymentTypeID from [ShotecEgypt].[dbo].[OrdersYearlyHistory] 
GO

-- Data Migration for Table dbo.PartialOrderYearlyHistory --
insert into [dbo].[PartialOrderYearlyHistory] (PartialOrderYearlyHistoryID,ItemTagNumber,ItemModelSize,InquiryNumber,Quantity,ProductTypeID,ProductID,SupplierID,ItemOfferPrice,ItemOfferRateToEuro,ItemOfferRateDate,TotalItemOfferPrice,TotalItemOfferPriceInEuro,ItemOrderPrice,ItemOrderPriceRateToEuro,TotalItemOrderPrice,TotalItemOrderPriceInEuro,OrderPriceRateDate,IsOrdered,Remarks,ParialDeliveryStatusID,UserName,ModifiedDate,ItemOfferCurrencyID,ItemOrderPriceCurrencyID)
select PartialOrderYearlyHistoryID,ItemTagNumber,ItemModelSize,Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),Quantity,(case when ProductTypeID = 4 then 1 else ProductTypeID end) as ProductTypeID,Migration.fn_GetNewProductID(ProductID,0,0),Migration.fn_GetNewSupplierID(SupplierID, 0, 0),ItemOfferPrice,ItemOfferRateToEuro,ItemOfferRateDate,TotalItemOfferPrice,TotalItemOfferPriceInEuro,ItemOrderPrice,ItemOrderPriceRateToEuro,TotalItemOrderPrice,TotalItemOrderPriceInEuro,OrderPriceRateDate,IsOrdered,Remarks,ParialDeliveryStatusID,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(ItemOfferCurrencyID, 0, 0),Migration.fn_GetNewCurrencyID(ItemOrderPriceCurrencyID, 0, 0) from [ShotecEgypt].[dbo].[PartialOrderYearlyHistory] 
GO


-- Data Migration for Table dbo.PartialLostYearlyHistory --
insert into [dbo].[PartialLostYearlyHistory] (PartialOrderYearlyHistoryID,LostComment,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,Comment,UserName,ModifiedDate,WinnerPriceCurrencyID,LostReasonID)
select PartialOrderYearlyHistoryID,LostComment,WinnerName,WinnerPrice,WinnerPriceInEuro,RateToEuro,RateDate,Comment,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(WinnerPriceCurrencyID, 0, 0),(case when LostReasonID = 2 or LostReasonID = 6 then null else case when LostReasonID = 1 then 3 else [Migration].[fn_GetNewLostReasonID](LostReasonID,0,0) end end ) as LostReasonID from [ShotecEgypt].[dbo].[PartialLostYearlyHistory] 
GO

-- Data Migration for Table dbo.ProjectsGuaranteeRenewsYearlyHistory --
insert into [dbo].[ProjectsGuaranteeRenewsYearlyHistory] (ID,GuaranteeID,RenewDate,UserName,ModifiedDate)
select ID,Migration.fn_GetNewGuranteeID(GuaranteeID,0,0),RenewDate,UserName,ModifiedDate from [ShotecEgypt].[dbo].[ProjectsGuaranteeRenewsYearlyHistory] 
GO


-- Data Migration for Table dbo.CommissionPaymentsYearlyHistory --
insert into [dbo].[CommissionPaymentsYearlyHistory] (InquiryNumber,TransactionID,CommissionPaymentNumber,PaidCommissionAmount,ONDate,RateToEuro,PaidCommissionAmountInEuro,SumPaidCommissionAmountInEuro,DueCommissionAmountInEuro,Comment,UserName,ModifiedDate,CurrencyID,BankID)
select Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),Migration.fn_GetNewTransactionID(TransactionID,0,0),CommissionPaymentNumber,PaidCommissionAmount,ONDate,RateToEuro,PaidCommissionAmountInEuro,SumPaidCommissionAmountInEuro,DueCommissionAmountInEuro,Comment,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),Migration.fn_GetNewBankID(BankID, 0, 0) from [ShotecEgypt].[dbo].[CommissionPaymentsYearlyHistory] 
GO


-- Data Migration for Table dbo.InquiriesCommentsYearlyHistory --
insert into [dbo].[InquiriesCommentsYearlyHistory] (ID,InquiryNumber,Comment,UserName,ModifiedDate,ProjectTypeID)
select ID,Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),Comment,UserName,ModifiedDate,(case when ProjectTypeID = 9 OR ProjectTypeID = 10 then 5 else case when ProjectTypeID = 8 then 4 else ProjectTypeID end end) as ProjectTypeID from [ShotecEgypt].[dbo].[InquiriesCommentsYearlyHistory] 
GO


-- Data Migration for Table dbo.DocumentsJobsYearlyHistory --
insert into [dbo].[DocumentsJobsYearlyHistory] (ID,InquiryNumber,DocName,DocTypeID)
select ID,Migration.fn_GetNewInquiryNumber(InquiryNumber,'0', '0'),DocName,DocTypeID from [ShotecEgypt].[dbo].[DocumentsJobsYearlyHistory] 
GO


-- Data Migration for Table dbo.DocumentsJobsVersionsYearlyHistory --
insert into [dbo].[DocumentsJobsVersionsYearlyHistory] (ID,DocID,FileName,DocumentData,VersionNo,UserName,ModifiedDate)
select ID,Migration.fn_GetNewDocID(DocID,0,0),[FileName],DocumentData,VersionNo,UserName,ModifiedDate from [ShotecEgypt].[dbo].[DocumentsJobsVersionsYearlyHistory] 
GO


-- Data Migration for Table dbo.PartialShipmentYearlyHistory --
insert into [dbo].[PartialShipmentYearlyHistory] (PartialShipmentYearlyHistoryID,ShipmentNumber,InvoiceNumber,InquiryNumber,ShipmentDate,ItemDescription,Price,RateToEuro,RateDate,PriceInEuro,Remarks,UserName,ModifiedDate,CurrencyID,ShotecNoTemp)
select PartialShipmentYearlyHistoryID,ShipmentNumber,InvoiceNumber,Migration.fn_GetNewInquiryNumber(InquiryNumber, '0', '0'),ShipmentDate,ItemDescription,Price,RateToEuro,RateDate,PriceInEuro,Remarks,UserName,ModifiedDate,Migration.fn_GetNewCurrencyID(CurrencyID, 0, 0),ShotecNoTemp from [ShotecEgypt].[dbo].[PartialShipmentYearlyHistory] 
GO
----------------------------------------------------------------------
----------------------------------------------------------------------
-- Notifications       --
----------------------------------------------------------------------
----------------------------------------------------------------------



-- Data Migration for Table dbo.Notifications --

SET IDENTITY_INSERT [dbo].[Notifications] ON;

insert into [dbo].[Notifications] (ID,NotificationTypeID,Notification,PersonID,RelatedFormName,RelatedID,UserName,ModifiedDate,BranchID,EgyptID)
select ID,NotificationTypeID,[Notification],Migration.fn_GetNewPersonID(PersonID,0,0),RelatedFormName,(case when NotificationTypeID = 1 then Migration.fn_GetNewProjectID(RelatedID,0,0) else RelatedID end)as RelatedID,UserName,ModifiedDate,1,ID from [ShotecEgypt].[dbo].[Notifications] 

SET IDENTITY_INSERT [dbo].[Notifications] OFF;

GO



-- Data Migration for Table dbo.NotificationPersons --

SET IDENTITY_INSERT [dbo].[NotificationPersons] ON;

insert into [dbo].[NotificationPersons] (NotificationPersonID,NotificationID,PersonID,IsRead,UserName,ModifiedDate)
select NotificationPersonID,NotificationID,PersonID,IsRead,UserName,ModifiedDate from [ShotecEgypt].[dbo].[NotificationPersons] 

SET IDENTITY_INSERT [dbo].[NotificationPersons] OFF;

GO



--------------------------------------------------------
--------------------------------------------------------
-- visits   --
--------------------------------------------------------
--------------------------------------------------------

-- Data Migration for Table dbo.Visits --

SET IDENTITY_INSERT [dbo].[Visits] ON;

insert into [dbo].[Visits] (VisitId,VisitNo,CustomerId,Finalized,StartDateTime,EndDateTime,Accomplishment,PendingTasks,VisitComments,Place,Reason,VisitCopy,ReportDate,BranchID,EgyptID)
select VisitId,VisitNo,Migration.fn_GetNewCustomerID(CustomerId,0,0),Finalized,StartDateTime,EndDateTime,Accomplishment,PendingTasks,VisitComments,Place,Reason,VisitCopy,ReportDate,1,VisitId from [ShotecEgypt].[dbo].[Visits] 

SET IDENTITY_INSERT [dbo].[Visits] OFF;

GO

-- Data Migration for Table dbo.VisitDetails --

SET IDENTITY_INSERT [dbo].[VisitDetails] ON;

insert into [dbo].[VisitDetails] (VisitDetailsId,VisitId,SupplierId,ReferencedShotecNumbers,CustomerNotes,EngineerNotes,Satisfied,Reason)
select VisitDetailsId,Migration.fn_GetNewVisitID(VisitId, 0, 0),Migration.fn_GetNewSupplierID(SupplierId, 0, 0),ReferencedShotecNumbers,CustomerNotes,EngineerNotes,Satisfied,Reason from [ShotecEgypt].[dbo].[VisitDetails] 

SET IDENTITY_INSERT [dbo].[VisitDetails] OFF;

GO

-- Data Migration for Table dbo.VisitEngineers --

SET IDENTITY_INSERT [dbo].[VisitEngineers] ON;

insert into [dbo].[VisitEngineers] (ID,VisitID,ResponsibleEngineerID,UserName,ModifiedDate)
select ID,Migration.fn_GetNewVisitID(VisitID, 0, 0),Migration.fn_GetNewPersonID(ResponsibleEngineerID,0,0),UserName,ModifiedDate from [ShotecEgypt].[dbo].[VisitEngineers] 

SET IDENTITY_INSERT [dbo].[VisitEngineers] OFF;

GO

-- Data Migration for Table dbo.VisitPurposes --

SET IDENTITY_INSERT [dbo].[VisitPurposes] ON;

insert into [dbo].[VisitPurposes] (ID,VisitID,Reason,AchivmentID,UserName,ModifiedDate)
select ID,Migration.fn_GetNewVisitID(VisitID, 0, 0),Reason,AchivmentID,UserName,ModifiedDate from [ShotecEgypt].[dbo].[VisitPurposes] 

SET IDENTITY_INSERT [dbo].[VisitPurposes] OFF;

GO

-- Data Migration for Table dbo.VisitsAttendeesDetails --

SET IDENTITY_INSERT [dbo].[VisitsAttendeesDetails] ON;

insert into [dbo].[VisitsAttendeesDetails] (VisitAttendeesDetailsId,VisitId,Attendees,Position)
select VisitAttendeesDetailsId,Migration.fn_GetNewVisitID(VisitId, 0, 0),Attendees,Position from [ShotecEgypt].[dbo].[VisitsAttendeesDetails] 

SET IDENTITY_INSERT [dbo].[VisitsAttendeesDetails] OFF;

GO

----------------------------------------------------------------------
----------------------------------------------------------------------
-- HR       --
----------------------------------------------------------------------
----------------------------------------------------------------------

-- Data Migration for Table dbo.PersonYearlyVacations --

insert into [dbo].[PersonYearlyVacations] (PersonID,[Year], NumOfVacationsAnnual , NumOfVacationsCasual ,BranchID)
select Migration.[fn_GetNewPersonID](PersonID, 0, 0),[Year],
case when  NumOfVacations = 21 then 14 when NumOfVacations = 30 then 23 else 0 end as NumOfVacationsAnnual, case when  NumOfVacations < 21 then NumOfVacations else 7 end as NumOfVacationsCasual , 1
from [ShotecEgypt].[dbo].[PersonYearlyVacations] 
GO

-- Data Migration for Table dbo.EmployeeHourRate --

SET IDENTITY_INSERT [dbo].[EmployeeHourRate] ON;

insert into [dbo].[EmployeeHourRate] (ID,[Year],Value,UserName,ModifiedDate,BranchID,EgyptID)
select ID,[Year],Value,UserName,ModifiedDate,1,ID from [ShotecEgypt].[dbo].[EmployeeHourRate] 

SET IDENTITY_INSERT [dbo].[EmployeeHourRate] OFF;

GO

-- Data Migration for Table dbo.TimeSheet --

SET IDENTITY_INSERT [dbo].[TimeSheet] ON;

insert into [dbo].[TimeSheet] (ID,PersonID,SheetDate,UserName,ModifiedDate,BranchID,EgyptID)
select ID,Migration.[fn_GetNewPersonID](PersonID, 0, 0),SheetDate,UserName,ModifiedDate,1,ID from [ShotecEgypt].[dbo].[TimeSheet] 

SET IDENTITY_INSERT [dbo].[TimeSheet] OFF;

GO

-- Data Migration for Table dbo.TimeSheetDetails --

SET IDENTITY_INSERT [dbo].[TimeSheetDetails] ON;

insert into [dbo].[TimeSheetDetails] (SheetDetailsID,InquiryNumber,Minutes,TimePercentage,SupplierID,SheetID,Cost)
select SheetDetailsID,InquiryNumber,Minutes,TimePercentage,Migration.fn_GetNewSupplierID(SupplierID, 0, 0),Migration.fn_GetNewTimeSheetID(SheetID, 0, 0),Cost from [ShotecEgypt].[dbo].[TimeSheetDetails] 

SET IDENTITY_INSERT [dbo].[TimeSheetDetails] OFF;

GO
-- Data Migration for Table dbo.VacationTypes --

SET IDENTITY_INSERT [dbo].[VacationTypes] ON

insert into [dbo].[VacationTypes] (VacationTypeId,VacationTypeName,UserName,ModifiedDate)
select VacationTypeId,VacationTypeName,UserName,ModifiedDate from [ShotecEgypt].[dbo].[VacationTypes] 

SET IDENTITY_INSERT [dbo].[VacationTypes] OFF

GO

-- Data Migration for Table dbo.EmployeeVacations --
SET IDENTITY_INSERT [dbo].[EmployeeVacations] ON;

insert into [dbo].[EmployeeVacations] (EmployeeVacationID,PersonID, VacationTypeId,StartDate,EndDate,RequestDate,ApprovedDate,IsApproved,ModifiedDate,VacationReportWayID,NumOfDays,Comment,UserName)
select EmployeeVacationID,Migration.fn_GetNewPersonID(PersonID, 0,0), VacationTypeId,StartDate,EndDate,RequestDate,ApprovedDate,IsApproved,ModifiedDate,VacationReportWayID,NumOfDays,Comment,UserName from [ShotecEgypt].[dbo].[EmployeeVacations]
where Migration.fn_GetNewPersonID(PersonID,0,0) IN (select BusinessEntityID from Person.Person)

SET IDENTITY_INSERT [dbo].[EmployeeVacations] OFF;


--------------
-- Twitter  --
--------------



-- Data Migration for Table dbo.TwitterFollowers --

SET IDENTITY_INSERT [dbo].[TwitterFollowers] ON;

insert into [dbo].[TwitterFollowers] (ID,UserID,FollwerID,IsAccepted,RequestDate,AcceptanceDate,FollowerTypeID,RequestComment,ProjectInquiryNumber)
select ID,Migration.fn_GetNewPersonID(UserID,0,0),Migration.fn_GetNewPersonID(FollwerID,0,0),IsAccepted,RequestDate,AcceptanceDate,FollowerTypeID,RequestComment,ProjectInquiryNumber from [ShotecEgypt].[dbo].[TwitterFollowers] 

SET IDENTITY_INSERT [dbo].[TwitterFollowers] OFF;

GO

-- Data Migration for Table dbo.BussinessTwitter --

SET IDENTITY_INSERT [dbo].[BussinessTwitter] ON;

insert into [dbo].[BussinessTwitter] (ID,TweetText,TweetByID,TweetBy,TweetByRealName,TweetTypeID,ModifiedDate,EgyptID)
select ID,TweetText,TweetByID,TweetBy,TweetByRealName,TweetTypeID,ModifiedDate,ID from [ShotecEgypt].[dbo].[BussinessTwitter] 

SET IDENTITY_INSERT [dbo].[BussinessTwitter] OFF;

GO

