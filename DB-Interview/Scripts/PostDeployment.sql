print '- Executing Post Deployment Scripts for $(DatabaseName) database';
 

  

-- Apply sample data
if  '$(apply_sample_data)' = 'true'
and '$(apply_seed_data)' = 'true'
  begin
    print '-- Adding sample Data for $(DatabaseName) database';

	--Sample Schema Scripts
	if not exists (select '1' from sys.schemas where name = 'sample')
	begin 
      exec ('create schema sample authorization dbo;');
         :r ..\Schemas\sample\Tables\Row.sql
         :r ..\Schemas\sample\Scripts\Row.sql
         :r ..\Schemas\sample\Tables\FirstName.sql
         :r ..\Schemas\sample\Scripts\FirstName.sql
         :r ..\Schemas\sample\Tables\LastName.sql
         :r ..\Schemas\sample\Scripts\LastName.sql
         :r ..\Schemas\sample\Tables\Street.sql
         :r ..\Schemas\sample\Scripts\Street.sql
	  
  	   --:r ..\Schemas\sample\Types\UidCollection.sql --TODO Need to research solution for creating types in a post deploy script.
	  
       :r ..\Schemas\Sample\Functions\udf_RandomFirstName.sql
       :r ..\Schemas\Sample\Functions\udf_RandomLastName.sql
       :r ..\Schemas\Sample\Functions\udf_RandomStreetAddress.sql
  	   :r ..\Schemas\Sample\Functions\udf_LoremIpsum.sql
	 end
  end;
go

if  '$(apply_sample_data)' = 'true'
and '$(apply_seed_data)' = 'true'
  begin
       --Sample Data Scripts
	   :r ..\Schemas\dbo\Scripts\SampleData\ZipCode.sql
	   :r ..\Schemas\dbo\Scripts\SampleData\address.sql
       :r ..\Schemas\dbo\Scripts\SampleData\Vehicle.sql
       :r ..\Schemas\dbo\Scripts\SampleData\Customer.sql
       :r ..\Schemas\dbo\Scripts\SampleData\CustomerVehicle.sql
       :r ..\Schemas\dbo\Scripts\SampleData\Contract.sql
  end;
else
  print '-- Sample data is disabled, (you can adjust the local value (user setting) of ''apply_sample_data'' in DB-PAC project properties on the SQLCMD Variables tab';
