libname lab4b "/folders/myshortcuts/SASUniversityEdition/myfolders/Lab 4/";
proc import datafile= "/folders/myshortcuts/SASUniversityEdition/myfolders/Lab 4/survival.csv"
out=lab4b.survival
dbms=csv
replace
;
run;
proc sgplot data=lab4b.survival;
scatter y=survival x=dosage;
title "Survival rate of rats at different dosage no modif";
run;
*transform to log;
data lab4bmodif; set lab4b.survival;
logY = log(survival);
proc reg data=lab4bmodif;
model logY= dosage;
title "Log model";
run;
proc print data = lab4bmodif; 
title"survival rate of rats for varying doses of radiation-transformed";
run;
*obtain st.dev;
proc means data=lab4bmodif N Mean STD;
var logY;
by dosage;
run;
data lab4modifwt;
set lab4bmodif;
if dosage=117.5 then wt=1/(0.1102160)**2;
else if dosage=235 then wt=1/(0.0934482)**2;
else if dosage=470 then wt=1/(0.2695898)**2;
else if dosage=705 then wt=1/(0.1279829)**2;
else if dosage=940 then wt=1/(0.5455684)**2;
else wt=1/(0.8235134)**2;
title "Weighted model";
proc reg data=lab4modifwt;
model logY= dosage;
weight wt;
output out=fitres
residual=res
predicted=fitted;
title "Weighted model";
run;
*Create weighted residual;
data fitres;
set fitres;
weightedres=res*sqrt(wt);
title "Weighted model";
run;
*plot sqrt{wt}*residual for diagonosis ;
proc sgplot data=fitres;
scatter x=fitted y=weightedres;
title "Weighted model";
run;

run;