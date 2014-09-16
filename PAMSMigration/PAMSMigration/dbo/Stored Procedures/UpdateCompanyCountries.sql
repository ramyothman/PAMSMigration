-- =============================================
-- Author:		@Author,,Name>
-- Alter date: @Alter Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCompanyCountries]
            @OldID int 
           ,@CountryName nvarchar(500)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
	AS
BEGIN
UPDATE [dbo].[CompanyCountries]
   SET [CountryName] = @CountryName
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE ID = @OldID    
END
