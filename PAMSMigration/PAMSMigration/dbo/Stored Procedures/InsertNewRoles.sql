CREATE PROCEDURE [dbo].[InsertNewRoles]
    @Name nvarchar(50),
    @IsActive bit,
    @LimitedSuppliers bit,
    @BranchID int , 
    @IsPrincipal bit
AS
INSERT INTO [dbo].[Roles] (
    [Name],
    [IsActive],
    [LimitedSuppliers],
    [BranchID],
    [IsPrincipal]
    )
Values (
    @Name,
    @IsActive,
    @LimitedSuppliers,
    @BranchID ,
    @IsPrincipal
    )
IF @@ROWCOUNT > 0
Select * from Roles
Where [ID] = @@identity
