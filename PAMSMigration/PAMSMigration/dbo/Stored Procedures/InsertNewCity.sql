CREATE PROCEDURE [dbo].[InsertNewCity]
            @ID int out
           ,@CountryRegionCode nchar(10)
           ,@City nvarchar(250)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[Cities]
           ([CountryRegionCode]
           ,[City]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@CountryRegionCode
           ,@City
           ,@UserName
           ,@ModifiedDate)
IF @@ROWCOUNT > 0
Select * from [dbo].[Cities]
Where ID = @ID
