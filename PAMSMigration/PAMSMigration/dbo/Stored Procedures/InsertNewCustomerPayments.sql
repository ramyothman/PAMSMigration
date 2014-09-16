CREATE PROCEDURE [dbo].[InsertNewCustomerPayments]
    @InquiryNumber nvarchar(50),
    @InvoiceNumber nvarchar(50),
    @PaymentNumber int,
    @PaidAmount decimal(18,2),
    @PaidAmountCurrencyID int,
    @PaidAmountRateToEuro decimal(18,2),
    @PaidAmountInEuro decimal(18,2),
    @PaidAmountRateDate datetime,
    @ONDate datetime,
    @SumPaid decimal(18,2),
    @Deduction bit,
    @DeductionNumber int,
    @DeductionAmount decimal(18,2),
    @DeductionAmountCurrencyID int,
    @DeductionAmountRateToEuro decimal(18,2),
    @DeductionAmountInEuro decimal(18,2),
    @DeductionAmountRateDate datetime,
    @Reason ntext,
    @SumDeduction decimal(18,2),
    @RestPayment decimal(18,2),
    @Comment ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
	@IsPaid	bit,
	@Amount	decimal(18, 2),
	@CurrencyID	int	
AS
select @PaymentNumber = COUNT([InquiryNumber]) 
from CustomerPayments 
where [InquiryNumber] = @InquiryNumber and [PaidAmount] >0
select @DeductionNumber = COUNT([InquiryNumber]) 
from CustomerPayments 
where [InquiryNumber] = @InquiryNumber and [DeductionAmount] >0
if((@PaymentNumber is null or @PaymentNumber = 0) and @PaidAmount >0)
   set @PaymentNumber = 1
else if (@PaidAmount <=0)
   set @PaymentNumber = 0
 else 
 set  @PaymentNumber = @PaymentNumber +1
 
if((@DeductionNumber is null or  @DeductionNumber = 0) and @DeductionAmount >0)
   set @DeductionNumber = 1
else if(@DeductionAmount <=0)
    set @DeductionNumber = 0
else   
set @DeductionNumber =   @DeductionNumber+1
INSERT INTO [dbo].[CustomerPayments] (
    [InquiryNumber],
    [InvoiceNumber],
    [PaymentNumber],
    [PaidAmount],
    [PaidAmountCurrencyID],
    [PaidAmountRateToEuro],
    [PaidAmountInEuro],
    [PaidAmountRateDate],
    [ONDate],
    [SumPaid],
    [Deduction],
    [DeductionNumber],
    [DeductionAmount],
    [DeductionAmountCurrencyID],
    [DeductionAmountRateToEuro],
    [DeductionAmountInEuro],
    [DeductionAmountRateDate],
    [Reason],
    [SumDeduction],
    [RestPayment],
    [Comment],
    [UserName],
    [ModifiedDate],
	IsPaid,
	Amount,
	CurrencyID)
Values (
    @InquiryNumber,
    @InvoiceNumber,
    @PaymentNumber,
    @PaidAmount,
    @PaidAmountCurrencyID,
    @PaidAmountRateToEuro,
    @PaidAmountInEuro,
    @PaidAmountRateDate,
    @ONDate,
    @SumPaid,
    @Deduction,
    @DeductionNumber,
    @DeductionAmount,
    @DeductionAmountCurrencyID,
    @DeductionAmountRateToEuro,
    @DeductionAmountInEuro,
    @DeductionAmountRateDate,
    @Reason,
    @SumDeduction,
    @RestPayment,
    @Comment,
    @UserName,
    @ModifiedDate,
	@IsPaid	,
	@Amount	,
	@CurrencyID	
	)
IF @@ROWCOUNT > 0
Select * from CustomerPayments
Where [CustomerPaymentID] = @@identity
