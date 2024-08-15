CREATE TABLE [JACT].[TransferAccountUsersInfo] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [TransferInfoId] INT            NOT NULL,
    [IdNumber]       NVARCHAR (MAX) NOT NULL,
    [Name]           NVARCHAR (MAX) NOT NULL,
    [UserTypeId]     INT            NOT NULL,
    [IdentityTypeId] INT            NULL,
    [CreatedAt]      DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]    INT            NOT NULL,
    [UpdatedAt]      DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]      INT            NULL,
    CONSTRAINT [PK_TransferAccountUsersInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransferAccountUsersInfo_AccountUserType_UserTypeId] FOREIGN KEY ([UserTypeId]) REFERENCES [SAMA].[AccountUserType] ([Id]),
    CONSTRAINT [FK_TransferAccountUsersInfo_IdTypes_IdentityTypeId] FOREIGN KEY ([IdentityTypeId]) REFERENCES [SAMA].[IdTypes] ([Id]),
    CONSTRAINT [FK_TransferAccountUsersInfo_TransferInfo_TransferInfoId] FOREIGN KEY ([TransferInfoId]) REFERENCES [JACT].[TransferInfo] ([Id]),
    CONSTRAINT [FK_TransferAccountUsersInfo_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_TransferAccountUsersInfo_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_TransferAccountUsersInfo_UserTypeId]
    ON [JACT].[TransferAccountUsersInfo]([UserTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferAccountUsersInfo_UpdatedBy]
    ON [JACT].[TransferAccountUsersInfo]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferAccountUsersInfo_TransferInfoId]
    ON [JACT].[TransferAccountUsersInfo]([TransferInfoId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferAccountUsersInfo_IdentityTypeId]
    ON [JACT].[TransferAccountUsersInfo]([IdentityTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferAccountUsersInfo_CreatedById]
    ON [JACT].[TransferAccountUsersInfo]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Action Transfer Account User Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferAccountUsersInfo', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Action Transfer Account User Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferAccountUsersInfo', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Action Transfer Account User Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferAccountUsersInfo', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Action Transfer Account User Info', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'TransferAccountUsersInfo', @level2type = N'COLUMN', @level2name = N'CreatedAt';

