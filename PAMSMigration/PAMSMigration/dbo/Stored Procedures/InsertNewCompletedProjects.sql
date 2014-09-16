CREATE PROCEDURE [dbo].[InsertNewCompletedProjects]
            @InquiryNumber nvarchar(50)
           ,@HasCommission bit
           ,@IsAllGuranteesClosed bit
           ,@GuaranteesClosedDate datetime
           ,@IsAllCommissionPaid bit
           ,@AllCommssionPaidDate datetime
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
AS
INSERT INTO [dbo].[CompletedProjects]
           ([InquiryNumber]
           ,[HasCommission]
           ,[IsAllGuranteesClosed]
           ,[GuaranteesClosedDate]
           ,[IsAllCommissionPaid]
           ,[AllCommssionPaidDate]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@InquiryNumber
           ,@HasCommission
           ,@IsAllGuranteesClosed
           ,@GuaranteesClosedDate
           ,@IsAllCommissionPaid
           ,@AllCommssionPaidDate
           ,@UserName
           ,@ModifiedDate)
IF @@ROWCOUNT > 0
Select * from CompletedProjects
Where [InquiryNumber] = @InquiryNumber
