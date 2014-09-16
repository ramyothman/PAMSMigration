CREATE PROCEDURE [dbo].[GetByProcessorIDSecurityActivation]
    @ProcessorId nvarchar(50)
AS
BEGIN
Select *
From [dbo].[SecurityActivation]
WHERE ProcessorId = @ProcessorId
END
