CREATE TABLE [JACT].[FinancialInstitutionDefendantBalanceInfo] (
    [Id]                     INT           IDENTITY (1, 1) NOT NULL,
    [DefandantBalanceInfoId] INT           NOT NULL,
    [CreatedAt]              DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]            INT           NOT NULL,
    [UpdatedAt]              DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]              INT           NULL,
    [FIResponseStatusId]     INT           NULL,
    [FinancialInstituteId]   INT           NULL,
    CONSTRAINT [PK_FinancialInstitutionDefendantBalanceInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_FinancialInstitutionDefendantBalanceInfo_DefandantBalanceInfo_DefandantBalanceInfoId] FOREIGN KEY ([DefandantBalanceInfoId]) REFERENCES [JACT].[DefandantBalanceInfo] ([Id]),
    CONSTRAINT [FK_FinancialInstitutionDefendantBalanceInfo_FinancialInstitutes_FinancialInstituteId] FOREIGN KEY ([FinancialInstituteId]) REFERENCES [SAMA].[FinancialInstitutes] ([Id]),
    CONSTRAINT [FK_FinancialInstitutionDefendantBalanceInfo_ResponseStatusCodes_FIResponseStatusId] FOREIGN KEY ([FIResponseStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id]),
    CONSTRAINT [FK_FinancialInstitutionDefendantBalanceInfo_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_FinancialInstitutionDefendantBalanceInfo_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstitutionDefendantBalanceInfo_FinancialInstituteId]
    ON [JACT].[FinancialInstitutionDefendantBalanceInfo]([FinancialInstituteId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstitutionDefendantBalanceInfo_FIResponseStatusId]
    ON [JACT].[FinancialInstitutionDefendantBalanceInfo]([FIResponseStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstitutionDefendantBalanceInfo_UpdatedBy]
    ON [JACT].[FinancialInstitutionDefendantBalanceInfo]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstitutionDefendantBalanceInfo_DefandantBalanceInfoId]
    ON [JACT].[FinancialInstitutionDefendantBalanceInfo]([DefandantBalanceInfoId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_FinancialInstitutionDefendantBalanceInfo_CreatedById]
    ON [JACT].[FinancialInstitutionDefendantBalanceInfo]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Financial Institution Defendant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'FinancialInstitutionDefendantBalanceInfo', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Financial Institution Defendant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'FinancialInstitutionDefendantBalanceInfo', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Financial Institution Defendant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'FinancialInstitutionDefendantBalanceInfo', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Financial Institution Defendant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'FinancialInstitutionDefendantBalanceInfo', @level2type = N'COLUMN', @level2name = N'CreatedAt';

