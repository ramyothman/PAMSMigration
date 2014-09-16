/****** Object:  UserDefinedFunction [dbo].[GetFirstDayOfQuarter]    Script Date: 03/20/2013 12:55:44 ******/
CREATE FUNCTION [dbo].[GetFirstDayOfQuarter] ( @pInputDate    DATETIME )
RETURNS DATETIME
BEGIN
    DECLARE @vOutputDate        DATETIME
    SET @vOutputDate = CAST(YEAR(@pInputDate) AS VARCHAR(4)) +
                       CASE WHEN MONTH(@pInputDate) IN ( 1,  2,  3) THEN '/01/01'
                            WHEN MONTH(@pInputDate) IN ( 4,  5,  6) THEN '/04/01'
                            WHEN MONTH(@pInputDate) IN ( 7,  8,  9) THEN '/07/01'
                            WHEN MONTH(@pInputDate) IN (10, 11, 12) THEN '/10/01'
                       END
    RETURN @vOutputDate
END
