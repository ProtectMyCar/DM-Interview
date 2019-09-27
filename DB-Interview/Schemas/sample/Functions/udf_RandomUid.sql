--Grabs a random id from a collection
--TODO Replace util.udf_RandomUid with this, Need to research solution for creating types in a post deploy script.
exec('create function sample.udf_RandomUid (
  @pCollection sample.UidCollection readonly,
  @pSeed       uniqueidentifier
)
returns uniqueidentifier
as
  begin
    declare @vRandomRecord int = util.udf_RandomInt(1, (select count(1)from @pCollection), @pSeed);

	return (select Id from @pCollection where rowNumber = @vRandomRecord)

  end;')

