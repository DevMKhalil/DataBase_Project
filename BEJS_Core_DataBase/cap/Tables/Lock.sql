CREATE TABLE [cap].[Lock] (
    [Key]          NVARCHAR (128) NOT NULL,
    [Instance]     NVARCHAR (256) NOT NULL,
    [LastLockTime] DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_cap.Lock] PRIMARY KEY CLUSTERED ([Key] ASC) WITH (IGNORE_DUP_KEY = ON)
);

