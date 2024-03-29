﻿CREATE PROCEDURE [dbo].[InsertNewCustomers]
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
INSERT INTO [dbo].[Customers] (
    [CompanyName],
    [CompanyCode],
    [CustomerTypeID],
    [CustomerMarketID],
    [CompanyWebSite],
    [ContactTitle],
    [ContactName],
    [ContactDisplayName],
    [ContactHomePhone],
    [ContactWorkPhone],
    [ContactMobile],
    [ContactEmail],
    [ContactAddress],
    [ContactCountry],
    [ContactCity],
    [ContactZip],
    [ContactFax],
    [UserName],
    [ModifiedDate],
    [CountryID])
Values (
    @CompanyName,
    @CompanyCode,
    @CustomerTypeID,
    @CustomerMarketID,
    @CompanyWebSite,
    @ContactTitle,
    @ContactName,
    @ContactDisplayName,
    @ContactHomePhone,
    @ContactWorkPhone,
    @ContactMobile,
    @ContactEmail,
    @ContactAddress,
    @ContactCountry,
    @ContactCity,
    @ContactZip,
    @ContactFax,
    @UserName,
    @ModifiedDate,
    @CountryID)
IF @@ROWCOUNT > 0
insert into CustomerBranches(CustomerID,BranchID)
values(@@identity,@BranchID)
Select * from Customers
Where [CustomerID] = @@identity
