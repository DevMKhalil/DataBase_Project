CREATE TABLE [LK].[Countries] (
    [Id]                  INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]                NVARCHAR (500)                                     NOT NULL,
    [NameAr]              NVARCHAR (500)                                     NOT NULL,
    [IsActive]            BIT                                                NOT NULL,
    [CallingCode]         INT                                                NOT NULL,
    [Alpha3Code]          NVARCHAR (3)                                       NULL,
    [ValidTo]             DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]           DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]           DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt]           DATETIME2 (7)                                      NULL,
    [CurrencyCode]        NVARCHAR (MAX)                                     NULL,
    [AbsherDescription]   NVARCHAR (MAX)                                     NULL,
    [AbsherDescriptionAr] NVARCHAR (MAX)                                     NULL,
    CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED ([Id] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[LK].[CountriesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Countries_NameAr]
    ON [LK].[Countries]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Countries_Name]
    ON [LK].[Countries]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Country', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Country', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Country', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Country', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id => Id of Country', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Countries', @level2type = N'COLUMN', @level2name = N'Id';

