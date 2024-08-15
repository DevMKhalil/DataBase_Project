CREATE TABLE [NOTIFY].[ExecutionRequestNotifications] (
    [Id]                 BIGINT           IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId] INT              NOT NULL,
    [ReasonId]           INT              NOT NULL,
    [ConversationId]     UNIQUEIDENTIFIER NOT NULL,
    [CreatedAt]          DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT              NOT NULL,
    [ActionAt]           DATETIME2 (7)    DEFAULT ('0001-01-01T00:00:00.0000000') NOT NULL,
    CONSTRAINT [PK_ExecutionRequestNotifications] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExecutionRequestNotifications_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ExecutionRequestNotifications_NotificationReasons_ReasonId] FOREIGN KEY ([ReasonId]) REFERENCES [NOTIFY].[NotificationReasons] ([Code]),
    CONSTRAINT [FK_ExecutionRequestNotifications_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestNotifications_ReasonId]
    ON [NOTIFY].[ExecutionRequestNotifications]([ReasonId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestNotifications_ExecutionRequestId]
    ON [NOTIFY].[ExecutionRequestNotifications]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExecutionRequestNotifications_CreatedById]
    ON [NOTIFY].[ExecutionRequestNotifications]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Execution Request Notification', @level0type = N'SCHEMA', @level0name = N'NOTIFY', @level1type = N'TABLE', @level1name = N'ExecutionRequestNotifications', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Execution Request Notification', @level0type = N'SCHEMA', @level0name = N'NOTIFY', @level1type = N'TABLE', @level1name = N'ExecutionRequestNotifications', @level2type = N'COLUMN', @level2name = N'CreatedAt';

