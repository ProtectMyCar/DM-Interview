--TODO: Improve random data generation with random values for bit fields.

--Limited by variable and dbo.Contract

declare @vContract_Records int = (select count(1)from dbo.CustomerVehicle) * .50;

print '--- dbo.Contract';

if not exists (select 'x' from dbo.Contract)
  begin
    print '---- Reseed identity for dbo.Contract';

    dbcc checkident('dbo.Contract', reseed, 700000);
  end;
else
  print '---- Skipping Reseed of identity for dbo.Contract, data exists already';

if object_id('TempDB..#Sample_dbo_Contract') is not null
  drop table #Sample_dbo_Contract;

create table #Sample_dbo_Contract (
  ContractId        uniqueidentifier null,
  CustomerId        uniqueidentifier null,
  DateCreated       datetime         null,
  DateCancelled     datetime         null,
  CustomerVehicleId uniqueidentifier null,
  DateModified      datetime         null
);

declare @vContract_Customer util.UidCollection;

insert into @vContract_Customer (Id)
select CustomerId
  from dbo.Customer;

declare @vContract_CustomerVehicle util.UidCollection;

insert into @vContract_CustomerVehicle (Id)
select CustomerVehicleId
  from dbo.CustomerVehicle;

;

insert into #Sample_dbo_Contract (ContractId,
                                  CustomerId,
                                  DateCreated,
                                  DateCancelled,
                                  CustomerVehicleId,
                                  DateModified)
select top (@vContract_Records)
       newid()                                                 ContractId,
       util.udf_RandomUid(@vContract_Customer, newid())        CustomerId,
       null                                                    DateCreated,
       null                                                    DateCancelled,
       util.udf_RandomUid(@vContract_CustomerVehicle, newid()) CustomerVehicleId,
       null                                                    DateModified
  from sample.Row;

update sC
   set sC.DateCreated = cv.DateCreated,
       sC.DateCancelled = case when util.udf_RandomInt(0, 100, newid()) < 60
                               then dateadd(day, util.udf_RandomInt(1, 60, newid()), cv.DateCreated)
                               else null end
  from #Sample_dbo_Contract sC
  join dbo.Customer         c on c.CustomerId = sC.CustomerId
  join dbo.CustomerVehicle  cv on cv.CustomerVehicleId = sC.CustomerVehicleId;

update sC
   set sC.DateCancelled = case when sC.DateCancelled < getdate()
                                 or sC.DateCancelled is null
                               then sC.DateCancelled
                               else getdate()end
  from #Sample_dbo_Contract sC;

-- Fix duplicate CustomerVehicleId's
while (select top (1)
              count(1)
         from #Sample_dbo_Contract sc
        group by sc.CustomerVehicleId
       having count(1) > 1) is not null
  begin
    update sC
       set sC.CustomerVehicleId = util.udf_RandomUid(@vContract_CustomerVehicle, newid())
      from #Sample_dbo_Contract sC
     where sC.ContractId in (select duplicates.ContractId
                               from (select row_number() over (partition by CustomerVehicleId order by DateCreated) Entry,
                                            ContractId,
                                            CustomerVehicleId
                                       from #Sample_dbo_Contract) duplicates
                              where duplicates.Entry > 1);
  end;

insert into dbo.Contract
select *
  from #Sample_dbo_Contract;
