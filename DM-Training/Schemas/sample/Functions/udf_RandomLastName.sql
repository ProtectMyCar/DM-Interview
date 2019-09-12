exec('create function sample.udf_RandomLastName (
  @pSeed uniqueidentifier
)
returns varchar(50)
as
  begin
    declare @vSize int = (select top (1) lastNameId from sample.LastName order by LastNameId desc)
    declare @vRow int = util.udf_RandomInt(1, @vSize, @pSeed);

    return (select top 1 name from sample.LastName where LastNameId = @vRow);
  end;')
