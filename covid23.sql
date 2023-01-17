--Total Deaths
create View TotalDeaths as
select sum(cast(new_cases as float)) as total_cases,sum(cast(new_deaths as int)) as total_deaths,SUM(CAST(new_deaths AS INT))/SUM(cast(new_cases as float))*100 as deathPercentage
from covid2023..covid23
where continent is not null

--total deaths by location
create View TotalDeathsbyLocation as
select location,sum(cast(new_deaths as int)) as total_deaths
from covid2023..covid23
where continent is null
and location not in ('International','Euorpean Union','World','Low income','Lower middle income','Upper middle income')
group by location


--highest infection by location
create View Highest›nfectionByLocation as
select location,population,max(total_cases) as HighestInfection,sum(new_cases)/population*100 as PercentPopulation›nfected
from covid2023..covid23
group by location,population


-- percent population infected
create View PercentPopulation›nfected as
select location,date,population,max(total_cases) as HighestInfection,sum(total_cases)/population*100 as PercentPopulation›nfected
from covid2023..covid23
group by location,population,date


--TOTAL TEST
create View TotalTest as
select location,max(cast(total_tests as bigint)) as TotalTest
from covid23
where continent is not null
group by location

--TOTAL TEST by date
create View TotalTestByDate as
select date, location,sum(cast(new_tests as bigint)) as NewTestByDate
from covid23
where continent is not null
group by location,date

-- Total number of COVID-19 vaccination doses administered
create View TotalNumOfVaccinaton as
select  location,max(cast(total_vaccinations as bigint)) as TotalVaccinatons 
from covid23
where continent is not null
group by location

-- Total number of people who received at least one vaccine dose
create View TotalNumofPeopleWhoRecivedAtLeastOneVaccineDose as
select  location,max(cast(people_vaccinated as bigint)) as PeopleVaccinated
from covid23
where continent is not null
group by location







