CREATE TABLE [ExrGov].[RegisteredCompanyDefendantsDelegates] (
    [DelegatedPersonId]       BIGINT         NOT NULL,
    [DefendantId]             INT            NOT NULL,
    [IsActive]                BIT            NOT NULL,
    [LastValidationCheckDate] DATETIME2 (7)  NOT NULL,
    [NICServicesMetadataJson] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_RegisteredCompanyDefendantsDelegates] PRIMARY KEY CLUSTERED ([DefendantId] ASC, [DelegatedPersonId] ASC),
    CONSTRAINT [FK_RegisteredCompanyDefendantsDelegates_NICDelegatedPersons_DelegatedPersonId] FOREIGN KEY ([DelegatedPersonId]) REFERENCES [ExrGov].[NICDelegatedPersons] ([Id]),
    CONSTRAINT [FK_RegisteredCompanyDefendantsDelegates_RegisteredCompanyDefendants_DefendantId] FOREIGN KEY ([DefendantId]) REFERENCES [ExrGov].[RegisteredCompanyDefendants] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_RegisteredCompanyDefendantsDelegates_DelegatedPersonId]
    ON [ExrGov].[RegisteredCompanyDefendantsDelegates]([DelegatedPersonId] ASC);

