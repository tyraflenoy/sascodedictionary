libname ex5 "/folders/myfolders/DataManagement/ex5";

data ex5.ex5_1;
infile "/folders/myfolders/DataManagement/ex5/ex5_1.txt"
delimiter=" "
firstobs=2;
input id gender $ age hepa;
run;

data ex5.ex5_2;
infile "/folders/myfolders/DataManagement/ex5/ex5_2.txt"
delimiter="#"
firstobs=2;
input make $ model $ type $ origin $ drivetrain $ MSRP invoice enginesize cylinder;
run;

proc import out=ex5.ex5_3
            datafile="/folders/myfolders/DataManagement/ex5/ex5_3.csv"
            dbms=csv replace;
run;
