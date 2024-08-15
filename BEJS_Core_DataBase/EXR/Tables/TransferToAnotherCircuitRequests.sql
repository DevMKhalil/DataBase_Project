CREATE TABLE [EXR].[TransferToAnotherCircuitRequests] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [JudicialCircuitId]  INT            NOT NULL,
    [DistributionRuleId] INT            NOT NULL,
    [StatusCode]         SMALLINT       NOT NULL,
    [RejectReason]       NVARCHAR (MAX) NULL,
    [GuidanceText]       NVARCHAR (MAX) NULL,
    [SecretaryId]        INT            NULL,
    [CreatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]        INT            NOT NULL,
    [UpdatedAt]          DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]          INT            NULL,
    CONSTRAINT [PK_TransferToAnotherCircuitRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransferToAnotherCircuitRequests_Circuits_JudicialCircuitId] FOREIGN KEY ([JudicialCircuitId]) REFERENCES [JCRT].[Circuits] ([Id]),
    CONSTRAINT [FK_TransferToAnotherCircuitRequests_DistributionRules_DistributionRuleId] FOREIGN KEY ([DistributionRuleId]) REFERENCES [EXR].[DistributionRules] ([Id]),
    CONSTRAINT [FK_TransferToAnotherCircuitRequests_TransferToAnotherCircuitRequestStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [ExrLK].[TransferToAnotherCircuitRequestStatuses] ([Code]),
    CONSTRAINT [FK_TransferToAnotherCircuitRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_TransferToAnotherCircuitRequests_Users_SecretaryId] FOREIGN KEY ([SecretaryId]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_TransferToAnotherCircuitRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequests_UpdatedBy]
    ON [EXR].[TransferToAnotherCircuitRequests]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequests_StatusCode]
    ON [EXR].[TransferToAnotherCircuitRequests]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequests_SecretaryId]
    ON [EXR].[TransferToAnotherCircuitRequests]([SecretaryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequests_JudicialCircuitId]
    ON [EXR].[TransferToAnotherCircuitRequests]([JudicialCircuitId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequests_DistributionRuleId]
    ON [EXR].[TransferToAnotherCircuitRequests]([DistributionRuleId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequests_CreatedById]
    ON [EXR].[TransferToAnotherCircuitRequests]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update TransferTo Another Circuit Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of TransferTo Another Circuit Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create TransferTo Another Circuit Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of TransferTo Another Circuit Request', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

