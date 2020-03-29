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

*

*EXAMPLE 1: SORT DATA BY WEIGHT;

*import data;
proc import out=week11.ex1
datafile= "/folders/myfolders/DataManagement/week11/examples/Example1.csv"
dbms=csv replace;
run;

*sort data by weight(smallest to largest);
proc sort data=week11.ex1;
by weight;
run;
*note that the missing value shows up first
How do you check if it was sorted well?;

proc print data =week11.ex1;
run;

*EXAMPLE 1: SORT DATA BY NAME (A TO Z);
proc sort data=week11.ex1;
by Name;
run;

*EXAMPLE 1: SORT DATA BY DATE (OLD TO NEW);
proc sort data=week11.ex1;
by date;
run;


*to sort in reverse order or descending order use by desceding;
*sort data by weight(largest to smallest);
proc sort data=week11.ex1;
by descending weight;
run;

*EXAMPLE 1: SORT DATA BY NAME (Z TO A);
proc sort data=week11.ex1;
by descending Name;
run;

*EXAMPLE 1: SORT DATA BY DATE (New TO old);
proc sort data=week11.ex1;
by descending date;
run;

*How do you sort by multiple variables?
EXAMPLE 1: Sort data by sex and date;
proc sort data=week11.ex1;
by sex date;
run;

*EXAMPLE 2:sort by exposure level;
*import data set;
proc import out= week11.ex2
datafile= "/folders/myfolders/DataManagement/week11/examples/Example2.csv"
dbms=csv replace;
run;
proc sort data=week11.ex2;
by exposure;
run;

*this sorted the data by ABC order now we will sort from high to low;
data week11.ex2_1;
set week11.ex2;
if exposure="High" then Exp_new=1;
if exposure="Medium" then Exp_new=2;
if exposure="Low" then Exp_new=3;

proc sort data=week11.ex2_1;
by exp_new;
run;

*COMBINING DATASETS;
*DATA-SET Statement;
libname week11 "/folders/myfolders/DataManagement/week11/examples";
proc import out=week11.ex3_1
datafile="/folders/myfolders/DataManagement/week11/examples/Example3_1.csv"
dbms=csv replace;
run;

proc import out=week11.ex3_2
datafile="/folders/myfolders/DataManagement/week11/examples/Example3_2.csv"
dbms=csv replace;
run;

data week11.ex3_combined;
set week11.ex3_1 week11.ex3_2;
run;

*EXAMPLE 4: one-to-one merge;
*DATA-MERGE Statement;
libname week11 "/folders/myfolders/DataManagement/week11/examples";

proc import out=week11.ex4_1
datafile="/folders/myfolders/DataManagement/week11/examples/Example4_1.csv"
dbms=csv replace;
run;

proc import out=week11.ex4_2
datafile="/folders/myfolders/DataManagement/week11/examples/Example4_2.csv"
dbms=csv replace;
run;

proc sort data=week11.ex4_1;
by ID;
run;

proc sort data=week11.ex4_2;
by ID;
run;

data week11.ex4_combined;
merge week11.ex4_1 week11.ex4_2;
by ID;
run;


*EXAMPLE 5: one-to-many merge;
libname week11 "/folders/myfolders/DataManagement/week11/examples";

proc import out=week11.ex5_1
datafile="/folders/myfolders/DataManagement/week11/examples/Example5_1.csv"
dbms=csv replace;
run;

proc import out=week11.ex5_2
datafile="/folders/myfolders/DataManagement/week11/examples/Example5_2.csv"
dbms=csv replace;
run;

proc sort data=week11.ex5_1;
by famid;
run;

proc sort data=week11.ex5_2;
by famid;
run;

data week11.ex5_combined;
merge week11.ex5_1 week11.ex5_2;
by famid;
run;

*EXAMPLE 6:combine two datasets;
libname week11 "/folders/myfolders/DataManagement/week11/examples";

proc import out=week11.ex6_1
datafile="/folders/myfolders/DataManagement/week11/examples/Example6_1.csv"
dbms=csv replace;
run;

proc import out=week11.ex6_2
datafile="/folders/myfolders/DataManagement/week11/examples/Example6_2.csv"
dbms=csv replace;
run;

data week11.ex6_combined;
merge week11.ex6_1 (in=a) week11.ex6_2 (in=b);
by ID;
if b;
run;