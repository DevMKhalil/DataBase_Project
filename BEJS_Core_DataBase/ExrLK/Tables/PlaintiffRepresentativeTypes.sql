CREATE TABLE [ExrLK].[PlaintiffRepresentativeTypes] (
    [Id]                       INT                                                IDENTITY (1, 1) NOT NULL,
    [Name]                     NVARCHAR (500)                                     NOT NULL,
    [NameAr]                   NVARCHAR (500)                                     NOT NULL,
    [IsActive]                 BIT                                                NOT NULL,
    [ExecutionRequestTypeCode] SMALLINT                                           NOT NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [CreatedAt]                DATETIME2 (7)                                      DEFAULT (getdate()) NOT NULL,
    [UpdatedAt]                DATETIME2 (7)                                      NULL,
    CONSTRAINT [PK_PlaintiffRepresentativeTypes] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PlaintiffRepresentativeTypes_Types_ExecutionRequestTypeCode] FOREIGN KEY ([ExecutionRequestTypeCode]) REFERENCES [ExrLK].[Types] ([Code]),
    CONSTRAINT [AK_PlaintiffRepresentativeTypes_NameAr_ExecutionRequestTypeCode] UNIQUE NONCLUSTERED ([NameAr] ASC, [ExecutionRequestTypeCode] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[ExrLK].[PlaintiffRepresentativeTypesHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_PlaintiffRepresentativeTypes_ExecutionRequestTypeCode]
    ON [ExrLK].[PlaintiffRepresentativeTypes]([ExecutionRequestTypeCode] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Updated At => it is used to determine update date and Time of Plaintiff Representative Type', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'PlaintiffRepresentativeTypes', @level2type = N'COLUMN', @level2name = N'UpdatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Created At => it is used to determine Creation date and Time of Plaintiff Representative Type', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'PlaintiffRepresentativeTypes', @level2type = N'COLUMN', @level2name = N'CreatedAt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NameAr => Arabic Name of Plaintiff Representative Type', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'PlaintiffRepresentativeTypes', @level2type = N'COLUMN', @level2name = N'NameAr';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name => Name of Plaintiff Representative Type', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'PlaintiffRepresentativeTypes', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Id => Id of Plaintiff Representative Type', @level0type = N'SCHEMA', @level0name = N'ExrLK', @level1type = N'TABLE', @level1name = N'PlaintiffRepresentativeTypes', @level2type = N'COLUMN', @level2name = N'Id';

