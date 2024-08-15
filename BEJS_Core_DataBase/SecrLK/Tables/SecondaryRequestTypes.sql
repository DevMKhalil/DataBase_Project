CREATE TABLE [SecrLK].[SecondaryRequestTypes] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (400)                                     NOT NULL,
    [NameAr]    NVARCHAR (400)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_SecondaryRequestTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SecrLK].[SecondaryRequestTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SecondaryRequestTypes_NameAr]
    ON [SecrLK].[SecondaryRequestTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SecondaryRequestTypes_Name]
    ON [SecrLK].[SecondaryRequestTypes]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Secondary Request Type', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Secondary Request Type', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Secondary Request Type', @level0type = N'SCHEMA', @level0name = N'SecrLK', @level1type = N'TABLE', @level1name = N'SecondaryRequestTypes', @level2type = N'COLUMN', @level2name = N'Code';

