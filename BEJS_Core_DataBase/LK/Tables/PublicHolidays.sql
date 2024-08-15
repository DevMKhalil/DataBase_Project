CREATE TABLE [LK].[PublicHolidays] (
    [Id]        SMALLINT                                           IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (100)                                     NOT NULL,
    [NameAr]    NVARCHAR (100)                                     NOT NULL,
    [From]      DECIMAL (8)                                        NOT NULL,
    [To]        DECIMAL (8)                                        NOT NULL,
    [Year]      SMALLINT                                           NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt] DATETIME2 (7)                                      NULL,
    CONSTRAINT [PK_PublicHolidays] PRIMARY KEY CLUSTERED ([Id] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[LK].[PublicHolidaysHistory], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Public Holiday', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PublicHolidays', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Public Holiday', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PublicHolidays', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Public Holiday', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PublicHolidays', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Public Holiday', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PublicHolidays', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id => Id of Public Holiday', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'PublicHolidays', @level2type = N'COLUMN', @level2name = N'Id';

