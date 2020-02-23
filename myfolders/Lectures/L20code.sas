/*Salary example*/
proc import datafile='/folders/myfolders/Lectures/salary.csv' 
out=salary
dbms=csv 
replace
;
run;

/*Main effects model;*/
proc glm data=salary plots=intplot;
     class E M ;
     Model S=E M;
run;

/*Model with interaction;*/
proc glm data=salary plots=intplot;
     class E M ;
     Model S=E M E*M;
run;
/*Model with interaction;*/
proc glm data=salary plots=diagnostics;
     class E(ref="1") M(ref="1") ;*CHECK "refs";
     Model S=E M E*M/SS1 SS2 SS3;
     output out=checkoutlier
     Rstudent=res;
run;


/*Model with interaction;*/
proc glm data=salary plots=diagnostics;
     class E(ref="1") M(ref="1") ;*CHECK "refs";
     Model S=E M E*M/SS1 SS2 SS3;
     output out=checkoutlier
     Rstudent=res;
run;


*Model with interaction;
proc glm data=salary plots=diagnostics;
     class E(ref="1") ;*CHECK "refs";
     Model S=E X E*X/SS1 SS2 SS3;
     output out=checkoutlier
     Rstudent=res;
run;

proc glm data=salary plots=diagnostics;
     class E(ref="1") ;*CHECK "refs";
     Model S=E X E*X/Solution;
     output out=checkoutlier
     Rstudent=res;
run;

proc glm data=salary plots=diagnostics;
     class E(ref="1") ;*CHECK "refs";
     Model S=E X/SS2;
     output out=checkoutlier
     Rstudent=res;
run;
proc glm data=salary plots=diagnostics;
     class E(ref="1") ;*CHECK "refs";
     Model S=E X/Solution;
     output out=checkoutlier
     Rstudent=res;
run;

data index1;
do obs=1 to 46;
output;
end;
run;
Data newdat;
set index1;
set salary;
run;

data newdat2; 
set newdat;
if obs =33 then delete;
run;


proc glm data=newdat2 plots=diagnostics;
     class E(ref="1") ;*CHECK "refs";
     Model S=E X M E*M/Solution;
     output out=checkoutlier
     Rstudent=res;
run;
