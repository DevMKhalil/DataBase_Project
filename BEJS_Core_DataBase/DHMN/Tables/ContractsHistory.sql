CREATE TABLE [DHMN].[ContractsHistory] (
    [Id]                      INT              NOT NULL,
    [Amount]                  DECIMAL (18, 2)  NOT NULL,
    [DepositAmount]           DECIMAL (18, 2)  NOT NULL,
    [InvoiceId]               INT              NOT NULL,
    [DhamenContractId]        UNIQUEIDENTIFIER NOT NULL,
    [ExpirationDate]          DATETIME2 (7)    NULL,
    [StatusId]                INT              NOT NULL,
    [FundsStatusId]           INT              NOT NULL,
    [CreatedAt]               DATETIME2 (7)    NOT NULL,
    [CreatedById]             INT              NOT NULL,
    [UpdatedAt]               DATETIME2 (7)    NULL,
    [UpdatedBy]               INT              NULL,
    [ReleaseFundsStatusId]    INT              NOT NULL,
    [RequestReleaseFundsDate] DATETIME2 (7)    NULL,
    [Version]                 ROWVERSION       NULL,
    [AmountDue]               DECIMAL (18, 2)  NOT NULL,
    [SurplusFundsStatusId]    INT              NOT NULL,
    [ValidFrom]               DATETIME2 (7)    NOT NULL,
    [ValidTo]                 DATETIME2 (7)    NOT NULL,
    [SurplusAmount]           DECIMAL (18, 2)  NULL
);


GO
CREATE CLUSTERED INDEX [ix_ContractsHistory]
    ON [DHMN].[ContractsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

