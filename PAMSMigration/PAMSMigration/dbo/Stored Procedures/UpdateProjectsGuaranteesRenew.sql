CREATE PROCEDURE [dbo].[UpdateProjectsGuaranteesRenew]
            @GuaranteeID int
           ,@RenewDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@oldID int
   AS
BEGIN        
UPDATE [dbo].[ProjectsGuaranteeRenews]
   SET [GuaranteeID] = @GuaranteeID
      ,[RenewDate] = @RenewDate
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @oldID
END
