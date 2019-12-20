/* Importing the data into SAS */
PROC IMPORT DATAFILE='/folders/myfolders/Predicting_Admissions/Admission_Predict.csv'
out=admpred
dbms=csv
replace
;
run;

/* PROC GLM with Diagnostic Plots */
TITLE "Multiple Linear Regression -- Admission Prediction Data";
	PROC GLM DATA=admpred plots=(DIAGNOSTICS);
		class Research;
		model Chance_of_Admit = GRE_Score TOEFL_Score SOP LOR CGPA University_Rating Research GRE_Score * Research TOEFL_Score * Research SOP * Research LOR * Research CGPA * Research University_Rating * Research /solution
	;
		
	run;


/* BOX COX TRANSFORMATION PROC TRANSREG */
TITLE "Box Cox Transformation -- Admission Prediction Data";
	proc transreg data=admpred plots=boxcox;
		model boxcox(Chance_of_Admit / lambda=-6 to 6 by 0.05) = identity(GRE_Score) identity(TOEFL_Score) identity(SOP) identity(LOR) identity(University_Rating) identity(GRE_Score * Research) identity(TOEFL_Score * Research) identity(SOP * Research) identity(LOR * Research) identity(CGPA * Research) identity(University_Rating * Research) class(Research / effects) identity(CGPA);
		output coefficients replace;
	
	run;
	
/* Transforming Chance_of_Admit and building another model with the respective transformation. */
data admpredmodif; set admpred;
transformedCOA = Chance_of_Admit**2.8;
run;

TITLE "Multiple Linear Regression -- Admission Prediction Data";
	PROC GLM DATA=admpredmodif plots=(DIAGNOSTICS);
		class Research;
		model transformedCOA = GRE_Score TOEFL_Score SOP LOR CGPA University_Rating Research GRE_Score * Research TOEFL_Score * Research SOP * Research LOR * Research CGPA * Research University_Rating * Research /solution
	;
		
	run;
