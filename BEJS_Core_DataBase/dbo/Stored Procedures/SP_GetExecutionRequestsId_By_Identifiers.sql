CREATE   PROCEDURE [dbo].[SP_GetExecutionRequestsId_By_Identifiers]
@PlaintiffNin NVARCHAR(50),
@PlaintiffRepNin NVARCHAR(50),
@UnifiedNumber NVARCHAR(50),
@LicenseNumber NVARCHAR(50),
@CRNumber NVARCHAR(50),
@MISALicenseNo NVARCHAR(50),
@RegistrationNumber NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
 
SELECT DISTINCT [GovR].[Id] AS RequestId
FROM [ExrGov].[Requests] GovR
         JOIN [EXR].[ExecutionRequests] R ON [R].[Id] = [GovR].[Id]
         JOIN [AUTH].[Users] USR ON [R].[CreatedById] = [USR].[Id]
WHERE (@PlaintiffRepNin IS NOT NULL AND USR.Nin = @PlaintiffRepNin)
 
UNION
SELECT DISTINCT [RCR].[Id] AS RequestId
FROM [EXR].[RegisteredCompanyRequests] RCR
         JOIN [EXR].[RegisteredCompanyPlaintiffs] RCP ON [RCR].[Id] = [RCP].[RequestId]
         JOIN [EXR].[RegisteredCompanyPlaintiffRepresentatives] RCPR ON [RCR].[PlaintiffRepresentativeId] = [RCPR].[Id]
WHERE (@PlaintiffRepNin IS NOT NULL AND COALESCE(RCPR.Person_NationalID, RCPR.Person_IqamaNumber, RCPR.Person_GulfNumber, RCPR.Person_BorderNumber) = @PlaintiffRepNin)
OR (@UnifiedNumber IS NOT NULL and RCP.UnifiedNumber = @UnifiedNumber)
OR (@CRNumber IS NOT NULL AND RCP.CRNumber = @CRNumber)
 
UNION
SELECT DISTINCT [REQ].[Id] AS RequestId
FROM [EXR].[UnRegisteredCompanyRequests] REQ
         JOIN [EXR].[UnRegisteredCompanyPlaintiffs] REQP ON [REQ].[Id] = [REQP].[RequestId]
         JOIN [EXR].[UnRegisteredCompanyPlaintiffRepresentatives] REQPR ON [REQ].[PlaintiffRepresentativeId] = [REQPR].[Id]
WHERE (@PlaintiffRepNin IS NOT NULL AND COALESCE(REQPR.Person_NationalID, REQPR.Person_IqamaNumber, REQPR.Person_GulfNumber, REQPR.Person_BorderNumber) = @PlaintiffRepNin)
OR (@MISALicenseNo IS NOT NULL and REQP.MISALicenseNo = @MISALicenseNo)
OR (@CRNumber IS NOT NULL AND REQP.CRNumber = @CRNumber)
 
UNION
SELECT DISTINCT [REQ].[Id] AS RequestId
FROM [EXR].[IndividualRequests] REQ
         JOIN [EXR].[IndividualPlaintiffs] REQP ON [REQ].[Id] = [REQP].[RequestId]
         LEFT JOIN [EXR].[IndividualPlaintiffRepresentatives] REQPR ON [REQ].[PlaintiffRepresentativeId] = [REQPR].[Id]
WHERE (@PlaintiffRepNin IS NOT NULL AND COALESCE(REQPR.Person_NationalID, REQPR.Person_IqamaNumber, REQPR.Person_GulfNumber, REQPR.Person_BorderNumber) = @PlaintiffRepNin)
OR (@PlaintiffNin IS NOT NULL AND COALESCE(REQP.NationalID, REQP.IqamaNumber, REQP.GulfNumber, REQP.BorderNumber) = @PlaintiffNin)
 
UNION
SELECT DISTINCT [REQ].[Id] AS RequestId
FROM [EXR].[WaqfRequests] REQ
         JOIN [EXR].[WaqPlaintiffs] REQP ON [REQ].[Id] = [REQP].[RequestId]
         JOIN [EXR].[WaqPlaintiffRepresentatives] REQPR ON [REQ].[PlaintiffRepresentativeId] = [REQPR].[Id]
WHERE (@PlaintiffRepNin IS NOT NULL AND  REQPR.Person_IdNumber = @PlaintiffRepNin)
OR (@UnifiedNumber IS NOT NULL and REQP.UnifiedNumber = @UnifiedNumber)
OR (@RegistrationNumber IS NOT NULL AND REQP.RegistrationNumber = @RegistrationNumber)
 
UNION
SELECT DISTINCT [REQ].[Id] AS RequestId
FROM [EXR].[CharityRequests] REQ
         JOIN [EXR].[CharityPlaintiffs] REQP ON [REQ].[Id] = [REQP].[RequestId]
         JOIN [EXR].[CharityPlaintiffRepresentatives] REQPR ON [REQ].[Id] = [REQPR].[RequestId]
WHERE (@PlaintiffRepNin IS NOT NULL AND [REQPR].Person_IdNumber = @PlaintiffRepNin)
OR (@UnifiedNumber IS NOT NULL and REQP.UnifiedNumber = @UnifiedNumber)
OR (@LicenseNumber IS NOT NULL AND REQP.LicenseNumber = @LicenseNumber)
 
UNION
SELECT DISTINCT [REQ].[Id] AS RequestId
FROM [EXR].[NonProfitInstitutionRequests] REQ
         JOIN [EXR].[NonProfitInstitutionPlaintiffs] REQP ON [REQ].[Id] = [REQP].[RequestId]
         JOIN [EXR].[NonProfitInstitutionPlaintiffRepresentatives] REQPR ON [REQ].[PlaintiffRepresentativeId] = [REQPR].[Id]
WHERE (@PlaintiffRepNin IS NOT NULL AND REQPR.Person_IdNumber = @PlaintiffRepNin)
OR (@UnifiedNumber IS NOT NULL and REQP.UnifiedNumber = @UnifiedNumber)
OR (@LicenseNumber IS NOT NULL AND REQP.LicenseNumber = @LicenseNumber)
 
END;