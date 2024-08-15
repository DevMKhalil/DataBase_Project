CREATE TABLE [JSES].[SessionMembers] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [SessionId]      INT           NOT NULL,
    [UserId]         INT           NULL,
    [IdentityNumber] NVARCHAR (30) NOT NULL,
    CONSTRAINT [PK_SessionMembers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SessionMembers_Sessions_SessionId] FOREIGN KEY ([SessionId]) REFERENCES [JSES].[Sessions] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SessionMembers_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_SessionMembers_UserId]
    ON [JSES].[SessionMembers]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SessionMembers_SessionId]
    ON [JSES].[SessionMembers]([SessionId] ASC);

