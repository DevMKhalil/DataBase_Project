CREATE TABLE [GOV].[Agencies] (
    [Id]             INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (200)                                     NULL,
    [NameAr]         NVARCHAR (200)                                     NOT NULL,
    [FullName]       NVARCHAR (200)                                     NOT NULL,
    [AgencyId]       INT                                                NOT NULL,
    [Mobile]         NVARCHAR (MAX)                                     NULL,
    [Email]          NVARCHAR (MAX)                                     NULL,
    [ParentAgencyId] INT                                                NULL,
    [OriginalData]   NVARCHAR (MAX)                                     NOT NULL,
    [IsActive]       BIT                                                NOT NULL,
    [CreatedAt]      DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt]      DATETIME2 (7)                                      NULL,
    [ValidTo]        DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]      DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Agencies_Agencies_ParentAgencyId] FOREIGN KEY ([ParentAgencyId]) REFERENCES [GOV].[Agencies] ([AgencyId]),
    CONSTRAINT [AK_Agencies_AgencyId] UNIQUE NONCLUSTERED ([AgencyId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[GOV].[AgenciesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Agencies_ParentAgencyId]
    ON [GOV].[Agencies]([ParentAgencyId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Agencies_NameAr]
    ON [GOV].[Agencies]([NameAr] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Agencies_FullName]
    ON [GOV].[Agencies]([FullName] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Agencies_AgencyId]
    ON [GOV].[Agencies]([AgencyId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Gov Agency', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'Agencies', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Gov Agency', @level0type = N'SCHEMA', @level0name = N'GOV', @level1type = N'TABLE', @level1name = N'Agencies', @level2type = N'COLUMN', @level2name = N'CreatedAt';

