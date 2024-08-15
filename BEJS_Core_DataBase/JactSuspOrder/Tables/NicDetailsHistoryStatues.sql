CREATE TABLE [JactSuspOrder].[NicDetailsHistoryStatues] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_NicDetailsHistoryStatues] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JactSuspOrder].[NicDetailsHistoryStatuesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NicDetailsHistoryStatues_NameAr]
    ON [JactSuspOrder].[NicDetailsHistoryStatues]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NicDetailsHistoryStatues_Name]
    ON [JactSuspOrder].[NicDetailsHistoryStatues]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Suspension Order Defendant Nic Details HistoryStatus', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetailsHistoryStatues', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Suspension Order Defendant Nic Details HistoryStatus', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetailsHistoryStatues', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Suspension Order Defendant Nic Details HistoryStatus', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'NicDetailsHistoryStatues', @level2type = N'COLUMN', @level2name = N'Code';

