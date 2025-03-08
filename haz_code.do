*Data Cleaning
*load the kr dataset 
use "C:\Users\pc\Downloads\ETKR81FL.DTA"

*generate weights
gen wt=v005/1000000

*generate the height-to-age z score from hw5
gen haz=hw5/100 if hw5<996

*define global labels
label define yesno 1 "Yes" 0 "No"
label define yesno2 1 "Yes" 2 "No"

*Recoding of variables

*early intiation of breastfeeding (bf)
clonevar bf = v426
replace bf=1 if v426==0
replace bf=2 if v426>=101
label values bf yesno2

*vaccination
clonevar vac = h10
replace vac=1 if h10==1
replace vac=0 if h10==0 | h10==8
label values vac yesno

*vitamin A supplementation
clonevar vita6 = h33
replace vita6=0 if h33==8
replace vita6=1 if h33>=1 & h33<4
label values vita yesno

*antenatal care visits
clonevar anc = m14
replace anc=. if anc==98

*place of delivery at home
gen del= inrange(m15,11,12) 
label values del yesno


*water source (wtr)
recode v113 (11/15 21 31 41 51 61/73 = 1 "improved water") (30 32 40 42 43 96 = 0 "unimproved/surface water") (99=99 "missing"), gen(wtr)


*santiation (def)
recode v116 (11/13 15 21 22 41 51 14 23 42 43 96 = 0 "unimproved sanitation") (31 = 1 "open defecation") (99=.), gen(def)

*radio
clonevar radio = v120

*electricity
clonevar ele = v119

*tv
clonevar tv = v121

*floor
clonevar floor = v127
replace floor=. if v127==0
replace floor=1 if v127==11 |v127==12
replace floor=0 if v127>=13 & v127<=96
label values floor yesno

*living in the capital (region)
clonevar region = v024
replace region=1 if v024==10
replace region=0 if v024<10 |v024==11
label values region yesno

*mother non-Christian
clonevar religion = v130
replace religion=0 if v130 <= 3
replace religion=1 if v130 > 3
label values religion yesno

*mother able to read and write
clonevar literacy=v155
replace literacy=0 if v155==0
replace literacy=1 if v155 > 0
label values literacy yesno

*wealth index
clonevar wi= v191
replace wi = wi/100000

*solid fuel for cooking
gen fsolid= inrange(v161,6,11) 
label values fsolid yesno

*clean fuel for cooking
gen fclean= inrange(v161,1,4) 
label values fclean yesno

*descriptive analysis
*categorical variables
tabulate b4 
tabulate bf 
tabulate vac 
tabulate vita6 
tabulate literacy 
tabulate religion 
tabulate del 
tabulate s413d 
tabulate radio 
tabulate tv 
tabulate ele 
tabulate v151 
tabulate fsolid 
tabulate fclean 
tabulate floor 
tabulate wtr 
tabulate def 
tabulate v025 
tabulate region

*Continous variables
summarize hw1,detail 
summarize bord,detail  
summarize v012,detail  
summarize v133,detail  
summarize v212,detail  
summarize anc,detail  
summarize v137,detail  
summarize v136,detail  
summarize wi,detail  
summarize v040,detail  

*Check for missing values
misstable summarize haz hw1 b4 bord bf vac vita6 v012 v133 v212 literacy religion anc del s413d v137 v136 wi radio tv ele v151 fsolid fclean floor wtr def v025 v040 region

*Check for multicollinearity
regress hw1 b4 bord bf v012 v133 v212 literacy religion del v137 v136 wi radio tv ele v151 fsolid fclean floor wtr def v025 v040 region
vif

*Regression Analysis
*NULL MODEL
mixed haz || v001:, pw(wt) mle
estimates store m0
estat icc


*model 1 (base)
mixed haz hw1 i.b4 i.bf v012 v133 v212 i.literacy i.religion i.del v137 v136 wi i.radio i.v151 i.fclean i.wtr i.def [pw=wt]|| v001: , mle
estimates store m1
estat icc
estat ic


*model 2 (full)
mixed haz hw1 i.b4 i.bf v012 v133 v212 i.literacy i.religion i.del v137 v136 wi i.radio i.v151 i.fclean i.wtr i.def i.v025 v040 i.region [pw=wt] || v001: , mle
estimates store m2
estat icc


*compare
estimates stats m0 m1 m2 