CREATE TABLE [GUDR].[GuidanceRequestActions] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [ActionCode]  SMALLINT       NOT NULL,
    [ActionText]  NVARCHAR (MAX) NOT NULL,
    [SecretaryId] INT            NOT NULL,
    [CreatedAt]   DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT            NOT NULL,
    [UpdatedAt]   DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT            NULL,
    CONSTRAINT [PK_GuidanceRequestActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GuidanceRequestActions_JudicialActions_ActionCode] FOREIGN KEY ([ActionCode]) REFERENCES [JACT].[JudicialActions] ([Code]),
    CONSTRAINT [FK_GuidanceRequestActions_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_GuidanceRequestActions_Users_SecretaryId] FOREIGN KEY ([SecretaryId]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_GuidanceRequestActions_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequestActions_UpdatedBy]
    ON [GUDR].[GuidanceRequestActions]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequestActions_SecretaryId]
    ON [GUDR].[GuidanceRequestActions]([SecretaryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequestActions_CreatedById]
    ON [GUDR].[GuidanceRequestActions]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequestActions_ActionCode]
    ON [GUDR].[GuidanceRequestActions]([ActionCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Request Action', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GuidanceRequestActions', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Request Action', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GuidanceRequestActions', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Request Action', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GuidanceRequestActions', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Request Action', @level0type = N'SCHEMA', @level0name = N'GUDR', @level1type = N'TABLE', @level1name = N'GuidanceRequestActions', @level2type = N'COLUMN', @level2name = N'CreatedAt';

