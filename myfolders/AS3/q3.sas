PROC IMPORT DATAFILE='/folders/myfolders/AS3/A3-Q3.csv'
out=as3
dbms=csv
replace
;
run;

PROC REG DATA=as3 plots(label)=(CooksD RStudentByLeverage DFFITS DFBETAS);
		/*id X1 X2 X3 X4 X5 X6;*/
	model Y = X1 X2 X3 X4 X5 X6;
	run;
	
data idx;
do obs = 1 to 40;
output;
end;
run;

data modifas3;
set idx;
set as3;
run;

data modifas31;
set modifas3;
if obs= 34 or obs=38 then delete;
run;

PROC REG DATA=modifas31 plots(label)=(CooksD RStudentByLeverage DFFITS DFBETAS);
		/*id X1 X2 X3 X4 X5 X6;*/
	model Y = X1 X2 X3 X4 X5 X6;
	run;
