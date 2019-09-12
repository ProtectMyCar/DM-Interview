create table dbo.ZipCode (
  State     varchar(50)      null,
  City      varchar(50)      null,
  Postal    varchar(10)      null,
  Latitude  float(53)        null,
  Longitude float(53)        null,
  ZipCodeId uniqueidentifier not null rowguidcol constraint PK_ZipCode primary key
    constraint DF_ZipCode_ZipCodeId default (newid()),
);
