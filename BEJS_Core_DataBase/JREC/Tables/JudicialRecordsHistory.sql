CREATE TABLE [JREC].[JudicialRecordsHistory] (
    [Id]                      INT            NOT NULL,
    [RecordNumber]            BIGINT         NULL,
    [ExecutionRequestId]      INT            NOT NULL,
    [RulingJudicialActionId]  SMALLINT       NULL,
    [StatusId]                SMALLINT       NOT NULL,
    [RulingText]              NVARCHAR (MAX) NULL,
    [PleaTranscript]          NVARCHAR (MAX) NULL,
    [PleaDecisionId]          SMALLINT       NULL,
    [PleaJudicialActionId]    SMALLINT       NULL,
    [JudicialSessionId]       INT            NULL,
    [StartDate]               DATE           NULL,
    [StartDateHijri]          DECIMAL (8)    NULL,
    [ValidTo]                 DATETIME2 (7)  NOT NULL,
    [ValidFrom]               DATETIME2 (7)  NOT NULL,
    [RulingDeliveryDate]      DATE           NULL,
    [RulingDeliveryDateHijri] DECIMAL (8)    NULL,
    [SettledDate]             DATETIME2 (7)  NULL,
    [SettledById]             INT            NULL,
    [IsCertified]             BIT            NOT NULL,
    [CertifiedDate]           DATETIME2 (7)  NULL,
    [CreatedAt]               DATETIME2 (7)  NOT NULL,
    [CreatedById]             INT            NOT NULL,
    [UpdatedAt]               DATETIME2 (7)  NULL,
    [UpdatedBy]               INT            NULL,
    [AdjournSessionReasonId]  SMALLINT       NULL,
    [RulingBriefId]           SMALLINT       NULL,
    [StartTime]               TIME (7)       NOT NULL,
    [EndTime]                 TIME (7)       NOT NULL,
    [JudgeUserId]             INT            NULL,
    [SecretaryUserId]         INT            NULL,
    [SecondaryRequestId]      INT            NULL
);


GO
CREATE CLUSTERED INDEX [ix_JudicialRecordsHistory]
    ON [JREC].[JudicialRecordsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

