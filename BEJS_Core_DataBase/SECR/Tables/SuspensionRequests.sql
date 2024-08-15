CREATE TABLE [SECR].[SuspensionRequests] (
    [Id]                        INT                                                IDENTITY (1, 1) NOT NULL,
    [SecondaryRequestId]        INT                                                NOT NULL,
    [Reasons]                   NVARCHAR (MAX)                                     NOT NULL,
    [ProceduresStatement]       NVARCHAR (MAX)                                     NOT NULL,
    [TimeLimitRequired]         NVARCHAR (MAX)                                     NULL,
    [StartDate]                 DATE                                               NULL,
    [StartDateHijri]            DECIMAL (8)                                        NULL,
    [ValidTo]                   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                 DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [EndDate]                   DATE                                               NULL,
    [EndDateHijri]              DECIMAL (8)                                        NULL,
    [IsPlaintiff]               BIT                                                NOT NULL,
    [JudicialActionDefendantId] INT                                                NULL,
    [SuspensionParentId]        INT                                                NULL,
    [CreatedAt]                 DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]               INT                                                NOT NULL,
    [UpdatedAt]                 DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]                 INT                                                NULL,
    [SuspensionRequestId]       INT                                                NULL,
    CONSTRAINT [PK_SuspensionRequests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SuspensionRequests_Defendants_JudicialActionDefendantId] FOREIGN KEY ([JudicialActionDefendantId]) REFERENCES [JACT].[Defendants] ([Id]),
    CONSTRAINT [FK_SuspensionRequests_SecondaryRequests_SecondaryRequestId] FOREIGN KEY ([SecondaryRequestId]) REFERENCES [SECR].[SecondaryRequests] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_SuspensionRequests_SuspensionRequests_SuspensionParentId] FOREIGN KEY ([SuspensionParentId]) REFERENCES [SECR].[SuspensionRequests] ([Id]),
    CONSTRAINT [FK_SuspensionRequests_SuspensionRequests_SuspensionRequestId] FOREIGN KEY ([SuspensionRequestId]) REFERENCES [SECR].[SuspensionRequests] ([Id]),
    CONSTRAINT [FK_SuspensionRequests_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SuspensionRequests_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SECR].[SuspensionRequestsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_SuspensionRequests_SuspensionRequestId]
    ON [SECR].[SuspensionRequests]([SuspensionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SuspensionRequests_UpdatedBy]
    ON [SECR].[SuspensionRequests]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SuspensionRequests_SuspensionParentId]
    ON [SECR].[SuspensionRequests]([SuspensionParentId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SuspensionRequests_SecondaryRequestId]
    ON [SECR].[SuspensionRequests]([SecondaryRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SuspensionRequests_JudicialActionDefendantId]
    ON [SECR].[SuspensionRequests]([JudicialActionDefendantId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SuspensionRequests_CreatedById]
    ON [SECR].[SuspensionRequests]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Suspension Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SuspensionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Suspension Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SuspensionRequests', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Suspension Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SuspensionRequests', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Suspension Request', @level0type = N'SCHEMA', @level0name = N'SECR', @level1type = N'TABLE', @level1name = N'SuspensionRequests', @level2type = N'COLUMN', @level2name = N'CreatedAt';

