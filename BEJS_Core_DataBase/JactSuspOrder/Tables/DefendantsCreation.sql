CREATE TABLE [JactSuspOrder].[DefendantsCreation] (
    [Id]                              INT           IDENTITY (1, 1) NOT NULL,
    [SuspensionCaseId]                INT           NOT NULL,
    [SuspensionLevelId]               INT           NOT NULL,
    [IsExtensionAllowedOnGrace]       BIT           NULL,
    [IsExtensionAllowedOnFirstLevel]  BIT           NULL,
    [IsExtensionAllowedOnSecondLevel] BIT           NULL,
    [CreatedAt]                       DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById]                     INT           NOT NULL,
    CONSTRAINT [PK_DefendantsCreation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DefendantsCreation_Cases_SuspensionCaseId] FOREIGN KEY ([SuspensionCaseId]) REFERENCES [NicSuspOrder].[Cases] ([Id]),
    CONSTRAINT [FK_DefendantsCreation_Levels_SuspensionLevelId] FOREIGN KEY ([SuspensionLevelId]) REFERENCES [NicSuspOrder].[Levels] ([Id]),
    CONSTRAINT [FK_DefendantsCreation_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsCreation_SuspensionLevelId]
    ON [JactSuspOrder].[DefendantsCreation]([SuspensionLevelId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsCreation_SuspensionCaseId]
    ON [JactSuspOrder].[DefendantsCreation]([SuspensionCaseId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_DefendantsCreation_CreatedById]
    ON [JactSuspOrder].[DefendantsCreation]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Suspension Order Defendant Creation', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'DefendantsCreation', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Suspension Order Defendant Creation', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'DefendantsCreation', @level2type = N'COLUMN', @level2name = N'CreatedAt';

