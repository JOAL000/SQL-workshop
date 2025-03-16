# SQL Join exercise
#
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
SELECT * FROM city WHERE name LIKE "ping%" ORDER BY population ASC;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
SELECT * FROM city WHERE name LIKE "ran%" ORDER BY population desc;
#
# 3: Count all cities
#
SELECT count(*) FROM city;
#
# 4: Get the average population of all cities
#
SELECT avg(population) FROM city;
#
# 5: Get the biggest population found in any of the cities
#
SELECT max(population) FROM city;
#
# 6: Get the smallest population found in any of the cities
#
SELECT min(population) FROM city;

SELECT * FROM city WHERE population = (SELECT MIN(population) FROM city);
#
# 7: Sum the population of all cities with a population below 10000
#
SELECT sum(population) FROM city WHERE population<10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
#
SELECT count(*) FROM city where countrycode in ('MOZ','VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
SELECT countrycode,count(*) FROM city WHERE countrycode IN ("moz", "VNM") GROUP BY countrycode;
#
# 10: Get average population of cities in MOZ and VNM
#
SELECT countrycode,avg(population) FROM city WHERE countrycode IN ("moz", "VNM") GROUP BY countrycode;
#
# 11: Get the countrycodes with more than 200 cities
#
select countrycode,count(*) citycount from city group by countrycode having citycount>200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
#
select countrycode,count(*) citycount from city group by countrycode having citycount>200 order by citycount;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
select language from city inner join countrylanguage using (countrycode)  where population between 400 and 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
select name,language from city inner join countrylanguage using (countrycode)  where population between 400 and 500;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#
select name from city where countrycode = (select countrycode from city where population = 122199);

SELECT c2.name FROM city c1,city c2 WHERE c1.countrycode=c2.countrycode AND c1.population=122199;
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
select name from city where countrycode = (select countrycode from city where population = 122199) and population != 122199;

SELECT c2.name FROM city c1,city c2 WHERE c1.countrycode =c2countrycode AND c1.population = 122199 AND c2.population != 122199;
#
# 17: What are the city names in the country where Luanda is capital?
#
select name from city where countrycode = (select countrycode from city where name = "Luanda");

select name from city where countrycode = (select code from country where capital = (select id from city where name ="Luanda"));
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#cartesian product:
#similar to CROSS JOIN
select city.name from city join country where region = (select region from country where code = (select countrycode from city where name = "Yaren")) and city.id=country.capital;
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#

#
# 20: Get the name of the most populous city
#
SELECT name FROM city WHERE population = (SELECT MAX(population) FROM city);
