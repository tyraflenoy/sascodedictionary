*NOTES:
how to create or redefine variables
there are two parts: data and proc step

Rules for SAS Variable names:
-32 characters long
-start with: letter or _
-second or later spot can have: letter, _, numbers
-not case sensitive
Example:
NO - item#5, 5qr;
*DATA step basic format
data new - making this new
set old - based on this old one
statements
run;
*data -define new SAS dataset


		set - reads existing dataset that will be used;
*new variable = expression
create new variable or redefine old variable
create a new similar variable and keep the original:

create variable with a constant:
current_year=2020
country="USA";
*Example 1: Creating Variables Containing Constants;
libname week8 "/folders/myfolders/DataManagement/week8";

data week8.wk8_ex1;
	infile "/folders/myfolders/DataManagement/week8/wk8_ex1.txt" firstobs=2;
	input Name $ Tomato Zucchini;
run;

data week8.garden_1;
	* this is the new dataset;
	set week8.wk8_ex1;
	Year=2019;
	Location="Home";
run;

*adds new variable year and location and all data will be what is after "=";
****


		*Example 2: Creating variables using arithmetic operator: average score;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex2 
		datafile="/folders/myfolders/DataManagement/week8/wk8_ex2.csv" dbms=csv 
		replace;
run;

data week8.score_new;
	set week8.wk8_ex2;
	ave_score=(score1+score2+score3)/3;
	*keep enter variables wanna keep (goes the same for drop);
run;

***



		*example3: Creating Variables Using Arithmetic Operator;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex3 
		datafile="/folders/myfolders/DataManagement/week8/wk8_ex3.xlsx" dbms=xlsx 
		replace;
run;

data week8.product_1;
	set week8.wk8_ex3;
	defect_pct=100*(defect/total);
run;

***


		example 4: Creating Variables Using SAS Function;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex4 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex4.csv" dbms=csv 
		replace;
run;

*extract only state code;

data week8.ex4_1;
	set week8.wk8_ex4;
	state=substr(region, 1, 2);
run;

*1= from first position and 2=two characters;
***


		example 5: Make variables for year, month and day from birth date;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex5 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex5.csv" dbms=csv 
		replace;
run;

*Make variables for year, month and day from birth date;

data week8.date_1;
	set week8.wk8_ex5;
	Year=year(Bdate);
	Month=month(Bdate);
	Day=day(Bdate);
run;

*How can you change the variable name?;

data week8.date_1;
	set week8.wk8_ex5;
	rename Bdate=Birth_date;
run;

*normally new=expression;

data week8.date_1;
	set week8.wk8_ex5;
	Birth_Date=Bdate;
	*this steps makes new variable and the data will be same ads bdate;
	drop Bdate;
run;

*****


		example 6: make variables for age category from age data;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex6 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex6.csv" dbms=csv 
		replace;
run;

data week8.ex6_1;
	set week8.wk8_ex6;

	if 10=<age=<19 then
		age_cat="10-19";

	if 20=<age=<29 then
		age_cat="20-29";

	if 30=<age=<39 then
		age_cat="30-39";

	if 40=<age=<49 then
		age_cat="40-49";
run;

***
example 7: make new categories;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex7 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex7.xlsx" dbms=xlsx 
		replace;
run;

data week8.ex7_1;
	set week8.wk8_ex7;

	if gpa>=3.5 then
		gpagroup="excellent";
	else if gpa>=3.0 then
		gpagroup="good";
	else if gpa>=2.5 then
		gpagroup="fair";
run;

***


		example 8: make binary variable/ indicator variable;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex8 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex8.csv" dbms=csv 
		replace;
run;

data week8.ex8_1;
	set week8.wk8_ex8;

	if num_siblings>0 then
		sibling_yn=1;

	if num_siblings=0 then
		sibling_yn=0;
run;

***


		example 9: make a binary indicator variable;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex9 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex9.xlsx" dbms=xlsx 
		replace;
run;

data week8.ex9_1;
	set week8.wk8_ex9;

	If SysBP=. or DiaBP=. Then
		EBP=.;
	Else if SysBP>140 and DiaBP>90 then
		EBP=1;
	Else
		EBP=0;
run;

***


		example 10: how to delete observations with missing data;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex10 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex10.csv" dbms=csv 
		replace;
run;

data week8.ex10_1;
	set week8.wk8_ex10;

	if BMI=. then
		delete;
run;

****


		example 11: how to delete observations with missing data;
libname week8 "/folders/myfolders/DataManagement/week8";

proc import out=week8.wk8_ex11 
		datafile="/folders/myfolders/DataManagement/week8/Wk8_ex11.csv" dbms=csv 
		replace;
run;

data week8.ex11_1;
	set week8.wk8_ex11;

	if sex="" then
		delete;
run;
