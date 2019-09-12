create table dbo.CustomerVehicle (
  CustomerVehicleId     uniqueidentifier not null rowguidcol constraint PK_CustomerVehicle primary key clustered constraint df_CustomerVehicle_CustomerVehicleId default (newid()),
  CustomerId            uniqueidentifier not null constraint FK_CustomerVehicle_Customer foreign key references dbo.Customer (CustomerId),
  VehicleId             uniqueidentifier constraint FK_CustomerVehicle_Vehicle foreign key references dbo.Vehicle (VehicleId),
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
  DateCreated           datetime         null constraint df_CustomerVehicle_DateCreated default (getdate()),
  Modifications         bit              null,
  PreExistingConditions bit              null,
  DateModified          datetime         null constraint df_CustomerVehicle_DateModified default (getdate())
);
go

create nonclustered index IX_CustomerVehicle_CustomerId
  on dbo.CustomerVehicle (CustomerId asc);
go

create nonclustered index ix_CustomerVehicle_DateCreated
  on dbo.CustomerVehicle (DateCreated);
go

create nonclustered index ix_CustomerVehicle_DateModified
  on dbo.CustomerVehicle (DateModified);
go