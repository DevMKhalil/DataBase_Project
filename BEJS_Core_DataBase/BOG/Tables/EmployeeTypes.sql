CREATE TABLE [BOG].[EmployeeTypes] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (50)                                      NOT NULL,
    [NameAr]    NVARCHAR (50)                                      NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_EmployeeTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[BOG].[EmployeeTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_EmployeeTypes_NameAr]
    ON [BOG].[EmployeeTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_EmployeeTypes_Name]
    ON [BOG].[EmployeeTypes]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Bog User Type', @level0type = N'SCHEMA', @level0name = N'BOG', @level1type = N'TABLE', @level1name = N'EmployeeTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Bog User Type', @level0type = N'SCHEMA', @level0name = N'BOG', @level1type = N'TABLE', @level1name = N'EmployeeTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Bog User Type', @level0type = N'SCHEMA', @level0name = N'BOG', @level1type = N'TABLE', @level1name = N'EmployeeTypes', @level2type = N'COLUMN', @level2name = N'Code';

