CREATE TABLE [JACT].[LiftOrderDetails] (
    [Id]                  INT             IDENTITY (1, 1) NOT NULL,
    [CurrencyCode]        NVARCHAR (MAX)  NOT NULL,
    [CurrencyId]          INT             NULL,
    [BankAccountNumber]   NVARCHAR (MAX)  NULL,
    [IBAN]                NVARCHAR (MAX)  NULL,
    [BankingInstitution]  NVARCHAR (MAX)  NULL,
    [SourceAmount]        DECIMAL (18, 2) NOT NULL,
    [JointAccount]        BIT             NOT NULL,
    [BlockAmount]         DECIMAL (18, 2) NOT NULL,
    [ForeignExchangeRate] DECIMAL (18, 2) NOT NULL,
    [LiftDatetime]        DATE            NOT NULL,
    [LiftDatetimeHijri]   DECIMAL (8)     NULL,
    [RefNum]              NVARCHAR (MAX)  NULL,
    [LiftOrderInfoId]     INT             NULL,
    [TransferStatusId]    INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_LiftOrderDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_LiftOrderDetails_Currencies_CurrencyId] FOREIGN KEY ([CurrencyId]) REFERENCES [LK].[Currencies] ([Id]),
    CONSTRAINT [FK_LiftOrderDetails_LiftOrderInfo_LiftOrderInfoId] FOREIGN KEY ([LiftOrderInfoId]) REFERENCES [JACT].[LiftOrderInfo] ([Id]),
    CONSTRAINT [FK_LiftOrderDetails_TransferStatus_TransferStatusId] FOREIGN KEY ([TransferStatusId]) REFERENCES [SAMA].[TransferStatus] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_LiftOrderDetails_TransferStatusId]
    ON [JACT].[LiftOrderDetails]([TransferStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LiftOrderDetails_LiftOrderInfoId]
    ON [JACT].[LiftOrderDetails]([LiftOrderInfoId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LiftOrderDetails_CurrencyId]
    ON [JACT].[LiftOrderDetails]([CurrencyId] ASC);

