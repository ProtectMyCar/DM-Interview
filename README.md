# Protect My Car - Technical Interview

![](Docs/Images/protect-my-car-logo-large.png)

## Welcome!

Congratulations! You've moved on to the next step in the interview process with Protect My Car's Information Technology Team! We are excited to talk to you and see first hand your database experience.

## Preparing for your technical interview

Please clone this git repository and make sure you're in the `master` branch. 

Using the links below download and install the following software:

1. [Visual Studio 2019 Community](https://visualstudio.microsoft.com/) - Make sure to install the ASP.NET and Web Application Development and or the Data Storage & Processing "workload(s)". Alternatively you can install the SQL Server Data Tools Component.
2. [SQL Server Management Studio 18.x (Optional)](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017) - Install the latest version that is compatible with SQL Server 2017.

Visual Studio 2019 Community Edition with [SQL Server Data Tools](https://docs.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-2017) should give you everything you need to build, deploy objects & sample data (to [SQL Server LocalDB](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb?view=sql-server-2017) which is included in SQL Server Data Tools), and query the interview DB but you might find using SQL Server Management Studio (SSMS) is more familiar.

If you've installed Visual Studio 2019 go ahead and open the [DM-Interview solution file](/DM-Interview.sln) and build the database. After the build is complete you should see a new database in `(LocalDB)/ProjectsV13` with all the tables and sample data.

If you'd prefer to just [restore a backup file](/Docs/RestoreFromBackup.md) you can restore the included database backup file into a new database on any edition of SQL Server 2017. [Backup file](/Docs/Files/InterviewDB.bak)

## The Technical Interview Process

### Data Management Team

If you're interviewing for the Data Management team during your technical interview you will be asked to write queries from scratch using the database that is produced by this repository. You will not be expected to know everything about the simplified version of our database contained in this SQL Server Database Project. However, you now have access to the exact schema and sample data that we will ask you to query data from, so you can get as familiar with it as you like.

#### Interview Questions

The technical interview should be pretty painless, there are ten questions, starting with the easiest stuff and they get progressivly harder and require some creativity. We're not expecting you to get these 100% the same way we do, but we can tell a lot from your thought process as you work through them. If you've made it this far, here is a little reward, these are the first three questions from the actual technical interview. 

1. Select a list of all customers who have ever had a contract. Include the following columns: `InternalID`, `Full Name`, `Phone`, `Email`. 
2. Select the contract `InternalId` and `DateCreated` of each contract with a contract create date in the month of January 2019/2020.
3. Select the contract `InternalId` of anyone with the last name Torres.

## Development Team

If you're interviewing for the Data Management team during your technical interview you will be asked to work on a .net project and utilize the database built from the database project in this solution.

# Database Structure

## Tables

|Table Name|Description|
|----------|-----------|
|dbo.Customer|Shows Customer Information.|
|dbo.CustomerVehicle|Represents any vehicle(s) owned by a customer.|
|dbo.Contract|Represents a service contract for a vehicle (only 1 service contract per Vehicle).|
|dbo.Address|Represents an address|
|dbo.Vehicle|Represents a vehicle template|

## Diagram

![](Docs/Images/DB-Interview_Diagram.png)
