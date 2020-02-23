/*Data imported as L8.marketing*/
/*Pairs Scatterplot*/

proc corr data=L8.marketing plots=matrix(histogram); 
run;

/*Regression Models*/
title "Simple Linear Regression Model -- Marketing Data";
 proc REG data=L8.marketing Plot=none;
     model sales =facebook;
run;

title "Simple Linear Regression Model -- Marketing Data";
 proc REG data=L8.marketing Plot=none;
     model sales =youtube;
run;

title "Multiple Linear Regression Model -- Marketing Data";
 proc REG data=L8.marketing Plot=none;
     model sales =facebook youtube;
run;
