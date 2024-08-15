CREATE TABLE [MOI].[MOIDelegateStatuses] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_MOIDelegateStatuses] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[MOI].[MOIDelegateStatusesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MOIDelegateStatuses_NameAr]
    ON [MOI].[MOIDelegateStatuses]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MOIDelegateStatuses_Name]
    ON [MOI].[MOIDelegateStatuses]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of M O I Delegate Status', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegateStatuses', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of M O I Delegate Status', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegateStatuses', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of M O I Delegate Status', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegateStatuses', @level2type = N'COLUMN', @level2name = N'Code';

