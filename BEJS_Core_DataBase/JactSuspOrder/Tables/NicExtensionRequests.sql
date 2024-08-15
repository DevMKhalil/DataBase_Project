CREATE TABLE [JactSuspOrder].[NicExtensionRequests] (
    [Id]                          INT            IDENTITY (1, 1) NOT NULL,
    [NicDetailsId]                INT            NOT NULL,
    [SuspensionLevelCode]         INT            NULL,
    [SuspensionLevelEn]           NVARCHAR (MAX) NULL,
    [SuspensionLevelAr]           NVARCHAR (MAX) NULL,
    [ExtensionRequestCreatedDate] DATETIME2 (7)  NULL,
    [ExtensionRequestStatusCode]  INT            NULL,
    [ExtensionRequestStatusEn]    NVARCHAR (MAX) NULL,
    [ExtensionRequestStatusAr]    NVARCHAR (MAX) NULL,
    [ExtesnionDays]               INT            NULL,
    [ExtensionRequestEndDate]     DATETIME2 (7)  NULL,
    [CreatedAt]                   DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]                 INT            NOT NULL,
    [UpdatedAt]                   DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]                   INT            NULL,
    CONSTRAINT [PK_NicExtensionRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NicExtensionRequests_NicDetails_NicDetailsId] FOREIGN KEY ([NicDetailsId]) REFERENCES [JactSuspOrder].[NicDetails] ([Id]),
    CONSTRAINT [FK_NicExtensionRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NicExtensionRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NicExtensionRequests_UpdatedBy]
    ON [JactSuspOrder].[NicExtensionRequests]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicExtensionRequests_NicDetailsId]
    ON [JactSuspOrder].[NicExtensionRequests]([NicDetailsId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicExtensionRequests_CreatedById]
    ON [JactSuspOrder].[NicExtensionRequests]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Suspension Order Defendant Nic Extension Request', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicExtensionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Suspension Order Defendant Nic Extension Request', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicExtensionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Suspension Order Defendant Nic Extension Request', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicExtensionRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Suspension Order Defendant Nic Extension Request', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicExtensionRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

