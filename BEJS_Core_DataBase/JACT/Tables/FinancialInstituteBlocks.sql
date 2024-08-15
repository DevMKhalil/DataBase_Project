CREATE TABLE [JACT].[FinancialInstituteBlocks] (
    [Id]                         BIGINT          IDENTITY (1, 1) NOT NULL,
    [FinancialInstituteId]       INT             NOT NULL,
    [SummaryInfo_TotalAmount]    DECIMAL (18, 2) NULL,
    [SummaryInfo_TransferAmount] DECIMAL (18, 2) NULL,
    [SummaryInfo_PendingAmount]  DECIMAL (18, 2) NULL,
    [BlockSafeBoxExecutionTime]  DATETIME2 (7)   NULL,
    [DefendantBlockId]           INT             NOT NULL,
    [FIResponseStatusId]         INT             NULL,
    CONSTRAINT [PK_FinancialInstituteBlocks] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FinancialInstituteBlocks_DefendantBlocks_DefendantBlockId] FOREIGN KEY ([DefendantBlockId]) REFERENCES [JACT].[DefendantBlocks] ([Id]),
    CONSTRAINT [FK_FinancialInstituteBlocks_FinancialInstitutes_FinancialInstituteId] FOREIGN KEY ([FinancialInstituteId]) REFERENCES [SAMA].[FinancialInstitutes] ([Id]),
    CONSTRAINT [FK_FinancialInstituteBlocks_ResponseStatusCodes_FIResponseStatusId] FOREIGN KEY ([FIResponseStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstituteBlocks_FIResponseStatusId]
    ON [JACT].[FinancialInstituteBlocks]([FIResponseStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstituteBlocks_FinancialInstituteId]
    ON [JACT].[FinancialInstituteBlocks]([FinancialInstituteId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstituteBlocks_DefendantBlockId]
    ON [JACT].[FinancialInstituteBlocks]([DefendantBlockId] ASC);

