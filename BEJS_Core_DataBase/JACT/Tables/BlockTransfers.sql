CREATE TABLE [JACT].[BlockTransfers] (
    [Id]                        BIGINT          IDENTITY (1, 1) NOT NULL,
    [AccountNumber]             NVARCHAR (MAX)  NULL,
    [IBAN]                      NVARCHAR (MAX)  NULL,
    [Institution]               NVARCHAR (MAX)  NULL,
    [AccountCurrency]           NVARCHAR (MAX)  NULL,
    [AmountInAccount]           DECIMAL (18, 2) NULL,
    [IsJointAccount]            BIT             NOT NULL,
    [TransferredAmount]         DECIMAL (18, 2) NOT NULL,
    [TransferRate]              DECIMAL (18, 2) NOT NULL,
    [ReferenceNumber]           NVARCHAR (MAX)  NULL,
    [TransferTime]              DATETIME2 (7)   NULL,
    [TransferStatusId]          INT             NOT NULL,
    [FinancialInstituteBlockId] BIGINT          NOT NULL,
    CONSTRAINT [PK_BlockTransfers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BlockTransfers_FinancialInstituteBlocks_FinancialInstituteBlockId] FOREIGN KEY ([FinancialInstituteBlockId]) REFERENCES [JACT].[FinancialInstituteBlocks] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_BlockTransfers_TransferStatus_TransferStatusId] FOREIGN KEY ([TransferStatusId]) REFERENCES [SAMA].[TransferStatus] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BlockTransfers_TransferStatusId]
    ON [JACT].[BlockTransfers]([TransferStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BlockTransfers_FinancialInstituteBlockId]
    ON [JACT].[BlockTransfers]([FinancialInstituteBlockId] ASC);

