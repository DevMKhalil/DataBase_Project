CREATE TABLE [DHMN].[Contracts] (
    [Id]                      INT                                                IDENTITY (1, 1) NOT NULL,
    [Amount]                  DECIMAL (18, 2)                                    NOT NULL,
    [DepositAmount]           DECIMAL (18, 2)                                    NOT NULL,
    [InvoiceId]               INT                                                NOT NULL,
    [DhamenContractId]        UNIQUEIDENTIFIER                                   DEFAULT ('00000000-0000-0000-0000-000000000000') NOT NULL,
    [ExpirationDate]          DATETIME2 (7)                                      NULL,
    [StatusId]                INT                                                NOT NULL,
    [FundsStatusId]           INT                                                NOT NULL,
    [CreatedAt]               DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]             INT                                                NOT NULL,
    [UpdatedAt]               DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]               INT                                                NULL,
    [ReleaseFundsStatusId]    INT                                                DEFAULT ((0)) NOT NULL,
    [RequestReleaseFundsDate] DATETIME2 (7)                                      NULL,
    [Version]                 ROWVERSION                                         NULL,
    [AmountDue]               DECIMAL (18, 2)                                    DEFAULT ((0.0)) NOT NULL,
    [SurplusFundsStatusId]    INT                                                DEFAULT ((0)) NOT NULL,
    [ValidFrom]               DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN DEFAULT ('0001-01-01T00:00:00.0000000') NOT NULL,
    [ValidTo]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   DEFAULT ('9999-12-31T23:59:59.9999999') NOT NULL,
    [SurplusAmount]           DECIMAL (18, 2)                                    NULL,
    CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Contracts_ContractStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [DhmnLK].[ContractStatus] ([Id]),
    CONSTRAINT [FK_Contracts_FundsStatus_FundsStatusId] FOREIGN KEY ([FundsStatusId]) REFERENCES [DhmnLK].[FundsStatus] ([Id]),
    CONSTRAINT [FK_Contracts_Invoices_InvoiceId] FOREIGN KEY ([InvoiceId]) REFERENCES [NVOC].[Invoices] ([Id]),
    CONSTRAINT [FK_Contracts_ReleaseFundsStatus_ReleaseFundsStatusId] FOREIGN KEY ([ReleaseFundsStatusId]) REFERENCES [DhmnLK].[ReleaseFundsStatus] ([Id]),
    CONSTRAINT [FK_Contracts_SurplusFundsStatus_SurplusFundsStatusId] FOREIGN KEY ([SurplusFundsStatusId]) REFERENCES [DhmnLK].[SurplusFundsStatus] ([Id]),
    CONSTRAINT [FK_Contracts_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Contracts_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[DHMN].[ContractsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Contracts_SurplusFundsStatusId]
    ON [DHMN].[Contracts]([SurplusFundsStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Contracts_FundsStatusId]
    ON [DHMN].[Contracts]([FundsStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Contracts_UpdatedBy]
    ON [DHMN].[Contracts]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Contracts_StatusId]
    ON [DHMN].[Contracts]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Contracts_ReleaseFundsStatusId]
    ON [DHMN].[Contracts]([ReleaseFundsStatusId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Contracts_InvoiceId]
    ON [DHMN].[Contracts]([InvoiceId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Contracts_DhamenContractId]
    ON [DHMN].[Contracts]([DhamenContractId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Contracts_CreatedById]
    ON [DHMN].[Contracts]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Contract', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Contracts', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Contract', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Contracts', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Contract', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Contracts', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Contract', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Contracts', @level2type = N'COLUMN', @level2name = N'CreatedAt';

