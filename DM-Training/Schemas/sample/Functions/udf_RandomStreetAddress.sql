exec ('create function sample.udf_RandomStreetAddress (
  @pSeed uniqueidentifier
)
returns varchar(105)
as
  begin
    declare @vSize int = (select top (1) StreetId from sample.Street order by streetId desc)
    declare @vRow int = util.udf_RandomInt(1, @vSize, @pSeed);

    return (select top 1
                   cast(@vRow as varchar(4)) + '' '' + street
              from sample.street
             where streetId = @vRow);
  end;');