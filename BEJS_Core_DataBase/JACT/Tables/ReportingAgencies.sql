CREATE TABLE [JACT].[ReportingAgencies] (
    [Code]        SMALLINT                                           NOT NULL,
    [ActionCode]  SMALLINT                                           NOT NULL,
    [TypeCode]    SMALLINT                                           NOT NULL,
    [GovAgencyId] INT                                                NOT NULL,
    [ValidTo]     DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]   DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ReportingAgencies] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_ReportingAgencies_Agencies_GovAgencyId] FOREIGN KEY ([GovAgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_ReportingAgencies_JudicialActions_ActionCode] FOREIGN KEY ([ActionCode]) REFERENCES [JACT].[JudicialActions] ([Code]),
    CONSTRAINT [FK_ReportingAgencies_ReportingAgencyTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [JACT].[ReportingAgencyTypes] ([Code]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JACT].[ReportingAgenciesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_ReportingAgencies_TypeCode]
    ON [JACT].[ReportingAgencies]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ReportingAgencies_GovAgencyId]
    ON [JACT].[ReportingAgencies]([GovAgencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ReportingAgencies_ActionCode]
    ON [JACT].[ReportingAgencies]([ActionCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Judicial Action Agency', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'ReportingAgencies', @level2type = N'COLUMN', @level2name = N'Code';

