/****** Object:  View [dbo].[GetAllSubCommissions]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllSubCommissions]
AS
SELECT     SubCommissionID, InquiryNumber, AgentID, PriceCommissionBase, PercentPriceCommissionBase, SubCommissionPercent, SubCommissionAmount, CurrencyID, 
                      RateToEuro, ONDate, SubCommissionAmountInEuro, Reason, UserName, ModifiedDate
FROM         dbo.SubCommissions
