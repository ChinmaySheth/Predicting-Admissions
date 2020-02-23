/*cigarette example*/
proc import datafile='/folders/myfolders/Lectures/cigarette.csv' 
out=cig
dbms=csv 
replace
;
run;

/*
Run the Full Model (with all variables)
*/
Title "Full Model";
proc reg Data=cig plot=none;
model Sales=Age	HS	Income	Black	Female	Price ;
run;

/*Forward, Backward, Stepwise Selection*/
proc reg Data=cig plot=none;
model Sales=Age	HS	Income	Black	Female	Price/Selection=forward SLEntry=0.1;
run;


proc reg Data=cig plot=none;
model Sales=Age	HS	Income	Black	Female	Price/Selection=Backward SLStay=0.1;
run;


proc reg Data=cig plot=none;
model Sales=Age	HS	Income	Black	Female	Price/Selection=stepwise SLEntry=0.1 SLStay=0.1;
run;

*Reduced model;
proc reg Data=cig plot=none;
model Sales=Age	Income	Price;
run;

/*Criteria-based Selection*/
Title "All subset";
proc reg Data=cig plot=none outest=outAIC;
model Sales=Age	HS	Income	Black	Female	Price/Selection=CP AdjRsq AIC BIC;
run;


Title "Adjusted R^2";
proc reg Data=cig;
model Sales=Age	HS	Income	Black	Female	Price/selection=AdjRsq ;
run;

Title "C_p";
proc reg Data=cig plots=cp;
model Sales=Age	HS	Income	Black	Female	Price/selection=Cp ;
run;


Title "AIC BIC";
proc reg Data=cig;
model Sales=Age	HS	Income	Black	Female	Price/Selection= Cp AIC BIC;
run;


