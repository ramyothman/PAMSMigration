CREATE PROCEDURE [dbo].[InsertNewSubCommissions]
    @InquiryNumber nvarchar(50),
    @AgentID int,
    @PriceCommissionBase decimal(18,0),
    @PercentPriceCommissionBase numeric,
    @SubCommissionPercent numeric,
    @SubCommissionAmount decimal(18,0),
    @CurrencyID int,
    @RateToEuro numeric,
    @ONDate datetime,
    @SubCommissionAmountInEuro decimal(18,0),
    @Reason ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime
AS
INSERT INTO [dbo].[SubCommissions] (
    [InquiryNumber],
    [AgentID],
    [PriceCommissionBase],
    [PercentPriceCommissionBase],
    [SubCommissionPercent],
    [SubCommissionAmount],
    [CurrencyID],
    [RateToEuro],
    [ONDate],
    [SubCommissionAmountInEuro],
    [Reason],
    [UserName],
    [ModifiedDate])
Values (
    @InquiryNumber,
    @AgentID,
    @PriceCommissionBase,
    @PercentPriceCommissionBase,
    @SubCommissionPercent,
    @SubCommissionAmount,
    @CurrencyID,
    @RateToEuro,
    @ONDate,
    @SubCommissionAmountInEuro,
    @Reason,
    @UserName,
    @ModifiedDate)
IF @@ROWCOUNT > 0
Select * from SubCommissions
Where [SubCommissionID] = @@identity
