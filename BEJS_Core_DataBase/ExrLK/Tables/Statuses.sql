CREATE TABLE [ExrLK].[Statuses] (
    [Code]                      SMALLINT                                           NOT NULL,
    [Name]                      NVARCHAR (200)                                     NOT NULL,
    [NameAr]                    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]                   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                 DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [IntegrationStatusCode]     SMALLINT                                           DEFAULT (CONVERT([smallint],(0))) NOT NULL,
    [IntegrationEfaaStatusCode] SMALLINT                                           NULL,
    CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_Statuses_ExecutionRequestIntegrationEfaaStatus_IntegrationEfaaStatusCode] FOREIGN KEY ([IntegrationEfaaStatusCode]) REFERENCES [ExrLK].[ExecutionRequestIntegrationEfaaStatus] ([Code]),
    CONSTRAINT [FK_Statuses_IntegrationStatuses_IntegrationStatusCode] FOREIGN KEY ([IntegrationStatusCode]) REFERENCES [ExrLK].[IntegrationStatuses] ([Code]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ExrLK].[StatusesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Statuses_IntegrationEfaaStatusCode]
    ON [ExrLK].[Statuses]([IntegrationEfaaStatusCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Statuses_IntegrationStatusCode]
    ON [ExrLK].[Statuses]([IntegrationStatusCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Statuses_NameAr]
    ON [ExrLK].[Statuses]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Statuses_Name]
    ON [ExrLK].[Statuses]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Execution Request Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'Statuses', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Execution Request Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'Statuses', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Execution Request Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'Statuses', @level2type = N'COLUMN', @level2name = N'Code';

