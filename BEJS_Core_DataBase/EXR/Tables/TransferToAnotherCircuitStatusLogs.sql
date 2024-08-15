CREATE TABLE [EXR].[TransferToAnotherCircuitStatusLogs] (
    [Id]                         INT           IDENTITY (1, 1) NOT NULL,
    [TransferToAnotherCircuitId] INT           NOT NULL,
    [StatusCode]                 SMALLINT      NOT NULL,
    [CreatedAt]                  DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]                INT           NOT NULL,
    [UpdatedAt]                  DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]                  INT           NULL,
    CONSTRAINT [PK_TransferToAnotherCircuitStatusLogs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransferToAnotherCircuitStatusLogs_TransferToAnotherCircuitRequests_TransferToAnotherCircuitId] FOREIGN KEY ([TransferToAnotherCircuitId]) REFERENCES [EXR].[TransferToAnotherCircuitRequests] ([Id]),
    CONSTRAINT [FK_TransferToAnotherCircuitStatusLogs_TransferToAnotherCircuitRequestStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [ExrLK].[TransferToAnotherCircuitRequestStatuses] ([Code]),
    CONSTRAINT [FK_TransferToAnotherCircuitStatusLogs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_TransferToAnotherCircuitStatusLogs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitStatusLogs_UpdatedBy]
    ON [EXR].[TransferToAnotherCircuitStatusLogs]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitStatusLogs_TransferToAnotherCircuitId]
    ON [EXR].[TransferToAnotherCircuitStatusLogs]([TransferToAnotherCircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitStatusLogs_StatusCode]
    ON [EXR].[TransferToAnotherCircuitStatusLogs]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitStatusLogs_CreatedById]
    ON [EXR].[TransferToAnotherCircuitStatusLogs]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update TransferTo Another Circuit Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitStatusLogs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of TransferTo Another Circuit Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitStatusLogs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create TransferTo Another Circuit Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitStatusLogs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of TransferTo Another Circuit Status Log', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitStatusLogs', @level2type = N'COLUMN', @level2name = N'CreatedAt';

