CREATE TABLE [MOI].[MOIDelegateHistory] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [MOIDelegateId]       INT           NOT NULL,
    [DeactivateStartDate] DATE          NULL,
    [DeactivateEndDate]   DATE          NULL,
    [TypeId]              SMALLINT      NOT NULL,
    [CreatedAt]           DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]         INT           NOT NULL,
    CONSTRAINT [PK_MOIDelegateHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_MOIDelegateHistory_MOIDelegateHistoryTypes_TypeId] FOREIGN KEY ([TypeId]) REFERENCES [MOI].[MOIDelegateHistoryTypes] ([Code]),
    CONSTRAINT [FK_MOIDelegateHistory_MOIDelegates_MOIDelegateId] FOREIGN KEY ([MOIDelegateId]) REFERENCES [MOI].[MOIDelegates] ([Id]),
    CONSTRAINT [FK_MOIDelegateHistory_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_MOIDelegateHistory_TypeId]
    ON [MOI].[MOIDelegateHistory]([TypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MOIDelegateHistory_MOIDelegateId]
    ON [MOI].[MOIDelegateHistory]([MOIDelegateId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MOIDelegateHistory_CreatedById]
    ON [MOI].[MOIDelegateHistory]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create M O I Delegate History', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegateHistory', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of M O I Delegate History', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegateHistory', @level2type = N'COLUMN', @level2name = N'CreatedAt';

