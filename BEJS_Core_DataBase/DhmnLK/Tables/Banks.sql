CREATE TABLE [DhmnLK].[Banks] (
    [Id]                       INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]                     NVARCHAR (200)                                     NULL,
    [NameAr]                   NVARCHAR (200)                                     NOT NULL,
    [Code]                     NVARCHAR (20)                                      NOT NULL,
    [IsActive]                 BIT                                                NOT NULL,
    [CreatedAt]                DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt]                DATETIME2 (7)                                      NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [SAMAFinancialInstituteId] INT                                                DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Banks_FinancialInstitutes_SAMAFinancialInstituteId] FOREIGN KEY ([SAMAFinancialInstituteId]) REFERENCES [SAMA].[FinancialInstitutes] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[DhmnLK].[BanksHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Banks_SAMAFinancialInstituteId]
    ON [DhmnLK].[Banks]([SAMAFinancialInstituteId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Banks_Name]
    ON [DhmnLK].[Banks]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Bank', @level0type = N'SCHEMA', @level0name = N'DhmnLK', @level1type = N'TABLE', @level1name = N'Banks', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Bank', @level0type = N'SCHEMA', @level0name = N'DhmnLK', @level1type = N'TABLE', @level1name = N'Banks', @level2type = N'COLUMN', @level2name = N'CreatedAt';

