CREATE PROCEDURE [dbo].[UpdateCustomers]
    @OldCustomerID int,
    @CompanyName nvarchar(100),
    @CompanyCode nvarchar(20),
    @CompanyWebSite nvarchar(100),
    @CustomerMarketID int,
    @CustomerTypeID int,
    @ContactTitle nvarchar(10),
    @ContactName nvarchar(100),
    @ContactDisplayName nvarchar(150),
    @ContactHomePhone nvarchar(50),
    @ContactWorkPhone nvarchar(50),
    @ContactMobile nvarchar(50),
    @ContactEmail nvarchar(50),
    @ContactAddress nvarchar(255),
    @ContactCountry nvarchar(50),
    @ContactCity nvarchar(50),
    @ContactZip nvarchar(50),
    @ContactFax nvarchar(50),
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @CountryID int,
    @BranchID int
AS
UPDATE [dbo].[Customers]
SET
    CompanyName = @CompanyName,
    CompanyCode = @CompanyCode,
    CustomerTypeID = @CustomerTypeID,
    CustomerMarketID = @CustomerMarketID,
    CompanyWebSite = @CompanyWebSite,
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
    UserName = @UserName,
    ModifiedDate = @ModifiedDate,
    CountryID = @CountryID--,
    --BranchID = @BranchID
WHERE [CustomerID] = @OLDCustomerID
IF @@ROWCOUNT > 0
update CustomerBranches set BranchID=@BranchID
where CustomerID=@OldCustomerID
Select * From Customers 
Where [CustomerID] = @OLDCustomerID
