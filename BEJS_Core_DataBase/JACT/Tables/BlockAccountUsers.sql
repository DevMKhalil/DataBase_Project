CREATE TABLE [JACT].[BlockAccountUsers] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]         NVARCHAR (MAX) NULL,
    [Name]           NVARCHAR (MAX) NULL,
    [UserTypeId]     INT            NOT NULL,
    [AccountId]      BIGINT         NOT NULL,
    [IdentityTypeId] INT            NULL,
    CONSTRAINT [PK_BlockAccountUsers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_BlockAccountUsers_AccountUserType_UserTypeId] FOREIGN KEY ([UserTypeId]) REFERENCES [SAMA].[AccountUserType] ([Id]),
    CONSTRAINT [FK_BlockAccountUsers_BlockAccounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [JACT].[BlockAccounts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_BlockAccountUsers_IdTypes_IdentityTypeId] FOREIGN KEY ([IdentityTypeId]) REFERENCES [SAMA].[IdTypes] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BlockAccountUsers_IdentityTypeId]
    ON [JACT].[BlockAccountUsers]([IdentityTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BlockAccountUsers_UserTypeId]
    ON [JACT].[BlockAccountUsers]([UserTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_BlockAccountUsers_AccountId]
    ON [JACT].[BlockAccountUsers]([AccountId] ASC);

