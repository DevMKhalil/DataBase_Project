﻿CREATE TABLE [Court].[CourtMemberStatuses] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_CourtMemberStatuses] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Court].[CourtMemberStatusesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CourtMemberStatuses_NameAr]
    ON [Court].[CourtMemberStatuses]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CourtMemberStatuses_Name]
    ON [Court].[CourtMemberStatuses]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Court Member Status', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMemberStatuses', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Court Member Status', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMemberStatuses', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Court Member Status', @level0type = N'SCHEMA', @level0name = N'Court', @level1type = N'TABLE', @level1name = N'CourtMemberStatuses', @level2type = N'COLUMN', @level2name = N'Code';

