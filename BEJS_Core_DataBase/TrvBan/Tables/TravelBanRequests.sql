CREATE TABLE [TrvBan].[TravelBanRequests] (
    [Id]                               INT           IDENTITY (1, 1) NOT NULL,
    [TypeId]                           INT           NOT NULL,
    [StatusId]                         INT           NOT NULL,
    [AssignedDelegateId]               INT           NULL,
    [ExecutionRequestJudicialActionId] INT           NOT NULL,
    [SubmittedAt]                      DATETIME2 (7) NULL,
    [CreatedAt]                        DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]                      INT           NOT NULL,
    [UpdatedAt]                        DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]                        INT           NULL,
    [AssignedAt]                       DATETIME2 (7) NULL,
    [RequestNumber]                    NVARCHAR (50) DEFAULT (N'') NOT NULL,
    CONSTRAINT [PK_TravelBanRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TravelBanRequests_MOIDelegates_AssignedDelegateId] FOREIGN KEY ([AssignedDelegateId]) REFERENCES [MOI].[MOIDelegates] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TravelBanRequests_RequestJudicialActions_ExecutionRequestJudicialActionId] FOREIGN KEY ([ExecutionRequestJudicialActionId]) REFERENCES [JACT].[RequestJudicialActions] ([Id]),
    CONSTRAINT [FK_TravelBanRequests_TravelBanRequestStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [TrvBan].[TravelBanRequestStatus] ([Code]),
    CONSTRAINT [FK_TravelBanRequests_TravelBanRequestTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [TrvBan].[TravelBanRequestTypes] ([Code]),
    CONSTRAINT [FK_TravelBanRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_TravelBanRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanRequests_UpdatedBy]
    ON [TrvBan].[TravelBanRequests]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanRequests_TypeId]
    ON [TrvBan].[TravelBanRequests]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanRequests_StatusId]
    ON [TrvBan].[TravelBanRequests]([StatusId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TravelBanRequests_ExecutionRequestJudicialActionId]
    ON [TrvBan].[TravelBanRequests]([ExecutionRequestJudicialActionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanRequests_CreatedById]
    ON [TrvBan].[TravelBanRequests]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TravelBanRequests_AssignedDelegateId]
    ON [TrvBan].[TravelBanRequests]([AssignedDelegateId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Travel Ban Request', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Travel Ban Request', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Travel Ban Request', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Travel Ban Request', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

