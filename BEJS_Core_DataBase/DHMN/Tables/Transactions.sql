CREATE TABLE [DHMN].[Transactions] (
    [Id]                              BIGINT          IDENTITY (1, 1) NOT NULL,
    [DhamenTransactionId]             BIGINT          NOT NULL,
    [Amount]                          DECIMAL (18, 2) NOT NULL,
    [TransactionTime]                 DATETIME2 (7)   NOT NULL,
    [TypeId]                          INT             NOT NULL,
    [StatusId]                        INT             NOT NULL,
    [RejectionReason]                 NVARCHAR (MAX)  NULL,
    [PaymentStageId]                  INT             NOT NULL,
    [RejectionTransactionReqStatusId] INT             NULL,
    [NotificationId]                  BIGINT          NOT NULL,
    [BuyerId]                         INT             NULL,
    [CreatedAt]                       DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_BuyerId_Not_Null] CHECK ([BuyerId] IS NOT NULL OR [TypeId]<>(1)),
    CONSTRAINT [FK_Transactions_Buyers_BuyerId] FOREIGN KEY ([BuyerId]) REFERENCES [DHMN].[Buyers] ([Id]),
    CONSTRAINT [FK_Transactions_Notifications_NotificationId] FOREIGN KEY ([NotificationId]) REFERENCES [DHMN].[Notifications] ([Id]),
    CONSTRAINT [FK_Transactions_PaymentStages_PaymentStageId] FOREIGN KEY ([PaymentStageId]) REFERENCES [DhmnLK].[PaymentStages] ([Id]),
    CONSTRAINT [FK_Transactions_RejectionTransactionReqStatus_RejectionTransactionReqStatusId] FOREIGN KEY ([RejectionTransactionReqStatusId]) REFERENCES [DhmnLK].[RejectionTransactionReqStatus] ([Id]),
    CONSTRAINT [FK_Transactions_TransactionStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [DhmnLK].[TransactionStatus] ([Id]),
    CONSTRAINT [FK_Transactions_TransactionTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [DhmnLK].[TransactionTypes] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Transactions_TypeId]
    ON [DHMN].[Transactions]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transactions_StatusId]
    ON [DHMN].[Transactions]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transactions_RejectionTransactionReqStatusId]
    ON [DHMN].[Transactions]([RejectionTransactionReqStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transactions_PaymentStageId]
    ON [DHMN].[Transactions]([PaymentStageId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Transactions_NotificationId]
    ON [DHMN].[Transactions]([NotificationId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Transactions_DhamenTransactionId]
    ON [DHMN].[Transactions]([DhamenTransactionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Transactions_BuyerId]
    ON [DHMN].[Transactions]([BuyerId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Transaction', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Transactions', @level2type = N'COLUMN', @level2name = N'CreatedAt';

