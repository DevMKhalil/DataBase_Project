CREATE TABLE [NACT].[UserNotification] (
    [Id]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]    INT            NOT NULL,
    [FromId]    INT            NOT NULL,
    [Title]     NVARCHAR (500) NOT NULL,
    [Message]   NVARCHAR (MAX) NULL,
    [Type]      NVARCHAR (MAX) NULL,
    [Action]    NVARCHAR (MAX) NULL,
    [Url]       NVARCHAR (MAX) NULL,
    [IsActive]  BIT            NOT NULL,
    [IsRead]    BIT            NOT NULL,
    [CreatedAt] DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [UpdatedAt] DATETIME2 (7)  NULL,
    CONSTRAINT [PK_UserNotification] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of User Notification', @level0type = N'SCHEMA', @level0name = N'NACT', @level1type = N'TABLE', @level1name = N'UserNotification', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of User Notification', @level0type = N'SCHEMA', @level0name = N'NACT', @level1type = N'TABLE', @level1name = N'UserNotification', @level2type = N'COLUMN', @level2name = N'CreatedAt';

