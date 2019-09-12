create function util.udf_RemoveProblematicCharacters (
  @pString  varchar(max),
  @pReplace varchar(10)
)
returns varchar(max)
as
  begin
    select @pString = replace(@pString, char(9), @pReplace); -- tab

    select @pString = replace(@pString, char(10), @pReplace); -- line feed

    select @pString = replace(@pString, char(13), @pReplace); -- carriage return

    select @pString = replace(@pString, '|', @pReplace);

    select @pString = replace(@pString, ',', @pReplace);

    select @pString = replace(@pString, '#', @pReplace);

    while charindex('  ', @pString) > 0
    select @pString = replace(@pString, '  ', ' ');

    return rtrim(ltrim(@pString));
  end;