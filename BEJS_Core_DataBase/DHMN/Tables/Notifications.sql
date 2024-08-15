CREATE TABLE [DHMN].[Notifications] (
    [Id]                                BIGINT           IDENTITY (1, 1) NOT NULL,
    [DhamenNotificationId]              BIGINT           NOT NULL,
    [TypeId]                            INT              NOT NULL,
    [Time]                              DATETIME2 (7)    NOT NULL,
    [ContractInfo_TotalAmount]          DECIMAL (18, 2)  NULL,
    [ContractInfo_DepositAmount]        DECIMAL (18, 2)  NULL,
    [ContractInfo_AmountDue]            DECIMAL (18, 2)  NULL,
    [ContractInfo_StatusId]             INT              NULL,
    [ContractInfo_FundsStatusId]        INT              NULL,
    [ContractInfo_SurplusFundsStatusId] INT              NULL,
    [ContractId]                        INT              NOT NULL,
    [CreatedAt]                         DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [ConversationId]                    UNIQUEIDENTIFIER DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    [ContractInfo_BuyerDepositAmount]   DECIMAL (18, 2)  NULL,
    [ContractInfo_BuyerIdentityNumber]  NVARCHAR (MAX)   NULL,
    [ContractInfo_SurplusAmount]        DECIMAL (18, 2)  NULL,
    [DhamenBatchCreationTime]           DATETIME2 (7)    DEFAULT ('0001-01-01T00:00:00.0000000') NOT NULL,
    [DhamenBatchId]                     UNIQUEIDENTIFIER DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Notifications_Contracts_ContractId] FOREIGN KEY ([ContractId]) REFERENCES [DHMN].[Contracts] ([Id]),
    CONSTRAINT [FK_Notifications_ContractStatus_ContractInfo_StatusId] FOREIGN KEY ([ContractInfo_StatusId]) REFERENCES [DhmnLK].[ContractStatus] ([Id]),
    CONSTRAINT [FK_Notifications_DhamenNotificationTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [DhmnLK].[DhamenNotificationTypes] ([Id]),
    CONSTRAINT [FK_Notifications_FundsStatus_ContractInfo_FundsStatusId] FOREIGN KEY ([ContractInfo_FundsStatusId]) REFERENCES [DhmnLK].[FundsStatus] ([Id]),
    CONSTRAINT [FK_Notifications_SurplusFundsStatus_ContractInfo_SurplusFundsStatusId] FOREIGN KEY ([ContractInfo_SurplusFundsStatusId]) REFERENCES [DhmnLK].[SurplusFundsStatus] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Notifications_TypeId]
    ON [DHMN].[Notifications]([TypeId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Notifications_DhamenNotificationId]
    ON [DHMN].[Notifications]([DhamenNotificationId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Notifications_ContractInfo_SurplusFundsStatusId]
    ON [DHMN].[Notifications]([ContractInfo_SurplusFundsStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Notifications_ContractInfo_StatusId]
    ON [DHMN].[Notifications]([ContractInfo_StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Notifications_ContractInfo_FundsStatusId]
    ON [DHMN].[Notifications]([ContractInfo_FundsStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Notifications_ContractId]
    ON [DHMN].[Notifications]([ContractId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Dhamen Notification', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Notifications', @level2type = N'COLUMN', @level2name = N'CreatedAt';

