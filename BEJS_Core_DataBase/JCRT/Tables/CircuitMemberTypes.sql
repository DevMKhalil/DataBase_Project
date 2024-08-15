CREATE TABLE [JCRT].[CircuitMemberTypes] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_CircuitMemberTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JCRT].[CircuitMemberTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CircuitMemberTypes_NameAr]
    ON [JCRT].[CircuitMemberTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CircuitMemberTypes_Name]
    ON [JCRT].[CircuitMemberTypes]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Judicial Circuit Member Type', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMemberTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Judicial Circuit Member Type', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMemberTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Judicial Circuit Member Type', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'CircuitMemberTypes', @level2type = N'COLUMN', @level2name = N'Code';

