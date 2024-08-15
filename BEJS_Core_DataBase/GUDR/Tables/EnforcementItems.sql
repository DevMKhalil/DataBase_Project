CREATE TABLE [GUDR].[EnforcementItems] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [GuidanceRequestId] INT            NOT NULL,
    [EnforcementItemId] BIGINT         NOT NULL,
    [Note]              NVARCHAR (MAX) NULL,
    [CreatedAt]         DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]       INT            NOT NULL,
    [UpdatedAt]         DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]         INT            NULL,
    CONSTRAINT [PK_EnforcementItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EnforcementItems_EnforcementItems_EnforcementItemId] FOREIGN KEY ([EnforcementItemId]) REFERENCES [EXR].[EnforcementItems] ([Id]),
    CONSTRAINT [FK_EnforcementItems_GuidanceRequests_GuidanceRequestId] FOREIGN KEY ([GuidanceRequestId]) REFERENCES [SECR].[GuidanceRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_EnforcementItems_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_EnforcementItems_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_UpdatedBy]
    ON [GUDR].[EnforcementItems]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_GuidanceRequestId]
    ON [GUDR].[EnforcementItems]([GuidanceRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_EnforcementItemId]
    ON [GUDR].[EnforcementItems]([EnforcementItemId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_CreatedById]
    ON [GUDR].[EnforcementItems]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Enforcement Item', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Enforcement Item', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Enforcement Item', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Enforcement Item', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enforcement Item Id => it is used to determine the related enforcement item', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'EnforcementItemId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Guidance Request Id => it is used to determine the related completion request', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'GuidanceRequestId';

