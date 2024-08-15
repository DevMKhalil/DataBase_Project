CREATE TABLE [ExrGov].[WaqfDefendantDelegates] (
    [DelegatedPersonId]       BIGINT         NOT NULL,
    [DefendantId]             INT            NOT NULL,
    [IsActive]                BIT            NOT NULL,
    [LastValidationCheckDate] DATETIME2 (7)  NOT NULL,
    [NICServicesMetadataJson] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_WaqfDefendantDelegates] PRIMARY KEY CLUSTERED ([DefendantId] ASC, [DelegatedPersonId] ASC),
    CONSTRAINT [FK_WaqfDefendantDelegates_NICDelegatedPersons_DelegatedPersonId] FOREIGN KEY ([DelegatedPersonId]) REFERENCES [ExrGov].[NICDelegatedPersons] ([Id]),
    CONSTRAINT [FK_WaqfDefendantDelegates_WaqfDefendants_DefendantId] FOREIGN KEY ([DefendantId]) REFERENCES [ExrGov].[WaqfDefendants] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_WaqfDefendantDelegates_DelegatedPersonId]
    ON [ExrGov].[WaqfDefendantDelegates]([DelegatedPersonId] ASC);

