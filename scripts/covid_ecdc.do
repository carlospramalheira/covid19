qui{
set more off
clear all
 
/*
// ------------------------------- ECDC -----------------------------------

STATA .do file to import COVID19 data from ECDC.

Authors:
	Carlos Pinhão Ramalheira, Internal Medicine, MD
	Carlos Ramalheira, Psychiatry, MD

// -----------------------------------------------------------------------
*/

local ecdc_today : display %tdCY-N-D date("`c(current_date)'", "DMY")
local ecdc_yesterday : display %tdCY-N-D date("`c(current_date)'", "DMY") - 1
local ecdc_2daysago : display %tdCY-N-D date("`c(current_date)'", "DMY") - 2
capture import excel "https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-`ecdc_today'.xlsx" , firstrow clear

if _rc==0 {
	import excel "https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-`ecdc_today'.xlsx" , firstrow clear
	save "ECDC-COVID19-worldwide-`ecdc_today'.dta" , replace
	noi di "`ecdc_today' ECDC data imported"
	local file =1
}

else if _rc != 0 {
	import excel "https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-`ecdc_yesterday'.xlsx" , firstrow clear
	save "ECDC-COVID19-worldwide-`ecdc_yesterday'.dta" , replace
	noi di "`ecdc_today' ECDC data not available   ||   `ecdc_yesterday' ECDC data imported"
	local file =2
}

format %tdCCYY-NN-DD dateRep
cap rename dateRep date
cap rename cases confirmed_new
cap rename deaths death_new
cap rename popData2018 pop
egen country = group( countriesAndTerritories countryterritoryCode geoId )
labmask country , values( geoId )
sort country date
by country : ge confirmed=sum( confirmed_new )
by country : ge death=sum( death_new )
order countriesAndTerritories countryterritoryCode geoId country date day month year confirmed confirmed_new death death_new pop

if `file'==1 {
	save "ECDC-COVID19-worldwide-`ecdc_today'.dta" , replace
	export delimited "ECDC-COVID19-worldwide-`ecdc_today'.csv", replace
	export excel using "ECDC-COVID19-worldwide-`ecdc_today'.xls", firstrow(variables) replace
	}
if `file'==2 {
	save "ECDC-COVID19-worldwide-`ecdc_yesterday'.dta" , replace
	export delimited "ECDC-COVID19-worldwide-`ecdc_yesterday'.csv", replace
	export excel using "ECDC-COVID19-worldwide-`ecdc_yesterday'.xls", firstrow(variables) replace
	}


// ------------------------------------------------------------------------

}
