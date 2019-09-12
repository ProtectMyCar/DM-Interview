exec('create function sample.udf_RandomFirstName (
  @pSeed uniqueidentifier
)
returns varchar(50)
as
  begin
    declare @vSize int = (select top(1) FirstNameId from sample.FirstName order by FirstNameId desc)
    declare @vRow int = util.udf_RandomInt(1, @vSize, @pSeed);

    return (select top 1 Name from sample.FirstName where FirstNameId = @vRow);
  end;')
