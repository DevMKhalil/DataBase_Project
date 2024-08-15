CREATE TABLE [JactSuspOrder].[Defendants] (
    [Id]                        INT             IDENTITY (1, 1) NOT NULL,
    [JudicialActionDefendantId] INT             NOT NULL,
    [OrderText]                 NVARCHAR (2000) NOT NULL,
    [StartDate]                 DATE            NOT NULL,
    [StartDateHijri]            DECIMAL (8)     NULL,
    [ExpiryDate]                DATE            NOT NULL,
    [ExpiryDateHijri]           DECIMAL (8)     NULL,
    [StatusCode]                SMALLINT        NOT NULL,
    [NicOrderNumber]            FLOAT (53)      NULL,
    [NicOrderRegisterDate]      DATETIME2 (7)   NULL,
    [NicDetailsId]              INT             NULL,
    [ReferenceNumber]           BIGINT          NOT NULL,
    [DefendantIdentifierNumber] BIGINT          NOT NULL,
    [CreatedAt]                 DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]               INT             NOT NULL,
    [UpdatedAt]                 DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                 INT             NULL,
    CONSTRAINT [PK_Defendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Defendants_Defendants_JudicialActionDefendantId] FOREIGN KEY ([JudicialActionDefendantId]) REFERENCES [JACT].[Defendants] ([Id]),
    CONSTRAINT [FK_Defendants_NicDetails_NicDetailsId] FOREIGN KEY ([NicDetailsId]) REFERENCES [JactSuspOrder].[NicDetails] ([Id]),
    CONSTRAINT [FK_Defendants_Statues_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [JactSuspOrder].[Statues] ([Code]),
    CONSTRAINT [FK_Defendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Defendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_UpdatedBy]
    ON [JactSuspOrder].[Defendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_StatusCode]
    ON [JactSuspOrder].[Defendants]([StatusCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Defendants_NicDetailsId]
    ON [JactSuspOrder].[Defendants]([NicDetailsId] ASC) WHERE ([NicDetailsId] IS NOT NULL);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Defendants_JudicialActionDefendantId]
    ON [JactSuspOrder].[Defendants]([JudicialActionDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Defendants_CreatedById]
    ON [JactSuspOrder].[Defendants]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judical Suspension Order Defendant', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'Defendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judical Suspension Order Defendant', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'Defendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judical Suspension Order Defendant', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'Defendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judical Suspension Order Defendant', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'Defendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

