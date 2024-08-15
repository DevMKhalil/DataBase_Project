CREATE TABLE [SECR].[GuidanceRequests] (
    [Id]                      INT           IDENTITY (1, 1) NOT NULL,
    [SecondaryRequestId]      INT           NOT NULL,
    [HasExecutionRequest]     BIT           NULL,
    [CourtId]                 INT           NULL,
    [CreatedAt]               DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]             INT           NOT NULL,
    [UpdatedAt]               DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]               INT           NULL,
    [EnforcementId]           INT           NULL,
    [PlaintiffTypeCode]       SMALLINT      NULL,
    [GuidanceRequestActionId] INT           NULL,
    CONSTRAINT [PK_GuidanceRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GuidanceRequests_Courts_CourtId] FOREIGN KEY ([CourtId]) REFERENCES [LK].[Courts] ([Id]),
    CONSTRAINT [FK_GuidanceRequests_Enforcements_EnforcementId] FOREIGN KEY ([EnforcementId]) REFERENCES [EXR].[Enforcements] ([Id]),
    CONSTRAINT [FK_GuidanceRequests_GuidanceRequestActions_GuidanceRequestActionId] FOREIGN KEY ([GuidanceRequestActionId]) REFERENCES [GUDR].[GuidanceRequestActions] ([Id]),
    CONSTRAINT [FK_GuidanceRequests_PlaintiffTypes_PlaintiffTypeCode] FOREIGN KEY ([PlaintiffTypeCode]) REFERENCES [LK].[PlaintiffTypes] ([Code]),
    CONSTRAINT [FK_GuidanceRequests_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]),
    CONSTRAINT [FK_GuidanceRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_GuidanceRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequests_GuidanceRequestActionId]
    ON [SECR].[GuidanceRequests]([GuidanceRequestActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequests_PlaintiffTypeCode]
    ON [SECR].[GuidanceRequests]([PlaintiffTypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequests_EnforcementId]
    ON [SECR].[GuidanceRequests]([EnforcementId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequests_UpdatedBy]
    ON [SECR].[GuidanceRequests]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GuidanceRequests_SecondaryRequestId]
    ON [SECR].[GuidanceRequests]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequests_CreatedById]
    ON [SECR].[GuidanceRequests]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GuidanceRequests_CourtId]
    ON [SECR].[GuidanceRequests]([CourtId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Guidance Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'GuidanceRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Guidance Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'GuidanceRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Guidance Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'GuidanceRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Guidance Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'GuidanceRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

