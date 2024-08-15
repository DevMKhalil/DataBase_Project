CREATE TABLE [GOV].[SamaAgencyIdentifiers] (
    [Id]        INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (200)                                     NULL,
    [NameAr]    NVARCHAR (200)                                     NULL,
    [Code]      NVARCHAR (200)                                     NULL,
    [IsActive]  BIT                                                NOT NULL,
    [CreatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt] DATETIME2 (7)                                      NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_SamaAgencyIdentifiers] PRIMARY KEY CLUSTERED ([Id] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[GOV].[SamaAgencyIdentifiersHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_SamaAgencyIdentifiers_Name]
    ON [GOV].[SamaAgencyIdentifiers]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Sama Agency Identifier', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'SamaAgencyIdentifiers', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Sama Agency Identifier', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'SamaAgencyIdentifiers', @level2type = N'COLUMN', @level2name = N'CreatedAt';

