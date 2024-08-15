CREATE TABLE [ObjR].[ObjectionRequestStatuses] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ObjectionRequestStatuses] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ObjR].[ObjectionRequestStatusesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ObjectionRequestStatuses_NameAr]
    ON [ObjR].[ObjectionRequestStatuses]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ObjectionRequestStatuses_Name]
    ON [ObjR].[ObjectionRequestStatuses]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Objection Request Status', @level0type = N'SCHEMA', @level0name = N'ObjR', @level1type = N'TABLE', @level1name = N'ObjectionRequestStatuses', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Objection Request Status', @level0type = N'SCHEMA', @level0name = N'ObjR', @level1type = N'TABLE', @level1name = N'ObjectionRequestStatuses', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Objection Request Status', @level0type = N'SCHEMA', @level0name = N'ObjR', @level1type = N'TABLE', @level1name = N'ObjectionRequestStatuses', @level2type = N'COLUMN', @level2name = N'Code';

