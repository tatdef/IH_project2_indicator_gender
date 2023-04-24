CREATE DATABASE IF NOT EXISTS indicator;

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

SELECT country_name, (IFNULL(births_attended_norm,0) + IFNULL(parliament_norm,0) + IFNULL(school_norm,0) + IFNULL(lgbt_equality_index_normalized,0) + IFNULL(wage_gap_norm,0) - IFNULL(fertility_norm,0) as index
FROM indicator.gender1;


/*
-fertility_norm -life_expect_norm + births_attended_norm + parliament_norm + school_norm +lgbt_equality_index_normalized +wage_gap_norm

-- if possible add WBLI 

--
-- SELECT country, life_expectancy_diff
-- FROM indicator.life_expectancy;

/*SELECT country_name, stddev(GPI_school_enroll_Prim_Sec)
FROM indicator.school_enrollment
GROUP BY country_name ;*/


