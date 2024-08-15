CREATE TABLE [IntgLK].[ExRequestTempStatus] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ExRequestTempStatus] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[IntgLK].[ExRequestTempStatusHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ExRequestTempStatus_NameAr]
    ON [IntgLK].[ExRequestTempStatus]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ExRequestTempStatus_Name]
    ON [IntgLK].[ExRequestTempStatus]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Ex Request Temp Status', @level0type = N'SCHEMA', @level0name = N'IntgLK', @level1type = N'TABLE', @level1name = N'ExRequestTempStatus', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Ex Request Temp Status', @level0type = N'SCHEMA', @level0name = N'IntgLK', @level1type = N'TABLE', @level1name = N'ExRequestTempStatus', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Ex Request Temp Status', @level0type = N'SCHEMA', @level0name = N'IntgLK', @level1type = N'TABLE', @level1name = N'ExRequestTempStatus', @level2type = N'COLUMN', @level2name = N'Code';

