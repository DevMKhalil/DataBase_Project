

PRINT '     _  _                                       '
PRINT '    | || |  _            _                      '
PRINT '    | || |_| |_ ___  ___| |_ _   _ _ __ ___     '
PRINT '    |__   _| __/ _ \/ __| __| | | |  __/ _ \    '
PRINT '       |_| | ||  __/ (__| |_| |_| | | |  __/    '
PRINT '            \__\___|\___|\__|\__,_|_|  \___|    '
PRINT '                                                '
PRINT '        empower your software solutions         '
PRINT '                                                '

PRINT '******************* post scripts *******************'

-- Start transaction for all post scripts
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
        PRINT 'The database ' +  @DBNAME + ' does not yet exist. All post deployment scripts will be skipped.'
        SET @DBEXISTS = 0
    END
    ELSE
    BEGIN
        PRINT 'The database ' +  @DBNAME + ' already exists. post deployment scripts will be executed.'
        SET @DBEXISTS = 1
    END

    -- Only run scripts of type 'pre' if the database exists, otherwise skip. post scripts are always run.
    IF @DBEXISTS=1 AND 'post'='pre' AND OBJECT_ID(N'dbo._MigrationScriptsHistory', N'U') IS NOT NULL OR 'post'='post'
    BEGIN
        -- Check if the script was already run in previous migrations
        IF NOT EXISTS(SELECT *
                        FROM dbo.[_MigrationScriptsHistory]
                        WHERE [ScriptNameId] = 'PostScripts\20171016123600_SetupInitialData.sql')
        BEGIN
            -- Run the new migration script
            PRINT '------------------ RUN --------------------------'
            PRINT 'Script Id:      PostScripts\20171016123600_SetupInitialData.sql'
            PRINT 'Script Name:    20171016123600_SetupInitialData.sql'
            PRINT 'Order Criteria: 20171016123600'
            PRINT 'Script Type:    post'
            PRINT 'Script Path:    C:\Users\NTG\source\repos\SSDTDataMigration\Samples\CustomSSDTMigrationScripts.Sample\Scripts\PostScripts\20171016123600_SetupInitialData.sql'
            PRINT 'Script Hash:    rzbK+S/5Isiz/iDZICgs6w=='
        
            PRINT ' > Start post-script run....'
            exec('PRINT ''Start initializing database data''

-- Products
PRINT ''Initialize product data...''

INSERT INTO dbo.product (Id, Price, Description, Name)
SELECT 1, 5, NULL, ''Surface Book''
WHERE NOT EXISTS (SELECT 1 FROM dbo.product WHERE Id = 1)

INSERT INTO dbo.product (Id, Price, Description, Name)
SELECT 2, 5, ''Microsoft Surface Pen'', ''Surface Pen''
WHERE NOT EXISTS (SELECT 1 FROM dbo.product WHERE Id = 2)

INSERT INTO dbo.product (Id, Price, Description, Name)
SELECT 3, 5, NULL, ''Suraface Mouse''
WHERE NOT EXISTS (SELECT 1 FROM dbo.product WHERE Id = 3)

-- Customers
PRINT ''Initialize customer data...''

INSERT INTO dbo.customer (Id, FirstName, LastName, StreetName, City, StreetNumber)
SELECT 1, ''Brian'', ''Herry'', ''Anystreet'', ''Zuric'', ''3''
WHERE NOT EXISTS (SELECT 1 FROM dbo.customer WHERE Id = 1)

INSERT INTO dbo.customer (Id, FirstName, LastName, StreetName, City, StreetNumber)
SELECT 2, ''Bara'', ''Nellson'', ''Topstreet'', ''Madrid'', ''100''
WHERE NOT EXISTS (SELECT 1 FROM dbo.customer WHERE Id = 2)

INSERT INTO dbo.customer (Id, FirstName, LastName, StreetName, City, StreetNumber)
SELECT 3, ''Tom'', ''Johnson'', null, ''London'', null
WHERE NOT EXISTS (SELECT 1 FROM dbo.customer WHERE Id = 3)

-- Orders 
PRINT ''Initialize order data...''

INSERT INTO dbo.[order] (Id, CustomerId, ProductId, Quantity, Comment, OrderDate)
SELECT 1, 1, 1, 1, ''Shipt as one package'', GETDATE()
WHERE NOT EXISTS (SELECT 1 FROM dbo.[order] WHERE Id = 1)

INSERT INTO dbo.[order] (Id, CustomerId, ProductId, Quantity, Comment, OrderDate)
SELECT 2, 1, 2, 2, NULL, GETDATE()
WHERE NOT EXISTS (SELECT 1 FROM dbo.[order] WHERE Id = 2)

INSERT INTO dbo.[order] (Id, CustomerId, ProductId, Quantity, Comment, OrderDate)
SELECT 3, 2, 3, 4, NULL, GETDATE()
WHERE NOT EXISTS (SELECT 1 FROM dbo.[order] WHERE Id = 3)

PRINT ''Finished initializing database data''')
            PRINT ' > Finished post-script run....'
        
            -- Register the script in the migration script history table to prevent duplicate runs
            PRINT ' > Register script in migration history table.'
            INSERT INTO dbo.[_MigrationScriptsHistory]
            VALUES('PostScripts\20171016123600_SetupInitialData.sql', GETDATE(), 'rzbK+S/5Isiz/iDZICgs6w==')

            PRINT '----------------- END RUN ------------------------'
            PRINT '|'
        END
        ELSE
        BEGIN
            -- The script was already run. Check if script hash has changed meanwhile.
            IF NOT EXISTS(SELECT *
                            FROM dbo.[_MigrationScriptsHistory]
                            WHERE [ScriptHash] = 'rzbK+S/5Isiz/iDZICgs6w==')
            BEGIN
                IF 1!=0
                    RAISERROR ('ERROR: The hash value for the post migration script 20171016123600_SetupInitialData.sql does not match with the origin registered and executed script.', 18, 1);
                ELSE
                    -- SEVERITY 0-9 is treated as warning
                    RAISERROR ('WARNING: The hash value for the post migration script 20171016123600_SetupInitialData.sql does not match with the past registered and executed script.', 5, 1);
            END
        
            PRINT 'Skip post-script 20171016123600_SetupInitialData.sql (already executed)'
        END
    END

    -- Only run scripts of type 'pre' if the database exists, otherwise skip. post scripts are always run.
    IF @DBEXISTS=1 AND 'post'='pre' AND OBJECT_ID(N'dbo._MigrationScriptsHistory', N'U') IS NOT NULL OR 'post'='post'
    BEGIN
        -- Check if the script was already run in previous migrations
        IF NOT EXISTS(SELECT *
                        FROM dbo.[_MigrationScriptsHistory]
                        WHERE [ScriptNameId] = 'PostScripts\20171017110000_MergeColumnStreet.sql')
        BEGIN
            -- Run the new migration script
            PRINT '------------------ RUN --------------------------'
            PRINT 'Script Id:      PostScripts\20171017110000_MergeColumnStreet.sql'
            PRINT 'Script Name:    20171017110000_MergeColumnStreet.sql'
            PRINT 'Order Criteria: 20171017110000'
            PRINT 'Script Type:    post'
            PRINT 'Script Path:    C:\Users\NTG\source\repos\SSDTDataMigration\Samples\CustomSSDTMigrationScripts.Sample\Scripts\PostScripts\20171017110000_MergeColumnStreet.sql'
            PRINT 'Script Hash:    xS5Fs7n+eoWW5DU1RNM9ug=='
        
            PRINT ' > Start post-script run....'
            exec('-- Merge columns StreetName and StreetNumber into StreetName

PRINT ''Merge StreetName and StreetNumber columns into new StreetName column''
UPDATE Customer SET StreetName=CONVERT(VARCHAR(50), CONCAT(RTRIM(StreetName), '' '', RTRIM(ISNULL(StreetNumber, ''''))));

--PRINT ''Drop deprecated column StreetNumber from [dbo].[Customer]''
--ALTER TABLE Customer DROP COLUMN StreetNumber')
            PRINT ' > Finished post-script run....'
        
            -- Register the script in the migration script history table to prevent duplicate runs
            PRINT ' > Register script in migration history table.'
            INSERT INTO dbo.[_MigrationScriptsHistory]
            VALUES('PostScripts\20171017110000_MergeColumnStreet.sql', GETDATE(), 'xS5Fs7n+eoWW5DU1RNM9ug==')

            PRINT '----------------- END RUN ------------------------'
            PRINT '|'
        END
        ELSE
        BEGIN
            -- The script was already run. Check if script hash has changed meanwhile.
            IF NOT EXISTS(SELECT *
                            FROM dbo.[_MigrationScriptsHistory]
                            WHERE [ScriptHash] = 'xS5Fs7n+eoWW5DU1RNM9ug==')
            BEGIN
                IF 1!=0
                    RAISERROR ('ERROR: The hash value for the post migration script 20171017110000_MergeColumnStreet.sql does not match with the origin registered and executed script.', 18, 1);
                ELSE
                    -- SEVERITY 0-9 is treated as warning
                    RAISERROR ('WARNING: The hash value for the post migration script 20171017110000_MergeColumnStreet.sql does not match with the past registered and executed script.', 5, 1);
            END
        
            PRINT 'Skip post-script 20171017110000_MergeColumnStreet.sql (already executed)'
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

    -- Rollback all transactions if any of the post scripts failed.
    IF @@TRANCOUNT > 0  
        ROLLBACK TRANSACTION;

    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

END CATCH;

-- Commit transaction if all post scripts have been successfully run.
IF @@TRANCOUNT > 0  
    COMMIT TRANSACTION;  
GO