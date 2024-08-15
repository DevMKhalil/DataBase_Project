CREATE TABLE [Court].[CourtMembers] (
    [Id]                       INT                                                IDENTITY (1, 1) NOT NULL,
    [UserAccountId]            INT                                                NOT NULL,
    [StatusCode]               SMALLINT                                           NOT NULL,
    [DelegationStartDate]      DATE                                               NULL,
    [DelegationStartDateHijri] DECIMAL (8)                                        NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [DelegationEndDate]        DATE                                               NULL,
    [DelegationEndDateHijri]   DECIMAL (8)                                        NULL,
    [CreatedAt]                DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]              INT                                                NOT NULL,
    [UpdatedAt]                DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]                INT                                                NULL,
    [PermissionCode]           SMALLINT                                           DEFAULT (CONVERT([smallint],(0))) NOT NULL,
    CONSTRAINT [PK_CourtMembers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CourtMembers_CourtMemberPermissions_PermissionCode] FOREIGN KEY ([PermissionCode]) REFERENCES [Court].[CourtMemberPermissions] ([Code]),
    CONSTRAINT [FK_CourtMembers_CourtMemberStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [Court].[CourtMemberStatuses] ([Code]),
    CONSTRAINT [FK_CourtMembers_UserAccounts_UserAccountId] FOREIGN KEY ([UserAccountId]) REFERENCES [AUTH].[UserAccounts] ([Id]),
    CONSTRAINT [FK_CourtMembers_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_CourtMembers_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Court].[CourtMembersHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_CourtMembers_PermissionCode]
    ON [Court].[CourtMembers]([PermissionCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CourtMembers_UserAccountId]
    ON [Court].[CourtMembers]([UserAccountId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CourtMembers_UpdatedBy]
    ON [Court].[CourtMembers]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CourtMembers_StatusCode]
    ON [Court].[CourtMembers]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CourtMembers_CreatedById]
    ON [Court].[CourtMembers]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Court Member', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMembers', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Court Member', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMembers', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Court Member', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMembers', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Court Member', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMembers', @level2type = N'COLUMN', @level2name = N'CreatedAt';

