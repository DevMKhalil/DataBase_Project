CREATE TABLE [GOV].[AgencyAccountManagers] (
    [Id]                   INT                                                IDENTITY (1, 1) NOT NULL,
    [UserAccountId]        INT                                                NOT NULL,
    [RepresentationDeedId] BIGINT                                             NOT NULL,
    [GovAgencyId]          INT                                                NOT NULL,
    [TypeCode]             SMALLINT                                           NOT NULL,
    [StatusCode]           SMALLINT                                           NOT NULL,
    [FirstName]            NVARCHAR (200)                                     NOT NULL,
    [FatherName]           NVARCHAR (200)                                     NULL,
    [GrandFatherName]      NVARCHAR (200)                                     NULL,
    [FamilyName]           NVARCHAR (200)                                     NOT NULL,
    [Email]                NVARCHAR (100)                                     NOT NULL,
    [MobileNumber]         NVARCHAR (25)                                      NULL,
    [PhoneNumber]          NVARCHAR (25)                                      NULL,
    [DelegationStart]      DATE                                               NULL,
    [DelegationStartHijri] DECIMAL (8)                                        NULL,
    [ValidTo]              DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]            DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [DelegationEnd]        DATE                                               NULL,
    [DelegationEndHijri]   DECIMAL (8)                                        NULL,
    [BirthDate]            DATE                                               NULL,
    [BirthDateHijri]       DECIMAL (8)                                        NULL,
    [CreatedAt]            DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]          INT                                                NOT NULL,
    [UpdatedAt]            DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]            INT                                                NULL,
    CONSTRAINT [PK_AgencyAccountManagers] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_AgencyAccountManagers_Mobile_OR_Phone_Number] CHECK ([MobileNumber] IS NOT NULL OR [PhoneNumber] IS NOT NULL),
    CONSTRAINT [FK_AgencyAccountManagers_Agencies_GovAgencyId] FOREIGN KEY ([GovAgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_AgencyAccountManagers_AgencyAccountManagerStatuses_StatusCode] FOREIGN KEY ([StatusCode]) REFERENCES [GOV].[AgencyAccountManagerStatuses] ([Code]),
    CONSTRAINT [FK_AgencyAccountManagers_AgencyAccountManagerTypes_TypeCode] FOREIGN KEY ([TypeCode]) REFERENCES [GOV].[AgencyAccountManagerTypes] ([Code]),
    CONSTRAINT [FK_AgencyAccountManagers_Attachments_RepresentationDeedId] FOREIGN KEY ([RepresentationDeedId]) REFERENCES [ATTACH].[Attachments] ([Id]),
    CONSTRAINT [FK_AgencyAccountManagers_UserAccounts_UserAccountId] FOREIGN KEY ([UserAccountId]) REFERENCES [AUTH].[UserAccounts] ([Id]),
    CONSTRAINT [FK_AgencyAccountManagers_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_AgencyAccountManagers_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[GOV].[AgencyAccountManagersHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_AgencyAccountManagers_UserAccountId]
    ON [GOV].[AgencyAccountManagers]([UserAccountId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyAccountManagers_UpdatedBy]
    ON [GOV].[AgencyAccountManagers]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyAccountManagers_TypeCode]
    ON [GOV].[AgencyAccountManagers]([TypeCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyAccountManagers_StatusCode]
    ON [GOV].[AgencyAccountManagers]([StatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyAccountManagers_RepresentationDeedId]
    ON [GOV].[AgencyAccountManagers]([RepresentationDeedId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyAccountManagers_GovAgencyId]
    ON [GOV].[AgencyAccountManagers]([GovAgencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AgencyAccountManagers_CreatedById]
    ON [GOV].[AgencyAccountManagers]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Gov Agency Account Manager', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyAccountManagers', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Gov Agency Account Manager', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyAccountManagers', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Gov Agency Account Manager', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyAccountManagers', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Gov Agency Account Manager', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'AgencyAccountManagers', @level2type = N'COLUMN', @level2name = N'CreatedAt';

