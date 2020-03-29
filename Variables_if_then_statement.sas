*Creating or redefining variables using the if-then statement

EXTRA EXAMPLE;
libname week11 "/folders/myfolders/DataManagement/week11/examples";


*We are going to make a variable for county from zip codes;

*import data set;
proc import out= week11.location
datafile="/folders/myfolders/DataManagement/week11/examples/extra.csv"
dbms=csv replace;
run;

*make variable county based on zip code;
data week11.location_1;
set week11.location;
if zip in (75001, 75006, 75011, 75014, 75015) then County="Dallas";
if zip in (75002, 75009, 75013) then County="Collin";
if zip in (75007, 75010) then County="Denton";
run;
