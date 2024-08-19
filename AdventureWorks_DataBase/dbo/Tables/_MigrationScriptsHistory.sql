CREATE TABLE [dbo].[_MigrationScriptsHistory] (
    [ScriptNameId]  NVARCHAR (255) NOT NULL,
    [ExecutionDate] DATETIME2 (7)  NOT NULL,
    [ScriptHash]    NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([ScriptNameId] ASC)
);

