CREATE TABLE [AUTH].[UserAccounts] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [UserId]             INT            NOT NULL,
    [RoleCode]           INT            NOT NULL,
    [IsActive]           BIT            NOT NULL,
    [IsSelected]         BIT            NOT NULL,
    [DeactivationReason] NVARCHAR (MAX) NULL,
    [CreatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT            NOT NULL,
    [UpdatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT            NULL,
    CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserAccounts_Roles_RoleCode] FOREIGN KEY ([RoleCode]) REFERENCES [AUTH].[Roles] ([Code]),
    CONSTRAINT [FK_UserAccounts_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_UserAccounts_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_UserAccounts_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_UserAccounts_UserId]
    ON [AUTH].[UserAccounts]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UserAccounts_UpdatedBy]
    ON [AUTH].[UserAccounts]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UserAccounts_RoleCode]
    ON [AUTH].[UserAccounts]([RoleCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UserAccounts_CreatedById]
    ON [AUTH].[UserAccounts]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update User Account', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'UserAccounts', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of User Account', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'UserAccounts', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create User Account', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'UserAccounts', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of User Account', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'UserAccounts', @level2type = N'COLUMN', @level2name = N'CreatedAt';

