CREATE TABLE [EFAA].[EfaaActionLogs] (
    [Id]                 BIGINT                                             IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId] INT                                                NOT NULL,
    [EfaaStatusCode]     SMALLINT                                           NOT NULL,
    [ExecutionTempId]    INT                                                NOT NULL,
    [DeliveryStatus]     BIT                                                NULL,
    [ConversationId]     UNIQUEIDENTIFIER                                   NOT NULL,
    [CreatedAt]          DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [ValidFrom]          DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN DEFAULT ('0001-01-01T00:00:00.0000000') NOT NULL,
    [ValidTo]            DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   DEFAULT ('9999-12-31T23:59:59.9999999') NOT NULL,
    CONSTRAINT [PK_EfaaActionLogs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EfaaActionLogs_ExectionRequestTempData_ExecutionTempId] FOREIGN KEY ([ExecutionTempId]) REFERENCES [INTG].[ExectionRequestTempData] ([Id]),
    CONSTRAINT [FK_EfaaActionLogs_ExecutionRequestIntegrationEfaaStatus_EfaaStatusCode] FOREIGN KEY ([EfaaStatusCode]) REFERENCES [ExrLK].[ExecutionRequestIntegrationEfaaStatus] ([Code]),
    CONSTRAINT [FK_EfaaActionLogs_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[EFAA].[EfaaActionLogsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_EfaaActionLogs_ExecutionTempId]
    ON [EFAA].[EfaaActionLogs]([ExecutionTempId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EfaaActionLogs_ExecutionRequestId]
    ON [EFAA].[EfaaActionLogs]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EfaaActionLogs_EfaaStatusCode]
    ON [EFAA].[EfaaActionLogs]([EfaaStatusCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Efaa Action Log', @level0type = N'SCHEMA', @level0name = N'EFAA', @level1type = N'TABLE', @level1name = N'EfaaActionLogs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

