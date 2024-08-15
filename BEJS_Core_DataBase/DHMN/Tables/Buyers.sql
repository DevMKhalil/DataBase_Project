CREATE TABLE [DHMN].[Buyers] (
    [Id]                      INT             IDENTITY (1, 1) NOT NULL,
    [Amount]                  DECIMAL (18, 2) NOT NULL,
    [PaymentInfo_VIBAN]       NVARCHAR (24)   NULL,
    [PaymentInfo_BBAN]        NVARCHAR (100)  NULL,
    [PaymentInfo_BankId]      INT             NULL,
    [PaymentInfo_PaymentUrl]  NVARCHAR (MAX)  NULL,
    [Name]                    NVARCHAR (MAX)  NULL,
    [IdentityNumber]          NVARCHAR (MAX)  NULL,
    [IdentityTypeId]          INT             NOT NULL,
    [ContractId]              INT             NOT NULL,
    [CreatedAt]               DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]             INT             NOT NULL,
    [UpdatedAt]               DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]               INT             NULL,
    [CalculatedDepositAmount] DECIMAL (18, 2) DEFAULT ((0.0)) NOT NULL,
    [IsAmountFullyPaid]       BIT             DEFAULT (CONVERT([bit],(0))) NOT NULL,
    [DhamenDepositAmount]     DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Buyers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Buyers_Banks_PaymentInfo_BankId] FOREIGN KEY ([PaymentInfo_BankId]) REFERENCES [DhmnLK].[Banks] ([Id]),
    CONSTRAINT [FK_Buyers_BeneficiaryIdentityTypes_IdentityTypeId] FOREIGN KEY ([IdentityTypeId]) REFERENCES [DhmnLK].[BeneficiaryIdentityTypes] ([Id]),
    CONSTRAINT [FK_Buyers_Contracts_ContractId] FOREIGN KEY ([ContractId]) REFERENCES [DHMN].[Contracts] ([Id]),
    CONSTRAINT [FK_Buyers_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Buyers_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Buyers_UpdatedBy]
    ON [DHMN].[Buyers]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Buyers_PaymentInfo_BankId]
    ON [DHMN].[Buyers]([PaymentInfo_BankId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Buyers_IdentityTypeId]
    ON [DHMN].[Buyers]([IdentityTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Buyers_CreatedById]
    ON [DHMN].[Buyers]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Buyers_ContractId]
    ON [DHMN].[Buyers]([ContractId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Buyer', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Buyers', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Buyer', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Buyers', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Buyer', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Buyers', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Buyer', @level0type = N'SCHEMA', @level0name = N'DHMN', @level1type = N'TABLE', @level1name = N'Buyers', @level2type = N'COLUMN', @level2name = N'CreatedAt';

