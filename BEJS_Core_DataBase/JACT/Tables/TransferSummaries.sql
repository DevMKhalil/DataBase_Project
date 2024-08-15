CREATE TABLE [JACT].[TransferSummaries] (
    [Id]                             INT             IDENTITY (1, 1) NOT NULL,
    [DefendantTransferId]            INT             NOT NULL,
    [FinancialInstituteId]           INT             NOT NULL,
    [FIResponseStatusId]             INT             NOT NULL,
    [TotalAmountTransferredFromBank] DECIMAL (18, 2) NULL,
    [CustomerName]                   NVARCHAR (MAX)  NULL,
    [CustomerIdNumber]               NVARCHAR (MAX)  NULL,
    [CustomerNationalityId]          INT             NULL,
    [CreatedAt]                      DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]                    INT             NOT NULL,
    [UpdatedAt]                      DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                      INT             NULL,
    [CustomerIdentityTypeId]         INT             NULL,
    CONSTRAINT [PK_TransferSummaries] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransferSummaries_Countries_CustomerNationalityId] FOREIGN KEY ([CustomerNationalityId]) REFERENCES [LK].[Countries] ([Id]),
    CONSTRAINT [FK_TransferSummaries_FinancialInstitutes_FinancialInstituteId] FOREIGN KEY ([FinancialInstituteId]) REFERENCES [SAMA].[FinancialInstitutes] ([Id]),
    CONSTRAINT [FK_TransferSummaries_IdTypes_CustomerIdentityTypeId] FOREIGN KEY ([CustomerIdentityTypeId]) REFERENCES [SAMA].[IdTypes] ([Id]),
    CONSTRAINT [FK_TransferSummaries_ResponseStatusCodes_FIResponseStatusId] FOREIGN KEY ([FIResponseStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id]),
    CONSTRAINT [FK_TransferSummaries_Transfers_DefendantTransferId] FOREIGN KEY ([DefendantTransferId]) REFERENCES [JACT].[Transfers] ([Id]),
    CONSTRAINT [FK_TransferSummaries_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_TransferSummaries_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_TransferSummaries_UpdatedBy]
    ON [JACT].[TransferSummaries]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferSummaries_FIResponseStatusId]
    ON [JACT].[TransferSummaries]([FIResponseStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferSummaries_FinancialInstituteId]
    ON [JACT].[TransferSummaries]([FinancialInstituteId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferSummaries_DefendantTransferId]
    ON [JACT].[TransferSummaries]([DefendantTransferId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferSummaries_CustomerNationalityId]
    ON [JACT].[TransferSummaries]([CustomerNationalityId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferSummaries_CustomerIdentityTypeId]
    ON [JACT].[TransferSummaries]([CustomerIdentityTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferSummaries_CreatedById]
    ON [JACT].[TransferSummaries]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Action Defendant Transfer Summary', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferSummaries', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Action Defendant Transfer Summary', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferSummaries', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Action Defendant Transfer Summary', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferSummaries', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Action Defendant Transfer Summary', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferSummaries', @level2type = N'COLUMN', @level2name = N'CreatedAt';

