CREATE TABLE [GOV].[AgencyLegalRepresentativesHistory] (
    [Id]                           INT            NOT NULL,
    [UserAccountId]                INT            NOT NULL,
    [RepresentationDeedId]         BIGINT         NOT NULL,
    [GovAgencyId]                  INT            NOT NULL,
    [StatusCode]                   SMALLINT       NOT NULL,
    [IsExternal]                   BIT            NOT NULL,
    [LicenseOfPracticeNumber]      BIGINT         NULL,
    [ResidencyTypeCode]            SMALLINT       NOT NULL,
    [AbsherNationalityCode]        INT            NOT NULL,
    [AbsherNationalityDescription] NVARCHAR (100) NOT NULL,
    [FirstName]                    NVARCHAR (200) NOT NULL,
    [FatherName]                   NVARCHAR (200) NULL,
    [GrandFatherName]              NVARCHAR (200) NULL,
    [FamilyName]                   NVARCHAR (200) NOT NULL,
    [Email]                        NVARCHAR (100) NOT NULL,
    [MobileNumber]                 NVARCHAR (25)  NULL,
    [PhoneNumber]                  NVARCHAR (25)  NULL,
    [BirthDate]                    DATE           NULL,
    [BirthDateHijri]               DECIMAL (8)    NULL,
    [ValidTo]                      DATETIME2 (7)  NOT NULL,
    [ValidFrom]                    DATETIME2 (7)  NOT NULL,
    [CreatedAt]                    DATETIME2 (7)  NOT NULL,
    [CreatedById]                  INT            NOT NULL,
    [UpdatedAt]                    DATETIME2 (7)  NULL,
    [UpdatedBy]                    INT            NULL
);


GO
CREATE CLUSTERED INDEX [ix_AgencyLegalRepresentativesHistory]
    ON [GOV].[AgencyLegalRepresentativesHistory]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

