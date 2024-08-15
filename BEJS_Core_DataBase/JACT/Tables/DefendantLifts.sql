CREATE TABLE [JACT].[DefendantLifts] (
    [Id]                         INT            IDENTITY (1, 1) NOT NULL,
    [JudicialActionDefendantId]  INT            NOT NULL,
    [SamaOperationId]            BIGINT         NOT NULL,
    [StatusId]                   SMALLINT       NOT NULL,
    [ServiceRequestNumber]       NVARCHAR (MAX) NULL,
    [CorrelationReferenceNumber] NVARCHAR (MAX) NULL,
    [SummeryInfoId]              INT            NULL,
    [CreatedAt]                  DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]                INT            NOT NULL,
    [UpdatedAt]                  DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]                  INT            NULL,
    [CallBackStatusId]           INT            NULL,
    CONSTRAINT [PK_DefendantLifts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DefendantLifts_Defendants_JudicialActionDefendantId] FOREIGN KEY ([JudicialActionDefendantId]) REFERENCES [JACT].[Defendants] ([Id]),
    CONSTRAINT [FK_DefendantLifts_LiftSummeryInfo_SummeryInfoId] FOREIGN KEY ([SummeryInfoId]) REFERENCES [JACT].[LiftSummeryInfo] ([Id]),
    CONSTRAINT [FK_DefendantLifts_RequestStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [SAMA].[RequestStatus] ([Code]),
    CONSTRAINT [FK_DefendantLifts_ResponseStatusCodes_CallBackStatusId] FOREIGN KEY ([CallBackStatusId]) REFERENCES [SAMA].[ResponseStatusCodes] ([Id]),
    CONSTRAINT [FK_DefendantLifts_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_DefendantLifts_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantLifts_CallBackStatusId]
    ON [JACT].[DefendantLifts]([CallBackStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantLifts_UpdatedBy]
    ON [JACT].[DefendantLifts]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantLifts_SummeryInfoId]
    ON [JACT].[DefendantLifts]([SummeryInfoId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantLifts_StatusId]
    ON [JACT].[DefendantLifts]([StatusId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DefendantLifts_JudicialActionDefendantId]
    ON [JACT].[DefendantLifts]([JudicialActionDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantLifts_CreatedById]
    ON [JACT].[DefendantLifts]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Defendant Lift', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantLifts', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Defendant Lift', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantLifts', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Defendant Lift', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantLifts', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Defendant Lift', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefendantLifts', @level2type = N'COLUMN', @level2name = N'CreatedAt';

