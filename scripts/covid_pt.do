qui{
set more off
clear all
 
/*
// ------------------------------- PT ------------------------------------

STATA .do file to import COVID19 data from repositories: ECDC, John Hopkins University, DGS (Peralta Santos)

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

// ------------------------------------------------------------------------
}
