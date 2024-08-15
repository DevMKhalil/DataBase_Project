CREATE TABLE [JactSuspOrder].[ActionTypes] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_ActionTypes] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JactSuspOrder].[ActionTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ActionTypes_NameAr]
    ON [JactSuspOrder].[ActionTypes]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ActionTypes_Name]
    ON [JactSuspOrder].[ActionTypes]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Judicial Suspension Order Defendant Action Type', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'ActionTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Judicial Suspension Order Defendant Action Type', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'ActionTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Judicial Suspension Order Defendant Action Type', @level0type = N'SCHEMA', @level0name = N'JactSuspOrder', @level1type = N'TABLE', @level1name = N'ActionTypes', @level2type = N'COLUMN', @level2name = N'Code';

