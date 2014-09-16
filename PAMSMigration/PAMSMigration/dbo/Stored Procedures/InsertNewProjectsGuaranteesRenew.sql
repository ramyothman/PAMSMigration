CREATE PROCEDURE [dbo].[InsertNewProjectsGuaranteesRenew]
           @GuaranteeID int
           ,@RenewDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
   AS
BEGIN        
INSERT INTO [dbo].[ProjectsGuaranteeRenews]
           ([GuaranteeID]
           ,[RenewDate]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@GuaranteeID
           ,@RenewDate
           ,@UserName
           ,@ModifiedDate)
IF @@ROWCOUNT > 0
Select * from [dbo].[ProjectsGuaranteeRenews]
Where [ID] = @@identity
END
