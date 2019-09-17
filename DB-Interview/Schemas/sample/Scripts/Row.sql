insert into sample.row (scratch)
select '1';

while (select count(1)from sample.row) < 500000
  begin
    insert into sample.row (scratch)
    select '1'
      from sample.row;
  end;