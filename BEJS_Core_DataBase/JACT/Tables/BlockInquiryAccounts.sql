CREATE TABLE [JACT].[BlockInquiryAccounts] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [AccountNumber]  NVARCHAR (MAX) NULL,
    [IBAN]           NVARCHAR (MAX) NULL,
    [BlockInquiryId] BIGINT         NOT NULL,
    CONSTRAINT [PK_BlockInquiryAccounts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BlockInquiryAccounts_BlockInquiries_BlockInquiryId] FOREIGN KEY ([BlockInquiryId]) REFERENCES [JACT].[BlockInquiries] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_BlockInquiryAccounts_BlockInquiryId]
    ON [JACT].[BlockInquiryAccounts]([BlockInquiryId] ASC);

