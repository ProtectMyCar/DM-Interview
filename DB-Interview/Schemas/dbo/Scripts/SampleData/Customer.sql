print '--- dbo.Customer';

set nocount on;

declare @vRecords int = 15000;

if (select count(1)from dbo.Customer) >= @vRecords
  set @vRecords = 1;

if object_id('TempDB..#Sample_dbo_Customer') is not null
  drop table #Sample_dbo_Customer;

create table #Sample_dbo_Customer (
  CustomerId      uniqueidentifier,
  DateCreated     datetime,
  DateModified    datetime,
  FirstName       varchar(50),
  LastName        varchar(50),
  Phone           varchar(10),
  AddressId       uniqueidentifier,
  EmailAddress    varchar(250),
  SpouseFirstName varchar(50),
  SpouceLastName  varchar(50),
  HomeOwner       varchar(3)
);

declare @vCustomer_Address util.UidCollection;

insert into @vCustomer_Address (Id)
select AddressId
  from dbo.Address;

insert into #Sample_dbo_Customer (CustomerId,
                                  DateCreated,
                                  DateModified,
                                  FirstName,
                                  LastName,
                                  Phone,
                                  AddressId,
                                  EmailAddress,
                                  SpouseFirstName,
                                  SpouceLastName,
                                  HomeOwner)
select top (@vRecords)
       newid()                                                                                                              CustomerId,
       dateadd(hour, util.udf_RandomInt(1, 24, newid()), dateadd(day, util.udf_RandomInt(0, 500, newid()) * -1, getdate())) DateCreated,
       null                                                                                                                 DateModified,
       sample.udf_RandomFirstName(newid())                                                                                  FirstName,
       sample.udf_RandomLastName(newid())                                                                                   LastName,
       '999' + cast(util.udf_RandomInt(1000000, 9999999, newid()) as varchar(7))                                            Phone,
       util.udf_RandomUid(@vCustomer_Address, newid())                                                                      addressID,
       null                                                                                                                 EmailAddress,
       case when util.udf_RandomInt(0, 100, newid()) < 50
            then sample.udf_RandomFirstName(newid())
            else null end                                                                                                   SpouseFirstName,
       null                                                                                                                 SpouseLastName,
       case when util.udf_RandomInt(0, 100, newid()) < 35 then 'Yes' else 'No' end                                          HomeOwner
  from sample.row;

update sC
   set sC.DateModified = dateadd(day, util.udf_RandomInt(0, 30, newid()), DateCreated),
       sC.SpouceLastName = case when sC.SpouseFirstName is not null then sC.LastName else null end,
       sC.EmailAddress = left(FirstName, 1) + sC.LastName + cast(util.udf_RandomInt(0, 100, newid()) as varchar(3)) + '@SampleData.ProtectMyCar.com'
  from #Sample_dbo_Customer sC;

insert into dbo.Customer (CustomerId,
                          DateCreated,
                          DateModified,
                          FirstName,
                          LastName,
                          Phone,
                          AddressId,
                          EmailAddress,
                          SpouseFirstName,
                          SpouceLastName,
                          HomeOwner)
select CustomerId,
       DateCreated,
       DateModified,
       FirstName,
       LastName,
       Phone,
       AddressId,
       EmailAddress,
       SpouseFirstName,
       SpouceLastName,
       HomeOwner
  from #Sample_dbo_Customer;