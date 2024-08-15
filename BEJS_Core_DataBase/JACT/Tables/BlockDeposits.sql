CREATE TABLE [JACT].[BlockDeposits] (
    [Id]                        BIGINT          IDENTITY (1, 1) NOT NULL,
    [Number]                    NVARCHAR (MAX)  NULL,
    [Currency]                  NVARCHAR (MAX)  NULL,
    [Amount]                    DECIMAL (18, 2) NOT NULL,
    [BlockTime]                 DATETIME2 (7)   NULL,
    [FinancialInstituteBlockId] BIGINT          NOT NULL,
    CONSTRAINT [PK_BlockDeposits] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BlockDeposits_FinancialInstituteBlocks_FinancialInstituteBlockId] FOREIGN KEY ([FinancialInstituteBlockId]) REFERENCES [JACT].[FinancialInstituteBlocks] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_BlockDeposits_FinancialInstituteBlockId]
    ON [JACT].[BlockDeposits]([FinancialInstituteBlockId] ASC);

