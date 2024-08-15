CREATE TABLE [JACT].[LiftSummeryInfo] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [TotalAmount] DECIMAL (18, 2) NOT NULL,
    [BlockAmount] DECIMAL (18, 2) NOT NULL,
    CONSTRAINT [PK_LiftSummeryInfo] PRIMARY KEY CLUSTERED ([Id] ASC)
);

