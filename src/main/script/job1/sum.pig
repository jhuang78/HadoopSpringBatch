REGISTER $udf USING jython AS udf;

input_data = LOAD '$db.data_with_id' USING org.apache.hcatalog.pig.HCatLoader();

output_data = FOREACH input_data GENERATE
	udf.uid() AS id, 
	f1+f2+f3 AS sum;

rmf $warehouse/sum/
mkdir $warehouse/sum/
STORE output_data INTO '$db.sum' USING org.apache.hcatalog.pig.HCatStorer();