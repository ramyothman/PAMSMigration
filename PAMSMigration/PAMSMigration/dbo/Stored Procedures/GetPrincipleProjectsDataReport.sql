-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPrincipleProjectsDataReport]
@PeriodNumber int,
@PeriodChoice int,
@Current bit,
@SupplierID int,
@ProjectStatus nvarchar(50),
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
    if(@IsFromToChecked = 0)
    Begin
		-- User Choose Month
		if(@PeriodChoice = 0)
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
		--User Choose Quarter
		if(@PeriodChoice = 1)
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
		-- User Choose Year
		else if(@PeriodChoice = 2)
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
	if(@ProjectStatus = 'Inquiry')
	BEGIN
	  SELECT *
	  FROM [dbo].[ViewShotecProject]
	  where BranchID = @BranchID and InquiryDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
			InquiryDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
			  SupplierID = @SupplierID 
     END
     ELSE if(@ProjectStatus = 'Offer')
	 BEGIN
	  SELECT *
	  FROM [dbo].[ViewShotecProject]
	  where BranchID = @BranchID and OfferDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
			OfferDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
			  SupplierID = @SupplierID
     END
     ELSE if(@ProjectStatus = 'Order')
	 BEGIN
	  SELECT *
	  FROM [dbo].[ViewShotecProject]
	  where BranchID = @BranchID and OrderDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
			OrderDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
			  SupplierID = @SupplierID
     END
     ELSE if(@ProjectStatus = 'Delivered')
	 BEGIN
	  SELECT *
	  FROM [dbo].[ViewShotecProject]
	  where BranchID = @BranchID and DeliveredON >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
			DeliveredON <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
			  SupplierID = @SupplierID
     END
      ELSE 
	 BEGIN
	  SELECT *
	  FROM [dbo].[ViewShotecProject]
	  where BranchID = @BranchID and  LostDate >= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, @FromDate))) and 
			LostDate <= (SELECT DATEADD(dd, 0, DATEDIFF(dd, 0,@ToDate))) and 
			  SupplierID = @SupplierID and ProjectStatus = @ProjectStatus
     END
END
