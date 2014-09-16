-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetClientBreakDownGraph]
	-- Add the parameters for the stored procedure here
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@InquiryStatus nvarchar(50),
@ClientID int,
@IsFromToChecked bit,
@ChoosenFromDate datetime,
@ChoosenToDate datetime,
@BranchID int 
AS
BEGIN
	declare @FromDate as datetime
declare @ToDate as datetime
set @FromDate = @ChoosenFromDate
set @ToDate = @ChoosenToDate
-- User Choose Month
if(@PeriodChoice = 0)
Begin
	if(@IsFromToChecked = 0)
    Begin	
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(month, -@PeriodNumber ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(month, -@PeriodNumber +1,DATEADD(month,-1, getdate()))
			set @ToDate = DATEADD(month,-1, getdate())
		end
		
		SET @FromDate = DATEADD(DD, 1 - DAY(@FromDate), @FromDate)
		
		print(@FromDate)
		print(@ToDate)
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
    END
 END
    --User Choose Quarter
else if(@PeriodChoice = 1)
Begin
	if(@IsFromToChecked = 0)
    Begin
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(month, -(@PeriodNumber *3) ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(month, -(@PeriodNumber *3) +1,DATEADD(month,-4, getdate()))
			set @ToDate = DATEADD(month,-1, getdate())
		end
		
		set @FromDate = [dbo].[GetFirstDayOfQuarter](@FromDate)	
		
		print(@FromDate)
		print(@ToDate)
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
    END
END
-- User Choose Year
else if(@PeriodChoice = 2)
Begin
	if(@IsFromToChecked = 0)
    Begin	
		if(@Current = 'true')
		begin
			set @FromDate = DATEADD(year, -@PeriodNumber ,getdate())
			set @ToDate = getdate()
		end
		else
		begin
			set @FromDate = DATEADD(year, -@PeriodNumber +1,DATEADD(year,-1, getdate()))
			set @ToDate = DATEADD(year,-1, getdate())
		end
		--print(@FromDate + ',' + @ToDate + '')
		
		SELECT @ToDate = dateadd(mm,1,@ToDate - day(@ToDate)+1)-1
		SELECT @FromDate = (CAST(STR(MONTH(@FromDate))+'/'+STR(01)+'/'+STR(YEAR(@FromDate)) AS DateTime))
   END 
END
if(@InquiryStatus = 'Offer')
  Select InquiryStatus,
          TotalAmount,
          StatusCount,
          ISNULL(ProductTypeID,0) ProductTypeID    
  From (Select InquiryStatus,
         ISNull(SUM(TotalAmount),0) as TotalAmount,
         SUM(StatusCount) as StatusCount,ISNULL(ProductTypeID,0) ProductTypeID       
         from ( SELECT  InquiryStatus,Count(InquiryStatus) as StatusCount,						
						(CASE WHEN InquiryStatus IN ('Order') 
                        THEN ISNull(Sum(PriceInEuro),0) 
                        WHEN InquiryStatus IN ('Offer','Lost','LateResponse','Regret','Cancelled')
                        THEN ISNull(Sum(QuotationPriceInEuro),0) 
                        ELSE  ISNull(Sum(ShipmentPriceInEuro),0) 
                        END )as TotalAmount,ProductTypeID
				FROM  viewSubProjectTotals
				where BranchID = @BranchID and OfferDate is not null and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
										OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
					  CustomerID = @ClientID and InquiryStatus<>'Inquiry'AND InquiryStatus<>'Regret' 
			   --AND InquiryNumber IN (SELECT [InquiryNumber]  
      --                                      FROM [dbo].[ProjectsHistory]
      --                                      WHERE [ProjectTypeID] = 2) 
              Group by InquiryStatus,ProductTypeID
	          ) as tbl  
         Group by InquiryStatus,ProductTypeID
      )t,  ProjectTypes	
    where t.InquiryStatus = ProjectTypes.ProjectType
     order by ProjectTypes.OrderByType
END
