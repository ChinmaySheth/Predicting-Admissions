proc import datafile= "/folders/myfolders/Lectures/survival.csv"
out=survivalData
dbms=csv
replace
;
run;

/* Initial plot of survival rate vs radiation levels in rats with different dosages  */
proc sgplot data=survivalData;
scatter y=survival x=dosage;
title "Survival Rate of Rats with Different Dosages";
run;


/* Plot of applying a LOG transformation to the survival variable */
data survivalData1; set survivalData;

logY = log(survivalData);
proc reg data=survivalData1;
model logY= dosage;
title "Log Model of Survival Rate of Rats with Different Dosages";
run;


*proc print data = survivalData1; 
*title"Radiation-Transformed -- Survival Rate of Rats with Different Dosages";
*run;


*obtain st.dev;
proc means data=survivalData1 N Mean STD;
var logY;
by dosage;
run;


data survivalData2;
set survivalData1;
if dosage=117.5 then wt=1/(0.1102160)**2;
else if dosage=235 then wt=1/(0.0934482)**2;
else if dosage=470 then wt=1/(0.2695898)**2;
else if dosage=705 then wt=1/(0.1279829)**2;
else if dosage=940 then wt=1/(0.5455684)**2;
else wt=1/(0.8235134)**2;

title "Weighted model";
proc reg data=survivalData2;
model logY= dosage;
weight wt;
output out=fitres
residual=res
predicted=fitted;

title "Weighted Model -- Survival Rate of Rats with Different Dosages";

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