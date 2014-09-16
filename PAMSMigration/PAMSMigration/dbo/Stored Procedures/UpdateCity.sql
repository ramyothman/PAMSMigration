CREATE PROCEDURE [dbo].[UpdateCity]
            @oldID int
           ,@CountryRegionCode nchar(10)
           ,@City nvarchar(250)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
Begin
 UPDATE [dbo].[Cities]
   SET [CountryRegionCode] =@CountryRegionCode
      ,[City] = @City
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @oldID
End
