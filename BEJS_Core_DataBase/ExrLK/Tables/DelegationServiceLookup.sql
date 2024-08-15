CREATE TABLE [ExrLK].[DelegationServiceLookup] (
    [Code]      INT                                                NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [ServiceId] UNIQUEIDENTIFIER                                   NOT NULL,
    [IsActive]  BIT                                                NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_DelegationServiceLookup] PRIMARY KEY CLUSTERED ([Code] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ExrLK].[DelegationServiceLookupHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DelegationServiceLookup_NameAr]
    ON [ExrLK].[DelegationServiceLookup]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DelegationServiceLookup_Name]
    ON [ExrLK].[DelegationServiceLookup]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Delegation Service Lookup', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'DelegationServiceLookup', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Delegation Service Lookup', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'DelegationServiceLookup', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Delegation Service Lookup', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'DelegationServiceLookup', @level2type = N'COLUMN', @level2name = N'Code';

