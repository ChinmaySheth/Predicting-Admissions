/* The following is for question 3 */

data pvalue;
pvalue=(1-CDF("F", 0.196, 3, 44));
run;

/* The following code is for question 4 */ 

Proc import datafile='/folders/myfolders/cigarette.csv' 
out=cig
dbms=csv 
replace
;
run;

data cigData2;
input Income Price;
Datalines;
4000
40
;
run;

data cigData2;
set cig cigData2;
run;

Title "Cigarette Data";
proc reg Data=cigData2(keep=Sales Income Price) plot=none;
id Income Price;
model Sales = Income Price / r clm cli;
run;
