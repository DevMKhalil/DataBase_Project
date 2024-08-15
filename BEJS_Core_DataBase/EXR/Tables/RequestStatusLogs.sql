CREATE TABLE [EXR].[RequestStatusLogs] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [StatusId]           SMALLINT      NOT NULL,
    [ExecutionRequestId] INT           NOT NULL,
    [CreatedAt]          DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT           NOT NULL,
    [UpdatedAt]          DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT           NULL,
    CONSTRAINT [PK_RequestStatusLogs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RequestStatusLogs_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_RequestStatusLogs_Statuses_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [ExrLK].[Statuses] ([Code]),
    CONSTRAINT [FK_RequestStatusLogs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_RequestStatusLogs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_RequestStatusLogs_UpdatedBy]
    ON [EXR].[RequestStatusLogs]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestStatusLogs_StatusId]
    ON [EXR].[RequestStatusLogs]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestStatusLogs_ExecutionRequestId]
    ON [EXR].[RequestStatusLogs]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RequestStatusLogs_CreatedById]
    ON [EXR].[RequestStatusLogs]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Execution Request Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestStatusLogs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Execution Request Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestStatusLogs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Execution Request Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestStatusLogs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Execution Request Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'RequestStatusLogs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

