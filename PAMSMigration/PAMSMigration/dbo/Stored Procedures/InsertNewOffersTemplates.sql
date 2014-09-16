-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewOffersTemplates]
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
           ,@OfferValidityText nvarchar(MAX)
           AS
BEGIN
	INSERT INTO [dbo].[OffersTemplates]
           ([InquiryNumber]
           ,[HeaderName]
           ,[ClientContactPerson]
           ,[ClientContactPersonTitle]
           ,[ClientAddress]
           ,[ClientCity]
           ,[ClientPhone]
           ,[ClientFax]
           ,[HeaderDate]
           ,[ValidUntil]
           ,[HeaderText]
           ,[HeaderTemplate]
           ,[DeliveryTime]
           ,[PaymentTerms]
           ,[DeliveryTerms]
           ,[Taxes]
           ,[OfferValidity]
           ,[OfferValidityPeriod]
           ,[EndTemplate]
           ,[PreparedByEmpID]
           ,[ApprovedByEmpID]
           ,[TotalItemsValue]
           ,[ItemsCurrencyID]
           ,[ItemsComments]
           ,[ItemsNotes]
           ,[UserName]
           ,[ModifiedDate]
           ,[RevisionNumber]
           ,[IsFirstLanguage]
           ,[OfferValidityText])
     VALUES
           (@InquiryNumber
           ,@HeaderName
           ,@ClientContactPerson
           ,@ClientContactPersonTitle
           ,@ClientAddress
           ,@ClientCity
           ,@ClientPhone
           ,@ClientFax
           ,@HeaderDate
           ,@ValidUntil
           ,@HeaderText
           ,@HeaderTemplate
           ,@DeliveryTime
           ,@PaymentTerms
           ,@DeliveryTerms
           ,@Taxes
           ,@OfferValidity
           ,@OfferValidityPeriod 
           ,@EndTemplate
           ,@PreparedByEmpID
           ,@ApprovedByEmpID
           ,@TotalItemsValue
           ,@ItemsCurrencyID
           ,@ItemsComments
           ,@ItemsNotes
           ,@UserName
           ,@ModifiedDate
           ,@RevisionNumber
           ,@IsFirstLanguage
           ,@OfferValidityText)
           
 IF @@ROWCOUNT > 0
Select * from OffersTemplates
Where [ID] = @@identity
END
