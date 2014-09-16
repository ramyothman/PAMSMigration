-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateReportConfiguration]
            @PrintCoverPage bit
           ,@PrintCoverPageLogo bit
           ,@PrintCoverPageSlogen bit
           ,@PrintCoverPageCompanyStatement bit
           ,@PrintFooterReportName bit
           ,@PrintFooterPageNumber bit
           ,@PrintFooterTodayDate bit
           ,@PrintDetailsLogo bit
           ,@PrintStartReportComment bit
           ,@PrintEndReportComment bit
           ,@ReportLeftMargin decimal(5,2)
           ,@ReportRightMargin decimal(5,2)
           ,@ReportTopMargin decimal(5,2)
           ,@ReportBottomMargin decimal(5,2)
           ,@UserName nvarchar(50)
           ,@StartCommentTemplate ntext
           ,@EndCommentTemplate ntext
           ,@ModifiedDate datetime
           ,@BranchID int
           ,@OldID int
AS
BEGIN
UPDATE [dbo].[ReportConfiguration]
   SET [PrintCoverPage] = @PrintCoverPage
      ,[PrintCoverPageLogo] = @PrintCoverPageLogo
      ,[PrintCoverPageSlogen] = @PrintCoverPageSlogen
      ,[PrintCoverPageCompanyStatement] = @PrintCoverPageCompanyStatement
      ,[PrintFooterReportName] = @PrintFooterReportName
      ,[PrintFooterPageNumber] = @PrintFooterPageNumber
      ,[PrintFooterTodayDate] = @PrintFooterTodayDate
      ,[PrintDetailsLogo] = @PrintDetailsLogo
      ,[PrintStartReportComment] = @PrintStartReportComment
      ,[PrintEndReportComment] = @PrintEndReportComment
      ,[ReportLeftMargin] = @ReportLeftMargin
      ,[ReportRightMargin] = @ReportRightMargin
      ,[ReportTopMargin] = @ReportTopMargin
      ,[ReportBottomMargin] = @ReportBottomMargin
      ,[StartCommentTemplate] = @StartCommentTemplate
      ,[EndCommentTemplate] = @EndCommentTemplate
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[BranchID] = @BranchID
 WHERE ID = @OldID
END
