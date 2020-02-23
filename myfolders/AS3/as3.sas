/* Importing the cherry tree data */
Proc import datafile='/folders/myfolders/AS3/trees.csv' 
out=cherryTree
dbms=csv 
replace
;
run;

/* Diagnostic Plots */

/* Residuals vs Regressors */

title "Multiple Linear Regression Model -- Cherry Tree Data";
 proc REG data=cherryTree plots(only)=Residualplot;
     model Volume = Diameter Height;
run;


/*Partial Regression Plots*/

title "Multiple Linear Regression Model -- Cherry Tree Data";
 proc REG data=cherryTree ;
     model Volume = Diameter Height/ partial;
run;


/*Residuals vs Fitted values*/

title "Multiple Linear Regression Model -- Cherry Tree Data";
 proc REG data=cherryTree plots(only)=residualbypredicted;
     model Volume = Diameter Height;
run;


/*Normal QQ plot*/

title "Multiple Linear Regression Model -- Cherry Tree Data";
 proc REG data=cherryTree plots(only)=QQPLOT;
     model Volume = Diameter Height;
     output out=cherryTreeRes
		residual=Res
		Student=Stdres
		Rstudent=Rstdred
		predicted=yhat;
run;

/* Diagnostic Plots */

/* Transformed QQ Plot */

data cherryTreeModif; set cherryTree;
logVol = log(Volume);
run;

/* Diagnostic Plots */
title "Multiple Linear Regression Model -- Cherry Tree Data";
proc REG data=cherryTreeModif plots=all;
	model logVol = Diameter Height ;
run;

title "Multiple Linear Regression Model -- Cherry Tree Data";
proc REG data=cherryTreeModif plots(only)=QQPLOT;
	model logVol = Diameter Height;
run;

title "Multiple Linear Regression Model -- Cherry Tree Data";
 proc REG data=cherryTreeModif ;
     model logVol = Diameter Height/ partial;
run;

