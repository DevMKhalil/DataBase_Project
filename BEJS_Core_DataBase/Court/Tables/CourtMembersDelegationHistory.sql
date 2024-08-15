CREATE TABLE [Court].[CourtMembersDelegationHistory] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [CourtMemberId]       INT           NOT NULL,
    [DelegationStartDate] DATE          NULL,
    [DelegationEndDate]   DATE          NULL,
    [TypeId]              SMALLINT      NOT NULL,
    [CreatedAt]           DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]         INT           NOT NULL,
    CONSTRAINT [PK_CourtMembersDelegationHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CourtMembersDelegationHistory_CourtMembers_CourtMemberId] FOREIGN KEY ([CourtMemberId]) REFERENCES [Court].[CourtMembers] ([Id]),
    CONSTRAINT [FK_CourtMembersDelegationHistory_DelegationHistoryTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [Court].[DelegationHistoryTypes] ([Code]),
    CONSTRAINT [FK_CourtMembersDelegationHistory_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_CourtMembersDelegationHistory_TypeId]
    ON [Court].[CourtMembersDelegationHistory]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CourtMembersDelegationHistory_CreatedById]
    ON [Court].[CourtMembersDelegationHistory]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CourtMembersDelegationHistory_CourtMemberId]
    ON [Court].[CourtMembersDelegationHistory]([CourtMemberId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Court Members Delegation History', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMembersDelegationHistory', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Court Members Delegation History', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMembersDelegationHistory', @level2type = N'COLUMN', @level2name = N'CreatedAt';

