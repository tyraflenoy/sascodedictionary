data example1;
infile "/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example1.txt";
input mpg weight price;
run;

data example2;
infile "/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example2.txt"
delimiter=" "
firstobs=2 ;
input mpg weight price;
*/this tells you where the data starts/*

run;

data example3;
infile "/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example3.txt";
input mpg 1-2 name $ 4-11 weight 13-16 price 18-21;
run;
*NEED TO FIX the numbers denote vertical character spots, for example 3 is an empty spot and 1-2 is a character;

data example5;
infile "/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example5.txt"
delimiter=","
firstobs=2;
input mpg name $ weight price;

run;

*PROCIMPORT
out = output
dbms= type of data set for text can use tab or dlm;
proc import out=example2
datafile="/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example2.txt"
DBMS=dlm replace;
delimiter="";*not necessary b/c default;
getnames=yes;
datarow=2;
run;

proc import out=example5
datafile="/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example5.txt"
DBMS=dlm replace;
delimiter=",";*not necessary b/c default;
getnames=yes;
datarow=2;
run;

*HOW IMPORT EXCEL TO SAS;
proc import out=sample
datafile="location"
dbms=xlsx REPLACE;
Range="sheet1$";*tells you what sheet you are looking out in excel file;
Scantext=Yes;
Getnames=yes;
datarow=2;
run;

proc import out= example6
datafile="/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example6.xls"
DBMS=xls replace;
getnames=yes;*not necessary b/c default;
datarow=2;*not necessary b/c default;
run;

*HOW TO IMPORT A .CSV FILE;
proc import out= example8
datafile="/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/example8.csv"
DBMS=csv replace;
run;


*HOW TO CREATE PERMANANTE FILE?(EXAMPLE);
libname DataMana "/folders/myfolders/DataManagment"; 
proc copy in=work out=datamana; 
select exercise3;
run;
proc print data=exercise3;


*HOW TO CREATE DATASET IN SAS (.XPT- TO XPT FILE TEMP - PERM SAS;
LIBNAME mydata "location";
libname xptfile xport "location"
access=readonly;
proc copy inlib=xptfile outlib=mydata;
RUN;
*EXAMPLE;
LIBNAME DEMO_M "/folders/myfolders/DataManagment/Week 5 Example Dataset(1)/DEMO_I.XPT";
libname xptfile xport "/folders/myfolders/DataManagment/Week 5 Example Dataset(1)"
access=readonly;
proc copy inlib=xptfile outlib=DEMO_M;
RUN;
