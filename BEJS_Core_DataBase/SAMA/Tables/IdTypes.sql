CREATE TABLE [SAMA].[IdTypes] (
    [Id]                  INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]                NVARCHAR (500)                                     NOT NULL,
    [NameAr]              NVARCHAR (500)                                     NOT NULL,
    [IsActive]            BIT                                                NOT NULL,
    [ServiceCode]         NVARCHAR (MAX)                                     NOT NULL,
    [CallBackServiceCode] NVARCHAR (MAX)                                     NOT NULL,
    [GroupId]             INT                                                NOT NULL,
    [ValidTo]             DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]           DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]           DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt]           DATETIME2 (7)                                      NULL,
    CONSTRAINT [PK_IdTypes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_IdTypes_IdTypeGroups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [SAMA].[IdTypeGroups] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SAMA].[IdTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_IdTypes_GroupId]
    ON [SAMA].[IdTypes]([GroupId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of S A M A Id Type', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'IdTypes', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of S A M A Id Type', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'IdTypes', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of S A M A Id Type', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'IdTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of S A M A Id Type', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'IdTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id => Id of S A M A Id Type', @level0type = N'SCHEMA', @level0name = N'SAMA', @level1type = N'TABLE', @level1name = N'IdTypes', @level2type = N'COLUMN', @level2name = N'Id';

