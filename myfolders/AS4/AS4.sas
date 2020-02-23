proc import datafile='/folders/myfolders/AS4/A3-Q3.csv'
out=dat
dbms=csv
replace
;
run;

/*Forward selection on Assignment 3 Question 3 Data 
proc reg Data=dat plots=none;
model Y=X1 X2 X3 X4 X5 X6/Selection=forward SLENTRY=0.05;

/*Backwards selection on Assignment 3 Question 3 Data 
proc reg Data=dat plots=none;
model Y=X1 X2 X3 X4 X5 X6/Selection=backward SLSTAY=0.05;

/*Reduced model forward selection
Title "Forward Selection Model Diagnostics";
proc reg Data=dat plots=diagnostics;
model Y=X4 X6;
run;

/*Reduced model backward elimination
Title "Backward Elimination Model Diagnostics";
proc reg Data=dat plots=diagnostics;
model Y=X1 X2 X3 X4;
run;
*/

/*Criteria based selection */

Title "A3Q3 Data AIC";
proc reg Data=dat;
model Y=X1 X2 X3 X4 X5 X6/Selection= Cp AIC;
run;

Title "A3Q3 Data BIC";
proc reg Data=dat;
model Y=X1 X2 X3 X4 X5 X6/Selection= Cp BIC;
run;
*/