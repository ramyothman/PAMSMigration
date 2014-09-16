CREATE PROCEDURE [dbo].[InsertNewSuppliers]
    @SupplierName nvarchar(100),@SupplierWebSite nvarchar(100),
    @ContactTitle nvarchar(10),@ContactName nvarchar(100),
    @ContactDisplayName nvarchar(150),@ContactHomePhone nvarchar(50),
    @ContactWorkPhone nvarchar(50),@ContactMobile nvarchar(50),
    @ContactEmail nvarchar(50),@ContactAddress nvarchar(255),
    @ContactCountry nvarchar(50),@ContactCity nvarchar(50),
    @ContactZip nvarchar(50),@ContactFax nvarchar(50),
    @UserName nvarchar(50),@ModifiedDate datetime,
    @HasSubSuppliers BIT,@Logo image,
    @IsPrincipale bit,@CurrentCompany bit,
    @SupplierTypeID int = null,@BranchID int = null,
    @IsGeneral bit
AS
INSERT INTO [dbo].[Suppliers] (
    [SupplierName],[SupplierWebSite],
    [ContactTitle],[ContactName],
    [ContactDisplayName],[ContactHomePhone],
    [ContactWorkPhone],[ContactMobile],
    [ContactEmail],[ContactAddress],
    [ContactCountry],[ContactCity],
    [ContactZip],[ContactFax],
    [UserName],[ModifiedDate],
    [HasSubSuppliers],[Logo],
    [IsPrincipale],[CurrentCompany],
    [SupplierTypeID],[IsGeneral])
Values 
(@SupplierName,@SupplierWebSite,@ContactTitle,@ContactName,@ContactDisplayName
,@ContactHomePhone,@ContactWorkPhone,@ContactMobile,@ContactEmail,@ContactAddress
,@ContactCountry,@ContactCity,@ContactZip,@ContactFax,@UserName,@ModifiedDate
,@HasSubSuppliers,@Logo,@IsPrincipale,@CurrentCompany,@SupplierTypeID,@IsGeneral)
IF @@ROWCOUNT > 0
insert into SupplierBranch(SupplierID,BranchID)
values(@@Identity,@BranchID)
Select * from Suppliers
Where [SupplierID] = @@identity
