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
cap {
gen year=2020
generate date=mdy(month,day,year) 
format %tdCCYY-NN-DD date
tsset date , d
tsfill
drop day month year
save "pt_raw.dta", replace

drop cases_confirmed_norte- cc_0_9 d_1_1- d_0_9

local var_n = "cases_all cases_confirmed cases_unconfirmed cases_resultpending recovered deaths contacts inpatient icu"
foreach v of local var_n {
	gen `v'_new = `v' - L.`v' if cases_confirmed >0
	gen `v'_pct = (`v' - L.`v')*100/L.`v' if cases_confirmed >0
	gen `v'_new_pct = (`v'_new - L.`v'_new)/L.`v'_new if cases_confirmed >0
	}
gen pop = 10276617
order date cases_all cases_all_pct cases_all_new cases_all_new_pct cases_confirmed cases_confirmed_pct cases_confirmed_new cases_confirmed_new_pct cases_unconfirmed cases_unconfirmed_pct cases_unconfirmed_new cases_unconfirmed_new_pct cases_resultpending cases_resultpending_pct cases_resultpending_new cases_resultpending_new_pct recovered recovered_pct recovered_new recovered_new_pct deaths deaths_pct deaths_new deaths_new_pct contacts contacts_pct contacts_new contacts_new_pct inpatient inpatient_pct inpatient_new inpatient_new_pct icu icu_pct icu_new icu_new_pct
gen cov_rate=cases_confirmed * 100000 / pop
gen lethal_rate = deaths * 100000/ cases_confirmed
gen mortality_rate = deaths * 100000/pop

save "PT_COVID_TimeSeries.dta" , replace
export excel using "PT_COVID_TimeSeries.xls", firstrow(variables) replace
noi di "Portuguese time series database compiled"

// ------------------------------------------------------------------------

use "pt_raw.dta" , clear
drop if cases_confirmed < 2
drop cases_all- deaths_madeira inpatient icu
reshape long cc_1_ cc_0_ d_1_ d_0_ , i(date) j(age_gr_nr)
local var_id = "cc_1 cc_0 d_1 d_0"
foreach vi of local var_id {
	cap rename `vi'_ `vi'
}

reshape long cc_ d_ , i(date age_gr_nr) j(sex_nr)
rename cc_ cases_confirmed
rename d_ deaths

sort sex_nr age_gr_nr date
by sex_nr age_gr_nr : ge cases_confirmed_new = cases_confirmed[_n]-cases_confirmed[_n-1]
by sex_nr age_gr_nr : ge deaths_new = deaths[_n]-deaths[_n-1]

gen sex_label=""
replace sex_label="Homens" if sex_nr==1
replace sex_label="Mulheres" if sex_nr==0
gen sex=sex_nr
labmask sex , values(sex_label)
gen age_gr_label = ""
replace age_gr_label = "00-09" if age_gr_nr==1
replace age_gr_label = "10-19" if age_gr_nr==2
replace age_gr_label = "20-29" if age_gr_nr==3
replace age_gr_label = "30-39" if age_gr_nr==4
replace age_gr_label = "40-49" if age_gr_nr==5
replace age_gr_label = "50-59" if age_gr_nr==6
replace age_gr_label = "60-69" if age_gr_nr==7
replace age_gr_label = "70-79" if age_gr_nr==8
replace age_gr_label = "80+"   if age_gr_nr==9
gen age_gr = age_gr_nr
labmask age_gr , values (age_gr_label)

order date sex sex_nr sex_label age_gr age_gr_nr age_gr_label cases_confirmed cases_confirmed_new deaths deaths_new

save "PT_COVID_Confirmed_Deaths_by_sexage.dta" , replace
export excel using "PT_COVID_Confirmed_Deaths_by_sexage.xls", firstrow(variables) replace
noi di "Portuguese cases and deaths by sex and age database compiled"

// ------------------------------------------------------------------------

use "pt_raw.dta" , clear
drop if cases_confirmed < 2
drop cases_all- contacts cc_1_1- d_0_9
reshape long cases_confirmed_ deaths_ , i(date) j(nut) s 
rename cases_confirmed_ cases_confirmed
rename deaths_ deaths
drop if deaths==.

save "PT_COVID_Confirmed_Deaths_by_nuts2.dta" , replace
export excel using "PT_COVID_Confirmed_Deaths_by_nuts2.xls", firstrow(variables) replace
noi di "Portuguese cases and deaths by NUTS2 database compiled"

// ------------------------------------------------------------------------

rm "pt_raw.dta"

}
}
