-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOffersTemplates]
	        @InquiryNumber nvarchar(50)
           ,@HeaderName nvarchar(50)
           ,@ClientContactPerson nvarchar(50)
           ,@ClientContactPersonTitle nvarchar(50)
           ,@ClientAddress nvarchar(500)
           ,@ClientCity nvarchar(50)
           ,@ClientPhone nvarchar(50)
           ,@ClientFax nvarchar(50)
           ,@HeaderDate datetime
           ,@ValidUntil datetime
           ,@HeaderText nvarchar(MAX)
           ,@HeaderTemplate nvarchar(MAX)
           ,@DeliveryTime nvarchar(MAX)
           ,@PaymentTerms nvarchar(MAX)
           ,@DeliveryTerms nvarchar(MAX)
           ,@Taxes nvarchar(MAX)
           ,@OfferValidity int
           ,@OfferValidityPeriod nvarchar(50)
           ,@EndTemplate nvarchar(MAX)
           ,@PreparedByEmpID int
           ,@ApprovedByEmpID int
           ,@TotalItemsValue decimal(18,4)
           ,@ItemsCurrencyID int
           ,@ItemsComments nvarchar(MAX)
           ,@ItemsNotes nvarchar(MAX)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime
           ,@RevisionNumber int
           ,@IsFirstLanguage bit
           ,@oldID int 
           ,@OfferValidityText nvarchar(MAX)          
           AS
BEGIN
UPDATE [dbo].[OffersTemplates]
   SET [InquiryNumber] = @InquiryNumber
      ,[HeaderName] = @HeaderName
      ,[ClientContactPerson] = @ClientContactPerson
      ,[ClientContactPersonTitle] = @ClientContactPersonTitle
      ,[ClientAddress] = @ClientAddress
      ,[ClientCity] = @ClientCity
      ,[ClientPhone] = @ClientPhone
      ,[ClientFax] = @ClientFax
      ,[HeaderDate] = @HeaderDate
      ,[ValidUntil] = @ValidUntil
      ,[HeaderText] = @HeaderText
      ,[HeaderTemplate] = @HeaderTemplate
      ,[DeliveryTime] = @DeliveryTime
      ,[PaymentTerms] = @PaymentTerms
      ,[DeliveryTerms] = @DeliveryTerms
      ,[Taxes] = @Taxes
      ,[OfferValidity] = @OfferValidity
      ,[OfferValidityPeriod] = @OfferValidityPeriod
      ,[EndTemplate] = @EndTemplate
      ,[PreparedByEmpID] = @PreparedByEmpID
      ,[ApprovedByEmpID] = @ApprovedByEmpID
      ,[TotalItemsValue] = @TotalItemsValue
      ,[ItemsCurrencyID] = @ItemsCurrencyID
      ,[ItemsComments] = @ItemsComments
      ,[ItemsNotes] = @ItemsNotes
      ,[IsFirstLanguage] = @IsFirstLanguage
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
      ,[RevisionNumber] = @RevisionNumber
      ,[OfferValidityText] = @OfferValidityText
 WHERE ID = @oldID
END
