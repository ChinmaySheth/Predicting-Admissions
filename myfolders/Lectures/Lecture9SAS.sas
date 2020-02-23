libname L9 '/folders/myfolders/Lectures/L9';
run;


/*
Import the cigarette data set to R
*/
Proc import datafile='/folders/myfolders/cigarette.csv' 
out=cig
dbms=csv 
replace
;
run;

/*
Initial Visualization of the data
*/
proc sgscatter data=cig;
  matrix _numeric_;
  run;

/*
Run the Full Model (with all variables)
*/
Title "Full Model";
proc reg Data=cig plot=none;
model Sales=Age	HS	Income	Black	Female	Price ;
run;

Title "Reduced Model";
proc reg Data=cig plot=none;
model Sales=Income	Price ;
run;

data pvalue;
pvalue=(1-CDF("F",1.143,4,44));
run;


/*
Prediction using the reduced model
*/
Title "Reduced Model";
proc Reg data=cig plots=None noprint;
model Sales=Income	Price/alpha=0.01;
OUTPUT Out=cigpred
Predicted=Pred
LCLM=LowerCI
UCLM=UpperCI
LCL=LowerPI
UCL=UpperPI;
run;
