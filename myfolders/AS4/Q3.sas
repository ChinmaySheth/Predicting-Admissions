proc import datafile='/folders/myfolders/Lectures/guineapigs.csv' 
out=guineapigs
dbms=csv 
replace
;
run;

proc glm data=guineapigs plots=diagnostics;
	class supp;
	model len = dose supp dose*supp/solution;
run;
