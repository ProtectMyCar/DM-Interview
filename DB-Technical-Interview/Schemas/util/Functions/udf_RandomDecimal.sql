--To use pass newid() as the seed.
create function util.udf_RandomDecimal (
  @pMin  float,
  @pMax  float,
  @pSeed uniqueidentifier
)
returns float
as
  begin
    declare @vBase float = (util.udf_randomInt(@pMin, @pMax, @pSeed));
    declare @vDecimal float = (cast(util.udf_randomInt(1, 1000, @pSeed) as float) / 1000);
    declare @vResult float = @vBase + @vDecimal;

    while @vResult > @pMax
    set @vResult = @vResult - (cast(util.udf_randomInt(1, 1000, @pSeed) as float) / 1000);

    return @vResult;
  end;
