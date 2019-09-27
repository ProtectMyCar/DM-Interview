create table dbo.Vehicle (
  VehicleId                uniqueidentifier not null rowguidcol constraint PK_Vehicle primary key
    constraint DF_Vehicle_VehicleId default (newid()),
  VinPattern               varchar(17)      not null,
  VehicleYear              varchar(4)       null,
  Make                     varchar(25)      null,
  Model                    varchar(30)      null,
  Trim                     varchar(50)      null,
  Style                    varchar(255)     null,
  VehicleType              varchar(255)     null,
  BodyType                 varchar(255)     null,
  BodySubType              varchar(255)     null,
  Doors                    varchar(255)     null,
  MSRP                     varchar(255)     null,
  Plant                    varchar(255)     null,
  RestraintType            varchar(255)     null,
  GVWRange                 varchar(255)     null,
  Length                   varchar(255)     null,
  Height                   varchar(255)     null,
  Width                    varchar(255)     null,
  WheelBase                varchar(255)     null,
  CurbWeight               varchar(255)     null,
  GrossVehicleWeightRating varchar(255)     null,
  TMPWheelDiamiter         varchar(255)     null,
  TMPTake1Gallon           varchar(255)     null,
  MaxPayload               varchar(255)     null,
  Tonnage                  varchar(255)     null,
  WidthNoMirros            varchar(255)     null,
  LengthNoBumpers          varchar(255)     null,
  DriveType                varchar(255)     null,
  FuelType                 varchar(255)     null,
  DefEngineBlock           varchar(255)     null,
  DefEngineCylinders       varchar(255)     null,
  DefEngineSize            varchar(255)     null,
  EngineSizeOUM            varchar(255)     null,
  DefEngineAspriation      varchar(255)     null,
  DefTransType             varchar(255)     null,
  PolicyClass              varchar(2)       null,
  DefTransSpeed            varchar(255)     null,
  DateCreated              datetime         null constraint df_Vehicle_DateCreated default (getdate()),
  AmbassadorClass          varchar(2)       null,
  DiamondClass             varchar(2)       null,
  DateModified             datetime         null constraint df_Vehicle_DateModified default (getdate()),
);
go

create nonclustered index IX_Vehicle_Make
  on dbo.Vehicle (Make asc);
go

create nonclustered index IX_Vehicle_Make_Model
  on dbo.Vehicle (Make asc, Model asc)
  include (Trim, VehicleYear);
go

create nonclustered index IX_Vehicle_Model
  on dbo.Vehicle (Model asc);
go

create nonclustered index IX_Vehicle_Style
  on dbo.Vehicle (Style asc);
go

create nonclustered index IX_Vehicle_Trim
  on dbo.Vehicle (Trim asc);
go

create nonclustered index IX_Vehicle_VehicleYear
  on dbo.Vehicle (VehicleYear asc);
go

create nonclustered index IX_Vehicle_VinPattern
  on dbo.Vehicle (VinPattern asc);
go

create nonclustered index ix_Vehicle_DateCreated
  on dbo.Vehicle (DateCreated);
go

create nonclustered index ix_Vehicle_DateModified
  on dbo.Vehicle (DateModified);
go

create nonclustered index ix_Vehicle_PolicyClass
  on dbo.Vehicle (PolicyClass)
  include (VehicleYear, Make, Model, DateCreated);
go
;

create nonclustered index ix_Vehicle_AmbassadorClass
  on dbo.Vehicle (AmbassadorClass)
  include (VehicleYear, Make, Model, DateCreated);
go
;
create nonclustered index ix_Vehicle_DiamondClass
  on dbo.Vehicle (DiamondClass)
  include (VehicleYear, Make, Model, DateCreated);
go
;

create trigger dbo.trig_Vehicle_Update
on dbo.Vehicle
after update
as
  begin
    if session_context(N'DisableTriggers') = 'Yes'
      begin
        print 'Triggers Disabled';

        return;
      end;

    update a
       set DateModified = getdate()
      from dbo.Vehicle a
      join Inserted    i on i.VehicleId = a.VehicleId;
  end;
