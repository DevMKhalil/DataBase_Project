CREATE TABLE [SecrLK].[SecondaryRequestReturnReasons] (
    [Code]      SMALLINT                                           NOT NULL,
    [Name]      NVARCHAR (200)                                     NOT NULL,
    [NameAr]    NVARCHAR (200)                                     NOT NULL,
    [GroupCode] SMALLINT                                           NOT NULL,
    [ValidTo]   DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    [ValidFrom] DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    CONSTRAINT [PK_SecondaryRequestReturnReasons] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [FK_SecondaryRequestReturnReasons_SecondaryRequestReturnReasonGroups_GroupCode] FOREIGN KEY ([GroupCode]) REFERENCES [SecrLK].[SecondaryRequestReturnReasonGroups] ([Code]),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SecrLK].[SecondaryRequestReturnReasonsHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SecondaryRequestReturnReasons_NameAr_GroupCode]
    ON [SecrLK].[SecondaryRequestReturnReasons]([NameAr] ASC, [GroupCode] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SecondaryRequestReturnReasons_Name_GroupCode]
    ON [SecrLK].[SecondaryRequestReturnReasons]([Name] ASC, [GroupCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SecondaryRequestReturnReasons_GroupCode]
    ON [SecrLK].[SecondaryRequestReturnReasons]([GroupCode] ASC);

