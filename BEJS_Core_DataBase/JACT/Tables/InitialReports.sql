CREATE TABLE [JACT].[InitialReports] (
    [Id]                       INT             IDENTITY (1, 1) NOT NULL,
    [ExecutionRequestId]       INT             NOT NULL,
    [IsAccepted]               BIT             NOT NULL,
    [RejectionReasonId]        SMALLINT        NULL,
    [RejectionReasonDetails]   NVARCHAR (2000) NULL,
    [Notes]                    NVARCHAR (2000) NULL,
    [CreatedAt]                DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [CreatedById]              INT             NOT NULL,
    [LackOfJurisdictionReason] NVARCHAR (MAX)  NULL,
    [LackOfJurisdictionTypeId] SMALLINT        NULL,
    [UpdatedAt]                DATETIME2 (7)   DEFAULT (getdate()) NULL,
    [UpdatedBy]                INT             NULL,
    CONSTRAINT [PK_InitialReports] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_InitialReports_ExecutionRequests_ExecutionRequestId] FOREIGN KEY ([ExecutionRequestId]) REFERENCES [EXR].[ExecutionRequests] ([Id]),
    CONSTRAINT [FK_InitialReports_LackOfJurisdictionTypes_LackOfJurisdictionTypeId] FOREIGN KEY ([LackOfJurisdictionTypeId]) REFERENCES [JACT].[LackOfJurisdictionTypes] ([Code]),
    CONSTRAINT [FK_InitialReports_RejectionReasons_RejectionReasonId] FOREIGN KEY ([RejectionReasonId]) REFERENCES [JACT].[RejectionReasons] ([Code]),
    CONSTRAINT [FK_InitialReports_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_InitialReports_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_InitialReports_UpdatedBy]
    ON [JACT].[InitialReports]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_InitialReports_LackOfJurisdictionTypeId]
    ON [JACT].[InitialReports]([LackOfJurisdictionTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_InitialReports_RejectionReasonId]
    ON [JACT].[InitialReports]([RejectionReasonId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_InitialReports_ExecutionRequestId]
    ON [JACT].[InitialReports]([ExecutionRequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_InitialReports_CreatedById]
    ON [JACT].[InitialReports]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Initial Report', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'InitialReports', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Initial Report', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'InitialReports', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Initial Report', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'InitialReports', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Initial Report', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'InitialReports', @level2type = N'COLUMN', @level2name = N'CreatedAt';

