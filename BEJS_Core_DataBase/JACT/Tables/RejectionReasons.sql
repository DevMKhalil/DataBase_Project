CREATE TABLE [JACT].[RejectionReasons] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_RejectionReasons] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JACT].[RejectionReasonsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RejectionReasons_NameAr]
    ON [JACT].[RejectionReasons]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RejectionReasons_Name]
    ON [JACT].[RejectionReasons]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Execution Request Rejection Reason', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RejectionReasons', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Execution Request Rejection Reason', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RejectionReasons', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Execution Request Rejection Reason', @level0type = N'SCHEMA', @level0name = N'JACT', @level1type = N'TABLE', @level1name = N'RejectionReasons', @level2type = N'COLUMN', @level2name = N'Code';

