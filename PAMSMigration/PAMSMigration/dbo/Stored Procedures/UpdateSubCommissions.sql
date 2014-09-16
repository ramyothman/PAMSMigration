CREATE PROCEDURE [dbo].[UpdateSubCommissions]
    @OldSubCommissionID int,
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
UPDATE [dbo].[SubCommissions]
SET
    InquiryNumber = @InquiryNumber,
    AgentID = @AgentID,
    PriceCommissionBase = @PriceCommissionBase,
    PercentPriceCommissionBase = @PercentPriceCommissionBase,
    SubCommissionPercent = @SubCommissionPercent,
    SubCommissionAmount = @SubCommissionAmount,
    CurrencyID = @CurrencyID,
    RateToEuro = @RateToEuro,
    ONDate = @ONDate,
    SubCommissionAmountInEuro = @SubCommissionAmountInEuro,
    Reason = @Reason,
    UserName = @UserName,
    ModifiedDate = @ModifiedDate
WHERE [SubCommissionID] = @OLDSubCommissionID
IF @@ROWCOUNT > 0
Select * From SubCommissions 
Where [SubCommissionID] = @OLDSubCommissionID
