CREATE TABLE [JACT].[FinancialInstituteBlockCustomers] (
    [Id]                        BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]                      NVARCHAR (MAX) NULL,
    [IdValue]                   NVARCHAR (MAX) NULL,
    [NationalityCode]           NVARCHAR (MAX) NULL,
    [FinancialInstituteBlockId] BIGINT         NOT NULL,
    [IdentityTypeId]            INT            NULL,
    CONSTRAINT [PK_FinancialInstituteBlockCustomers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FinancialInstituteBlockCustomers_FinancialInstituteBlocks_FinancialInstituteBlockId] FOREIGN KEY ([FinancialInstituteBlockId]) REFERENCES [JACT].[FinancialInstituteBlocks] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_FinancialInstituteBlockCustomers_IdTypes_IdentityTypeId] FOREIGN KEY ([IdentityTypeId]) REFERENCES [SAMA].[IdTypes] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstituteBlockCustomers_IdentityTypeId]
    ON [JACT].[FinancialInstituteBlockCustomers]([IdentityTypeId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FinancialInstituteBlockCustomers_FinancialInstituteBlockId]
    ON [JACT].[FinancialInstituteBlockCustomers]([FinancialInstituteBlockId] ASC);

