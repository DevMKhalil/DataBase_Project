CREATE TABLE [ExrGov].[FacilityDefendantDelegates] (
    [DelegatedPersonId]       BIGINT         NOT NULL,
    [DefendantId]             INT            NOT NULL,
    [IsActive]                BIT            NOT NULL,
    [LastValidationCheckDate] DATETIME2 (7)  NOT NULL,
    [NICServicesMetadataJson] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_FacilityDefendantDelegates] PRIMARY KEY CLUSTERED ([DefendantId] ASC, [DelegatedPersonId] ASC),
    CONSTRAINT [FK_FacilityDefendantDelegates_FacilityDefendants_DefendantId] FOREIGN KEY ([DefendantId]) REFERENCES [ExrGov].[FacilityDefendants] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_FacilityDefendantDelegates_NICDelegatedPersons_DelegatedPersonId] FOREIGN KEY ([DelegatedPersonId]) REFERENCES [ExrGov].[NICDelegatedPersons] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FacilityDefendantDelegates_DelegatedPersonId]
    ON [ExrGov].[FacilityDefendantDelegates]([DelegatedPersonId] ASC);

