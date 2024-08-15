CREATE TABLE [JACT].[TimeLimits] (
    [Id]                INT         IDENTITY (1, 1) NOT NULL,
    [TimeLimitTypeCode] SMALLINT    NOT NULL,
    [Start]             DATE        NOT NULL,
    [StartHijri]        DECIMAL (8) NULL,
    [End]               DATE        NOT NULL,
    [EndHijri]          DECIMAL (8) NULL,
    CONSTRAINT [PK_TimeLimits] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TimeLimits_TimeLimitTypes_TimeLimitTypeCode] FOREIGN KEY ([TimeLimitTypeCode]) REFERENCES [JACT].[TimeLimitTypes] ([Code])
);


GO
CREATE NONCLUSTERED INDEX [IX_TimeLimits_TimeLimitTypeCode]
    ON [JACT].[TimeLimits]([TimeLimitTypeCode] ASC);

