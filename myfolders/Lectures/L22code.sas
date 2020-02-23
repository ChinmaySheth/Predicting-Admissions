/*Nuclear example*/
proc import datafile='/folders/myfolders/Lectures/nuclear-noname.csv' 
out=dat
dbms=csv 
replace
;
run;

/*Test Based Selection -- Backward Selection*/
Title "Backward Selection";
proc reg Data=dat plot=none;
model cost=x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 /Selection=Backward SLStay=0.5;
run;

/*Test Based Selection -- Forward Selection*/
Title "Forward Selection";
proc reg Data=dat plot=none;
model cost=x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 /Selection=Forward SLEntry=0.5;
run;

*Manually;
Title "Forward Selection: stage 1";
proc reg Data=dat plot=none;
model cost=x1;
model cost=x2;
model cost=x3;
model cost=x4;
model cost=x5;
model cost=x6;
model cost=x7;
model cost=x8;
model cost=x9;
model cost=x10;
run;

Title "Forward Selection: stage 2";
proc reg Data=dat plot=none;
model cost=x1 x2;
model cost=x1 x3;
model cost=x1 x4;
model cost=x1 x5;
model cost=x1 x6;
model cost=x1 x7;
model cost=x1 x8;
model cost=x1 x9;
model cost=x1 x10;
run;

Title "Forward Selection: stage 3";
proc reg Data=dat plot=none;
model cost=x1 x4 x2;
model cost=x1 x4 x3;
model cost=x1 x4 x5;
model cost=x1 x4 x6;
model cost=x1 x4 x7;
model cost=x1 x4 x8;
model cost=x1 x4 x9;
model cost=x1 x4 x10;
run;


/*Test Based Selection -- Stepwise Selection*/
Title "Stepwise Selection";
proc reg Data=dat plot=none;
model cost=x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 /Selection=Stepwise SLStay=0.5 SLEntry=0.5;
run;

*Manually;
Title "Stepwise Selection: stage 1";
proc reg Data=dat plot=none;
model cost=x1;
model cost=x2;
model cost=x3;
model cost=x4;
model cost=x5;
model cost=x6;
model cost=x7;
model cost=x8;
model cost=x9;
model cost=x10;
run;

Title "Stepwise Selection: stage 2";
proc reg Data=dat plot=none;
model cost=x1 x2;
model cost=x1 x3;
model cost=x1 x4;
model cost=x1 x5;
model cost=x1 x6;
model cost=x1 x7;
model cost=x1 x8;
model cost=x1 x9;
model cost=x1 x10;
run;

Title "Stepwise Selection: stage 3";
proc reg Data=dat plot=none;
model cost=x1 x4 x2;
model cost=x1 x4 x3;
model cost=x1 x4 x5;
model cost=x1 x4 x6;
model cost=x1 x4 x7;
model cost=x1 x4 x8;
model cost=x1 x4 x9;
model cost=x1 x4 x10;
run;

Title "Stepwise Selection: stage 4";
proc reg Data=dat plot=none;
model cost=x1 x4 x10 x2;
model cost=x1 x4 x10 x3;
model cost=x1 x4 x10 x5;
model cost=x1 x4 x10 x6;
model cost=x1 x4 x10 x7;
model cost=x1 x4 x10 x8;
model cost=x1 x4 x10 x9;
run;

Title "Stepwise Selection: stage 5";
proc reg Data=dat plot=none;
model cost=x1 x4 x10 x6 x2;
model cost=x1 x4 x10 x6 x3;
model cost=x1 x4 x10 x6 x5;
model cost=x1 x4 x10 x6 x7;
model cost=x1 x4 x10 x6 x8;
model cost=x1 x4 x10 x6 x9;
run;

*Final stages;
proc reg Data=dat plot=none;
model cost=x1 x3 x4 x5 x6 x9 x10;
run;

proc reg Data=dat plot=none;
model cost=x1 x3 x4 x5 x6 x7 x9 x10;
run;

proc reg Data=dat plot=none;
model cost=x1 x3 x4 x5 x6 x7 x9;
run;
