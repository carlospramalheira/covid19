# [COVID-19: Portugal](https://github.com/carlospramalheira/covid19)
Independent project to gather portuguese COVID-19 data and share STATA scripts to download data, run analysis and draw graphs.

## Contents:

### Databases

* <b>Portuguese Directore-General of Health</b> (DGS) nationwide daily data: _contacts under survailance, suspected cases, unconfirmed cases, cases pending test result, confirmed cases, inpatient, admitted to intensive care units, recovered cases and deaths_.
* <b>Portuguese Directore-General of Health</b> (DGS) nationwide daily data: _confirmed cases and deaths by sex, age and day of report_. 
* <b>Portuguese Directore-General of Health</b> (DGS) regional level data: _confirmed cases and deaths by NUTS2 and day of report_.
* <b>European Centre for Disease Prevention and Control</b> (situation update worldwide): _confirmed cases, deaths and population by country and day of report_.
* <b>John Hopkins University Repository</b> (daily reports): _confirmed cases and deaths by country (region level data available for some countries) and day of report_.

### Variable description

Raw variables available in daily reports:
```
    "contacts_under_survailance": population who came into contact with known positive cases and are under survailance by the authorities
    "cases_all": all suspected cases according to DGS ("Todos os casos suspeitos"). = confirmed cases + unconfirmed cases + cases pending test result
    "cases_resultpending": suspected cases waiting for test result
    "cases_unconfirmed": not confirmed cases
    "cases_confirmed": confirmed COVID-19 cases
    "inpatient": COVID-19 cases admitted into hospital care
    "icu": COVID-19 cases addmited into intensive care units
    "recovered": recovered COVID-19 cases
    "deaths": deaths by COVID-19
    
ALL RAW VARIABLES ARE CUMULATIVE except inpatient and icu
```

Variables obtained from raw data or introduced to the database:
```
    "pop": portuguese population estimate
    "cov_rate": disease rate = confirmed cases * 100.000 / population
    "lethal_rate": lethality rate = deaths * 100.000 / confirmed cases
    "mortality_rate": mortailty rate = deaths * 100.000 / population

    "*_new": any variable with this ending has a count of daily new cases
    "*_cum": any variable with this ending has a cumulative sum of known cases to date
    "*_pct": any variable with this ending is a percentual change from the previous day
    
    "days": number of days from the diagnosis of the first COVID-19 case
    "days_rt": number of days from disease rate greater or equal to 1/100.000 hab.
    "days_mrt": number of days from mortality rate greater or equal to 1/100.000 hab.
```

### STATA scripts to download currently available data
Code to download and setup the latest <b>Portuguese</b> data:
``` 
cd "C:\Users\Carlos\COVID19\" // choose your local working folder
do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid_pt.do"
```

Code to download and setup the latest <b>ECDC data</b>:
``` 
cd "C:\Users\Carlos\COVID19\" // choose your local working folder
do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid_ecdc.do"
```

Code to download and setup the latest <b>John Hopkins University data</b>:
``` 
cd "C:\Users\Carlos\COVID19\" // choose your local working folder
do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid_jhu.do"
```

Code to download and setup <b>ALL DATABASES</b>:
``` 
cd "C:\Users\Carlos\COVID19\" // choose your local working folder
do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid.do"
```

We strongly advice to download raw data using STATA. Alternatively you can download _.csv_ files from the _**datasets**_ folder above to use with R, Microsoft Excel or other program. Please bear in mind: these files might not be uptdate as oftenly!

## Data Sources:
### Portuguese Oficial Reports
* [Directore-General of Health](https://covid19.min-saude.pt/relatorio-de-situacao/)

### World Data Repository by Johns Hopkins CSSE:
* [World Health Organization (WHO)](https://www.who.int/)
* [DXY.cn. Pneumonia. 2020.](http://3g.dxy.cn/newh5/view/pneumonia)
* [BNO News](https://bnonews.com/index.php/2020/02/the-latest-coronavirus-cases/)
* [National Health Commission of the People’s Republic of China (NHC)](http://www.nhc.gov.cn/xcs/yqtb/list_gzbd.shtml)
* [China CDC (CCDC)](http://weekly.chinacdc.cn/news/TrackingtheEpidemic.htm)
* [Hong Kong Department of Health](https://www.chp.gov.hk/en/features/102465.html)
* [Macau Government](https://www.ssm.gov.mo/portal/)
* [Taiwan CDC](https://sites.google.com/cdc.gov.tw/2019ncov/taiwan?authuser=0)
* [US CDC](https://www.cdc.gov/coronavirus/2019-ncov/index.html)
* [Government of Canada](https://www.canada.ca/en/public-health/services/diseases/coronavirus.html)
* [Australia Government Department of Health](https://www.health.gov.au/news/coronavirus-update-at-a-glance)
* [European Centre for Disease Prevention and Control (ECDC)](https://www.ecdc.europa.eu/en/geographical-distribution-2019-ncov-cases)
* [Ministry of Health Singapore (MOH)](https://www.moh.gov.sg/covid-19)
* [Italy Ministry of Health](http://www.salute.gov.it/nuovocoronavirus)
* [1Point3Arces](https://coronavirus.1point3acres.com/en)
* [WorldoMeters](https://www.worldometers.info/coronavirus/)

## Authors:
* Carlos P. Ramalheira, MD
* Carlos Ramalheira, MD

## Contact Us:
* Email: carlos.ramalheira@gmail.com
(Please contact us if you are willing to become a collaborator in this project)

## Terms of Use:
This GitHub repository and its contents herein, including all data, mapping, and analysis, copyright rights reserved, is provided to the public strictly for educational and academic research purposes. The Website relies upon publicly available data from multiple sources, that do not always agree. Reliance on the Website for medical guidance or use of the Website in commerce is strictly prohibited.
