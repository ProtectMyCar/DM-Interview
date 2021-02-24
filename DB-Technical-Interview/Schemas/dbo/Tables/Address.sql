create table dbo.Address (
  AddressId    uniqueidentifier not null rowguidcol constraint PK_Address primary key clustered constraint df_Address_AddressId default (newid()),
  Address      varchar(250)     null,
  Address2     varchar(250)     null,
  City         varchar(150)     null,
  State        varchar(2)       null,
  Zip          varchar(9)       null,
  DateCreated  datetime         null constraint df_Address_DateCreated default (getdate()),
  DateModified datetime         null constraint df_Address_DateModified default (getdate()),
);
go

create nonclustered index IX_Address_Address
  on dbo.Address (Address asc);
go

create nonclustered index IX_Address_Zip
  on dbo.Address (Zip asc);
go

create nonclustered index IX_Address_State
  on dbo.Address (State asc);
go

create nonclustered index IX_Address_City
  on dbo.Address (City asc);
go

create nonclustered index ix_Address_DateCreated
  on dbo.Address (DateCreated desc);
go

create nonclustered index ix_Address_DateModified
  on dbo.Address (DateModified desc);
go