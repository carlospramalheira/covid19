qui{
set more off
clear all
 
/*
// ---------------------- John Hopkins University -------------------------

STATA .do file to import COVID19 data from John Hopkins University.

Authors:
	Carlos Pinhão Ramalheira, Internal Medicine, MD
	Carlos Ramalheira, Psychiatry, MD

// -----------------------------------------------------------------------
*/

local JHop_URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/"
forvalues month = 1/12 {
   forvalues day = 1/31 {
      local month = string(`month', "%02.0f")
      local day = string(`day', "%02.0f")
      local year = "2020"
      local today = "`month'-`day'-`year'"
      local FileName = "`JHop_URL'`today'.csv"
      clear
      capture import delimited "`FileName'"
      capture confirm variable ïprovincestate
      if _rc == 0 {
         rename ïprovincestate provincestate
         label variable provincestate "Province/State"
      }
	  capture rename province_state provincestate
      capture rename country_region countryregion
      capture rename last_update lastupdate
      capture rename lat latitude
      capture rename long longitude
      capture save "`today'", replace
      noi display "." , _continue
   }
}
clear
forvalues month = 1/12 {
   forvalues day = 1/31 {
      local month = string(`month', "%02.0f")
      local day = string(`day', "%02.0f")
      local year = "2020"
      local today = "`month'-`day'-`year'"
      capture append using "`today'"
	  capture rm "`today'.dta"
   }
}

cap replace provincestate = ïprovincestate if provincestate==""
cap drop ïprovincestate 
cap replace fips = ïfips if fips==""
cap drop ïfips 
noi di "!" , _newline

local today : display %tdCY-N-D date("`c(current_date)'", "DMY")
save "JHU-COVID19-worldwide-`today'.dta" , replace
noi di "`today' JHU data imported"
export delimited "JHU-COVID19-worldwide-`today'.csv", replace
export excel using "JHU-COVID19-worldwide-`today'.xls", firstrow(variables) replace

// ------------------------------------------------------------------------

}
