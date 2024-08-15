CREATE TABLE [SECR].[SecondaryRequestStatusLogs] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [SecondaryRequestId] INT           NOT NULL,
    [StatusCode]         SMALLINT      NOT NULL,
    [CreatedAt]          DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT           NOT NULL,
    [UpdatedAt]          DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT           NULL,
    CONSTRAINT [PK_SecondaryRequestStatusLogs] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SecondaryRequestStatusLogs_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]),
    CONSTRAINT [FK_SecondaryRequestStatusLogs_SecondaryRequestStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [SecrLK].[SecondaryRequestStatuses] ([Code]),
    CONSTRAINT [FK_SecondaryRequestStatusLogs_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SecondaryRequestStatusLogs_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestStatusLogs_UpdatedBy]
    ON [SECR].[SecondaryRequestStatusLogs]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestStatusLogs_StatusCode]
    ON [SECR].[SecondaryRequestStatusLogs]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestStatusLogs_SecondaryRequestId]
    ON [SECR].[SecondaryRequestStatusLogs]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestStatusLogs_CreatedById]
    ON [SECR].[SecondaryRequestStatusLogs]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Secondary RequestStatus Log', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusLogs', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Secondary RequestStatus Log', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusLogs', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Secondary RequestStatus Log', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusLogs', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Secondary RequestStatus Log', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusLogs', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Status Code => it is used to log the new status for secondary request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusLogs', @level2type = N'COLUMN', @level2name = N'StatusCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Secondary Request Id => it is used to determine the related secondary request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SecondaryRequestStatusLogs', @level2type = N'COLUMN', @level2name = N'SecondaryRequestId';

