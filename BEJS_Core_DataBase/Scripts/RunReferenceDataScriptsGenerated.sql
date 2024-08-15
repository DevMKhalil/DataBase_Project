

PRINT '     _  _                                       '
PRINT '    | || |  _            _                      '
PRINT '    | || |_| |_ ___  ___| |_ _   _ _ __ ___     '
PRINT '    |__   _| __/ _ \/ __| __| | | |  __/ _ \    '
PRINT '       |_| | ||  __/ (__| |_| |_| | | |  __/    '
PRINT '            \__\___|\___|\__|\__,_|_|  \___|    '
PRINT '                                                '
PRINT '        empower your software solutions         '
PRINT '                                                '

PRINT '******************* referencedata scripts *******************'

-- Start transaction for all referencedata scripts
BEGIN TRANSACTION;
BEGIN TRY

    DECLARE @DBEXISTS bit;
    SET @DBEXISTS = 0;

    DECLARE @DBNAME NVARCHAR(128);
    SET @DBNAME = DB_NAME();

    DECLARE @DBID INT;
    SET @DBID = DB_ID();

    IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = @DBNAME)
    BEGIN
        PRINT 'The database ' +  @DBNAME + ' does not yet exist. All referencedata deployment scripts will be skipped.'
        SET @DBEXISTS = 0
    END
    ELSE
    BEGIN
        PRINT 'The database ' +  @DBNAME + ' already exists. referencedata deployment scripts will be executed.'
        SET @DBEXISTS = 1
    END
    
    -- Prefill the _MigrationScriptsHistory table with the existing migration scripts when applying the first time
    IF @DBEXISTS=1 AND 'referencedata'='referencedata'
    BEGIN    
        IF OBJECT_ID(N'dbo._MigrationScriptsHistory', N'U') IS NOT NULL
        BEGIN
            IF NOT EXISTS (SELECT * FROM [dbo].[_MigrationScriptsHistory])
            BEGIN
                PRINT N'Set default values for MigrationScriptsHistory';

                INSERT INTO [dbo].[_MigrationScriptsHistory] 
                VALUES
                    ('PreScripts\20171016123600_Initial_Setup.sql', GETUTCDATE(),'FtZ5yB+xpknBlTpdwS/yeQ==')
                    ,('PreScripts\20171017081000_StreetNotNullableWithDefaultValue.sql', GETUTCDATE(),'/sx2QWViX8v12wPqfVk6DQ==')
                    ,('PostScripts\20171016123600_SetupInitialData.sql', GETUTCDATE(),'rzbK+S/5Isiz/iDZICgs6w==')
                    ,('PostScripts\20171017110000_MergeColumnStreet.sql', GETUTCDATE(),'xS5Fs7n+eoWW5DU1RNM9ug==')
                    ,('initialization\_migrationscriptshistory', GETUTCDATE(),'ZmI3OWI5ZThiOWU2ZGU5MTYwODFkYmJmN2M3ZjFlYzM=')
            END
            ELSE
            BEGIN
                PRINT N'MigrationScriptsHistory already has entries, skipping.';
            END
        END
        ELSE
        BEGIN
            RAISERROR ('ERROR: The migration script history table _MigrationScriptsHistory does not exists.', 18, 1);
        END
    END

    -- Only run scripts of type 'referencedata' if the database exists, otherwise skip.
    IF @DBEXISTS=1 AND 'referencedata'='referencedata'
    BEGIN    
        -- Run the new migration script
        PRINT '------------------ RUN --------------------------'
        PRINT 'Script Id:      ReferenceDataScripts\1_PaymetMethodInit.sql'
        PRINT 'Script Name:    1_PaymetMethodInit.sql'
        PRINT 'Order Criteria: 1'
        PRINT 'Script Type:    referencedata'
        PRINT 'Script Path:    C:\Users\NTG\source\repos\SSDTDataMigration\Samples\CustomSSDTMigrationScripts.Sample\Scripts\ReferenceDataScripts\1_PaymetMethodInit.sql'
        PRINT 'Script Hash:    M/P5CHS4tGcdSnPGK25Xmw=='
        
        PRINT ' > Start referencedata-script run....'
        exec('SET NOCOUNT ON

MERGE INTO [dbo].[PaymentMethod] AS Target
USING (VALUES
  (N''creditcard'',N''The credit card payment method'',N''Credit Card'')
 ,(N''debitcard'',N''The debit card payment method'',N''Debit Card'')
) AS Source ([Identifier],[Description],[Name])
ON (Target.[Identifier] = Source.[Identifier])
WHEN MATCHED AND (
	NULLIF(Source.[Description], Target.[Description]) IS NOT NULL OR NULLIF(Target.[Description], Source.[Description]) IS NOT NULL OR 
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN
 UPDATE SET
  [Description] = Source.[Description], 
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Identifier],[Description],[Name])
 VALUES(Source.[Identifier],Source.[Description],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;

DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT ''ERROR OCCURRED IN MERGE FOR [dbo].[PaymentMethod]. Rows affected: '' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT ''[dbo].[PaymentMethod] rows affected by MERGE: '' + CAST(@mergeCount AS VARCHAR(100));
 END

')
        PRINT ' > Finished referencedata-script run....'
        
        PRINT '----------------- END RUN ------------------------'
        PRINT '|'
    END
END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT @ErrorMessage = ERROR_MESSAGE(),
           @ErrorSeverity = ERROR_SEVERITY(),
           @ErrorState = ERROR_STATE();

    -- Rollback all transactions if any of the referencedata scripts failed.
    IF @@TRANCOUNT > 0  
        ROLLBACK TRANSACTION;

    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

END CATCH;

-- Commit transaction if all referencedata scripts have been successfully run.
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  
GO