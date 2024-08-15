CREATE TABLE [JACT].[BlockAccounts] (
    [Id]                        BIGINT          IDENTITY (1, 1) NOT NULL,
    [AccountNumber]             NVARCHAR (MAX)  NULL,
    [IBAN]                      NVARCHAR (MAX)  NULL,
    [Institution]               NVARCHAR (MAX)  NULL,
    [AccountCurrency]           NVARCHAR (MAX)  NULL,
    [AmountInAccount]           DECIMAL (18, 2) NOT NULL,
    [IsJointAccount]            BIT             NOT NULL,
    [BlockAmount]               DECIMAL (18, 2) NOT NULL,
    [TransferRate]              DECIMAL (18, 2) NOT NULL,
    [BlockTime]                 DATETIME2 (7)   NULL,
    [FinancialInstituteBlockId] BIGINT          NOT NULL,
    CONSTRAINT [PK_BlockAccounts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BlockAccounts_FinancialInstituteBlocks_FinancialInstituteBlockId] FOREIGN KEY ([FinancialInstituteBlockId]) REFERENCES [JACT].[FinancialInstituteBlocks] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_BlockAccounts_FinancialInstituteBlockId]
    ON [JACT].[BlockAccounts]([FinancialInstituteBlockId] ASC);

