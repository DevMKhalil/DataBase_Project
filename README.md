## Intro
SSDT is a database development tooling fully integrated into Microsoft Visual Studio. It supports database scheme migrations out of the box using DACPAC definition files and consist of an integrated single pre- and post script file capability. In practice more complex environments and database deployment scenarios require additional logic which requires an extended migration management. 

The SSDT Data Migration Scripts extension provides additional logic and management to meet the complexity for database deployments.

### Database Deployment Flow
Based on the single pre-, post and reference data scripts the extension allows to use multiple managed sub-deployment scripts:
 - Pre-Scripts
     - ...must be used with caution as the target database is in an undefined state as long as the actual scheme update has not been executed. Especially, if the database does not yet exist on the target server there is no way to run any of the pre-deployment scripts. must be used with 
 - Post-Scripts
     - ...are less critical compared to pre-scripts since the scheme migration has been executed in advance and provides an upgraded and consistent target database scheme.
 - Reference Data Scripts
     - ...are used for data which is needed by the application logic (extendable business logic, configuration, translations, etc...). Reference data should always be consistent with the application binaries. Most often, reference data uses merge statements for static reference table contents.
  
     - The following illustration shows the basic deployment flow using SSDT and the script extensibility features. All scripts and scheme migrations are bundled as artifacts during the build process and published onto the database by the dacfx framework at deployment time. 

![alt text](https://raw.githubusercontent.com/4tecture/SSDTDataMigration/master/Docs/Images/DeploymentProcessFlow.png "Deployment PRocess Flow")

## Build (and publish) a .dacpac (SQL Server database project) with .NET Core
The cross-platform version of sqlpackage allows publishing a .dacpac package for quite some time. Though building the database project (.sqlproj) was only possible on Windows because the .sqlproj project file is based on the full .NET Framework. The [MSBuild.Sdk.SqlProj](https://github.com/rr-wfm/MSBuild.Sdk.SqlProj) project finally allows to build the .dacpac file also on Mac or Linux.

### Prerequisites
This chapter lists all prerequisites which have to be met to run the extension locally or on build servers.
- Install **SQL Server Data Tools**  Visual Studio component (*Visual Studio Installer | Modify | Individual Components | Cloud, database and server | SQL Server Data Tools*)
- Install **4tecture.CustomSSDTMigrationScripts.msi** extension from [4tecture SSDT Data Migration Release](https://github.com/4tecture/SSDTDataMigration/releases/download/V1.4/4tecture.CustomSSDTMigrationScripts.x64.msi).

### Setup Sample - SQL Server Database project
- you can find the folder structure in [folder structure](https://github.com/4tecture/SSDTDataMigration?tab=readme-ov-file#setup-sample---sql-server-database-project)
- the needed scripts i tools folder

## Configuration
- The extension can be easily adapted to your needs by using a json configuration file. The configuration file placed beside the SSDT project file named **ssdt.migration.scripts.json** The [link snipped](https://github.com/4tecture/SSDTDataMigration?tab=readme-ov-file#configuration) shows all available options where each of the supported script type can be individually configured.

## About
This project is customized based on extension has been developed by consultants of [4tecture](https://www.4tecture.ch) based on their experience from many DevOps projects. Originally it was developed internally without public scope. However, we decided to make this open source so others can benefit, too. 

Feedback is very welcome. Please open an issue on GitHub or send us a message through our website.
