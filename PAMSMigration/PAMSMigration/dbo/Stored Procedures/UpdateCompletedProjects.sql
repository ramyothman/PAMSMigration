CREATE PROCEDURE [dbo].[UpdateCompletedProjects]
            @InquiryNumber nvarchar(50)
           ,@HasCommission bit
           ,@IsAllGuranteesClosed bit
           ,@GuaranteesClosedDate datetime
           ,@IsAllCommissionPaid bit
           ,@AllCommssionPaidDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
UPDATE [dbo].[CompletedProjects]
   SET [HasCommission] = @HasCommission
      ,[IsAllGuranteesClosed] = @IsAllGuranteesClosed
      ,[GuaranteesClosedDate] = @GuaranteesClosedDate
      ,[IsAllCommissionPaid] = @IsAllCommissionPaid
      ,[AllCommssionPaidDate] = @AllCommssionPaidDate
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
Where [InquiryNumber] = @InquiryNumber
