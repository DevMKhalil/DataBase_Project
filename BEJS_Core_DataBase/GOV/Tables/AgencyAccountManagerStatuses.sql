CREATE TABLE [GOV].[AgencyAccountManagerStatuses] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_AgencyAccountManagerStatuses] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[GOV].[AgencyAccountManagerStatusesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AgencyAccountManagerStatuses_NameAr]
    ON [GOV].[AgencyAccountManagerStatuses]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AgencyAccountManagerStatuses_Name]
    ON [GOV].[AgencyAccountManagerStatuses]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Gov Agency Account Manager Status', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyAccountManagerStatuses', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Gov Agency Account Manager Status', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyAccountManagerStatuses', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Gov Agency Account Manager Status', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyAccountManagerStatuses', @level2type = N'COLUMN', @level2name = N'Code';

