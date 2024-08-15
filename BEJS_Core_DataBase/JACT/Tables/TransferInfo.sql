CREATE TABLE [JACT].[TransferInfo] (
    [Id]                           INT             IDENTITY (1, 1) NOT NULL,
    [TransferSummaryId]            INT             NOT NULL,
    [BankAccountNumber]            NVARCHAR (MAX)  NOT NULL,
    [IBAN]                         NVARCHAR (MAX)  NOT NULL,
    [InstitutionName]              NVARCHAR (MAX)  NULL,
    [CurrencyCode]                 NVARCHAR (MAX)  NOT NULL,
    [CurrencyId]                   INT             NULL,
    [BlockAmountInAccountCurrency] DECIMAL (12, 2) NULL,
    [SourceAmount]                 DECIMAL (12, 2) NULL,
    [IsJointAccount]               BIT             NOT NULL,
    [ExchangeRate]                 DECIMAL (12, 2) NULL,
    [TransferExecutionDate]        DATETIME2 (7)   NULL,
    [TransferReferenceNumber]      NVARCHAR (MAX)  NULL,
    [TransferStatusId]             INT             NOT NULL,
    [CreatedAt]                    DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]                  INT             NOT NULL,
    [UpdatedAt]                    DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                    INT             NULL,
    CONSTRAINT [PK_TransferInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransferInfo_Currencies_CurrencyId] FOREIGN KEY ([CurrencyId]) REFERENCES [LK].[Currencies] ([Id]),
    CONSTRAINT [FK_TransferInfo_TransferStatus_TransferStatusId] FOREIGN KEY ([TransferStatusId]) REFERENCES [SAMA].[TransferStatus] ([Id]),
    CONSTRAINT [FK_TransferInfo_TransferSummaries_TransferSummaryId] FOREIGN KEY ([TransferSummaryId]) REFERENCES [JACT].[TransferSummaries] ([Id]),
    CONSTRAINT [FK_TransferInfo_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_TransferInfo_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_TransferInfo_UpdatedBy]
    ON [JACT].[TransferInfo]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferInfo_TransferSummaryId]
    ON [JACT].[TransferInfo]([TransferSummaryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferInfo_TransferStatusId]
    ON [JACT].[TransferInfo]([TransferStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferInfo_CurrencyId]
    ON [JACT].[TransferInfo]([CurrencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferInfo_CreatedById]
    ON [JACT].[TransferInfo]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Action Defendant Transfer Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferInfo', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Action Defendant Transfer Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferInfo', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Action Defendant Transfer Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferInfo', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Action Defendant Transfer Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferInfo', @level2type = N'COLUMN', @level2name = N'CreatedAt';

