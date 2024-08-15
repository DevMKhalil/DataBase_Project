CREATE TABLE [AUTH].[Roles] (
    [Code]       INT                                                NOT NULL,
    [Name]       NVARCHAR (200)                                     NOT NULL,
    [NameAr]     NVARCHAR (200)                                     NOT NULL,
    [IsExternal] BIT                                                NOT NULL,
    [IsActive]   BIT                                                NOT NULL,
    [ValidTo]    DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]  DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]  DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]  INT                                                NULL,
    [UpdatedAt]  DATETIME2 (7)                                      DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_Roles_Users_UpdatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [AUTH].[Users] ([Id]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[AUTH].[RolesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Roles_UpdatedBy]
    ON [AUTH].[Roles]([UpdatedBy] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_NameAr]
    ON [AUTH].[Roles]([NameAr] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name]
    ON [AUTH].[Roles]([Name] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Role', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Roles', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated By => it is used to determine which user update Role', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Roles', @level2type = N'COLUMN', @level2name = N'UpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Role', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Roles', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Role', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Roles', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Role', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Roles', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code => Code of Role', @level0type = N'SCHEMA', @level0name = N'AUTH', @level1type = N'TABLE', @level1name = N'Roles', @level2type = N'COLUMN', @level2name = N'Code';

