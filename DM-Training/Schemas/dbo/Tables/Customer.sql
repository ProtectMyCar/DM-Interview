create table dbo.Customer (
  CustomerId      uniqueidentifier not null rowguidcol constraint PK_Customer primary key clustered constraint df_Customer_CustomerId default (newid()),
  DateCreated     datetime         not null constraint df_Customer_DateCreated default (getdate()),
  DateModified    datetime         not null constraint df_Customer_DateModified default (getdate()),
  FirstName       varchar(50)      not null,
  LastName        varchar(50)      not null,
  Phone           varchar(10)      not null,
  AddressId       uniqueidentifier not null constraint FK_Customer_Address foreign key references dbo.Address (AddressId),
  EmailAddress    varchar(250)     null,
  SpouseFirstName varchar(50)      null,
  SpouceLastName  varchar(50)      null,
  HomeOwner       varchar(3)       null
);
go

create nonclustered index IX_Customer_AddressId
  on dbo.Customer (AddressId asc);
go

create nonclustered index IX_Customer_DateCreated
  on dbo.Customer (DateCreated asc);
go

create nonclustered index IX_Customer_DateModified
  on dbo.Customer (DateModified asc);
go

create nonclustered index IX_Customer_FirstName
  on dbo.Customer (FirstName asc);
go

create nonclustered index IX_Customer_LastName
  on dbo.Customer (LastName asc);
go

create nonclustered index IX_Customer_Phone
  on dbo.Customer (Phone asc);
go

create nonclustered index IX_Customer_EmailAddress
  on dbo.Customer (EmailAddress);
go