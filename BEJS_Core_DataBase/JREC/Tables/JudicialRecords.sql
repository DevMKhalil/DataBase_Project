CREATE TABLE [JREC].[JudicialRecords] (
    [Id]                      INT                                                IDENTITY (1, 1) NOT NULL,
    [RecordNumber]            BIGINT                                             NULL,
    [ExecutionRequestId]      INT                                                NOT NULL,
    [RulingJudicialActionId]  SMALLINT                                           NULL,
    [StatusId]                SMALLINT                                           NOT NULL,
    [RulingText]              NVARCHAR (MAX)                                     NULL,
    [PleaTranscript]          NVARCHAR (MAX)                                     NULL,
    [PleaDecisionId]          SMALLINT                                           NULL,
    [PleaJudicialActionId]    SMALLINT                                           NULL,
    [JudicialSessionId]       INT                                                NULL,
    [StartDate]               DATE                                               NULL,
    [StartDateHijri]          DECIMAL (8)                                        NULL,
    [ValidTo]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]               DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [RulingDeliveryDate]      DATE                                               NULL,
    [RulingDeliveryDateHijri] DECIMAL (8)                                        NULL,
    [SettledDate]             DATETIME2 (7)                                      NULL,
    [SettledById]             INT                                                NULL,
    [IsCertified]             BIT                                                NOT NULL,
    [CertifiedDate]           DATETIME2 (7)                                      NULL,
    [CreatedAt]               DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]             INT                                                NOT NULL,
    [UpdatedAt]               DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]               INT                                                NULL,
    [AdjournSessionReasonId]  SMALLINT                                           NULL,
    [RulingBriefId]           SMALLINT                                           NULL,
    [StartTime]               TIME (7)                                           DEFAULT ('00:00:00') NOT NULL,
    [EndTime]                 TIME (7)                                           DEFAULT ('00:00:00') NOT NULL,
    [JudgeUserId]             INT                                                NULL,
    [SecretaryUserId]         INT                                                NULL,
    [SecondaryRequestId]      INT                                                NULL,
    CONSTRAINT [PK_JudicialRecords] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_JudicialRecords_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_JudicialRecords_JudicialActions_PleaJudicialActionId] FOREIGN KEY ([PleaJudicialActionId]) REFERENCES [JACT].[JudicialActions] ([Code]),
    CONSTRAINT [FK_JudicialRecords_JudicialActions_RulingJudicialActionId] FOREIGN KEY ([RulingJudicialActionId]) REFERENCES [JACT].[JudicialActions] ([Code]),
    CONSTRAINT [FK_JudicialRecords_JudicialAdjournSessionReasons_AdjournSessionReasonId] FOREIGN KEY ([AdjournSessionReasonId]) REFERENCES [JREC].[JudicialAdjournSessionReasons] ([Code]),
    CONSTRAINT [FK_JudicialRecords_JudicialRecordStatuses_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [JREC].[JudicialRecordStatuses] ([Code]),
    CONSTRAINT [FK_JudicialRecords_JudicialRulingBriefs_RulingBriefId] FOREIGN KEY ([RulingBriefId]) REFERENCES [JREC].[JudicialRulingBriefs] ([Code]),
    CONSTRAINT [FK_JudicialRecords_PleaRecordDecisions_PleaDecisionId] FOREIGN KEY ([PleaDecisionId]) REFERENCES [JREC].[PleaRecordDecisions] ([Code]),
    CONSTRAINT [FK_JudicialRecords_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]),
    CONSTRAINT [FK_JudicialRecords_Sessions_JudicialSessionId] FOREIGN KEY ([JudicialSessionId]) REFERENCES [JSES].[Sessions] ([Id]),
    CONSTRAINT [FK_JudicialRecords_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_JudicialRecords_Users_SettledById] FOREIGN KEY ([SettledById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_JudicialRecords_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JREC].[JudicialRecordsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_SecondaryRequestId]
    ON [JREC].[JudicialRecords]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_RulingBriefId]
    ON [JREC].[JudicialRecords]([RulingBriefId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_AdjournSessionReasonId]
    ON [JREC].[JudicialRecords]([AdjournSessionReasonId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_UpdatedBy]
    ON [JREC].[JudicialRecords]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_StatusId]
    ON [JREC].[JudicialRecords]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_SettledById]
    ON [JREC].[JudicialRecords]([SettledById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_RulingJudicialActionId]
    ON [JREC].[JudicialRecords]([RulingJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_PleaJudicialActionId]
    ON [JREC].[JudicialRecords]([PleaJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_PleaDecisionId]
    ON [JREC].[JudicialRecords]([PleaDecisionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_JudicialSessionId]
    ON [JREC].[JudicialRecords]([JudicialSessionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_ExecutionRequestId]
    ON [JREC].[JudicialRecords]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_JudicialRecords_CreatedById]
    ON [JREC].[JudicialRecords]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Record', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'JudicialRecords', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Record', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'JudicialRecords', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Record', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'JudicialRecords', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Record', @level0type = N'SCHEMA', @level0name = N'JREC', @level1type = N'TABLE', @level1name = N'JudicialRecords', @level2type = N'COLUMN', @level2name = N'CreatedAt';

