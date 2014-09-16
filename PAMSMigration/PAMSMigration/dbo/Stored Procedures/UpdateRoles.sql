CREATE PROCEDURE [dbo].[UpdateRoles]
    @OldID int,
    @Name nvarchar(50),
    @IsActive bit,
    @LimitedSuppliers bit,
    @BranchID int ,
    @IsPrincipal bit
AS
UPDATE [dbo].[Roles]
SET
    Name = @Name,
    IsActive = @IsActive,
    LimitedSuppliers = @LimitedSuppliers,
    BranchID = @BranchID , 
    IsPrincipal = @IsPrincipal  
            
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From Roles 
Where [ID] = @OLDID
