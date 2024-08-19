

PRINT '     _  _                                       '
PRINT '    | || |  _            _                      '
PRINT '    | || |_| |_ ___  ___| |_ _   _ _ __ ___     '
PRINT '    |__   _| __/ _ \/ __| __| | | |  __/ _ \    '
PRINT '       |_| | ||  __/ (__| |_| |_| | | |  __/    '
PRINT '            \__\___|\___|\__|\__,_|_|  \___|    '
PRINT '                                                '
PRINT '        empower your software solutions         '
PRINT '                                                '

PRINT '******************* pre scripts *******************'

-- Start transaction for all pre scripts
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
        PRINT 'The database ' +  @DBNAME + ' does not yet exist. All pre deployment scripts will be skipped.'
        SET @DBEXISTS = 0
    END
    ELSE
    BEGIN
        PRINT 'The database ' +  @DBNAME + ' already exists. pre deployment scripts will be executed.'
        SET @DBEXISTS = 1
    END

    -- Only run scripts of type 'pre' if the database exists, otherwise skip. post scripts are always run.
    IF @DBEXISTS=1 AND 'pre'='pre' AND OBJECT_ID(N'dbo._MigrationScriptsHistory', N'U') IS NOT NULL OR 'pre'='post'
    BEGIN
        -- Check if the script was already run in previous migrations
        IF NOT EXISTS(SELECT *
                        FROM dbo.[_MigrationScriptsHistory]
                        WHERE [ScriptNameId] = 'PreScripts\20171016123600_Initial_Setup.sql')
        BEGIN
            -- Run the new migration script
            PRINT '------------------ RUN --------------------------'
            PRINT 'Script Id:      PreScripts\20171016123600_Initial_Setup.sql'
            PRINT 'Script Name:    20171016123600_Initial_Setup.sql'
            PRINT 'Order Criteria: 20171016123600'
            PRINT 'Script Type:    pre'
            PRINT 'Script Path:    C:\Users\NTG\source\repos\AdventureWorks_DataBase\AdventureWorks_DataBase\Scripts\PreScripts\20171016123600_Initial_Setup.sql'
            PRINT 'Script Hash:    FtZ5yB+xpknBlTpdwS/yeQ=='
        
            PRINT ' > Start pre-script run....'
            exec('PRINT ''Initial setup pre-script''')
            PRINT ' > Finished pre-script run....'
        
            -- Register the script in the migration script history table to prevent duplicate runs
            PRINT ' > Register script in migration history table.'
            INSERT INTO dbo.[_MigrationScriptsHistory]
            VALUES('PreScripts\20171016123600_Initial_Setup.sql', GETDATE(), 'FtZ5yB+xpknBlTpdwS/yeQ==')

            PRINT '----------------- END RUN ------------------------'
            PRINT '|'
        END
        ELSE
        BEGIN
            -- The script was already run. Check if script hash has changed meanwhile.
            IF NOT EXISTS(SELECT *
                            FROM dbo.[_MigrationScriptsHistory]
                            WHERE [ScriptHash] = 'FtZ5yB+xpknBlTpdwS/yeQ==')
            BEGIN
                IF 1!=0
                    RAISERROR ('ERROR: The hash value for the pre migration script 20171016123600_Initial_Setup.sql does not match with the origin registered and executed script.', 18, 1);
                ELSE
                    -- SEVERITY 0-9 is treated as warning
                    RAISERROR ('WARNING: The hash value for the pre migration script 20171016123600_Initial_Setup.sql does not match with the past registered and executed script.', 5, 1);
            END
        
            PRINT 'Skip pre-script 20171016123600_Initial_Setup.sql (already executed)'
        END
    END
END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT @ErrorMessage = ERROR_MESSAGE(),
           @ErrorSeverity = ERROR_SEVERITY(),
           @ErrorState = ERROR_STATE();

    -- Rollback all transactions if any of the pre scripts failed.
    IF @@TRANCOUNT > 0  
        ROLLBACK TRANSACTION;

    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

END CATCH;

-- Commit transaction if all pre scripts have been successfully run.
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  
GO