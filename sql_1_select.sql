# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#

#
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
#
SELECT "hello world",123;
#
# 2: Get everything from the city table
# (Hint: Many many rows)
#
SELECT * from city;
#
# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
#
SELECT * from city where district="aceh";
#
# 4: Get only the name of the cities where the countrycode is "bfa"
#
SELECT name from city where countrycode="bfa";
#
# 5: Get both the name and district of the cities where the countrycode is "tto"
#
SELECT Name, district from city where countrycode="tto";
#
# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
#
SELECT Name as nm , district as dist from city where countrycode="arm";
#
# 7: Get the cities with a name that starts with "bor"
#
select * from city where name like 'bor%';
#
# 8: Get the cities with a name that contains the string "orto"
#
select * from city where name like '%orto%';
#
# 9: Get the cities that has a population below 1000
#
select * from city where Population < 1000;
#
# 10: Get the unique countrycodes from the cities that has a population below 1000
#
select distinct countrycode from city where Population < 1000;
#
# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
#
select * from city where countrycode='UKR' and Population > 1000000;
#
# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
#
select * from city where  Population < 200 or Population >9500000;
#
# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
#
select * from city where countrycode IN ('TJK', 'MRT', 'AND', 'PNG', 'SJM');
#
# 14: Get the cities with a population between 200 and 700 inclusive
#
select * from city where population BETWEEN 200 AND 700;
#
# 15: Get the countries with a population between 8000 and 20000 inclusive
#
select * from country where population BETWEEN 8000 AND 20000;
#
# 16: Get the name of the countries with a independence year (indepyear) before year 0
#
select name from country where  indepyear < 0;
#
# 17: Get the countries that has no recorded independence year and a population above 1000000
#
select * from country where indepyear is null and population > 1000000;
#
# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
#
select * from country where LifeExpectancy is not null and SurfaceArea < 10;
