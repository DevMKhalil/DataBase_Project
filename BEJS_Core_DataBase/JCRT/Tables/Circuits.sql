CREATE TABLE [JCRT].[Circuits] (
    [Id]            INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (200)                                     NOT NULL,
    [CourtId]       INT                                                NOT NULL,
    [Specialties]   NVARCHAR (MAX)                                     NOT NULL,
    [ValidTo]       DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]     DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]     DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [CreatedById]   INT                                                NOT NULL,
    [UpdatedAt]     DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    [UpdatedBy]     INT                                                NULL,
    [IsDeleted]     BIT                                                NOT NULL,
    [DeletedAt]     DATETIME2 (7)                                      NULL,
    [DeletedBy]     INT                                                NULL,
    [GeoLocationId] INT                                                NULL,
    CONSTRAINT [PK_Circuits] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Circuits_CircuitGeoLocations_GeoLocationId] FOREIGN KEY ([GeoLocationId]) REFERENCES [JCRT].[CircuitGeoLocations] ([Id]),
    CONSTRAINT [FK_Circuits_Courts_CourtId] FOREIGN KEY ([CourtId]) REFERENCES [LK].[Courts] ([Id]),
    CONSTRAINT [FK_Circuits_Users_CreatedById] FOREIGN KEY ([CreatedById]) REFERENCES [AUTH].[Users] ([Id]),
    CONSTRAINT [FK_Circuits_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[JCRT].[CircuitsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Circuits_GeoLocationId]
    ON [JCRT].[Circuits]([GeoLocationId] ASC) WHERE ([GeoLocationId] IS NOT NULL);


GO
CREATE NONCLUSTERED INDEX [IX_Circuits_UpdatedBy]
    ON [JCRT].[Circuits]([UpdatedBy] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Circuits_CreatedById]
    ON [JCRT].[Circuits]([CreatedById] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Circuits_CourtId]
    ON [JCRT].[Circuits]([CourtId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Judicial Circuit', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'Circuits', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Judicial Circuit', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'Circuits', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created By Id => it is used to determine which user create Judicial Circuit', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'Circuits', @level2type = N'COLUMN', @level2name = N'CreatedById';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Judicial Circuit', @level0type = N'SCHEMA', @level0name = N'JCRT', @level1type = N'TABLE', @level1name = N'Circuits', @level2type = N'COLUMN', @level2name = N'CreatedAt';

