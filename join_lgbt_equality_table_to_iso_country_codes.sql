-- create database gender_index;

use gender_index;

-- left join the LGBT index with the country codes table to add the country ISO codes
select lgbt.country_name, cc.country_code_iso, lgbt.lgbt_equality_index
from lgbt_equality_index lgbt
left join country_codes cc
on lgbt.country_name like cc.country_name;

-- export the table to check and process the 'null' values manually (where country name formatting is slightly different from the Iso refernce list)
--