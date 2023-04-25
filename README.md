# Project2 - Building a composite indicator on gender
Project 2 Ironhack training on data analysis 

Objectives : 
*- Set up a database with indicators regarding gender 
*- Build a composite indicator from the data 
*- Write SQL queries to explore the data 

Content of the repository : 
*- this read.md file 
*- an sql file to create your database in MySQL
*- csv files containing the indicators' data

About our composite indicator : 
The objective was to include data on different areas (Healthcare and reproductive rights, Education, Economic empowerment, Women’s Leadership and Government, LGBT+ Rights...) 

We collected data on : 
*- Health (life expectancy per gender, fertility rate, births attended by health professionals) 
*- Socio-economic gender equalities (school enrollment gender parity index, gender wage gap)
*- Gender representation and rights (proportion of parliament seats held by women, LGBT rights index)

Our data sources were the World Bank data website (https://genderdata.worldbank.org/indicators), the OECD data website (https://data.oecd.org/earnwage/gender-wage-gap.htm), and the equaldex website (https://www.equaldex.com). 

**We had a lot more data on other indicators, but the comparison and normalization of different data types (percentage, number of people, years, yes/no answers for policies...) was a big challenge. We also had to define whether an indicator was "positive" or "negative" to build our composite indicator** 

*The current SQL composite indicator reflects some of the indicators but not all yet.* 

** Process for data cleaning : 
- download or scrape data 
- 

## Indicators with data missing for a minimum number of countries 
Health :  
*- fertility rate, total (births per woman) - 7 countries missing - 2020 OK 
*- life expectancy at birth (male, female) = created gender gap OK

*- maternal mortality ratio (as reflecting healthcare) DOWN
*- Births attended by skilled health staff (% of total)- CSV
*- anemia in non-pregnant women - https://genderdata.worldbank.org/indicators/sh-anm-nprg-zs 
*- obesity rate per gender  

Work, employment, representation 
*- Proportion of seats held by women in national parliaments (%) - CSV
*- Saved for old age (% age 15+) gender difference - DOWN
*- Account ownership at a financial institution or with a mobile-money-service provider (% of population ages 15+)
*- unemployment gender gap - Unemployment (%) - DOWN
*- Women, Business and the Law: Assets Indicator Score (scale 1-100) - DOWN
*- school enrollment gender parity index - https://genderdata.worldbank.org/indicators/se-enr - DOWN
*- literacy rate - https://genderdata.worldbank.org/indicators/se-adt?gender=gender-gap - DOWN
*- part time employment % gender gap - DOWN

