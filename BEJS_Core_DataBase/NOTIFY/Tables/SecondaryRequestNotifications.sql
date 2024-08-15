CREATE TABLE [NOTIFY].[SecondaryRequestNotifications] (
    [Id]                 BIGINT           IDENTITY (1, 1) NOT NULL,
    [SecondaryRequestId] INT              NOT NULL,
    [ExecutionRequestId] INT              NULL,
    [ReasonId]           INT              NOT NULL,
    [ConversationId]     UNIQUEIDENTIFIER NOT NULL,
    [ActionAt]           DATETIME2 (7)    NOT NULL,
    [CreatedAt]          DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT              NOT NULL,
    CONSTRAINT [PK_SecondaryRequestNotifications] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SecondaryRequestNotifications_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SecondaryRequestNotifications_NotificationReasons_ReasonId] FOREIGN KEY ([ReasonId]) REFERENCES [NOTIFY].[NotificationReasons] ([Code]),
    CONSTRAINT [FK_SecondaryRequestNotifications_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SecondaryRequestNotifications_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotifications_SecondaryRequestId]
    ON [NOTIFY].[SecondaryRequestNotifications]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotifications_ReasonId]
    ON [NOTIFY].[SecondaryRequestNotifications]([ReasonId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotifications_ExecutionRequestId]
    ON [NOTIFY].[SecondaryRequestNotifications]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestNotifications_CreatedById]
    ON [NOTIFY].[SecondaryRequestNotifications]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Secondary Request Notification', @level0type = N'SCHEMA', @level0name = N'NOTIFY', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotifications', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Secondary Request Notification', @level0type = N'SCHEMA', @level0name = N'NOTIFY', @level1type = N'TABLE', @level1name = N'SecondaryRequestNotifications', @level2type = N'COLUMN', @level2name = N'CreatedAt';

