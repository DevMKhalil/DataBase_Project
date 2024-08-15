CREATE TABLE [JactSuspOrder].[DefendantsActions] (
    [Id]                                 INT             IDENTITY (1, 1) NOT NULL,
    [JudicalSuspensionOrderDefendantId]  INT             NOT NULL,
    [NicSuspensionOrderOperationId]      BIGINT          NULL,
    [TypeCode]                           SMALLINT        NOT NULL,
    [StatusCode]                         SMALLINT        NULL,
    [OrderText]                          NVARCHAR (2000) NULL,
    [ExpiryDate]                         DATE            NULL,
    [ExpiryDateHijri]                    DECIMAL (8)     NULL,
    [SuspensionOrderDefendantCreationId] INT             NULL,
    [ResolveReferenceNumber]             BIGINT          NULL,
    [CreatedAt]                          DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]                        INT             NOT NULL,
    [UpdatedAt]                          DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                          INT             NULL,
    [Notes]                              NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_DefendantsActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DefendantsActions_ActionStatues_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [JactSuspOrder].[ActionStatues] ([Code]),
    CONSTRAINT [FK_DefendantsActions_ActionTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [JactSuspOrder].[ActionTypes] ([Code]),
    CONSTRAINT [FK_DefendantsActions_Defendants_JudicalSuspensionOrderDefendantId] FOREIGN KEY ([JudicalSuspensionOrderDefendantId]) REFERENCES [JactSuspOrder].[Defendants] ([Id]),
    CONSTRAINT [FK_DefendantsActions_DefendantsCreation_SuspensionOrderDefendantCreationId] FOREIGN KEY ([SuspensionOrderDefendantCreationId]) REFERENCES [JactSuspOrder].[DefendantsCreation] ([Id]),
    CONSTRAINT [FK_DefendantsActions_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_DefendantsActions_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsActions_UpdatedBy]
    ON [JactSuspOrder].[DefendantsActions]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsActions_TypeCode]
    ON [JactSuspOrder].[DefendantsActions]([TypeCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DefendantsActions_SuspensionOrderDefendantCreationId]
    ON [JactSuspOrder].[DefendantsActions]([SuspensionOrderDefendantCreationId] ASC) WHERE ([SuspensionOrderDefendantCreationId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsActions_StatusCode]
    ON [JactSuspOrder].[DefendantsActions]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsActions_JudicalSuspensionOrderDefendantId]
    ON [JactSuspOrder].[DefendantsActions]([JudicalSuspensionOrderDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsActions_CreatedById]
    ON [JactSuspOrder].[DefendantsActions]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judical Suspension Order Defendant Action', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'DefendantsActions', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judical Suspension Order Defendant Action', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'DefendantsActions', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judical Suspension Order Defendant Action', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'DefendantsActions', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judical Suspension Order Defendant Action', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'DefendantsActions', @level2type = N'COLUMN', @level2name = N'CreatedAt';

