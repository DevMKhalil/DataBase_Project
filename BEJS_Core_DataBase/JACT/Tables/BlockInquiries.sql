CREATE TABLE [JACT].[BlockInquiries] (
    [Id]                        BIGINT         IDENTITY (1, 1) NOT NULL,
    [JointDeposits]             NVARCHAR (MAX) NULL,
    [Shares]                    NVARCHAR (MAX) NULL,
    [FinancialInstituteBlockId] BIGINT         NOT NULL,
    CONSTRAINT [PK_BlockInquiries] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BlockInquiries_FinancialInstituteBlocks_FinancialInstituteBlockId] FOREIGN KEY ([FinancialInstituteBlockId]) REFERENCES [JACT].[FinancialInstituteBlocks] ([Id]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_BlockInquiries_FinancialInstituteBlockId]
    ON [JACT].[BlockInquiries]([FinancialInstituteBlockId] ASC);

