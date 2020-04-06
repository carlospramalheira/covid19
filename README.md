# [COVID-19: Portugal](https://github.com/carlospramalheira/covid19)
Independent project to gather portuguese COVID-19 data and share STATA scripts to download data, run analysis and draw graphs.

## Contents:

### Databases

* <b>Portuguese Directore-General of Health</b> (DGS) nationwide daily data:
    "contacts_under_survailance"
    "cases_all"
    "cases_resultpending"
    "cases_unconfirmed"	
    "cases_confirmed"
    "inpatient"
    "icu"
    "recovered"
    "deaths"

* <b>Portuguese Directore-General of Health</b> (DGS) nationwide daily data:
    Confirmed cases and deaths by sex, age and day of report

* <b>Portuguese Directore-General of Health</b> (DGS) regional level data:
    Confirmed cases and deaths by NUTS2 and day of report

* <b>European Centre for Disease Prevention and Control</b> (situation update worldwide): confirmed cases, deaths and population by country and day of report
* <b>John Hopkins University Repository</b> (daily reports): confirmed cases and deaths by country (region level data available for some countries) and day of report


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

Code to download and setup <b>ALL databases</b>:
``` 
cd "C:\Users\Carlos\COVID19\" // choose your local working folder
do "https://github.com/carlospramalheira/covid19/raw/master/scripts/covid.do"
```

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
