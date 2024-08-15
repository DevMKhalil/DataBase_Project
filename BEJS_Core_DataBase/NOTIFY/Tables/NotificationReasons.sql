CREATE TABLE [NOTIFY].[NotificationReasons] (
    [Code]      INT                                                NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_NotificationReasons] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[NOTIFY].[NotificationReasonsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NotificationReasons_NameAr]
    ON [NOTIFY].[NotificationReasons]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_NotificationReasons_Name]
    ON [NOTIFY].[NotificationReasons]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Notification Reason', @level0type = N'SCHEMA', @level0name = N'NOTIFY', @level1type = N'TABLE', @level1name = N'NotificationReasons', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Notification Reason', @level0type = N'SCHEMA', @level0name = N'NOTIFY', @level1type = N'TABLE', @level1name = N'NotificationReasons', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Notification Reason', @level0type = N'SCHEMA', @level0name = N'NOTIFY', @level1type = N'TABLE', @level1name = N'NotificationReasons', @level2type = N'COLUMN', @level2name = N'Code';

