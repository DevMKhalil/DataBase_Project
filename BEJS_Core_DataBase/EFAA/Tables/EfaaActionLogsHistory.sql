CREATE TABLE [EFAA].[EfaaActionLogsHistory] (
    [Id]                 BIGINT           NOT NULL,
    [ExecutionRequestId] INT              NOT NULL,
    [EfaaStatusCode]     SMALLINT         NOT NULL,
    [ExecutionTempId]    INT              NOT NULL,
    [DeliveryStatus]     BIT              NULL,
    [ConversationId]     UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt]          DATETIME2 (7)    NOT NULL,
    [ValidFrom]          DATETIME2 (7)    NOT NULL,
    [ValidTo]            DATETIME2 (7)    NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_EfaaActionLogsHistory]
    ON [EFAA].[EfaaActionLogsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

