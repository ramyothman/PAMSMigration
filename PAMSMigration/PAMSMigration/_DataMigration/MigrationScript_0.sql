-- Data Migration for Table Person.ContactType --
insert into [Person].[ContactType] (ContactTypeId,Name,ModifiedDate)
select ContactTypeId,Name,ModifiedDate from [PAMSDB].[Person].[ContactType] 
GO



-- Data Migration for Table dbo.CompanyCountries --

SET IDENTITY_INSERT [dbo].[CompanyCountries] ON

insert into [dbo].[CompanyCountries] (ID,CountryName,UserName,ModifiedDate)
select ID,CountryName,UserName,ModifiedDate from [PAMSDB].[dbo].[CompanyCountries] 

SET IDENTITY_INSERT [dbo].[CompanyCountries] OFF

GO



-- Data Migration for Table dbo.Currencies --

SET IDENTITY_INSERT [dbo].[Currencies] ON

insert into [dbo].[Currencies] (CurrencyCode,CurrencyName,CurrencyNameSL,ID,EgyptID,RPEID,QatarID)
select CurrencyCode,CurrencyName,CurrencyNameSL,ID,EgyptID,RPEID,QatarID from [PAMSDB].[dbo].[Currencies] 

SET IDENTITY_INSERT [dbo].[Currencies] OFF

GO

-- Data Migration for Table dbo.VacationReportWay --

SET IDENTITY_INSERT [dbo].[VacationReportWay] ON

insert into [dbo].[VacationReportWay] (ID,VacationReportWayName,UserName,ModifiedDate)
select ID,VacationReportWayName,UserName,ModifiedDate from [PAMSDB].[dbo].[VacationReportWay] 

SET IDENTITY_INSERT [dbo].[VacationReportWay] OFF

GO

-- Data Migration for Table dbo.Category --

SET IDENTITY_INSERT [dbo].[Category] ON

insert into [dbo].[Category] (CategoryID,Category2ID,Name,Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,Col10,Col11,Col12,Col13,Col14,Col15,Col16,Col17,Col18,Col19,Col20,Col21,Col22,Col23,Col24,Col25,Col26,Col27,Col28,Col29,Col30,EgyptID,RPEID,QatarID)
select CategoryID,Category2ID,Name,Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,Col10,Col11,Col12,Col13,Col14,Col15,Col16,Col17,Col18,Col19,Col20,Col21,Col22,Col23,Col24,Col25,Col26,Col27,Col28,Col29,Col30,EgyptID,RPEID,QatarID from [PAMSDB].[dbo].[Category] 

SET IDENTITY_INSERT [dbo].[Category] OFF

GO

-- Data Migration for Table dbo.UsersTypes --
insert into [dbo].[UsersTypes] (ID,UserType)
select ID,UserType from [PAMSDB].[dbo].[UsersTypes] 
GO

-- Data Migration for Table dbo.TweetByTypes --
insert into [dbo].[TweetByTypes] (ID,TweetByType)
select ID,TweetByType from [PAMSDB].[dbo].[TweetByTypes] 
GO


-- Data Migration for Table Person.BusinessEntity --

SET IDENTITY_INSERT [Person].[BusinessEntity] ON

insert into [Person].[BusinessEntity] (BusinessEntityId,RowGuid,ModifiedDate,EgyptBusinessEntityID,RPEBusinessEntityID,QatarBusinessEntityID)
select BusinessEntityId,RowGuid,ModifiedDate,EgyptBusinessEntityID,RPEBusinessEntityID,QatarBusinessEntityID from [PAMSDB].[Person].[BusinessEntity] 

SET IDENTITY_INSERT [Person].[BusinessEntity] OFF

GO

-- Data Migration for Table dbo.SystemSecurityFunctions --

SET IDENTITY_INSERT [dbo].[SystemSecurityFunctions] ON

insert into [dbo].[SystemSecurityFunctions] (ID,SecurityFunctionCode,SecurityFunction,PageID,IsActive)
select ID,SecurityFunctionCode,SecurityFunction,PageID,IsActive from [PAMSDB].[dbo].[SystemSecurityFunctions] 

SET IDENTITY_INSERT [dbo].[SystemSecurityFunctions] OFF

GO

-- Data Migration for Table dbo.TimePeriod --
insert into [dbo].[TimePeriod] (TimePeriodID,PeriodName,PeriodDays)
select TimePeriodID,PeriodName,PeriodDays from [PAMSDB].[dbo].[TimePeriod] 
GO

-- Data Migration for Table Person.AddressType --

SET IDENTITY_INSERT [Person].[AddressType] ON

insert into [Person].[AddressType] (AddressTypeId,Name,RowGuid,ModifiedDate)
select AddressTypeId,Name,RowGuid,ModifiedDate from [PAMSDB].[Person].[AddressType] 

SET IDENTITY_INSERT [Person].[AddressType] OFF

GO

-- Data Migration for Table dbo.Templates --
insert into [dbo].[Templates] (ID,Name,TemplateFL,TemplateSL,UserName,ModifiedDate)
select ID,Name,TemplateFL,TemplateSL,UserName,ModifiedDate from [PAMSDB].[dbo].[Templates] 
GO

-- Data Migration for Table dbo.SystemTabs --
insert into [dbo].[SystemTabs] (ID,SystemTabName)
select ID,SystemTabName from [PAMSDB].[dbo].[SystemTabs] 
GO

-- Data Migration for Table dbo.InquiryTypes --

SET IDENTITY_INSERT [dbo].[InquiryTypes] ON

insert into [dbo].[InquiryTypes] (InquiryType,InquiryDescription,ID)
select InquiryType,InquiryDescription,ID from [PAMSDB].[dbo].[InquiryTypes] 

SET IDENTITY_INSERT [dbo].[InquiryTypes] OFF

GO

-- Data Migration for Table dbo.InquiryStatus --

SET IDENTITY_INSERT [dbo].[InquiryStatus] ON

insert into [dbo].[InquiryStatus] (ID,Name,IsActive)
select ID,Name,IsActive from [PAMSDB].[dbo].[InquiryStatus] 

SET IDENTITY_INSERT [dbo].[InquiryStatus] OFF

GO

-- Data Migration for Table dbo.ReportType --
insert into [dbo].[ReportType] (ReportTypeID,ReportName)
select ReportTypeID,ReportName from [PAMSDB].[dbo].[ReportType] 
GO

-- Data Migration for Table dbo.ReportTemplate --

SET IDENTITY_INSERT [dbo].[ReportTemplate] ON

insert into [dbo].[ReportTemplate] (ReportTemplateID,Name,ReportTypeID,Description,ReportContent,IsMain)
select ReportTemplateID,Name,ReportTypeID,Description,ReportContent,IsMain from [PAMSDB].[dbo].[ReportTemplate] 

SET IDENTITY_INSERT [dbo].[ReportTemplate] OFF

GO



-- Data Migration for Table dbo.NotificationsTypes --

SET IDENTITY_INSERT [dbo].[NotificationsTypes] ON

insert into [dbo].[NotificationsTypes] (NotificationTypeID,NotificationType,UserName,ModifiedDate)
select NotificationTypeID,NotificationType,UserName,ModifiedDate from [PAMSDB].[dbo].[NotificationsTypes] 

SET IDENTITY_INSERT [dbo].[NotificationsTypes] OFF

GO

-- Data Migration for Table dbo.RegistrationStatuses --

SET IDENTITY_INSERT [dbo].[RegistrationStatuses] ON

insert into [dbo].[RegistrationStatuses] (ID,RegistrationStatus)
select ID,RegistrationStatus from [PAMSDB].[dbo].[RegistrationStatuses] 

SET IDENTITY_INSERT [dbo].[RegistrationStatuses] OFF

GO

-- Data Migration for Table dbo.Roles --

SET IDENTITY_INSERT [dbo].[Roles] ON

insert into [dbo].[Roles] (ID,Name,IsActive,LimitedSuppliers,BranchID,EgyptID,RPEID,QatarID,IsPrincipal)
select ID,Name,IsActive,LimitedSuppliers,BranchID,EgyptID,RPEID,QatarID,IsPrincipal from [PAMSDB].[dbo].[Roles] 

SET IDENTITY_INSERT [dbo].[Roles] OFF

GO

-- Data Migration for Table dbo.ProjectTypes --
insert into [dbo].[ProjectTypes] (ID,ProjectType,ProjectTypeColor,OrderByType)
select ID,ProjectType,ProjectTypeColor,OrderByType from [PAMSDB].[dbo].[ProjectTypes] 
GO

-- Data Migration for Table dbo.ProjectsStatuses --
insert into [dbo].[ProjectsStatuses] (ID,ProjectStatus,UserName,ModifiedDate)
select ID,ProjectStatus,UserName,ModifiedDate from [PAMSDB].[dbo].[ProjectsStatuses] 
GO


-- Data Migration for Table dbo.LostReasons --

SET IDENTITY_INSERT [dbo].[LostReasons] ON

insert into [dbo].[LostReasons] (ID,ReasonCode,ReasonName,EgyptID,RPEID,QatarID)
select ID,ReasonCode,ReasonName,EgyptID,RPEID,QatarID from [PAMSDB].[dbo].[LostReasons] 

SET IDENTITY_INSERT [dbo].[LostReasons] OFF

GO

-- Data Migration for Table dbo.Languages --

SET IDENTITY_INSERT [dbo].[Languages] ON

insert into [dbo].[Languages] (ID,Language)
select ID,Language from [PAMSDB].[dbo].[Languages] 

SET IDENTITY_INSERT [dbo].[Languages] OFF

GO

-- Data Migration for Table dbo.ProductTypes --

SET IDENTITY_INSERT [dbo].[ProductTypes] ON

insert into [dbo].[ProductTypes] (ProductTypeID,ProductType)
select ProductTypeID,ProductType from [PAMSDB].[dbo].[ProductTypes] 

SET IDENTITY_INSERT [dbo].[ProductTypes] OFF

GO

-- Data Migration for Table Person.EducationType --

SET IDENTITY_INSERT [Person].[EducationType] ON

insert into [Person].[EducationType] (EducationTypeId,EducationTypeName)
select EducationTypeId,EducationTypeName from [PAMSDB].[Person].[EducationType] 

SET IDENTITY_INSERT [Person].[EducationType] OFF

GO

-- Data Migration for Table dbo.ProductType --

SET IDENTITY_INSERT [dbo].[ProductType] ON

insert into [dbo].[ProductType] (ProductTypeID,Name)
select ProductTypeID,Name from [PAMSDB].[dbo].[ProductType] 

SET IDENTITY_INSERT [dbo].[ProductType] OFF

GO

-- Data Migration for Table dbo.DocumentsTypes --
insert into [dbo].[DocumentsTypes] (ID,DocType)
select ID,DocType from [PAMSDB].[dbo].[DocumentsTypes] 
GO

-- Data Migration for Table dbo.SystemPages --

SET IDENTITY_INSERT [dbo].[SystemPages] ON

insert into [dbo].[SystemPages] (ID,ModCode,PageName,Path,IsActive,TabID,EgyptID,RPEID,QatarID)
select ID,ModCode,PageName,Path,IsActive,TabID,EgyptID,RPEID,QatarID from [PAMSDB].[dbo].[SystemPages] 

SET IDENTITY_INSERT [dbo].[SystemPages] OFF

GO

-- Data Migration for Table dbo.SystemFunctions --

SET IDENTITY_INSERT [dbo].[SystemFunctions] ON

insert into [dbo].[SystemFunctions] (ID,Name,IsActive)
select ID,Name,IsActive from [PAMSDB].[dbo].[SystemFunctions] 

SET IDENTITY_INSERT [dbo].[SystemFunctions] OFF

GO

-- Data Migration for Table dbo.SuppliersTypes --

SET IDENTITY_INSERT [dbo].[SuppliersTypes] ON

insert into [dbo].[SuppliersTypes] (ID,SupplierType,UserName,ModifiedDate)
select ID,SupplierType,UserName,ModifiedDate from [PAMSDB].[dbo].[SuppliersTypes] 

SET IDENTITY_INSERT [dbo].[SuppliersTypes] OFF

GO

-- Data Migration for Table Serial.SerialComponent --

SET IDENTITY_INSERT [Serial].[SerialComponent] ON

insert into [Serial].[SerialComponent] (SerialComponentID,Description)
select SerialComponentID,Description from [PAMSDB].[Serial].[SerialComponent] 

SET IDENTITY_INSERT [Serial].[SerialComponent] OFF

GO

-- Data Migration for Table dbo.CustomersTypes --

SET IDENTITY_INSERT [dbo].[CustomersTypes] ON

insert into [dbo].[CustomersTypes] (ID,CustomerType,UserName,ModifiedDate)
select ID,CustomerType,UserName,ModifiedDate from [PAMSDB].[dbo].[CustomersTypes] 

SET IDENTITY_INSERT [dbo].[CustomersTypes] OFF

GO

-- Data Migration for Table dbo.StructureViewType --

SET IDENTITY_INSERT [dbo].[StructureViewType] ON

insert into [dbo].[StructureViewType] (ViewTypeID,ViewTypeName)
select ViewTypeID,ViewTypeName from [PAMSDB].[dbo].[StructureViewType] 

SET IDENTITY_INSERT [dbo].[StructureViewType] OFF

GO

-- Data Migration for Table dbo.StructureType --

SET IDENTITY_INSERT [dbo].[StructureType] ON

insert into [dbo].[StructureType] (StructureTypeID,StructureType)
select StructureTypeID,StructureType from [PAMSDB].[dbo].[StructureType] 

SET IDENTITY_INSERT [dbo].[StructureType] OFF

GO

-- Data Migration for Table dbo.StructureAttributes --

SET IDENTITY_INSERT [dbo].[StructureAttributes] ON

insert into [dbo].[StructureAttributes] (AttributeID,AttributeName,ParentAttribute)
select AttributeID,AttributeName,ParentAttribute from [PAMSDB].[dbo].[StructureAttributes] 

SET IDENTITY_INSERT [dbo].[StructureAttributes] OFF

GO

-- Data Migration for Table dbo.SecurityActivationCodes --

SET IDENTITY_INSERT [dbo].[SecurityActivationCodes] ON

insert into [dbo].[SecurityActivationCodes] (SecurityActivationCodeId,Code,IsActive,LicenseNumber,UsedLicenseNumber)
select SecurityActivationCodeId,Code,IsActive,LicenseNumber,UsedLicenseNumber from [PAMSDB].[dbo].[SecurityActivationCodes] 

SET IDENTITY_INSERT [dbo].[SecurityActivationCodes] OFF

GO

-- Data Migration for Table dbo.GuaranteeStatus --
insert into [dbo].[GuaranteeStatus] (GuaranteeStatusID,Name)
select GuaranteeStatusID,Name from [PAMSDB].[dbo].[GuaranteeStatus] 
GO

-- Data Migration for Table dbo.OffersTemplates --

SET IDENTITY_INSERT [dbo].[OffersTemplates] ON

insert into [dbo].[OffersTemplates] (ID,InquiryNumber,HeaderName,ClientContactPerson,ClientAddress,ClientCity,ClientPhone,ClientFax,HeaderDate,ValidUntil,HeaderText,HeaderTemplate,DeliveryTime,PaymentTerms,DeliveryTerms,Taxes,OfferValidity,EndTemplate,TotalItemsValue,ItemsCurrencyID,ItemsComments,ItemsNotes,RevisionNumber,IsFirstLanguage,UserName,ModifiedDate,ClientContactPersonTitle,OfferValidityPeriod,PreparedByEmpID,ApprovedByEmpID,BranchID,OfferValidityText)
select ID,InquiryNumber,HeaderName,ClientContactPerson,ClientAddress,ClientCity,ClientPhone,ClientFax,HeaderDate,ValidUntil,HeaderText,HeaderTemplate,DeliveryTime,PaymentTerms,DeliveryTerms,Taxes,OfferValidity,EndTemplate,TotalItemsValue,ItemsCurrencyID,ItemsComments,ItemsNotes,RevisionNumber,IsFirstLanguage,UserName,ModifiedDate,ClientContactPersonTitle,OfferValidityPeriod,PreparedByEmpID,ApprovedByEmpID,BranchID,OfferValidityText from [PAMSDB].[dbo].[OffersTemplates] 

SET IDENTITY_INSERT [dbo].[OffersTemplates] OFF

GO

-- Data Migration for Table dbo.GuaranteeDistinations --
insert into [dbo].[GuaranteeDistinations] (ID,GuarnteeDistination)
select ID,GuarnteeDistination from [PAMSDB].[dbo].[GuaranteeDistinations] 
GO

-- Data Migration for Table dbo.EmployeesTypes --

SET IDENTITY_INSERT [dbo].[EmployeesTypes] ON

insert into [dbo].[EmployeesTypes] (ID,EmployeeTypeName)
select ID,EmployeeTypeName from [PAMSDB].[dbo].[EmployeesTypes] 

SET IDENTITY_INSERT [dbo].[EmployeesTypes] OFF

GO

-- Data Migration for Table Serial.SerialType --
insert into [Serial].[SerialType] (SerialTypeID,Description)
select SerialTypeID,Description from [PAMSDB].[Serial].[SerialType] 
GO

-- Data Migration for Table dbo.PartialDeliveryStatus --
insert into [dbo].[PartialDeliveryStatus] (PartialDeliveryStatusID,PartialDeliveryStatus)
select PartialDeliveryStatusID,PartialDeliveryStatus from [PAMSDB].[dbo].[PartialDeliveryStatus] 
GO

-- Data Migration for Table Person.EmailAddressType --

SET IDENTITY_INSERT [Person].[EmailAddressType] ON

insert into [Person].[EmailAddressType] (EmailAddressTypeId,Name,ModifiedDate)
select EmailAddressTypeId,Name,ModifiedDate from [PAMSDB].[Person].[EmailAddressType] 

SET IDENTITY_INSERT [Person].[EmailAddressType] OFF

GO

-- Data Migration for Table dbo.OrderStatus --

SET IDENTITY_INSERT [dbo].[OrderStatus] ON

insert into [dbo].[OrderStatus] (ID,Name,IsActive)
select ID,Name,IsActive from [PAMSDB].[dbo].[OrderStatus] 

SET IDENTITY_INSERT [dbo].[OrderStatus] OFF

GO

-- Data Migration for Table dbo.OrdersChance --
insert into [dbo].[OrdersChance] (ID,OrderChance,UserName,ModifiedDate)
select ID,OrderChance,UserName,ModifiedDate from [PAMSDB].[dbo].[OrdersChance] 
GO

-- Data Migration for Table dbo.GuaranteeTypes --

SET IDENTITY_INSERT [dbo].[GuaranteeTypes] ON

insert into [dbo].[GuaranteeTypes] (ID,GuaranteeType,SourceID,DistinationID)
select ID,GuaranteeType,SourceID,DistinationID from [PAMSDB].[dbo].[GuaranteeTypes] 

SET IDENTITY_INSERT [dbo].[GuaranteeTypes] OFF

GO

-- Data Migration for Table dbo.OffersTemplatesClarifictaionsSubmittedTypes --
insert into [dbo].[OffersTemplatesClarifictaionsSubmittedTypes] (ID,OfferTemplateClarificationSubmittedType)
select ID,OfferTemplateClarificationSubmittedType from [PAMSDB].[dbo].[OffersTemplatesClarifictaionsSubmittedTypes] 
GO

-- Data Migration for Table Person.Person --
insert into [Person].[Person] (BusinessEntityId,NameStyle,EmailPromotion,RowGuid,ModifiedDate,CreatedDate,PersonImage,IsActive)
select BusinessEntityId,NameStyle,EmailPromotion,RowGuid,ModifiedDate,CreatedDate,PersonImage,IsActive from [PAMSDB].[Person].[Person] 
GO

-- Data Migration for Table dbo.PeriodType --

SET IDENTITY_INSERT [dbo].[PeriodType] ON

insert into [dbo].[PeriodType] (PeriodTypeID,Name,DaysNo)
select PeriodTypeID,Name,DaysNo from [PAMSDB].[dbo].[PeriodType] 

SET IDENTITY_INSERT [dbo].[PeriodType] OFF

GO

-- Data Migration for Table dbo.PaymentTypes --

SET IDENTITY_INSERT [dbo].[PaymentTypes] ON

insert into [dbo].[PaymentTypes] (PaymentType,PaymentTypeDescription,ID)
select PaymentType,PaymentTypeDescription,ID from [PAMSDB].[dbo].[PaymentTypes] 

SET IDENTITY_INSERT [dbo].[PaymentTypes] OFF

GO

-- Data Migration for Table dbo.PaymentTermType --

SET IDENTITY_INSERT [dbo].[PaymentTermType] ON

insert into [dbo].[PaymentTermType] (PaymentTermTypeID,Name)
select PaymentTermTypeID,Name from [PAMSDB].[dbo].[PaymentTermType] 

SET IDENTITY_INSERT [dbo].[PaymentTermType] OFF

GO

-- Data Migration for Table dbo.PriceBase --

SET IDENTITY_INSERT [dbo].[PriceBase] ON

insert into [dbo].[PriceBase] (PriceBaseCode,PriceBaseName,PriceBaseDescription,ID,EgyptID,RPEID,QatarID)
select PriceBaseCode,PriceBaseName,PriceBaseDescription,ID,EgyptID,RPEID,QatarID from [PAMSDB].[dbo].[PriceBase] 

SET IDENTITY_INSERT [dbo].[PriceBase] OFF

GO

-- Data Migration for Table Person.PhoneNumberType --

SET IDENTITY_INSERT [Person].[PhoneNumberType] ON

insert into [Person].[PhoneNumberType] (PhoneNumberTypeId,Name,ModifiedDate)
select PhoneNumberTypeId,Name,ModifiedDate from [PAMSDB].[Person].[PhoneNumberType] 

SET IDENTITY_INSERT [Person].[PhoneNumberType] OFF

GO

-- Data Migration for Table Person.Credential --
insert into [Person].[Credential] (BusinessEntityId,Username,PasswordHash,PasswordSalt,ActivationCode,IsActivated,IsActive,RowGuid,ModifiedDate)
select BusinessEntityId,Username,PasswordHash,PasswordSalt,ActivationCode,IsActivated,IsActive,RowGuid,ModifiedDate from [PAMSDB].[Person].[Credential] 
GO

-- Data Migration for Table Person.PersonPersonTypes --

SET IDENTITY_INSERT [Person].[PersonPersonTypes] ON

insert into [Person].[PersonPersonTypes] (PersonPersonTypesId,Name,RowGuid,ModifiedDate)
select PersonPersonTypesId,Name,RowGuid,ModifiedDate from [PAMSDB].[Person].[PersonPersonTypes] 

SET IDENTITY_INSERT [Person].[PersonPersonTypes] OFF

GO

-- Data Migration for Table dbo.ProductCustoms --
insert into [dbo].[ProductCustoms] (ProductCustomID,Name,CustomValue,IsPercent)
select ProductCustomID,Name,CustomValue,IsPercent from [PAMSDB].[dbo].[ProductCustoms] 
GO

-- Data Migration for Table dbo.ProductColumns --

SET IDENTITY_INSERT [dbo].[ProductColumns] ON

insert into [dbo].[ProductColumns] (ID,Name,Caption,TypeName)
select ID,Name,Caption,TypeName from [PAMSDB].[dbo].[ProductColumns] 

SET IDENTITY_INSERT [dbo].[ProductColumns] OFF

GO

-- Data Migration for Table dbo.PartialShipmentDetailsType --

SET IDENTITY_INSERT [dbo].[PartialShipmentDetailsType] ON

insert into [dbo].[PartialShipmentDetailsType] (PartialShipmentDetailsTypeID,PartialShipmentDetailsType)
select PartialShipmentDetailsTypeID,PartialShipmentDetailsType from [PAMSDB].[dbo].[PartialShipmentDetailsType] 

SET IDENTITY_INSERT [dbo].[PartialShipmentDetailsType] OFF

GO

-- Data Migration for Table dbo.PaymentAccountType --

SET IDENTITY_INSERT [dbo].[PaymentAccountType] ON

insert into [dbo].[PaymentAccountType] (PaymentAccountTypeID,Name)
select PaymentAccountTypeID,Name from [PAMSDB].[dbo].[PaymentAccountType] 

SET IDENTITY_INSERT [dbo].[PaymentAccountType] OFF

GO

-- Data Migration for Table dbo.CustomerMarkets --

SET IDENTITY_INSERT [dbo].[CustomerMarkets] ON

insert into [dbo].[CustomerMarkets] (ID,CustomerMarket,UserName,ModifiedDate)
select ID,CustomerMarket,UserName,ModifiedDate from [PAMSDB].[dbo].[CustomerMarkets] 

SET IDENTITY_INSERT [dbo].[CustomerMarkets] OFF

GO

-- Data Migration for Table Person.PersonLanguages --

SET IDENTITY_INSERT [Person].[PersonLanguages] ON

insert into [Person].[PersonLanguages] (PersonLanguageId,PersonId,LanguageId,Title,FirstName,MiddleName,LastName,Suffix,DisplayName,AcronymName)
select PersonLanguageId,PersonId,LanguageId,Title,FirstName,MiddleName,LastName,Suffix,DisplayName,AcronymName from [PAMSDB].[Person].[PersonLanguages] 

SET IDENTITY_INSERT [Person].[PersonLanguages] OFF

GO

-- Data Migration for Table dbo.TwitterHashTags --
insert into [dbo].[TwitterHashTags] (ID,HashTag)
select ID,HashTag from [PAMSDB].[dbo].[TwitterHashTags] 
GO

-- Data Migration for Table Person.PersonType --

SET IDENTITY_INSERT [Person].[PersonType] ON

insert into [Person].[PersonType] (PersonTypeId,BusinessEntityId,PersonPersonTypesId,ModifiedDate)
select PersonTypeId,BusinessEntityId,PersonPersonTypesId,ModifiedDate from [PAMSDB].[Person].[PersonType] 

SET IDENTITY_INSERT [Person].[PersonType] OFF

GO

-- Data Migration for Table Person.CountryRegion --
insert into [Person].[CountryRegion] (CountryRegionCode,Name,ModifiedDate)
select CountryRegionCode,Name,ModifiedDate from [PAMSDB].[Person].[CountryRegion] 
GO

-- Data Migration for Table dbo.VisitsAchievments --
insert into [dbo].[VisitsAchievments] (ID,Achievment)
select ID,Achievment from [PAMSDB].[dbo].[VisitsAchievments] 
GO

-- Data Migration for Table Serial.SerialStatus --

SET IDENTITY_INSERT [Serial].[SerialStatus] ON

insert into [Serial].[SerialStatus] (SerialStatusID,BranchID,SerialTypeID,IsActive,SerialDate,UserName)
select SerialStatusID,BranchID,SerialTypeID,IsActive,SerialDate,UserName from [PAMSDB].[Serial].[SerialStatus] 

SET IDENTITY_INSERT [Serial].[SerialStatus] OFF

GO


SET IDENTITY_INSERT [dbo].[Structure] ON

insert into [dbo].[Structure] (StructureID,StructureTypeID,BusinessEntityID,AttributeID,AttributeValue,ViewTypeID)
select StructureID,StructureTypeID,BusinessEntityID,AttributeID,AttributeValue,ViewTypeID from [PAMSDB].[dbo].[Structure] 

SET IDENTITY_INSERT [dbo].[Structure] OFF

GO


SET IDENTITY_INSERT [dbo].[RolePrivileges] ON

insert into [dbo].[RolePrivileges] (ID,RoleID,PageID,SystemFunctionID)
select ID,RoleID,PageID,SystemFunctionID from [PAMSDB].[dbo].[RolePrivileges] 

SET IDENTITY_INSERT [dbo].[RolePrivileges] OFF

GO

-- Data Migration for Table dbo.UserRoles --

SET IDENTITY_INSERT [dbo].[UserRoles] ON

insert into [dbo].[UserRoles] (ID,RoleID,UserID)
select ID,RoleID,UserID from [PAMSDB].[dbo].[UserRoles] 

SET IDENTITY_INSERT [dbo].[UserRoles] OFF

GO


-- Data Migration for Table Serial.SerialCombination --

SET IDENTITY_INSERT [Serial].[SerialCombination] ON

insert into [Serial].[SerialCombination] (SerialCombinationID,SerialStatusID,SerialComponentID,SerialComponentOrder,CharsNo,SerialDataType,IsAutoIncrement,AutoIncrementValue,DefaultValue)
select SerialCombinationID,SerialStatusID,SerialComponentID,SerialComponentOrder,CharsNo,SerialDataType,IsAutoIncrement,AutoIncrementValue,DefaultValue from [PAMSDB].[Serial].[SerialCombination] 

SET IDENTITY_INSERT [Serial].[SerialCombination] OFF

GO