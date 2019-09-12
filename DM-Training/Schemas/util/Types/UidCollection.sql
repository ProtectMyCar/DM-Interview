create type util.UidCollection as table (
  rowNumber int identity(1, 1) primary key clustered,
  Id        uniqueidentifier
);
