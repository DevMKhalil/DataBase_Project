CREATE TABLE [JACT].[DefandantBalanceInfo] (
    [Id]                        INT           IDENTITY (1, 1) NOT NULL,
    [JudicialActionDefendantId] INT           NOT NULL,
    [SamaOperationId]           BIGINT        NOT NULL,
    [StatusId]                  SMALLINT      DEFAULT (CONVERT([smallint],(4))) NOT NULL,
    [CreatedAt]                 DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]               INT           NOT NULL,
    [UpdatedAt]                 DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]                 INT           NULL,
    [CallBackStatusId]          INT           NULL,
    CONSTRAINT [PK_DefandantBalanceInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DefandantBalanceInfo_Defendants_JudicialActionDefendantId] FOREIGN KEY ([JudicialActionDefendantId]) REFERENCES [JACT].[Defendants] ([Id]),
    CONSTRAINT [FK_DefandantBalanceInfo_RequestStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [SAMA].[RequestStatus] ([Code]),
    CONSTRAINT [FK_DefandantBalanceInfo_ResponseStatusCodes_CallBackStatusId] FOREIGN KEY ([CallBackStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id]),
    CONSTRAINT [FK_DefandantBalanceInfo_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_DefandantBalanceInfo_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceInfo_CallBackStatusId]
    ON [JACT].[DefandantBalanceInfo]([CallBackStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceInfo_UpdatedBy]
    ON [JACT].[DefandantBalanceInfo]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceInfo_StatusId]
    ON [JACT].[DefandantBalanceInfo]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceInfo_SamaOperationId]
    ON [JACT].[DefandantBalanceInfo]([SamaOperationId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceInfo_JudicialActionDefendantId]
    ON [JACT].[DefandantBalanceInfo]([JudicialActionDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceInfo_CreatedById]
    ON [JACT].[DefandantBalanceInfo]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Defandant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceInfo', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Defandant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceInfo', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Defandant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceInfo', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Defandant Balance Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceInfo', @level2type = N'COLUMN', @level2name = N'CreatedAt';

