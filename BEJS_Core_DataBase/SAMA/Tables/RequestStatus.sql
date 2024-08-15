CREATE TABLE [SAMA].[RequestStatus] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_RequestStatus] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SAMA].[RequestStatusHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RequestStatus_NameAr]
    ON [SAMA].[RequestStatus]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RequestStatus_Name]
    ON [SAMA].[RequestStatus]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of S A M A RequestStatus', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'RequestStatus', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of S A M A RequestStatus', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'RequestStatus', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of S A M A RequestStatus', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'RequestStatus', @level2type = N'COLUMN', @level2name = N'Code';

