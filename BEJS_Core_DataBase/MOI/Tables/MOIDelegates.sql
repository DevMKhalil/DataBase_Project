CREATE TABLE [MOI].[MOIDelegates] (
    [Id]                       INT                                                IDENTITY (1, 1) NOT NULL,
    [UserAccountId]            INT                                                NOT NULL,
    [StatusCode]               SMALLINT                                           NOT NULL,
    [DeactivateStartDate]      DATE                                               NULL,
    [DeactivateStartDateHijri] DECIMAL (8)                                        NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [DeactivateEndDate]        DATE                                               NULL,
    [DeactivateEndDateHijri]   DECIMAL (8)                                        NULL,
    [CreatedAt]                DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]              INT                                                NOT NULL,
    [UpdatedAt]                DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]                INT                                                NULL,
    CONSTRAINT [PK_MOIDelegates] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_MOIDelegates_MOIDelegateStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [MOI].[MOIDelegateStatuses] ([Code]),
    CONSTRAINT [FK_MOIDelegates_UserAccounts_UserAccountId] FOREIGN KEY ([UserAccountId]) REFERENCES [AUTH].[UserAccounts] ([Id]),
    CONSTRAINT [FK_MOIDelegates_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_MOIDelegates_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[MOI].[MOIDelegatesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MOIDelegates_UserAccountId]
    ON [MOI].[MOIDelegates]([UserAccountId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MOIDelegates_UpdatedBy]
    ON [MOI].[MOIDelegates]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MOIDelegates_StatusCode]
    ON [MOI].[MOIDelegates]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MOIDelegates_CreatedById]
    ON [MOI].[MOIDelegates]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update M O I Delegate', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegates', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of M O I Delegate', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegates', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create M O I Delegate', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegates', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of M O I Delegate', @level0type = N'SCHEMA', @level0name = N'MOI', @level1type = N'TABLE', @level1name = N'MOIDelegates', @level2type = N'COLUMN', @level2name = N'CreatedAt';

