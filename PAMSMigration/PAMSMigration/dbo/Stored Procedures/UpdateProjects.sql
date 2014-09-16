CREATE PROCEDURE [dbo].[UpdateProjects]
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
           ,@BranchID int 
           ,@IsGeneral bit
		   ,@IsOwnerRegistered bit
           ,@OldProjectID int
  
AS
UPDATE [dbo].[Projects]
   SET [ProjectCode] = @ProjectCode
      ,[ProjectName] = @ProjectName
      ,[ProjectLocation] = @ProjectLocation
      ,[ProjectDescription] = @ProjectDescription
      ,[OwnerID] = @OwnerID
      ,[FinalProduct] = @FinalProduct
      ,[StartDate] = @StartDate
      ,[EstimatedCost] = @EstimatedCost
      ,[EstimatedCostCurrencyID] = @EstimatedCostCurrencyID
      ,[Shareholders] = @Shareholders
      ,[LicenseBy] = @LicenseBy
      ,[EngineeringByID] = @EngineeringByID
      ,[ProcurementByID] = @ProcurementByID
      ,[ContractorID] = @ContractorID
      ,[EPC] = @EPC
      ,[VendorlistBy] = @VendorlistBy
      ,[ProjectStatusID] = @ProjectStatusID
      ,[ContactTitle] = @ContactTitle
      ,[ContactName] = @ContactName
      ,[ContactPosition] = @ContactPosition
      ,[ContactHomePhone] = @ContactHomePhone
      ,[ContactWorkPhone] = @ContactWorkPhone
      ,[ContactMobile] = @ContactMobile
      ,[ContactEmail] = @ContactEmail
      ,[ContactAddress] = @ContactAddress
      ,[ContactCountry] = @ContactCountry
      ,[ContactCity] = @ContactCity
      ,[ContactZip] = @ContactZip
      ,[ContactFax] = @ContactFax
      ,[ContactCompany] = @ContactCompany
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[BranchID] = @BranchID
      ,[IsGeneral] = @IsGeneral
	  ,IsOwnerRegistered = @IsOwnerRegistered
WHERE ID = @OldProjectID
IF @@ROWCOUNT > 0
Select * From Projects 
Where ID = @OldProjectID
