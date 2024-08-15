CREATE TABLE [JACT].[LiftParticipatingUser] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [Name]               NVARCHAR (MAX) DEFAULT (N'') NOT NULL,
    [LiftOrderDetailsId] INT            DEFAULT ((0)) NOT NULL,
    [IdNumber]           NVARCHAR (MAX) DEFAULT (N'') NOT NULL,
    [IdentityTypeId]     INT            NULL,
    [UserTypeId]         INT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_LiftParticipatingUser] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_LiftParticipatingUser_AccountUserType_UserTypeId] FOREIGN KEY ([UserTypeId]) REFERENCES [SAMA].[AccountUserType] ([Id]),
    CONSTRAINT [FK_LiftParticipatingUser_IdTypes_IdentityTypeId] FOREIGN KEY ([IdentityTypeId]) REFERENCES [SAMA].[IdTypes] ([Id]),
    CONSTRAINT [FK_LiftParticipatingUser_LiftOrderDetails_LiftOrderDetailsId] FOREIGN KEY ([LiftOrderDetailsId]) REFERENCES [JACT].[LiftOrderDetails] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_LiftParticipatingUser_UserTypeId]
    ON [JACT].[LiftParticipatingUser]([UserTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LiftParticipatingUser_IdentityTypeId]
    ON [JACT].[LiftParticipatingUser]([IdentityTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LiftParticipatingUser_LiftOrderDetailsId]
    ON [JACT].[LiftParticipatingUser]([LiftOrderDetailsId] ASC);

