CREATE TABLE [TrvBan].[TravelBanRequestTypes] (
    [Code]      INT                                                NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_TravelBanRequestTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[TrvBan].[TravelBanRequestTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TravelBanRequestTypes_NameAr]
    ON [TrvBan].[TravelBanRequestTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TravelBanRequestTypes_Name]
    ON [TrvBan].[TravelBanRequestTypes]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Travel Ban RequestType', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequestTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Travel Ban RequestType', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequestTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Travel Ban RequestType', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequestTypes', @level2type = N'COLUMN', @level2name = N'Code';

