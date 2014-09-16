CREATE PROCEDURE [dbo].[UpdateSuppliers]
    @OldSupplierID int,@SupplierName nvarchar(100),
    @SupplierWebSite nvarchar(100),@ContactTitle nvarchar(10),
    @ContactName nvarchar(100),@ContactDisplayName nvarchar(150),
    @ContactHomePhone nvarchar(50),@ContactWorkPhone nvarchar(50),
    @ContactMobile nvarchar(50),@ContactEmail nvarchar(50),
    @ContactAddress nvarchar(255),@ContactCountry nvarchar(50),
    @ContactCity nvarchar(50),@ContactZip nvarchar(50),
    @ContactFax nvarchar(50),@UserName nvarchar(50),
    @ModifiedDate datetime,@HasSubSuppliers BIT,@Logo image,
    @IsPrincipale bit,@CurrentCompany bit,@SupplierTypeID int,
    @BranchID int,@IsGeneral bit
AS
UPDATE [dbo].[Suppliers]
SET
    SupplierName = @SupplierName,
    SupplierWebSite = @SupplierWebSite,
    ContactTitle = @ContactTitle,
    ContactName = @ContactName,
    ContactDisplayName = @ContactDisplayName,
    ContactHomePhone = @ContactHomePhone,
    ContactWorkPhone = @ContactWorkPhone,
    ContactMobile = @ContactMobile,
    ContactEmail = @ContactEmail,
    ContactAddress = @ContactAddress,
    ContactCountry = @ContactCountry,
    ContactCity = @ContactCity,
    ContactZip = @ContactZip,
    ContactFax = @ContactFax,
    Logo = @Logo,
    UserName = @UserName,
    ModifiedDate = @ModifiedDate,    
    HasSubSuppliers = @HasSubSuppliers,
    IsPrincipale = @IsPrincipale,
    CurrentCompany = @CurrentCompany,
    SupplierTypeID = @SupplierTypeID,
    --BranchID = @BranchID,
    IsGeneral = @IsGeneral
WHERE [SupplierID] = @OLDSupplierID
update supplierbranch set BranchID=@BranchID
where [SupplierID] = @OLDSupplierID
IF @@ROWCOUNT > 0
Select * From Suppliers 
Where [SupplierID] = @OLDSupplierID
