--TODO Replace util.UidCollection with this, Need to research solution for creating types in a post deploy script.
exec (
'create type sample.UidCollection as table (
  rowNumber int identity(1, 1) primary key clustered,
  Id        uniqueidentifier
);');
