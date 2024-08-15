CREATE TABLE [AUTH].[Users] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Nin]         NVARCHAR (15) NOT NULL,
    [CreatedAt]   DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT           NOT NULL,
    [UpdatedAt]   DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT           NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Users_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Users_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Users_UpdatedBy]
    ON [AUTH].[Users]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Nin]
    ON [AUTH].[Users]([Nin] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Users_CreatedById]
    ON [AUTH].[Users]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Users', @level2type = N'COLUMN', @level2name = N'CreatedAt';

