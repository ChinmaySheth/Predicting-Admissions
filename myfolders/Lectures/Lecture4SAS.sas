PROC IMPORT datafile='/folders/myfolders/comprepairsubset.csv'
out=comprepair
dbms=csv
replace
; 
run;

title "Simple Linear Regression Model -- Computer Repair Data";
 proc REG data=comprepair Plot=none;
     model y =x;
run;

data pvalue;
p1=(1-CDF("T",6.511,4))*2;
run;
