set more off
clear all
 
/*
// ------------------------------------------------------------------------
STATA .do file to import COVID19 data from all repositories.

Authors:
	Carlos Pinhão Ramalheira, Internal Medicine, MD
	Carlos Ramalheira, Psychiatry, MD

// ------------------------------------------------------------------------
*/

do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid_pt.do"
do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid_ecdc.do"
do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid_jhu.do"

// ------------------------------------------------------------------------
