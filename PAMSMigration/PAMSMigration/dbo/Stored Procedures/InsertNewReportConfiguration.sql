-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewReportConfiguration]
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
           ,@StartCommentTemplate ntext
           ,@EndCommentTemplate ntext
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@BranchID int
AS
BEGIN
INSERT INTO [dbo].[ReportConfiguration]
           ([PrintCoverPage]
           ,[PrintCoverPageLogo]
           ,[PrintCoverPageSlogen]
           ,[PrintCoverPageCompanyStatement]
           ,[PrintFooterReportName]
           ,[PrintFooterPageNumber]
           ,[PrintFooterTodayDate]
           ,[PrintDetailsLogo]
           ,[PrintStartReportComment]
           ,[PrintEndReportComment]
           ,[ReportLeftMargin]
           ,[ReportRightMargin]
           ,[ReportTopMargin]
           ,[ReportBottomMargin]
           ,[StartCommentTemplate]
           ,[EndCommentTemplate]
           ,[UserName]
           ,[ModifiedDate]
           ,[BranchID])
     VALUES
           (@PrintCoverPage
           ,@PrintCoverPageLogo
           ,@PrintCoverPageSlogen
           ,@PrintCoverPageCompanyStatement
           ,@PrintFooterReportName
           ,@PrintFooterPageNumber
           ,@PrintFooterTodayDate
           ,@PrintDetailsLogo
           ,@PrintStartReportComment
           ,@PrintEndReportComment
           ,@ReportLeftMargin
           ,@ReportRightMargin
           ,@ReportTopMargin
           ,@ReportBottomMargin
           ,@StartCommentTemplate 
           ,@EndCommentTemplate
           ,@UserName
           ,@ModifiedDate
           ,@BranchID)
END
