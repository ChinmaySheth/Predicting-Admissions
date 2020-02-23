
/*Exploratory analysis: Plots and correlation*/

/*box plots*/
proc sgplot data=L7.spotify;
  vbox popularity;
run;


proc sgplot data=L7.spotify;
  vbox danceability;
run;

/*Scatterplot*/
PROC SGPLOT data=L7.spotify;
    scatter x=danceability y=popularity;  
    title "Spotify Plot";
	label popularity="Popularity";
	label danceability="Danceability";
run;

PROC CORR data=L7.spotify;
    VAR danceability popularity;
run;


/*Regression analysis*/
PROC REG data=L7.spotify Plot=none;
	 title "Simple Linear Regression Model -- Spotify Data";
     model popularity =danceability/CLB;
run;
