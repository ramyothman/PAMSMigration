CREATE PROCEDURE [dbo].[InsertNewProjects]
            @ProjectCode nvarchar(50)
           ,@ProjectName nvarchar(100)
           ,@ProjectLocation nvarchar(100)
           ,@ProjectDescription ntext
           ,@OwnerID int
           ,@FinalProduct nvarchar(500)
           ,@StartDate datetime
           ,@EstimatedCost decimal(18,2)
           ,@EstimatedCostCurrencyID int
           ,@Shareholders nvarchar(250)
           ,@LicenseBy nvarchar(250)
           ,@EngineeringByID int
           ,@ProcurementByID int
           ,@ContractorID int
           ,@EPC nvarchar(250)
           ,@VendorlistBy nvarchar(500)
           ,@ProjectStatusID int
           ,@ContactTitle nchar(10)
           ,@ContactName nvarchar(100)
           ,@ContactPosition nvarchar(150)
           ,@ContactHomePhone nvarchar(50)
           ,@ContactWorkPhone nvarchar(50)
           ,@ContactMobile nvarchar(50)
           ,@ContactEmail nvarchar(50)
           ,@ContactAddress nvarchar(255)
           ,@ContactCountry nvarchar(50)
           ,@ContactCity nvarchar(50)
           ,@ContactZip nvarchar(50)
           ,@ContactFax nvarchar(50)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@ContactCompany nvarchar(250)
           ,@BranchID int = null
           ,@IsGeneral bit
		   ,@IsOwnerRegistered bit
AS
BEGIN
INSERT INTO [dbo].[Projects]
           ([ProjectCode]
           ,[ProjectName]
           ,[ProjectLocation]
           ,[ProjectDescription]
           ,[OwnerID]
           ,[FinalProduct]
           ,[StartDate]
           ,[EstimatedCost]
           ,[EstimatedCostCurrencyID]
           ,[Shareholders]
           ,[LicenseBy]
           ,[EngineeringByID]
           ,[ProcurementByID]
           ,[ContractorID]
           ,[EPC]
           ,[VendorlistBy]
           ,[ProjectStatusID]
           ,[ContactTitle]
           ,[ContactName]
           ,[ContactPosition]
           ,[ContactHomePhone]
           ,[ContactWorkPhone]
           ,[ContactMobile]
           ,[ContactEmail]
           ,[ContactAddress]
           ,[ContactCountry]
           ,[ContactCity]
           ,[ContactZip]
           ,[ContactFax]
           ,[ContactCompany]
           ,[UserName]
           ,[ModifiedDate]
           ,[BranchID]
           ,[IsGeneral]
		   ,IsOwnerRegistered)
     VALUES
           (@ProjectCode
           ,@ProjectName
           ,@ProjectLocation
           ,@ProjectDescription
           ,@OwnerID
           ,@FinalProduct
           ,@StartDate
           ,@EstimatedCost
           ,@EstimatedCostCurrencyID
           ,@Shareholders
           ,@LicenseBy
           ,@EngineeringByID
           ,@ProcurementByID
           ,@ContractorID
           ,@EPC
           ,@VendorlistBy
           ,@ProjectStatusID
           ,@ContactTitle
           ,@ContactName
           ,@ContactPosition
           ,@ContactHomePhone
           ,@ContactWorkPhone
           ,@ContactMobile
           ,@ContactEmail
           ,@ContactAddress
           ,@ContactCountry
           ,@ContactCity
           ,@ContactZip
           ,@ContactFax
           ,@ContactCompany
           ,@UserName
           ,@ModifiedDate
           ,@BranchID
           ,@IsGeneral
		   ,@IsOwnerRegistered)
IF @@ROWCOUNT > 0
Select * from Projects
Where [ProjectCode] = @ProjectCode
END
