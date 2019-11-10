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
		class SOP LOR University_Rating Research;
		model Chance_of_Admit = GRE_Score TOEFL_Score SOP LOR CGPA University_Rating Research /solution
	;
		
	run;
