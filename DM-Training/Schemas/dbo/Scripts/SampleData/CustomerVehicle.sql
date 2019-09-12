print '--- dbo.CustomerVehicle';

declare @vCustomerVehicle_Records int = (select count(1)from dbo.Customer) * 1.5;

if (select count(1)from dbo.CustomerVehicle) >= @vCustomerVehicle_Records
  set @vCustomerVehicle_Records = 1;

if object_id('TempDB..#Sample_dbo_CustomerVehicle') is not null
  drop table #Sample_dbo_CustomerVehicle;

create table #Sample_dbo_CustomerVehicle (
  CustomerVehicleId     uniqueidentifier null,
  CustomerId            uniqueidentifier null,
  VehicleId             uniqueidentifier null,
  VehicleYear           varchar(4)       null,
  Make                  varchar(25)      null,
  Model                 varchar(30)      null,
  Trim                  varchar(50)      null,
  Style                 varchar(255)     null,
  Mileage               int              null,
  Year                  int              null,
  VINNumber             varchar(20)      null,
  Turbo                 bit              null,
  SuperCharger          bit              null,
  Hybrid                bit              null,
  AWD                   bit              null,
  AWS                   bit              null,
  Dually                bit              null,
  FourByFour            bit              null,
  OneTon                bit              null,
  V10                   bit              null,
  Diesel                bit              null,
  PolicyClass           varchar(5)       null,
  DateCreated           datetime         null,
  Modifications         bit              null,
  PreExistingConditions bit              null,
  DateModified          datetime         null
);

declare @vCustomerVehicle_Vehicle util.UidCollection;

insert into @vCustomerVehicle_Vehicle (Id)
select VehicleId
  from dbo.Vehicle;

declare @vCustomerVehicle_Customer util.UidCollection;

insert into @vCustomerVehicle_Customer (Id)
select CustomerId
  from dbo.Customer;

insert into #Sample_dbo_CustomerVehicle (CustomerVehicleId,
                                         CustomerId,
                                         VehicleId,
                                         VehicleYear,
                                         Make,
                                         Model,
                                         Trim,
                                         Style,
                                         Mileage,
                                         Year,
                                         VINNumber,
                                         Turbo,
                                         SuperCharger,
                                         Hybrid,
                                         AWD,
                                         AWS,
                                         Dually,
                                         FourByFour,
                                         OneTon,
                                         V10,
                                         Diesel,
                                         PolicyClass,
                                         DateCreated,
                                         Modifications,
                                         PreExistingConditions,
                                         DateModified)
select top (@vCustomerVehicle_Records)
       newid()                                                                                                                                CustomerVehicleId,
       util.udf_RandomUid(@vCustomerVehicle_Customer, newid())                                                                                CustomerId,
       util.udf_RandomUid(@vCustomerVehicle_Vehicle, newid())                                                                                 VehicleId,
       null                                                                                                                                   VehicleYear,
       null                                                                                                                                   Make,
       null                                                                                                                                   Model,
       null                                                                                                                                   Trim,
       null                                                                                                                                   Style,
       util.udf_RandomInt(1000, 18000, newid())                                                                                               Mileage,
       null                                                                                                                                   Year,
       cast(util.udf_RandomInt(1, 9, newid()) as varchar(1)) + 'HGBH41JXMN' + cast(util.udf_RandomInt(100000, 999999, newid()) as varchar(6)) VinNumber,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    Turbo,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    SuperCharger,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    Hybrid,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    AWD,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    AWS,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    Dually,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    FourByFour,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    OneTon,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    V10,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    Diesel,
       null                                                                                                                                   PolicyClass,
       null                                                                                                                                   DateCreated,
       case when util.udf_RandomInt(1, 100, newid()) < 10 then 1 else 0 end                                                                   Modifications,
       case when util.udf_RandomInt(1, 100, newid()) < 5 then 1 else 0 end                                                                    PreExistingConditions,
       null                                                                                                                                   DateModified
  from sample.Row;

update sCV
   set sCV.VehicleYear = v.VehicleYear,
       sCV.Make = v.Make,
       sCV.Model = v.Model,
       sCV.Trim = v.Trim,
       sCV.Style = v.Style,
       sCV.Mileage = sCV.Mileage * ((datepart(year, getdate()) - v.VehicleYear) + 1),
       sCV.DateCreated = c.DateCreated
  from #Sample_dbo_CustomerVehicle sCV
  join dbo.Vehicle                 v on v.VehicleId = sCV.VehicleId
  join dbo.Customer                c on c.CustomerId = sCV.CustomerId;

insert into dbo.CustomerVehicle (CustomerVehicleId,
                             CustomerId,
							 VehicleId,
                             VehicleYear,
                             Make,
                             Model,
                             Trim,
                             Style,
                             Mileage,
                             Year,
                             VINNumber,
                             Turbo,
                             SuperCharger,
                             Hybrid,
                             AWD,
                             AWS,
                             Dually,
                             FourByFour,
                             OneTon,
                             V10,
                             Diesel,
                             PolicyClass,
                             DateCreated,
                             Modifications,
                             PreExistingConditions,
                             DateModified)
select CustomerVehicleId,
       CustomerId,
       VehicleId,
       VehicleYear,
       Make,
       Model,
       Trim,
       Style,
       Mileage,
       Year,
       VINNumber,
       Turbo,
       SuperCharger,
       Hybrid,
       AWD,
       AWS,
       Dually,
       FourByFour,
       OneTon,
       V10,
       Diesel,
       PolicyClass,
       DateCreated,
       Modifications,
       PreExistingConditions,
       DateModified
  from #Sample_dbo_CustomerVehicle;