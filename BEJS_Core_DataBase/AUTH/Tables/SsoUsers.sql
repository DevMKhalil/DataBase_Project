CREATE TABLE [AUTH].[SsoUsers] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [UserId]               INT            NOT NULL,
    [IsExternal]           BIT            NOT NULL,
    [UserCode]             NVARCHAR (MAX) NOT NULL,
    [FirstName]            NVARCHAR (MAX) NOT NULL,
    [SecondName]           NVARCHAR (MAX) NOT NULL,
    [ThirdName]            NVARCHAR (MAX) NOT NULL,
    [FamilyName]           NVARCHAR (MAX) NOT NULL,
    [BirthDate]            DATE           NOT NULL,
    [GenderTypeId]         SMALLINT       NOT NULL,
    [GenderTypeDesc]       NVARCHAR (MAX) NOT NULL,
    [Email]                NVARCHAR (MAX) NOT NULL,
    [NetworkUser]          NVARCHAR (MAX) NULL,
    [Phone]                NVARCHAR (MAX) NOT NULL,
    [RegistrationMethodId] SMALLINT       NOT NULL,
    [Sub]                  NVARCHAR (MAX) NOT NULL,
    [IdentityTypeId]       SMALLINT       NOT NULL,
    [CreatedAt]            DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]          INT            NOT NULL,
    [UpdatedAt]            DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]            INT            NULL,
    CONSTRAINT [PK_SsoUsers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SsoUsers_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SsoUsers_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SsoUsers_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SsoUsers_UserId_IsExternal]
    ON [AUTH].[SsoUsers]([UserId] ASC, [IsExternal] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SsoUsers_UserId]
    ON [AUTH].[SsoUsers]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SsoUsers_UpdatedBy]
    ON [AUTH].[SsoUsers]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SsoUsers_CreatedById]
    ON [AUTH].[SsoUsers]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Sso User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'SsoUsers', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Sso User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'SsoUsers', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Sso User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'SsoUsers', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Sso User', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'SsoUsers', @level2type = N'COLUMN', @level2name = N'CreatedAt';

