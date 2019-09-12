--To use pass newid() as the seed.
create function util.udf_RandomInt (
  @pMin  int,
  @pMax  int,
  @pSeed uniqueidentifier
)
returns int
as
  begin
    declare @vRange int = @pMax - @pMin;
    declare @vResult int = ((abs(cast(cast(@pSeed as varbinary) as int))) % (@vRange + 1));

    set @vResult = @pMin + @vResult;

    return @vResult;
  end;
