create function util.udf_RandomUid (
  @pCollection util.UidCollection readonly,
  @pSeed       uniqueidentifier
)
returns uniqueidentifier
as
  begin
    declare @pSize int = (select top (1) rowNumber from @pCollection order by rowNumber desc);
    declare @vRandomRecord int = util.udf_RandomInt(1, @pSize, @pSeed);

    return (select Id from @pCollection where rowNumber = @vRandomRecord);
  end;
