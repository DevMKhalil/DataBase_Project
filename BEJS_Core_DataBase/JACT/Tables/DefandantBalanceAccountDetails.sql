CREATE TABLE [JACT].[DefandantBalanceAccountDetails] (
    [Id]                     INT             IDENTITY (1, 1) NOT NULL,
    [AccountNumber]          NVARCHAR (200)  NULL,
    [IBAN]                   NVARCHAR (24)   NULL,
    [AccountType]            NVARCHAR (MAX)  NULL,
    [AccountStatusId]        INT             NULL,
    [IsJointAccount]         BIT             NOT NULL,
    [AccountOpeningDate]     DATETIME2 (7)   NULL,
    [AccountClosingDate]     DATETIME2 (7)   NULL,
    [TotalBalance]           DECIMAL (18, 2) NULL,
    [AvailableBalance]       DECIMAL (18, 2) NULL,
    [BalanceDate]            DATETIME2 (7)   NULL,
    [AccountCurrency]        NVARCHAR (MAX)  NULL,
    [Institution]            NVARCHAR (MAX)  NULL,
    [FinancialInstitutionId] INT             NOT NULL,
    [CreatedAt]              DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]            INT             NOT NULL,
    [UpdatedAt]              DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]              INT             NULL,
    CONSTRAINT [PK_DefandantBalanceAccountDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DefandantBalanceAccountDetails_BalanceInfoAccountStatus_AccountStatusId] FOREIGN KEY ([AccountStatusId]) REFERENCES [SAMA].[BalanceInfoAccountStatus] ([Id]),
    CONSTRAINT [FK_DefandantBalanceAccountDetails_FinancialInstitutionDefendantBalanceInfo_FinancialInstitutionId] FOREIGN KEY ([FinancialInstitutionId]) REFERENCES [JACT].[FinancialInstitutionDefendantBalanceInfo] ([Id]),
    CONSTRAINT [FK_DefandantBalanceAccountDetails_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_DefandantBalanceAccountDetails_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountDetails_UpdatedBy]
    ON [JACT].[DefandantBalanceAccountDetails]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountDetails_FinancialInstitutionId]
    ON [JACT].[DefandantBalanceAccountDetails]([FinancialInstitutionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountDetails_CreatedById]
    ON [JACT].[DefandantBalanceAccountDetails]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountDetails_AccountStatusId]
    ON [JACT].[DefandantBalanceAccountDetails]([AccountStatusId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Defandant Balance AccountDetails', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountDetails', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Defandant Balance AccountDetails', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountDetails', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Defandant Balance AccountDetails', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountDetails', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Defandant Balance AccountDetails', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountDetails', @level2type = N'COLUMN', @level2name = N'CreatedAt';

