CREATE TABLE [ExrGov].[NonProfitInstitutionDefendantDelegates] (
    [DelegatedPersonId]       BIGINT         NOT NULL,
    [DefendantId]             INT            NOT NULL,
    [IsActive]                BIT            NOT NULL,
    [LastValidationCheckDate] DATETIME2 (7)  NOT NULL,
    [NICServicesMetadataJson] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_NonProfitInstitutionDefendantDelegates] PRIMARY KEY CLUSTERED ([DefendantId] ASC, [DelegatedPersonId] ASC),
    CONSTRAINT [FK_NonProfitInstitutionDefendantDelegates_NICDelegatedPersons_DelegatedPersonId] FOREIGN KEY ([DelegatedPersonId]) REFERENCES [ExrGov].[NICDelegatedPersons] ([Id]),
    CONSTRAINT [FK_NonProfitInstitutionDefendantDelegates_NonProfitInstitutionDefendants_DefendantId] FOREIGN KEY ([DefendantId]) REFERENCES [ExrGov].[NonProfitInstitutionDefendants] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_NonProfitInstitutionDefendantDelegates_DelegatedPersonId]
    ON [ExrGov].[NonProfitInstitutionDefendantDelegates]([DelegatedPersonId] ASC);

