# Protect My Car - Data Management Database Technical Interview

![](Docs/Images/protect-my-car-logo-large.png)

## Welcome!

Congratulations you've moved on to the next step in the interview process with the Protect My Car Data Management Team! We are excited to talk to you and see first hand your database experience.

## Preparing for your technical interview

Please clone this git repository and make sure you're in the `master` branch. 

Using the links below download and install the following software:

1. [Visual Studio 2019 Community](https://visualstudio.microsoft.com/) - Make sure to install the ASP.NET and Web Application Development and or the Data Storage & Processing "workload(s)". Alternatively you can install the SQL Server Data Tools Component.
2. [SQL Server Management Studio 18.x (Optional)](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017) - Install the latest version that is compatible with SQL Server 2017.
3. [SQL Server 2017 Express (Optional)](https://www.microsoft.com/en-us/sql-server/sql-server-editions-express) - At a minimum you can follow the [Installation and configuration guide](/Docs/InstallSQL17LocalDB.md). LocalDB should be all you need, but you can install the database engine if you'd like.

Visual Studio 2019 Community Edition with [SQL Server Data Tools](https://docs.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-2017) should give you everything you need to build, deploy objects & sample data (to [SQL Server LocalDB](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb?view=sql-server-2017) which is included in SQL Server Data Tools), and query the interview DB but you might find using SQL Server Management Studio (SSMS) is more familiar.

If you've installed Visual Studio 2019 go ahead and open the [DM-Interview solution file](/DM-Interview.sln) and build the database. After the build is complete you should see a new database in (LocalDB)/ProjectsV13 with all the tables and sample data.

If you'd prefer to just restore a backup file you can restore the included database backup file into a new database on any edition of SQL Server 2017. [Backup file](/Docs/Files/InterviewDB.bak)

## The Technical Interview Process

During your technical interview you will be asked to run queries from the database that is produced by this repository. You will not be expected to know everything about the simplified version of our database contained in this SQL Server Database Project. However, you now have access to the exact schema and sample data that we will ask you to query data from so you can get as familiar with it as you like.

## Database Structure

### Tables
- **Customer :** Shows Customer Information.
- **CustomerVehicle :** Represents a vehicle owned by a customer.
- **Contract :** Represents a service contract for a vehicle
- **Address :** Represents an address
- **Vehicle :** Represents a vehicle template

### Diagram

![](Docs/Images/DB-Interview_Diagram.png)


