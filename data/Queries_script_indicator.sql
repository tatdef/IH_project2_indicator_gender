/*start from here !!!!!!!*/

CREATE DATABASE IF NOT EXISTS indicator;

/*Create tables in your database (based on data/done/norm) :  
- first_four_norms_indicators
- fifth_indicator  
- lgbt_equality_index_final
- wage 
And then you can run the two queries below to (1) create the table gender1, 
(2) query that table to get the indicator information. */ 

CREATE TABLE gender1
SELECT 
	four.country_name,
    four.fertility_norm,
    four.life_expect_norm,
    four.births_attended_norm,
    four.parliament_norm,
    fifth.school_norm,
    lgbt.lgbt_equality_index_normalized,
    wage.wage_gap_norm
FROM 
first_four_norms_indicators four
LEFT JOIN fifth_indicator fifth USING(country_name)
LEFT JOIN lgbt_equality_index_final lgbt USING (country_name)
LEFT JOIN wage wage using(country_name);

/* The query below allows to get a composite indicator regarding gender in several countries
it has some limitations : 
- you can add the wage gap norm at the end of the query, but most of the countries will return null as this indicator 
was not available for all countries ; 
- we didn't include, at the moment, the WBLI (women business and the law) indicator 
https://genderdata.worldbank.org/indicators/sg-law-indx/
- as well as the female labor force with intermediate education
we have them available, but we lacked the time at this point. */

/*FINALLY, remember you can amend the query below in order to get results for a specific country, by using a "where" clause.
Have FUN ! Yey ! */ 

Select * from gender1;

USE indicator;
SELECT 
	country_name, 
	(births_attended_norm +parliament_norm+school_norm+lgbt_equality_index_normalized-fertility_norm) as composite_indicator
FROM gender1
where country_name like "U%"
ORDER BY composite_indicator desc;


-- ARCHIVE 

-- SELECT country, life_expectancy_diff
-- FROM indicator.life_expectancy;

/*SELECT country_name, stddev(GPI_school_enroll_Prim_Sec)
FROM indicator.school_enrollment
GROUP BY country_name ;*/


use indicator;
SELECT 
    fert.country_name,
    avg(fert.fert_norm),
	avg(life.life_norm), 
    avg(birth.births_norm),
    avg(parl.parl_norm)
FROM fertility fert
LEFT JOIN life_expectancy life ON life.country = fert.country_name
LEFT JOIN births_attended_skilled birth USING(country_name)
LEFT JOIN parliament_seats_percent parl USING(country_name)
GROUP BY fert.country_name; 
-- table four indicators 

----

use indicator;
SELECT 
    fert.country_name,
	avg(school.school_norm)
FROM fertility fert
LEFT JOIN school_enrollment school USING(country_name)
GROUP BY fert.country_name; 
-- fifth indicator 

use indicator;
SELECT 
    fert.country_name,
    avg(wage.wage_gap_reversed_index) as wage_gap_norm
FROM fertility fert
LEFT JOIN employees_wage_gap_index wage USING(country_code)
GROUP BY fert.country_name; 
-- wage 


