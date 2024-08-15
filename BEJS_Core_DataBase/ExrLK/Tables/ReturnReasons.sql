CREATE TABLE [ExrLK].[ReturnReasons] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (400)                                     NOT NULL,
    [NameAr]    NVARCHAR (400)                                     NOT NULL,
    [GroupId]   SMALLINT                                           NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ReturnReasons] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_ReturnReasons_ReturnReasonGroups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [ExrLK].[ReturnReasonGroups] ([Code]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ExrLK].[ReturnReasonsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReturnReasons_NameAr]
    ON [ExrLK].[ReturnReasons]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ReturnReasons_Name]
    ON [ExrLK].[ReturnReasons]([Name] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ReturnReasons_GroupId]
    ON [ExrLK].[ReturnReasons]([GroupId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of ReturnReason', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ReturnReasons', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of ReturnReason', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ReturnReasons', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of ReturnReason', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'ReturnReasons', @level2type = N'COLUMN', @level2name = N'Code';

