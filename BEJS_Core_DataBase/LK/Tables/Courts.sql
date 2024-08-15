CREATE TABLE [LK].[Courts] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (200) NOT NULL,
    [CreatedAt]   DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT            NOT NULL,
    [UpdatedAt]   DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT            NULL,
    CONSTRAINT [PK_Courts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Courts_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Courts_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Courts_UpdatedBy]
    ON [LK].[Courts]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Courts_Name]
    ON [LK].[Courts]([Name] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Courts_CreatedById]
    ON [LK].[Courts]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Court', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Courts', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Court', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Courts', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Court', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Courts', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Court', @level0type = N'SCHEMA', @level0name = N'LK', @level1type = N'TABLE', @level1name = N'Courts', @level2type = N'COLUMN', @level2name = N'CreatedAt';

