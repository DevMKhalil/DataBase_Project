CREATE TABLE [GOV].[SamaAgencyMappings] (
    [Id]              INT                                                IDENTITY (1, 1) NOT NULL,
    [AgencyId]        INT                                                NOT NULL,
    [MappingAgencyId] INT                                                NOT NULL,
    [CreatedAt]       DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]     INT                                                NOT NULL,
    [UpdatedAt]       DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]       INT                                                NULL,
    [ValidFrom]       DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN DEFAULT ('0001-01-01T00:00:00.0000000') NOT NULL,
    [ValidTo]         DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   DEFAULT ('9999-12-31T23:59:59.9999999') NOT NULL,
    CONSTRAINT [PK_SamaAgencyMappings] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SamaAgencyMappings_Agencies_AgencyId] FOREIGN KEY ([AgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_SamaAgencyMappings_SamaAgencyIdentifiers_MappingAgencyId] FOREIGN KEY ([MappingAgencyId]) REFERENCES [GOV].[SamaAgencyIdentifiers] ([Id]),
    CONSTRAINT [FK_SamaAgencyMappings_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SamaAgencyMappings_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[GOV].[SamaAgencyMappingsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_SamaAgencyMappings_UpdatedBy]
    ON [GOV].[SamaAgencyMappings]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SamaAgencyMappings_MappingAgencyId]
    ON [GOV].[SamaAgencyMappings]([MappingAgencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SamaAgencyMappings_CreatedById]
    ON [GOV].[SamaAgencyMappings]([CreatedById] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SamaAgencyMappings_AgencyId]
    ON [GOV].[SamaAgencyMappings]([AgencyId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Sama Agency Mapping', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'SamaAgencyMappings', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Sama Agency Mapping', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'SamaAgencyMappings', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Sama Agency Mapping', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'SamaAgencyMappings', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Sama Agency Mapping', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'SamaAgencyMappings', @level2type = N'COLUMN', @level2name = N'CreatedAt';

