declare @tAddress_zipcode util.UidCollection;

print 'dbo.address';

insert into @tAddress_zipcode (Id)
select zipcodeid
  from dbo.zipcode;

insert into dbo.Address (AddressId,
                         Address,
                         Address2,
                         City,
                         State,
                         Zip,
                         DateCreated,
                         DateModified)
select base.AddressID,
       base.Address,
       null      Address2,
       zc.city,
       zc.state,
       zc.postal,
       getdate() DateCreated,
       getdate() DateModified
  from (select top 300
               newid()                                        AddressID,
               sample.udf_randomStreetAddress(newid())        Address,
               util.udf_RandomUid(@tAddress_zipcode, newid()) ZipcodeId
          from sample.row) base
  join dbo.zipcode         zc on zc.ZipcodeId = base.ZipcodeId;
