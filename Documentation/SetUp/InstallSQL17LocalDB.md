# Installing and Configuring SQL Server 2017 Express/LocalDB

[Back to Home](./ReadMe.md) > Installing and Configuring SQL Server 2017 Express/LocalDB

In order to successfully build and use a local copy of PMC databases you should be running SQL Server 2017 (V14).

## Instructions

###Configuring SQL Server

1. Download and run the SQL Server Express 2017 installer from here: https://www.microsoft.com/en-us/sql-server/sql-server-editions-express

2. Choose the Custom option
![Image of SQL Server Express Installer](images/InstallSQL17LocalDB001.png)

3. Choose a location to download the media and click Install.
![Image of SQL Server Express Installer](images/InstallSQL17LocalDB002.png)

4. Click on the `New SQL Server stand-alone installation` option
![Image of SQL Server Express Installer](images/InstallSQL17LocalDB003.png)

5. Accept the license terms, click next.
6. Click next on the Install Rules check (All should pass, it's ok if Windows Firewall is a warning)
7. On the Feature selection screen click the "Unselect All" button and then check the following options under the "Shared Features" section
   - Client Tools Connectivity
   - LocalDB
![Image of SQL Server Express Installer](images/InstallSQL17LocalDB004.png)

8. Click next, install and close on the completion screen
![Image of SQL Server Express Installer](images/InstallSQL17LocalDB005.png)

9. Open Command Prompt and run the following commands:
   - List existing LocalDB instances
   ```
   sqllocaldb info
   ```
   ![Image of SQL Server Express Installer](images/InstallSQL17LocalDB006.png)
   - Create a new instance with the lastest installed version of LocalDB
   ```sqllocaldb create ProjectsV14```

10. At this point you should be able to connect to your local database.
   ![Logging In To LocalDb](images/LoginToLocalDb.PNG)

### Setting Up the Interview Database

1. Download `InterviewDB.bak` from the [github repository](https://github.com/ProtectMyCar/DM-Interview/blob/master/Documentation/SetUp/Database%20Backup/InterviewDB.bak "Gitgub").

2. Next, login to your local sql server. Once Logged in, Expand the server and right click on the databases folder then select restore
   ![Restoring Db](images/RestoreDatabse.PNG)

3. Finally Select device and point to the .bak file downloaded you downloaded from the repo
![Restoring Db](images/RestoreDatabse2.PNG)

5. If you get an error during this step, go to the Files Tab on the left, and check the box that says "Reallocate all files to folder"

4. You should now be able to see the database and begin querying.

