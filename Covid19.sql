DROP DATABASE IF EXISTS covid19; 
SHOW DATABASES;
CREATE DATABASE covid19;
USE covid19;

select *
from covidcountrydata;

-- cotinents contained in the dataset 
select distinct continent 
from worldometerdata
order by 1;

-- country with the highest population by continents 
select continent, country, population
from worldometerdata
where (continent, population) IN (
  select continent, MAX(population)
  from worldometerdata
  group by continent
);

-- the total covid cases reveiced by these high populating countries 
select continent, country, Totalcases
from worldometerdata
where country= 'USA'
UNION ALL
select continent, country, Totalcases
from worldometerdata
where country= 'Brazil'
UNION ALL
select continent, country, Totalcases
from worldometerdata
where country= 'India'
UNION ALL
select continent, country, Totalcases
from worldometerdata
where country= 'Nigeria'
UNION ALL
select continent, country, Totalcases
from worldometerdata
where country= 'Australia'
order by Totalcases desc;


-- the total deaths by these high populating countries 
select continent, country, TotalDeaths
from worldometerdata
where country= 'USA'
UNION ALL
select continent, country, TotalDeaths
from worldometerdata
where country= 'Brazil'
UNION ALL
select continent, country, TotalDeaths
from worldometerdata
where country= 'India'
UNION ALL
select continent, country, TotalDeaths
from worldometerdata
where country= 'Nigeria'
UNION ALL
select continent, country, TotalDeaths
from worldometerdata
where country= 'Australia'
order by TotalDeaths desc;

-- percent of population lost due to covid 
select country , (TotalDeaths/population)*100 as Deathpercentage
from worldometerdata
where country= 'USA'
UNION ALL
select country , (TotalDeaths/population)*100 as Deathpercentage
from worldometerdata
where country= 'Brazil'
UNION ALL
select country , (TotalDeaths/population)*100 as Deathpercentage
from worldometerdata
where country= 'India'
UNION ALL 
select country , (TotalDeaths/population)*100 as Deathpercentage
from worldometerdata
where country= 'Nigeria'
UNION ALL 
select country , (TotalDeaths/population)*100 as Deathpercentage
from worldometerdata
where country= 'Australia';


-- new deaths, cases and recovered covid cases 
select continent, country, NewDeaths,NewCases,NewRecovered
from worldometerdata
where  NewDeaths IS NOT NULL AND NewDeaths > 0 AND  NewCases IS NOT NULL AND NewCases > 0 AND
NewRecovered IS NOT NULL AND NewRecovered
order by NewCases desc;

