CREATE TABLE [EXR].[SamaOperationDetails] (
    [Id]                        INT                                                IDENTITY (1, 1) NOT NULL,
    [EnforcementId]             INT                                                NULL,
    [SamaValidationOperationId] BIGINT                                             NOT NULL,
    [StatusId]                  SMALLINT                                           NOT NULL,
    [ValidTo]                   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                 DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]                 DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]               INT                                                NOT NULL,
    [UpdatedAt]                 DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]                 INT                                                NULL,
    [RequestTempId]             INT                                                NULL,
    CONSTRAINT [PK_SamaOperationDetails] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SamaOperationDetails_Enforcements_EnforcementId] FOREIGN KEY ([EnforcementId]) REFERENCES [EXR].[Enforcements] ([Id]),
    CONSTRAINT [FK_SamaOperationDetails_ExectionRequestTempData_RequestTempId] FOREIGN KEY ([RequestTempId]) REFERENCES [INTG].[ExectionRequestTempData] ([Id]),
    CONSTRAINT [FK_SamaOperationDetails_RequestStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [SAMA].[RequestStatus] ([Code]),
    CONSTRAINT [FK_SamaOperationDetails_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_SamaOperationDetails_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[EXR].[SamaOperationDetailsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_SamaOperationDetails_RequestTempId]
    ON [EXR].[SamaOperationDetails]([RequestTempId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SamaOperationDetails_UpdatedBy]
    ON [EXR].[SamaOperationDetails]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SamaOperationDetails_StatusId]
    ON [EXR].[SamaOperationDetails]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SamaOperationDetails_EnforcementId]
    ON [EXR].[SamaOperationDetails]([EnforcementId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SamaOperationDetails_CreatedById]
    ON [EXR].[SamaOperationDetails]([CreatedById] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Sama Operation Details', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SamaOperationDetails', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Sama Operation Details', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SamaOperationDetails', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Sama Operation Details', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SamaOperationDetails', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Sama Operation Details', @level0type = N'SCHEMA', @level0name = N'EXR', @level1type = N'TABLE', @level1name = N'SamaOperationDetails', @level2type = N'COLUMN', @level2name = N'CreatedAt';

