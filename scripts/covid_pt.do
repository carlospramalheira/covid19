qui{
set more off
clear all
 
/*
// ------------------------------- PT ------------------------------------

STATA .do file to import COVID19 data.

Authors:
	Carlos Pinhão Ramalheira, Internal Medicine, MD
	Carlos Ramalheira, Psychiatry, MD

// -----------------------------------------------------------------------
*/

capture import delimited "https://github.com/carlospramalheira/covid19/raw/master/source/pt_raw.csv" , clear

if _rc==0 {
import delimited "https://github.com/carlospramalheira/covid19/raw/master/source/pt_raw.csv" , clear
noi di "Portuguese raw data imported"
}

else if _rc != 0 {
noi di "Portuguese raw data not available"
}

save "pt_raw.dta", replace

// ------------------------------------------------------------------------

cap gen year=2020
cap generate date=mdy(month,day,year) 
format %tdCCYY-NN-DD date
tsset date , d
cap drop cases_confirmed_norte- cc_0_9 d_1_1- d_0_9
cap drop day month year
local var_n = "cases_all cases_confirmed cases_unconfirmed cases_resultpending recovered deaths contacts inpatient icu"
foreach v of local var_n {
	gen `v'_new = `v' - L.`v'
	gen `v'_pct = (`v' - L.`v')*100/L.`v'
	gen `v'_new_pct = (`v'_new - L.`v'_new)/L.`v'_new
	}
gen pop = 10276617

order date cases_all cases_all_pct cases_all_new cases_all_new_pct cases_confirmed cases_confirmed_pct cases_confirmed_new cases_confirmed_new_pct cases_unconfirmed cases_unconfirmed_pct cases_unconfirmed_new cases_unconfirmed_new_pct cases_resultpending cases_resultpending_pct cases_resultpending_new cases_resultpending_new_pct recovered recovered_pct recovered_new recovered_new_pct deaths deaths_pct deaths_new deaths_new_pct contacts contacts_pct contacts_new contacts_new_pct inpatient inpatient_pct inpatient_new inpatient_new_pct icu icu_pct icu_new icu_new_pct

// ------------------------------------------------------------------------



// ------------------------------------------------------------------------



// ------------------------------------------------------------------------

cap rm "pt_raw.dta"

}
