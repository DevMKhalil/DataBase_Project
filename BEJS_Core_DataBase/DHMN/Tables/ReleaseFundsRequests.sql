CREATE TABLE [DHMN].[ReleaseFundsRequests] (
    [Id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [ScheduleDate] DATETIME2 (7) NOT NULL,
    [RetryCount]   INT           NOT NULL,
    [ContractId]   INT           NOT NULL,
    [CreatedAt]    DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [StatusCode]   SMALLINT      DEFAULT (CONVERT([smallint],(0))) NOT NULL,
    CONSTRAINT [PK_ReleaseFundsRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ReleaseFundsRequests_Contracts_ContractId] FOREIGN KEY ([ContractId]) REFERENCES [DHMN].[Contracts] ([Id]),
    CONSTRAINT [FK_ReleaseFundsRequests_ReleaseFundsRequestStatus_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [DhmnLK].[ReleaseFundsRequestStatus] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_ReleaseFundsRequests_StatusCode]
    ON [DHMN].[ReleaseFundsRequests]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ReleaseFundsRequests_ContractId]
    ON [DHMN].[ReleaseFundsRequests]([ContractId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Release FundsRequest', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'ReleaseFundsRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

