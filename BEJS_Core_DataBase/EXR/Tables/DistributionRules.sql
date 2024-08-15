CREATE TABLE [EXR].[DistributionRules] (
    [Id]                      INT             IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId]      INT             NOT NULL,
    [IsMatched]               BIT             NOT NULL,
    [UnmatchedReason]         NVARCHAR (2000) NULL,
    [IsReturnRequestAssigned] BIT             NULL,
    [CreatedAt]               DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]             INT             NOT NULL,
    [UpdatedAt]               DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]               INT             NULL,
    CONSTRAINT [PK_DistributionRules] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DistributionRules_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_DistributionRules_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_DistributionRules_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DistributionRules_UpdatedBy]
    ON [EXR].[DistributionRules]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DistributionRules_ExecutionRequestId]
    ON [EXR].[DistributionRules]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DistributionRules_CreatedById]
    ON [EXR].[DistributionRules]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Distribution Rules', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'DistributionRules', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Distribution Rules', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'DistributionRules', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Distribution Rules', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'DistributionRules', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Distribution Rules', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'DistributionRules', @level2type = N'COLUMN', @level2name = N'CreatedAt';

