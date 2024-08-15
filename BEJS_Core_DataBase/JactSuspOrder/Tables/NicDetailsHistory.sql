CREATE TABLE [JactSuspOrder].[NicDetailsHistory] (
    [Id]                            INT           IDENTITY (1, 1) NOT NULL,
    [NicDetailsId]                  INT           NOT NULL,
    [NicSuspensionOrderOperationId] BIGINT        NOT NULL,
    [StatusCode]                    SMALLINT      NOT NULL,
    [CreatedAt]                     DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]                   INT           NOT NULL,
    [UpdatedAt]                     DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]                     INT           NULL,
    CONSTRAINT [PK_NicDetailsHistory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_NicDetailsHistory_NicDetails_NicDetailsId] FOREIGN KEY ([NicDetailsId]) REFERENCES [JactSuspOrder].[NicDetails] ([Id]),
    CONSTRAINT [FK_NicDetailsHistory_NicDetailsHistoryStatues_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [JactSuspOrder].[NicDetailsHistoryStatues] ([Code]),
    CONSTRAINT [FK_NicDetailsHistory_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_NicDetailsHistory_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_NicDetailsHistory_UpdatedBy]
    ON [JactSuspOrder].[NicDetailsHistory]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicDetailsHistory_StatusCode]
    ON [JactSuspOrder].[NicDetailsHistory]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicDetailsHistory_NicDetailsId]
    ON [JactSuspOrder].[NicDetailsHistory]([NicDetailsId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NicDetailsHistory_CreatedById]
    ON [JactSuspOrder].[NicDetailsHistory]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Suspension Order Defendant Nic Details History', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetailsHistory', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Suspension Order Defendant Nic Details History', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetailsHistory', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Suspension Order Defendant Nic Details History', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetailsHistory', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Suspension Order Defendant Nic Details History', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetailsHistory', @level2type = N'COLUMN', @level2name = N'CreatedAt';

