create table dbo.Contract (
  ContractId        uniqueidentifier not null rowguidcol constraint PK_Contract primary key clustered constraint df_Contract_ContractId default (newid()),
  InternalId        int              identity(3000, 1) not for replication not null,
  CustomerId        uniqueidentifier not null constraint FK_Contract_Customer foreign key references dbo.Customer (CustomerId),
  DateCreated       datetime         not null,
  DateCancelled     datetime         null,
  CustomerVehicleId uniqueidentifier not null constraint FK_Contract_CustomerVehicle foreign key references dbo.CustomerVehicle (CustomerVehicleId),
  DateModified      datetime         null constraint df_Contract_DateModified default (getdate())
);
go

create nonclustered index IX_Contract_CustomerId
  on dbo.Contract (CustomerId asc);
go

create unique nonclustered index UN_Contract_InternalId
  on dbo.Contract (InternalId);
go

create nonclustered index IX_Contract_CustomerVehicleId
  on dbo.Contract (CustomerVehicleId asc);
go

create nonclustered index IX_Contract_InternalId
  on dbo.Contract (InternalId asc);
go

go

create nonclustered index ix_Contract_DateModified
  on dbo.Contract (DateModified desc);
go