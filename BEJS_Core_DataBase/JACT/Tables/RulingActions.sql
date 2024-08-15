CREATE TABLE [JACT].[RulingActions] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [JudicialSessionId] INT            NOT NULL,
    [Events]            NVARCHAR (MAX) NOT NULL,
    [Reasons]           NVARCHAR (MAX) NOT NULL,
    [Verdict]           NVARCHAR (MAX) NOT NULL,
    [RestOfRuling]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_RulingActions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RulingActions_Sessions_JudicialSessionId] FOREIGN KEY ([JudicialSessionId]) REFERENCES [JSES].[Sessions] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RulingActions_JudicialSessionId]
    ON [JACT].[RulingActions]([JudicialSessionId] ASC);

