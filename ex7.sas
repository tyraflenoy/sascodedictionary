libname week11 "/folders/myfolders/DataManagement/week11/exercise7";

proc import out=week11.demographic
datafile="/folders/myfolders/DataManagement/week11/exercise7/Demographic.csv"
dbms=csv replace;
run;

proc import out=week11.health
datafile="/folders/myfolders/DataManagement/week11/exercise7/Health.csv"
dbms=csv replace;
run;

data week11.healthdemo_combined;
merge week11.health (in=a) week11.demographic (in=b);
by ID;
if a and b;
run;

data week11.healthdemo_combined;
set week11.healthdemo_combined;
format age_cat $5.;
If age=<20 then age_cat="<20 ";
If 20=<age=<34 then age_cat="20-34 ";
If 35=<age=<49 then age_cat="35-49 ";
If 50=<age=<64 then age_cat="50-64 ";
If age>=65 then age_cat="65+";
drop age;


If raceethn=1 then Raceethn_new="Ame_Mex";
If raceethn=2 then Raceethn_new="Other";
If raceethn=3 then Raceethn_new="NH_White";
If raceethn=4 then Raceethn_new="NH_Black";
If raceethn=5 then Raceethn_new="Other";
drop raceethn;

*Q6;
Format pov_cat $ 3.;
If poverty=<1 then Pov_cat="<1";
If 1=<poverty=<3 then Pov_cat="1-3 ";
If poverty>=3 then pov_cat="3+";
Drop poverty;

*Q7;
If cotinine_ppb=<10 then smoke_exp="0";
If cotinine_ppb>=10 then smoke_exp="1";

*Q8;
Height_m=(height_cm/100);
Drop height_cm;

*Q9;
BMI=(weight_kg/(height_m)**2);
run;



