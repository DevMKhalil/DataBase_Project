CREATE TABLE [EXR].[EnforcementItems] (
    [Id]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [Data]          NVARCHAR (1000) NOT NULL,
    [EnforcementId] INT             NOT NULL,
    [CreatedAt]     DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]   INT             NOT NULL,
    [UpdatedAt]     DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]     INT             NULL,
    [StatusCode]    SMALLINT        DEFAULT (CONVERT([smallint],(1))) NOT NULL,
    CONSTRAINT [PK_EnforcementItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EnforcementItems_EnforcementItemStatus_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [EXR].[EnforcementItemStatus] ([Code]),
    CONSTRAINT [FK_EnforcementItems_Enforcements_EnforcementId] FOREIGN KEY ([EnforcementId]) REFERENCES [EXR].[Enforcements] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_EnforcementItems_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_EnforcementItems_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_StatusCode]
    ON [EXR].[EnforcementItems]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_UpdatedBy]
    ON [EXR].[EnforcementItems]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_EnforcementId]
    ON [EXR].[EnforcementItems]([EnforcementId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EnforcementItems_CreatedById]
    ON [EXR].[EnforcementItems]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Enforcement Item', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Enforcement Item', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Enforcement Item', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Enforcement Item', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'EnforcementItems', @level2type = N'COLUMN', @level2name = N'CreatedAt';

