CREATE TABLE [JACT].[DefendantBlocks] (
    [Id]                          INT             IDENTITY (1, 1) NOT NULL,
    [JudicialActionDefendantsId]  INT             NOT NULL,
    [StatusId]                    SMALLINT        NOT NULL,
    [SAMAOperationId]             BIGINT          NOT NULL,
    [ServiceRequestNumber]        NVARCHAR (MAX)  NULL,
    [BlockRequest_DebetTypeCode]  INT             NULL,
    [BlockRequest_BlockAmount]    DECIMAL (18, 2) NULL,
    [BlockSummary_BlockAmount]    DECIMAL (18, 2) NULL,
    [BlockSummary_TransferAmount] DECIMAL (18, 2) NULL,
    [BlockSummary_PendingAmount]  DECIMAL (18, 2) NULL,
    [BlockSummary_StatusId]       INT             NULL,
    [CreatedAt]                   DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]                 INT             NOT NULL,
    [UpdatedAt]                   DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                   INT             NULL,
    [CallBackStatusId]            INT             NULL,
    CONSTRAINT [PK_DefendantBlocks] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DefendantBlocks_BlockExecutionStatus_BlockSummary_StatusId] FOREIGN KEY ([BlockSummary_StatusId]) REFERENCES [SAMA].[BlockExecutionStatus] ([Id]),
    CONSTRAINT [FK_DefendantBlocks_DebtType_BlockRequest_DebetTypeCode] FOREIGN KEY ([BlockRequest_DebetTypeCode]) REFERENCES [SAMA].[DebtType] ([Id]),
    CONSTRAINT [FK_DefendantBlocks_Defendants_JudicialActionDefendantsId] FOREIGN KEY ([JudicialActionDefendantsId]) REFERENCES [JACT].[Defendants] ([Id]),
    CONSTRAINT [FK_DefendantBlocks_RequestStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [SAMA].[RequestStatus] ([Code]),
    CONSTRAINT [FK_DefendantBlocks_ResponseStatusCodes_CallBackStatusId] FOREIGN KEY ([CallBackStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id]),
    CONSTRAINT [FK_DefendantBlocks_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_DefendantBlocks_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantBlocks_CallBackStatusId]
    ON [JACT].[DefendantBlocks]([CallBackStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantBlocks_UpdatedBy]
    ON [JACT].[DefendantBlocks]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantBlocks_StatusId]
    ON [JACT].[DefendantBlocks]([StatusId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DefendantBlocks_SAMAOperationId]
    ON [JACT].[DefendantBlocks]([SAMAOperationId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DefendantBlocks_JudicialActionDefendantsId]
    ON [JACT].[DefendantBlocks]([JudicialActionDefendantsId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantBlocks_CreatedById]
    ON [JACT].[DefendantBlocks]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantBlocks_BlockSummary_StatusId]
    ON [JACT].[DefendantBlocks]([BlockSummary_StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantBlocks_BlockRequest_DebetTypeCode]
    ON [JACT].[DefendantBlocks]([BlockRequest_DebetTypeCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Defendant Block', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantBlocks', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Defendant Block', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantBlocks', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Defendant Block', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantBlocks', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Defendant Block', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantBlocks', @level2type = N'COLUMN', @level2name = N'CreatedAt';

