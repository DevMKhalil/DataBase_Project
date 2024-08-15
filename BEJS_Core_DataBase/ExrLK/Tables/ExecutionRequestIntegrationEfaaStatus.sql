CREATE TABLE [ExrLK].[ExecutionRequestIntegrationEfaaStatus] (
    [Code]          SMALLINT                                           NOT NULL,
    [Name]          NVARCHAR (200)                                     NOT NULL,
    [NameAr]        NVARCHAR (200)                                     NOT NULL,
    [EnablePayment] BIT                                                NOT NULL,
    [ValidTo]       DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]     DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ExecutionRequestIntegrationEfaaStatus] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ExrLK].[ExecutionRequestIntegrationEfaaStatusHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ExecutionRequestIntegrationEfaaStatus_NameAr]
    ON [ExrLK].[ExecutionRequestIntegrationEfaaStatus]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ExecutionRequestIntegrationEfaaStatus_Name]
    ON [ExrLK].[ExecutionRequestIntegrationEfaaStatus]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Execution Request IntegrationEfaa Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ExecutionRequestIntegrationEfaaStatus', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Execution Request IntegrationEfaa Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ExecutionRequestIntegrationEfaaStatus', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Execution Request IntegrationEfaa Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ExecutionRequestIntegrationEfaaStatus', @level2type = N'COLUMN', @level2name = N'Code';

