CREATE TABLE [EXR].[GovAgencyDefendants] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [RequestId]   INT           NOT NULL,
    [AgencyId]    INT           NOT NULL,
    [CreatedAt]   DATETIME2 (7) DEFAULT (getdate()) NOT NULL,
    [CreatedById] INT           NOT NULL,
    [UpdatedAt]   DATETIME2 (7) DEFAULT (getdate()) NULL,
    [UpdatedBy]   INT           NULL,
    CONSTRAINT [PK_GovAgencyDefendants] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_GovAgencyDefendants_Agencies_AgencyId] FOREIGN KEY ([AgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_GovAgencyDefendants_ExecutionRequests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_GovAgencyDefendants_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_GovAgencyDefendants_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [AK_GovAgencyDefendants_RequestId_AgencyId] UNIQUE NONCLUSTERED ([RequestId] ASC, [AgencyId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_UpdatedBy]
    ON [EXR].[GovAgencyDefendants]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_CreatedById]
    ON [EXR].[GovAgencyDefendants]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_GovAgencyDefendants_AgencyId]
    ON [EXR].[GovAgencyDefendants]([AgencyId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Gov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Gov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Gov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Gov Agency Defendant', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'GovAgencyDefendants', @level2type = N'COLUMN', @level2name = N'CreatedAt';

