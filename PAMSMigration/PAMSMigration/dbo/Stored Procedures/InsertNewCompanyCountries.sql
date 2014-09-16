-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,,>
-- Description:	@Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewCompanyCountries]
            @ID int out 
	       ,@CountryName nvarchar(500)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   INSERT INTO [dbo].[CompanyCountries]
           ([CountryName]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@CountryName
           ,@UserName
           ,@ModifiedDate)
           
           set @ID = SCOPE_IDENTITY()
END
