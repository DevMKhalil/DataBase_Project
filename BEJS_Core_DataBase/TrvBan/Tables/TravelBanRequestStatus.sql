CREATE TABLE [TrvBan].[TravelBanRequestStatus] (
    [Code]      INT                                                NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_TravelBanRequestStatus] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[TrvBan].[TravelBanRequestStatusHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TravelBanRequestStatus_NameAr]
    ON [TrvBan].[TravelBanRequestStatus]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_TravelBanRequestStatus_Name]
    ON [TrvBan].[TravelBanRequestStatus]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Travel Ban Request Status', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequestStatus', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Travel Ban Request Status', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequestStatus', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Travel Ban Request Status', @level0type = N'SCHEMA', @level0name = N'TrvBan', @level1type = N'TABLE', @level1name = N'TravelBanRequestStatus', @level2type = N'COLUMN', @level2name = N'Code';

