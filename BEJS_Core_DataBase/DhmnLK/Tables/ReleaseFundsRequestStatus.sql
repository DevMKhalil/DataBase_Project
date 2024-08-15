CREATE TABLE [DhmnLK].[ReleaseFundsRequestStatus] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ReleaseFundsRequestStatus] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[DhmnLK].[ReleaseFundsRequestStatusHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReleaseFundsRequestStatus_NameAr]
    ON [DhmnLK].[ReleaseFundsRequestStatus]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReleaseFundsRequestStatus_Name]
    ON [DhmnLK].[ReleaseFundsRequestStatus]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Release FundsRequest Status', @level0type = N'SCHEMA', @level0name = N'DhmnLK', @level1type = N'TABLE', @level1name = N'ReleaseFundsRequestStatus', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Release FundsRequest Status', @level0type = N'SCHEMA', @level0name = N'DhmnLK', @level1type = N'TABLE', @level1name = N'ReleaseFundsRequestStatus', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Release FundsRequest Status', @level0type = N'SCHEMA', @level0name = N'DhmnLK', @level1type = N'TABLE', @level1name = N'ReleaseFundsRequestStatus', @level2type = N'COLUMN', @level2name = N'Code';

