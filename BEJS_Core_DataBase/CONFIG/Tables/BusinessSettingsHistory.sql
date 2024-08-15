CREATE TABLE [CONFIG].[BusinessSettingsHistory] (
    [Id]                   INT             NOT NULL,
    [Key]                  NVARCHAR (150)  NOT NULL,
    [Name]                 NVARCHAR (200)  NOT NULL,
    [NameAr]               NVARCHAR (200)  NULL,
    [Value]                NVARCHAR (2000) NOT NULL,
    [ValidationExpression] NVARCHAR (1000) NULL,
    [IsActive]             BIT             NOT NULL,
    [GroupId]              INT             NOT NULL,
    [ValueTypeId]          INT             NOT NULL,
    [ValueDiscriminatorId] INT             NOT NULL,
    [ValidTo]              DATETIME2 (7)   NOT NULL,
    [ValidFrom]            DATETIME2 (7)   NOT NULL,
    [UpdatedAt]            DATETIME2 (7)   NULL,
    [UpdatedBy]            INT             NULL,
    [CreatedAt]            DATETIME2 (7)   NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_BusinessSettingsHistory]
    ON [CONFIG].[BusinessSettingsHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

