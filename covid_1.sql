SELECT *
  FROM CovidDeaths2

-- Data used
SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths2
ORDER BY 1,2 

-- Total cases vs total deaths
-- Likelihood of dying if you contract covid in ur country
SELECT Location, date, total_cases, total_deaths, population, (total_deaths/total_cases)*100 AS percent_chance
FROM CovidDeaths2
WHERE location like '%india%'
ORDER BY 1,2 

-- Total cases vs total Population
-- Percentage of population that got covid
SELECT Location, date, total_cases, total_deaths, population, (total_cases/population)*100 AS percent_population_infected
FROM CovidDeaths2
WHERE location like '%india%'
ORDER BY 1,2 

-- Highest infection rate
SELECT Location, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population)*100) AS percent_population_infected
FROM CovidDeaths2
--WHERE location like '%india%'
GROUP BY location, population
ORDER BY percent_population_infected DESC


-- Countries with highest death count per Population


SELECT Location, FORMAT(MAX(total_deaths), '##,##,###') AS TotalDeathCount
FROM CovidDeaths2
WHERE continent IS NOT NULL
GROUP BY Location
ORDER BY MAX(total_deaths) DESC;


-- By continent
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM CovidDeaths2
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- Showing the continent with highest death count
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM CovidDeaths2
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- Global numbers
SELECT date, SUM(new_cases) AS Total_New_Cases, SUM(new_deaths) AS Total_New_Deaths, (SUM(new_deaths) / CAST(SUM(new_cases) AS float)) * 100 AS Death_percentage
FROM CovidDeaths2
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2 

-- Exploring both tables
SELECT TOP 100 *
FROM CovidVaccinations
SELECT TOP 100 *
FROM CovidDeaths2

-- Looking at total population Vs vacctination
SELECT CovidDeaths2.continent, CovidDeaths2.location, CovidDeaths2.date, CovidDeaths2.population, CovidVaccinations.new_vaccinations,
SUM(CovidVaccinations.new_vaccinations) OVER (PARTITION BY CovidDeaths2.location ORDER BY CovidDeaths2.location, CovidDeaths2.date ) AS RollingPeopleVaccinated
 --MAX(RollingPeopleVaccinated/population)*100
FROM CovidDeaths2
JOIN CovidVaccinations
 ON CovidDeaths2.location = CovidVaccinations.location  
 AND CovidDeaths2.date = CovidVaccinations.date
WHERE CovidDeaths2.continent IS NOT NULL
ORDER BY 2,3



--use cte
/*
WITH PopvsVac (Continent, Location, Date, Population, New_vaccinations, RollingPeopleVaccinated ) 
AS 
(
SELECT CovidDeaths2.continent, CovidDeaths2.location, CovidDeaths2.date, CovidDeaths2.population, CovidVaccinations.new_vaccinations,
SUM(CovidVaccinations.new_vaccinations) OVER (PARTITION BY CovidDeaths2.location ORDER BY CovidDeaths2.location, CovidDeaths2.date ) AS RollingPeopleVaccinated
 --MAX(RollingPeopleVaccinated/population)*100
FROM CovidDeaths2
JOIN CovidVaccinations
 ON CovidDeaths2.location = CovidVaccinations.location  
 AND CovidDeaths2.date = CovidVaccinations.date
WHERE CovidDeaths2.continent IS NOT NULL
ORDER BY 2,3
)
SELECT * , (RollingPeopleVaccinated/Population)*100
FROM PopvsVac
*/
WITH PopvsVac (Continent, Location, Date, Population, New_vaccinations, RollingPeopleVaccinated) AS
(
    SELECT 
        CovidDeaths2.continent, 
        CovidDeaths2.location, 
        CovidDeaths2.date, 
        CovidDeaths2.population, 
        CovidVaccinations.new_vaccinations,
        SUM(CovidVaccinations.new_vaccinations) OVER (PARTITION BY CovidDeaths2.location ORDER BY CovidDeaths2.date) AS RollingPeopleVaccinated
    FROM 
        CovidDeaths2
    JOIN 
        CovidVaccinations ON CovidDeaths2.location = CovidVaccinations.location  
                          AND CovidDeaths2.date = CovidVaccinations.date
    WHERE 
        CovidDeaths2.continent IS NOT NULL
)
SELECT 
    *, 
    (CAST(RollingPeopleVaccinated AS float) / Population) * 100 AS VaccinationPercentage
FROM 
    PopvsVac;

-- TEMP Table
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
    Continent NVARCHAR(255),
    Location NVARCHAR(255),
    Date datetime, 
    Population numeric,
    New_vaccinations numeric,
    RollingPeopleVaccinated numeric
)
INSERT INTO #PercentPopulationVaccinated
SELECT 
        CovidDeaths2.continent, 
        CovidDeaths2.location, 
        CovidDeaths2.date, 
        CovidDeaths2.population, 
        CovidVaccinations.new_vaccinations,
        SUM(CovidVaccinations.new_vaccinations) OVER (PARTITION BY CovidDeaths2.location ORDER BY CovidDeaths2.date) AS RollingPeopleVaccinated
    FROM 
        CovidDeaths2
    JOIN 
        CovidVaccinations ON CovidDeaths2.location = CovidVaccinations.location  
                          AND CovidDeaths2.date = CovidVaccinations.date
    WHERE 
        CovidDeaths2.continent IS NOT NULL

SELECT *, (RollingPeopleVaccinated/Population)*100
FROM #PercentPopulationVaccinated

-- Creating view to store data for later visualisations

CREATE View PercentPopulationVaccinated AS

SELECT 
        CovidDeaths2.continent, 
        CovidDeaths2.location, 
        CovidDeaths2.date, 
        CovidDeaths2.population, 
        CovidVaccinations.new_vaccinations,
        SUM(CovidVaccinations.new_vaccinations) OVER (PARTITION BY CovidDeaths2.location ORDER BY CovidDeaths2.date) AS RollingPeopleVaccinated
    FROM 
        CovidDeaths2
    JOIN 
        CovidVaccinations ON CovidDeaths2.location = CovidVaccinations.location  
                          AND CovidDeaths2.date = CovidVaccinations.date
    WHERE 
        CovidDeaths2.continent IS NOT NULL

SELECT *
FROM PercentPopulationVaccinated


