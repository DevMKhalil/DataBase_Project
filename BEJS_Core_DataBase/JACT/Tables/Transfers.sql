CREATE TABLE [JACT].[Transfers] (
    [Id]                              INT             IDENTITY (1, 1) NOT NULL,
    [JudicialActionDefendantId]       INT             NOT NULL,
    [SamaOperationId]                 BIGINT          NOT NULL,
    [TotalAmountTransferredFromBanks] DECIMAL (18, 2) NULL,
    [RequestStatusId]                 SMALLINT        NOT NULL,
    [BlockedAccountId]                BIGINT          NOT NULL,
    [CreatedAt]                       DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]                     INT             NOT NULL,
    [UpdatedAt]                       DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                       INT             NULL,
    [CallBackStatusId]                INT             NULL,
    CONSTRAINT [PK_Transfers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Transfers_BlockAccounts_BlockedAccountId] FOREIGN KEY ([BlockedAccountId]) REFERENCES [JACT].[BlockAccounts] ([Id]),
    CONSTRAINT [FK_Transfers_Defendants_JudicialActionDefendantId] FOREIGN KEY ([JudicialActionDefendantId]) REFERENCES [JACT].[Defendants] ([Id]),
    CONSTRAINT [FK_Transfers_RequestStatus_RequestStatusId] FOREIGN KEY ([RequestStatusId]) REFERENCES [SAMA].[RequestStatus] ([Code]),
    CONSTRAINT [FK_Transfers_ResponseStatusCodes_CallBackStatusId] FOREIGN KEY ([CallBackStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id]),
    CONSTRAINT [FK_Transfers_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Transfers_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Transfers_CallBackStatusId]
    ON [JACT].[Transfers]([CallBackStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transfers_UpdatedBy]
    ON [JACT].[Transfers]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transfers_RequestStatusId]
    ON [JACT].[Transfers]([RequestStatusId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Transfers_JudicialActionDefendantId]
    ON [JACT].[Transfers]([JudicialActionDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transfers_CreatedById]
    ON [JACT].[Transfers]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transfers_BlockedAccountId]
    ON [JACT].[Transfers]([BlockedAccountId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Action Defendant Transfer', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'Transfers', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Action Defendant Transfer', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'Transfers', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Action Defendant Transfer', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'Transfers', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Action Defendant Transfer', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'Transfers', @level2type = N'COLUMN', @level2name = N'CreatedAt';

