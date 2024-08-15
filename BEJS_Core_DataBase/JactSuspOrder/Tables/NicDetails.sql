CREATE TABLE [JactSuspOrder].[NicDetails] (
    [Id]                             INT            IDENTITY (1, 1) NOT NULL,
    [NicOrderNumber]                 FLOAT (53)     NOT NULL,
    [IdNumber]                       FLOAT (53)     NULL,
    [CaseCode]                       INT            NULL,
    [CaseEn]                         NVARCHAR (MAX) NULL,
    [CaseAr]                         NVARCHAR (MAX) NULL,
    [OrderStatusCode]                INT            NULL,
    [OrderStatusEn]                  NVARCHAR (MAX) NULL,
    [OrderStatusAr]                  NVARCHAR (MAX) NULL,
    [IssueRequestReference]          NVARCHAR (MAX) NULL,
    [ResolutionRequestReference]     NVARCHAR (MAX) NULL,
    [ResolutionOrderDate]            DATETIME2 (7)  NULL,
    [OrderCreateDate]                DATETIME2 (7)  NULL,
    [OrderCreateOperatorId]          FLOAT (53)     NULL,
    [OrderUpdateDate]                DATETIME2 (7)  NULL,
    [OrderUpdateOperatorId]          FLOAT (53)     NULL,
    [StartSuspensionLevel]           INT            NULL,
    [StartSuspensionLevelEn]         NVARCHAR (MAX) NULL,
    [StartSuspensionLevelAr]         NVARCHAR (MAX) NULL,
    [CurrentSuspensionLevel]         INT            NULL,
    [CurrentSuspensionLevelEn]       NVARCHAR (MAX) NULL,
    [CurrentSuspensionLevelAr]       NVARCHAR (MAX) NULL,
    [CurrentSuspensionLevelDeadline] DATETIME2 (7)  NULL,
    [ReponseData]                    NVARCHAR (MAX) NULL,
    [CreatedAt]                      DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]                    INT            NOT NULL,
    [UpdatedAt]                      DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]                      INT            NULL,
    CONSTRAINT [PK_NicDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NicDetails_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NicDetails_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NicDetails_UpdatedBy]
    ON [JactSuspOrder].[NicDetails]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicDetails_CreatedById]
    ON [JactSuspOrder].[NicDetails]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Suspension Order Defendant Nic Details', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetails', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Suspension Order Defendant Nic Details', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetails', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Suspension Order Defendant Nic Details', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetails', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Suspension Order Defendant Nic Details', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetails', @level2type = N'COLUMN', @level2name = N'CreatedAt';

