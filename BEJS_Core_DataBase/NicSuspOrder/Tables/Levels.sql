CREATE TABLE [NicSuspOrder].[Levels] (
    [Id]        INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (500)                                     NOT NULL,
    [NameAr]    NVARCHAR (500)                                     NOT NULL,
    [IsActive]  BIT                                                NOT NULL,
    [NicCode]   INT                                                NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt] DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt] DATETIME2 (7)                                      NULL,
    CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED ([Id] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[NicSuspOrder].[LevelsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Levels_NameAr]
    ON [NicSuspOrder].[Levels]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Levels_Name]
    ON [NicSuspOrder].[Levels]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Nic Suspension Order Level', @level0type = N'SCHEMA', @level0name = N'NicSuspOrder', @level1type = N'TABLE', @level1name = N'Levels', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Nic Suspension Order Level', @level0type = N'SCHEMA', @level0name = N'NicSuspOrder', @level1type = N'TABLE', @level1name = N'Levels', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Nic Suspension Order Level', @level0type = N'SCHEMA', @level0name = N'NicSuspOrder', @level1type = N'TABLE', @level1name = N'Levels', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Nic Suspension Order Level', @level0type = N'SCHEMA', @level0name = N'NicSuspOrder', @level1type = N'TABLE', @level1name = N'Levels', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id => Id of Nic Suspension Order Level', @level0type = N'SCHEMA', @level0name = N'NicSuspOrder', @level1type = N'TABLE', @level1name = N'Levels', @level2type = N'COLUMN', @level2name = N'Id';

