-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewPartialLosts] 	
    @PartialOrderID int,
    @LostReasonID int,
    @LostComment nvarchar(100),
    @Comment ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @WinnerName nvarchar(150),
    @WinnerPrice money,
    @WinnerPriceInEuro money,
    @RateToEuro decimal(18,2),
    @RateDate datetime,
    @WinnerPriceCurrencyID int
  
AS
INSERT INTO [dbo].[PartialLost] (
    [PartialOrderID],
    [LostReasonID],
    [LostComment],
    [Comment],
    [UserName],
    [ModifiedDate],
    [WinnerName],
    [WinnerPrice],
    [WinnerPriceInEuro],
    [RateToEuro],
    [RateDate],
    [WinnerPriceCurrencyID])
Values (
    @PartialOrderID,
    @LostReasonID,
    @LostComment,
    @Comment,
    @UserName,
    @ModifiedDate,
    @WinnerName,
    @WinnerPrice,
    @WinnerPriceInEuro,
    @RateToEuro,
    @RateDate,
    @WinnerPriceCurrencyID)
    
IF @@ROWCOUNT > 0
Select * from PartialLost 
Where [PartialOrderID] = @PartialOrderID
