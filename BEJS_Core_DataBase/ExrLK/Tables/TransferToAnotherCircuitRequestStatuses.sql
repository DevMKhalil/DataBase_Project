CREATE TABLE [ExrLK].[TransferToAnotherCircuitRequestStatuses] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_TransferToAnotherCircuitRequestStatuses] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ExrLK].[TransferToAnotherCircuitRequestStatusesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequestStatuses_NameAr]
    ON [ExrLK].[TransferToAnotherCircuitRequestStatuses]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TransferToAnotherCircuitRequestStatuses_Name]
    ON [ExrLK].[TransferToAnotherCircuitRequestStatuses]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of TransferTo Another Circuit Request Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitRequestStatuses', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of TransferTo Another Circuit Request Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitRequestStatuses', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of TransferTo Another Circuit Request Status', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'TransferToAnotherCircuitRequestStatuses', @level2type = N'COLUMN', @level2name = N'Code';

