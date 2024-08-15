CREATE TABLE [EXR].[SelfServiceRequestingAgencies] (
    [Id]          INT                                                IDENTITY (1, 1) NOT NULL,
    [GovAgencyId] INT                                                NOT NULL,
    [ValidTo]     DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]   DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]   DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT                                                NOT NULL,
    [UpdatedAt]   DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT                                                NULL,
    CONSTRAINT [PK_SelfServiceRequestingAgencies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SelfServiceRequestingAgencies_Agencies_GovAgencyId] FOREIGN KEY ([GovAgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_SelfServiceRequestingAgencies_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SelfServiceRequestingAgencies_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[EXR].[SelfServiceRequestingAgenciesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_SelfServiceRequestingAgencies_UpdatedBy]
    ON [EXR].[SelfServiceRequestingAgencies]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SelfServiceRequestingAgencies_GovAgencyId]
    ON [EXR].[SelfServiceRequestingAgencies]([GovAgencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SelfServiceRequestingAgencies_CreatedById]
    ON [EXR].[SelfServiceRequestingAgencies]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update SelfService Requesting Agency', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SelfServiceRequestingAgencies', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of SelfService Requesting Agency', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SelfServiceRequestingAgencies', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create SelfService Requesting Agency', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SelfServiceRequestingAgencies', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of SelfService Requesting Agency', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SelfServiceRequestingAgencies', @level2type = N'COLUMN', @level2name = N'CreatedAt';

