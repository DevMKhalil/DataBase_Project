CREATE TABLE [ExrGov].[CharityDefendantDelegates] (
    [DelegatedPersonId]       BIGINT         NOT NULL,
    [DefendantId]             INT            NOT NULL,
    [IsActive]                BIT            NOT NULL,
    [LastValidationCheckDate] DATETIME2 (7)  NOT NULL,
    [NICServicesMetadataJson] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_CharityDefendantDelegates] PRIMARY KEY CLUSTERED ([DefendantId] ASC, [DelegatedPersonId] ASC),
    CONSTRAINT [FK_CharityDefendantDelegates_CharityDefendants_DefendantId] FOREIGN KEY ([DefendantId]) REFERENCES [ExrGov].[CharityDefendants] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_CharityDefendantDelegates_NICDelegatedPersons_DelegatedPersonId] FOREIGN KEY ([DelegatedPersonId]) REFERENCES [ExrGov].[NICDelegatedPersons] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_CharityDefendantDelegates_DelegatedPersonId]
    ON [ExrGov].[CharityDefendantDelegates]([DelegatedPersonId] ASC);

