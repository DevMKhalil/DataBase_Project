CREATE   PROCEDURE [dbo].[SP_GetJudicialActionId_By_DefendantData] @name NVARCHAR(50),@mobile NVARCHAR(12)
AS
IF  (@name IS NULL or LEN(@name) = 0 )AND (@mobile IS NULL or LEN(@mobile) = 0 )
BEGIN
SELECT NULL AS RequestJudicialActionId WHERE 1 = 0;
RETURN;
END
/* IndividualDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON RJA.Id = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[IndividualDefendants] [Def] ON Def.Id = [JADEF].[IndividualDefendantId]
WHERE 
   (
   @name is null or LEN(@name) = 0 
   OR [Def].[Person_FirstName] LIKE '%' + @name + '%'
   OR [Def].[Person_FatherName] LIKE '%' + @name + '%'
   OR [Def].[Person_GrandfatherName] LIKE '%' + @name + '%'
   OR [Def].[Person_FamilyName] LIKE '%' + @name + '%'
	)
	AND
	(
	@mobile is null or LEN(@mobile) = 0 
	OR [Def].[Person_Mobile] = @mobile
	)
UNION
/* RegisteredCompanyDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[RegisteredCompanyDefendants] Def ON [Def].[Id] = [JADEF].[RegisteredCompanyDefendantId]
WHERE 
   ( @name is null or LEN(@name) = 0 
   OR [Def].[Name] LIKE '%' + @name + '%')
   AND
	(
	@mobile is null or LEN(@mobile) = 0 
	OR [Def].[Phone] = @mobile
	)
UNION
	/* CharityDefendants */
SELECT DISTINCT [RJA].Id AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[CharityDefendants] Def ON [Def].[Id] = [JADEF].[NonProfitInstitutionDefendantId]
WHERE
   ( @name is null or LEN(@name) = 0 
   OR [Def].[Name] LIKE '%' + @name + '%')
   AND
	(
	@mobile is null or LEN(@mobile) = 0 
	OR [Def].[Phone] = @mobile
	)
UNION
/* NonProfitInstitutionDefendants */
SELECT DISTINCT [RJA].Id AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[NonProfitInstitutionDefendants] Def ON [Def].Id = [JADEF].[NonProfitInstitutionDefendantId]
WHERE 
		   ( @name is null or LEN(@name) = 0 
		   OR [Def].[Name] LIKE '%' + @name + '%')
		   AND
			(
			@mobile is null or LEN(@mobile) = 0 
			OR [Def].[Phone] = @mobile
			)
UNION
/* WaqfDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[WaqfDefendants] Def ON [Def].[Id] = [JADEF].[WaqfDefendantId]
WHERE 
     ( @name is null or LEN(@name) = 0 
   OR [Def].[Name] LIKE '%' + @name + '%'
  )
   AND
	(
	@mobile is null or LEN(@mobile) = 0 
	OR [Def].[MobileNumber] = @mobile
	)
UNION
/* UnRegisteredCompanyDefendants */
SELECT DISTINCT [RJA].[Id] AS RequestJudicialActionId
FROM [JACT].[RequestJudicialActions] RJA
         JOIN [JACT].[Defendants] JADEF ON [RJA].[Id] = [JADEF].[ExecutionRequestJudicialActionId]
         JOIN [ExrGov].[UnRegisteredCompanyDefendants] Def ON [Def].[Id] = [JADEF].[UnRegisteredCompanyDefendantId]
WHERE 
     ( @name is null or LEN(@name) = 0 
   OR [Def].[Name] LIKE '%' + @name + '%'
   )
   AND
	(
	@mobile is null or LEN(@mobile) = 0 
	OR [Def].[Phone] = @mobile
	)