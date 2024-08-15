 
 
CREATE      PROCEDURE [dbo].[GetJudicialActionId_By_DefendantIdNumber_And_UnifiedNumbers] @idNumber NVARCHAR(10) ,@unifiedNumbers VARCHAR(MAX)
AS
 
-- Parse the delimited string into a table variable
    DECLARE @unifiedNumberTable TABLE (Value BIGINT);
    INSERT INTO @unifiedNumberTable
    SELECT CAST(value AS BIGINT) FROM STRING_SPLIT(@unifiedNumbers, ',');
 
/* GovAgencyDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [EXR].[GovAgencyDefendants] GAD ON [GAD].[Id] = [JADEF].[GovAgencyDefendantId]
         JOIN [GOV].[AgencyLegalRepresentatives] GAL ON [GAD].[AgencyId] = [GAL].[GovAgencyId] AND [GAL].[StatusCode] = 1
         LEFT JOIN [JACT].[AssignedAgencies] ASG on ASG.AgencyId = [GAL].[GovAgencyId]
         JOIN [AUTH].[UserAccounts] UACC ON [GAL].[UserAccountId] = [UACC].[Id]
         JOIN [AUTH].[Users] USR ON [UACC].[UserId] = [USR].[Id]
WHERE USR.Nin = @idNumber
 
UNION
/* IndividualDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON RJA.Id = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[IndividualDefendants] [Def] ON Def.Id = [JADEF].[IndividualDefendantId]
WHERE [Def].[Person_NationalID] = @idNumber
   OR [Def].[Person_IqamaNumber] = @idNumber
   OR [Def].[Person_GulfNumber] = @idNumber
   OR [Def].[Person_BorderNumber] = @idNumber
UNION
/* WaqfDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[WaqfDefendants] Def ON [Def].[Id] = [JADEF].[WaqfDefendantId]
WHERE [Def].[UnifiedNumber] IN (SELECT Value FROM @unifiedNumberTable)
UNION
/* RegisteredCompanyDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[RegisteredCompanyDefendants] Def ON [Def].[Id] = [JADEF].[RegisteredCompanyDefendantId]
WHERE [Def].[UnifiedNumber] IN (SELECT Value FROM @unifiedNumberTable)
UNION
/* UnRegisteredCompanyDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[UnRegisteredCompanyDefendants] Def ON [Def].[Id] = [JADEF].[UnRegisteredCompanyDefendantId]
WHERE [Def].[Representative_NationalID] = @idNumber
   OR [Def].[Representative_IqamaNumber] = @idNumber
   OR [Def].[Representative_GulfNumber] = @idNumber
   OR [Def].[Representative_BorderNumber] = @idNumber
 
UNION
/* NonProfitInstitutionDefendants */
SELECT DISTINCT [RJA].Id AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[NonProfitInstitutionDefendants] Def ON [Def].Id = [JADEF].[NonProfitInstitutionDefendantId]
WHERE [Def].[UnifiedNumber] IN (SELECT Value FROM @unifiedNumberTable)
 
UNION
/* CharityDefendants */
SELECT DISTINCT [RJA].Id AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[CharityDefendants] Def ON [Def].[Id] = [JADEF].[CharityDefendantId]
WHERE [Def].[UnifiedNumber] IN (SELECT Value FROM @unifiedNumberTable)
UNION
/* FaciltyDefendants */
SELECT DISTINCT [RJA].Id AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[FacilityDefendants] Def ON [Def].[Id] = [JADEF].[FacilityDefendantId]
WHERE [Def].[NationalUnifiedNumber] IN (SELECT Value FROM @unifiedNumberTable);