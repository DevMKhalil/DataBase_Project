CREATE TABLE [SECR].[CompletionRequests] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [SecondaryRequestId] INT           NOT NULL,
    [IsFullExecuted]     BIT           NULL,
    [CreatedAt]          DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT           NOT NULL,
    [UpdatedAt]          DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT           NULL,
    CONSTRAINT [PK_CompletionRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CompletionRequests_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]),
    CONSTRAINT [FK_CompletionRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CompletionRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_CompletionRequests_UpdatedBy]
    ON [SECR].[CompletionRequests]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CompletionRequests_SecondaryRequestId]
    ON [SECR].[CompletionRequests]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CompletionRequests_CreatedById]
    ON [SECR].[CompletionRequests]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Completion Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Completion Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Completion Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletionRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Completion Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletionRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Is Full Executed => it is used to determined if execution is fully or partially Executed', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletionRequests', @level2type = N'COLUMN', @level2name = N'IsFullExecuted';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Secondary Request Id => it is used to determine the related secondary request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletionRequests', @level2type = N'COLUMN', @level2name = N'SecondaryRequestId';

