CREATE TABLE [JACT].[DefandantBalanceAccountUser] (
    [Id]                               INT            IDENTITY (1, 1) NOT NULL,
    [UserName]                         NVARCHAR (MAX) NULL,
    [IdentityNo]                       NVARCHAR (MAX) NULL,
    [UserTypeId]                       INT            NOT NULL,
    [DefandantBalanceAccountDetailsId] INT            NOT NULL,
    [CreatedAt]                        DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]                      INT            NOT NULL,
    [UpdatedAt]                        DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]                        INT            NULL,
    [IdTypeId]                         INT            NULL,
    CONSTRAINT [PK_DefandantBalanceAccountUser] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DefandantBalanceAccountUser_AccountUserType_UserTypeId] FOREIGN KEY ([UserTypeId]) REFERENCES [SAMA].[AccountUserType] ([Id]),
    CONSTRAINT [FK_DefandantBalanceAccountUser_DefandantBalanceAccountDetails_DefandantBalanceAccountDetailsId] FOREIGN KEY ([DefandantBalanceAccountDetailsId]) REFERENCES [JACT].[DefandantBalanceAccountDetails] ([Id]),
    CONSTRAINT [FK_DefandantBalanceAccountUser_IdTypes_IdTypeId] FOREIGN KEY ([IdTypeId]) REFERENCES [SAMA].[IdTypes] ([Id]),
    CONSTRAINT [FK_DefandantBalanceAccountUser_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_DefandantBalanceAccountUser_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountUser_UserTypeId]
    ON [JACT].[DefandantBalanceAccountUser]([UserTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountUser_UpdatedBy]
    ON [JACT].[DefandantBalanceAccountUser]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountUser_IdTypeId]
    ON [JACT].[DefandantBalanceAccountUser]([IdTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountUser_DefandantBalanceAccountDetailsId]
    ON [JACT].[DefandantBalanceAccountUser]([DefandantBalanceAccountDetailsId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefandantBalanceAccountUser_CreatedById]
    ON [JACT].[DefandantBalanceAccountUser]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Defandant Balance Account User', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountUser', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Defandant Balance Account User', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountUser', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Defandant Balance Account User', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountUser', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Defandant Balance Account User', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'DefandantBalanceAccountUser', @level2type = N'COLUMN', @level2name = N'CreatedAt';

