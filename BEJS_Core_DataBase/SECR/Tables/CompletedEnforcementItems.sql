CREATE TABLE [SECR].[CompletedEnforcementItems] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [CompletionRequestId] INT            NOT NULL,
    [EnforcementItemId]   BIGINT         NOT NULL,
    [Note]                NVARCHAR (MAX) NULL,
    [CreatedAt]           DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]         INT            NOT NULL,
    [UpdatedAt]           DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]           INT            NULL,
    CONSTRAINT [PK_CompletedEnforcementItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CompletedEnforcementItems_CompletionRequests_CompletionRequestId] FOREIGN KEY ([CompletionRequestId]) REFERENCES [SECR].[CompletionRequests] ([Id]),
    CONSTRAINT [FK_CompletedEnforcementItems_EnforcementItems_EnforcementItemId] FOREIGN KEY ([EnforcementItemId]) REFERENCES [EXR].[EnforcementItems] ([Id]),
    CONSTRAINT [FK_CompletedEnforcementItems_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CompletedEnforcementItems_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_CompletedEnforcementItems_UpdatedBy]
    ON [SECR].[CompletedEnforcementItems]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CompletedEnforcementItems_EnforcementItemId]
    ON [SECR].[CompletedEnforcementItems]([EnforcementItemId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CompletedEnforcementItems_CreatedById]
    ON [SECR].[CompletedEnforcementItems]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CompletedEnforcementItems_CompletionRequestId]
    ON [SECR].[CompletedEnforcementItems]([CompletionRequestId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Completed Enforcement Item', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletedEnforcementItems', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Completed Enforcement Item', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletedEnforcementItems', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Completed Enforcement Item', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletedEnforcementItems', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Completed Enforcement Item', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletedEnforcementItems', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforcement Item Id => it is used to determine the related enforcement item', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletedEnforcementItems', @level2type = N'COLUMN', @level2name = N'EnforcementItemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Completion Request Id => it is used to determine the related completion request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'CompletedEnforcementItems', @level2type = N'COLUMN', @level2name = N'CompletionRequestId';

