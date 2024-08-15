CREATE TABLE [INTG].[ExectionRequestTempData] (
    [Id]                  INT            IDENTITY (1, 1) NOT NULL,
    [RequestData]         NVARCHAR (MAX) NULL,
    [RetryCount]          INT            NOT NULL,
    [CreatedAt]           DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [CreatedById]         INT            NOT NULL,
    [UpdatedAt]           DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [UpdatedBy]           INT            NULL,
    [SubmissionNo]        BIGINT         NULL,
    [AgencyId]            INT            NULL,
    [TempRequestStatusId] SMALLINT       NULL,
    [SourceId]            SMALLINT       NULL,
    CONSTRAINT [PK_ExectionRequestTempData] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExectionRequestTempData_Agencies_AgencyId] FOREIGN KEY ([AgencyId]) REFERENCES [GOV].[Agencies] ([Id]),
    CONSTRAINT [FK_ExectionRequestTempData_ExRequestTempStatus_TempRequestStatusId] FOREIGN KEY ([TempRequestStatusId]) REFERENCES [IntgLK].[ExRequestTempStatus] ([Code]),
    CONSTRAINT [FK_ExectionRequestTempData_Sources_SourceId] FOREIGN KEY ([SourceId]) REFERENCES [ExrLK].[Sources] ([Code]),
    CONSTRAINT [FK_ExectionRequestTempData_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_ExectionRequestTempData_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ExectionRequestTempData_SourceId]
    ON [INTG].[ExectionRequestTempData]([SourceId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExectionRequestTempData_TempRequestStatusId]
    ON [INTG].[ExectionRequestTempData]([TempRequestStatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExectionRequestTempData_AgencyId]
    ON [INTG].[ExectionRequestTempData]([AgencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExectionRequestTempData_UpdatedBy]
    ON [INTG].[ExectionRequestTempData]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ExectionRequestTempData_CreatedById]
    ON [INTG].[ExectionRequestTempData]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Exection Request Temp Data', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'ExectionRequestTempData', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Exection Request Temp Data', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'ExectionRequestTempData', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Exection Request Temp Data', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'ExectionRequestTempData', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Exection Request Temp Data', @level0type = N'SCHEMA', @level0name = N'INTG', @level1type = N'TABLE', @level1name = N'ExectionRequestTempData', @level2type = N'COLUMN', @level2name = N'CreatedAt';

